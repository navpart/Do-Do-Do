table 50094 "Item Price Group"
{

    fields
    {
        field(1; "Item Price Grp Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Maximum Discount %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 99.99;
            MinValue = 0;

            trigger OnValidate()
            begin
                VALIDATE("Profit % On Cost B4 Discount", GetProfitBeforeDiscount);
            end;
        }
        field(4; "Min Profit % After Discount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                "MarkUp Profit % After Discount" := (ProfitOnCostToMarkup("Min Profit % After Discount"));

                VALIDATE("Profit % On Cost B4 Discount", GetProfitBeforeDiscount);
            end;
        }
        field(5; "MarkUp Profit % After Discount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(6; "Profit % On Cost B4 Discount"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "MarkUp Profit % B4 Discount" := (ProfitOnCostToMarkup("Profit % On Cost B4 Discount"));
            end;
        }
        field(7; "MarkUp Profit % B4 Discount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(8; "Index No"; Integer)
        {
        }
        /* field(9; "Group Items"; Code[20])
        {

            CalcFormula = Lookup(Item."No." WHERE("Item Price Group" = FIELD("Item Price Grp Code")));
            Editable = false;
            FieldClass = FlowField;
        } */
        field(10; "Group Count"; Integer)
        {
            CalcFormula = Count(Item WHERE("Inventory Posting Group" = FILTER('N_PARTS'),
                                            "Item Price Group" = FIELD("Item Price Grp Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Exchange Rate"; Decimal)
        {
            DecimalPlaces = 0 : 5;

        }
        field(12; "Landing Cost %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(13; "Price Adjustment %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "Item Price Grp Code")
        {
            Clustered = true;
        }
        key(Key2; "MarkUp Profit % After Discount")
        {
        }
        key(Key3; "Maximum Discount %")
        {
        }
        key(Key4; "Maximum Discount %", "MarkUp Profit % After Discount")
        {
        }
        key(Key5; "Index No")
        {
        }
    }

    fieldgroups
    {
    }


    procedure GetProfitBeforeDiscount(): Decimal
    begin

        EXIT(100 * ("Min Profit % After Discount" + "Maximum Discount %") / (100 - "Maximum Discount %"));
    end;


    procedure ProfitOnCostToMarkup("Input%": Decimal): Decimal
    begin

        IF "Input%" = -100 THEN
            EXIT(0)
        ELSE
            EXIT("Input%" * 100 / (100 + "Input%"));
    end;


    procedure ProfitMarkupToOnCost("Input%": Decimal): Decimal
    begin

        IF "Input%" = 100 THEN
            EXIT(0)
        ELSE
            EXIT((100 * "Input%") / (100 - "Input%"));
    end;






    procedure UpdateSellingPrice()
    Var
        Item: Record Item;
        ItemPriceGrp: Record "Item Price Group";
        AmountPlusDirectCost: Decimal;
        ProgressDialog: Dialog;
        TotalCount: Integer;
        CurrentCount: Integer;
        ProgressPercent: Integer;

    begin
        Item.Reset();
        TotalCount := Item.Count;

        if TotalCount = 0 then
            exit;

        CurrentCount := 0;
        ProgressDialog.Open('Updating Selling Prices...\\' +
            'Item No.: #1##########\\' +
            'Progress: #2######### of #3######### (@4@@@@@@@@@)');

        if Item.FindSet() then
            repeat
                CurrentCount += 1;
                ProgressPercent := Round(CurrentCount / TotalCount * 10000, 1);
                ProgressDialog.Update(1, Item."No.");
                ProgressDialog.Update(2, CurrentCount);
                ProgressDialog.Update(3, TotalCount);
                ProgressDialog.Update(4, ProgressPercent);

                if ItemPriceGrp.Get(Item."Item Price Group") then begin
                    AmountPlusDirectCost := Round(((GetLastUnitCostFromPurchInvoice(Item."No.") * ItemPriceGrp."Exchange Rate") * (1 + (ItemPriceGrp."Landing Cost %" / 100))), 0.01);
                    Item."Unit Price" := Round((AmountPlusDirectCost * (1 + (ItemPriceGrp."Price Adjustment %" / 100))), 0.01);
                    Item.Modify();
                end;
            until Item.Next() = 0;

        ProgressDialog.Close();
    end;

    procedure UpdateSellingPriceForItem(ItemNo: Code[20])
    var
        Item: Record Item;
        ItemPriceGrp: Record "Item Price Group";
        AmountPlusDirectCost: Decimal;
    begin
        if not Item.Get(ItemNo) then
            exit;

        if Item."Item Price Group" = '' then begin
            Message('Item %1 does not have an Item Price Group assigned.', ItemNo);
            exit;
        end;

        if ItemPriceGrp.Get(Item."Item Price Group") then begin
            AmountPlusDirectCost := Round(((GetLastUnitCostFromPurchInvoice(Item."No.") * ItemPriceGrp."Exchange Rate") * (1 + (ItemPriceGrp."Landing Cost %" / 100))), 0.01);
            Item."Unit Price" := Round((AmountPlusDirectCost * (1 + (ItemPriceGrp."Price Adjustment %" / 100))), 0.01);
            Item.Modify();
            Message('Unit Price updated to %1 for Item %2', Item."Unit Price", ItemNo);
        end else
            Message('Item Price Group %1 not found.', Item."Item Price Group");
    end;

    procedure GetLastUnitCostFromPurchInvoice(ItemNo: Code[20]): Decimal
    var
        PurchInvLine: Record "Purch. Inv. Line";
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        PurchInvLine.Reset();
        PurchInvLine.SetCurrentKey("Document No.");
        PurchInvLine.SetRange(Type, PurchInvLine.Type::Item);
        PurchInvLine.SetRange("No.", ItemNo);
        if PurchInvLine.FindLast() then
            repeat
                if PurchInvHeader.Get(PurchInvLine."Document No.") then
                    if PurchInvHeader."Currency Code" <> '' then
                        exit(PurchInvLine."Direct Unit Cost");
            until PurchInvLine.Next(-1) = 0;
        exit(0);
    end;

}

