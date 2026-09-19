table 70061 "Allocation Test Line"
{

    fields
    {
        field(1; "Document No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No." WHERE(Allocated = CONST(true));

            trigger OnValidate()
            begin
                IF Item.GET("Item No.") THEN
                    "Item Description" := Item.Description
                ELSE
                    "Item Description" := '';

                // ItemLedgerEntry.GET("Item No.");
                // ItemLedgerEntry.SETCURRENTKEY("Item No.","Posting Date");
                // ItemLedgerEntry.SETFILTER("Item No.","Item No.");
                // ItemLedgerEntry.SETRANGE("Posting Date","Starte Date","End Date");
                // ItemLedgerEntry.SETFILTER("Source No.","Customer No.");
                // IF ItemLedgerEntry.FINDFIRST THEN
                //  "Ordered Quantity" += ItemLedgerEntry.Quantity;
                // MODIFY;
            end;
        }
        field(3; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Current Available Quantity"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                  "Location Code" = FILTER('123ORE|129IKO|113LEK|CONSIGNMEN|EXIBITION')));
            FieldClass = FlowField;
        }
        field(6; "Allocation Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TESTFIELD("Start Date");
                TESTFIELD("End Date");
                VALIDATE("Remaining Allocated Quantity");
            end;
        }
        field(7; "Ordered Quantity"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                   "Source No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(8; "Remaining Allocated Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Allocation Quantity" <> 0 THEN
                    "Remaining Allocated Quantity" := "Allocation Quantity" - "Ordered Quantity"
            end;
        }
        field(9; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ItemLedgerEntry.SETCURRENTKEY("Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
                ItemLedgerEntry.SETFILTER("Item No.", "Item No.");
                ItemLedgerEntry.SETRANGE("Posting Date", "Start Date", "End Date");
                ItemLedgerEntry.SETRANGE("Source No.", "Customer No.");

                IF ItemLedgerEntry.FINDSET THEN BEGIN
                    ItemLedgerEntry.CALCSUMS("Invoiced Quantity");
                    "Ordered Quantity" := ABS(ItemLedgerEntry."Invoiced Quantity");
                    MODIFY(TRUE);
                    VALIDATE("Remaining Allocated Quantity");
                END;
            end;
        }
        field(11; "Customer No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." WHERE("No." = FILTER('TDV*'));

            trigger OnValidate()
            begin

                IF Customer.GET("Customer No.") THEN
                    "Customer Name" := Customer.Name
                ELSE
                    "Customer Name" := '';

                //VALIDATE("Item No.");
            end;
        }
        field(12; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Customer No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record 18;
        Item: Record 27;
        ItemLedgerEntry: Record 32;
}

