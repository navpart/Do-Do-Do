table 50039 "Warranty Claim Detail"
{
    /* DrillDownPageID = 50164;
    LookupPageID = 50164;
 */
    fields
    {
        field(1; "Claim No."; Code[20])
        {
            TableRelation = "Warranty Claim Header"."Claim No.";
        }
        field(2; "Vehicle identification Number"; Code[20])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Dealer Code"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(5; "Claim Date"; Date)
        {
        }
        field(6; "Claim Type"; Option)
        {
            OptionCaption = 'Item,Labour,Subcontract';
            OptionMembers = Item,Labour,Subcontract;
        }
        field(7; "No."; Code[20])
        {
            TableRelation = IF ("Claim Type" = filter(Item)) Item."No." WHERE("Inventory Posting Group" = filter('N_PARTS'))
            ELSE
            IF ("Claim Type" = filter(Labour)) "Service Cost".Code WHERE("Model Description" = FIELD(Model), Type = CONST(Labour))
            ELSE
            IF ("Claim Type" = filter(Subcontract)) "Service Cost".Code WHERE("Model Description" = FIELD(Model), Type = CONST(Sublet));

            trigger OnValidate()
            begin
                WarHeader.GET("Claim No.");
                IF "No." <> '' THEN BEGIN
                    CASE "Claim Type" OF
                        "Claim Type"::Item:
                            IF ItemRec.GET("No.") THEN BEGIN
                                Description := ItemRec.Description;
                                "Shelf No." := ItemRec."Shelf No.";
                                VALIDATE("Unit Cost", SPrice);
                            END;
                        "Claim Type"::Labour:
                            IF ServiceCost.GET("No.", 0) THEN BEGIN
                                Description := ServiceCost.Description;
                                VALIDATE("Unit Cost", ServiceCost."Default Unit Price");
                                "Department Code" := WarHeader."Department Code";
                                "Branch Code" := WarHeader."Branch Code";
                            END;
                        "Claim Type"::Subcontract:
                            IF ServiceCost.GET("No.", 1) THEN BEGIN
                                Description := ServiceCost.Description;
                                VALIDATE("Unit Cost", ServiceCost."Default Unit Price");
                                "Department Code" := WarHeader."Department Code";
                                "Branch Code" := WarHeader."Branch Code";
                            END;
                    END;
                END;
            end;
        }
        field(8; Description; Text[50])
        {
        }
        field(9; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                StockkeepRec.SETRANGE("Location Code", Location);
                StockkeepRec.SETRANGE("Item No.", "No.");
                StockkeepRec.SETRANGE("Variant Code", "Variant Code");
                IF StockkeepRec.FINDFIRST THEN BEGIN
                    StockkeepRec.CALCFIELDS("Net Inventory");
                    IF Quantity > StockkeepRec."Net Inventory" THEN
                        ERROR('Please check availability!');
                END;
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(10; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(11; Amount; Decimal)
        {
        }
        field(12; "TNL Approved"; Boolean)
        {

          /*   trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Approve Warranty Claim" THEN ERROR('Sorry You Can Not Approve This Warranty Claim');
                IF "TNL Approved" THEN
                    "TNL Approved Date" := TODAY
                ELSE
                    "TNL Approved Date" := 0D;
            end; */
        }
        field(13; "Issue to Dealer"; Boolean)
        {

         /*    trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF "Claim Type" = "Claim Type"::Item THEN BEGIN
                    IF NOT UserRec."Replace War. Material Claim" THEN ERROR('Sorry You Can Not Issue Warranty Material Claim')
                END ELSE
                    IF NOT UserRec."Replace Warranty Labour Claim" THEN ERROR('Sorry You Can Not Allow Warranty Labour Claim');
            end; */
        }
        field(14; "TNL Approved Date"; Date)
        {
        }
        field(15; "Issue to Dealer Date"; Date)
        {
        }
        field(16; "Materia Claimed Before"; Integer)
        {
           /*  CalcFormula = Count("Warranty Claim Detail" WHERE("Vehicle identification Number" = FIELD("Vehicle identification Number"),
                                                               Claim Type=CONST(Item),
                                                               "No."=FIELD("No.")));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(17;"Variant Code";Code[10])
        {
            TableRelation = "Item Variant".Code WHERE ("Item No."=FIELD("No."));

            trigger OnValidate()
            begin
                VALIDATE("Unit Cost",SPrice);
            end;
        }
        field(18;Location;Code[10])
        {
            TableRelation = Location.Code;

            trigger OnValidate()
            begin
                VALIDATE("Unit Cost",SPrice);
            end;
        }
        field(19;"Amount Refunded by TMC";Decimal)
        {
        }
        field(20;"Department Code";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(21;"Branch Code";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(22;"Shelf No.";Code[20])
        {
        }
        field(23;Model;Code[30])
        {
        }
        field(24;TWC;Code[20])
        {
            CalcFormula = Lookup("Warranty Claim Header"."TWC No." WHERE ("Claim No."=FIELD("Claim No.")));
            FieldClass = FlowField;
        }
        field(25;"Warranty Claim";Boolean)
        {
            CalcFormula = Lookup("Warranty Claim Header"."Claim Materials Posted" WHERE ("TWC No."=FIELD(TWC)));
            FieldClass = FlowField;
        }
        field(26;"Unit Cost dollar";Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //VALIDATE(Quantity);
            end;
        }
        field(27;"Amount dollar";Decimal)
        {
            Editable = false;
        }
        field(28;"Part Requested";Code[20])
        {
            Editable = false;
        }
        field(29;"Quantity Issued";Decimal)
        {
            DecimalPlaces = 0:0;
            Editable = false;

            trigger OnLookup()
            begin
                 //"Quantity to be Issued":=Quantity-"Quantity Issued";
            end;
        }
        field(30;"Quantity to be Issued";Decimal)
        {
            DecimalPlaces = 0:0;

            trigger OnValidate()
            begin
                StockkeepRec.SETRANGE("Location Code",Location);
                StockkeepRec.SETRANGE("Item No.","No.");
                StockkeepRec.SETRANGE("Variant Code","Variant Code");
                IF StockkeepRec.FINDFIRST THEN BEGIN
                  StockkeepRec.CALCFIELDS("Net Inventory");
                  IF "Quantity to be Issued" > StockkeepRec."Net Inventory" THEN
                    ERROR('Please check availability!');
                END;
                Amount := "Quantity to be Issued" * "Unit Cost";
                // "Quantity to be Issued":=Quantity-"Quantity Issued";
            end;
        }
        field(31;Skip;Boolean)
        {
            Editable = false;
        }
        field(32;FullyPosted;Boolean)
        {
            Editable = false;
        }
        field(33;"Partially Posted";Boolean)
        {
            Editable = false;
        }
        field(34;"Claim Total";Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                "Claim Total" :=  "Unit Cost dollar" * "Materia Claimed Before";
            end;
        }
    }

    keys
    {
        key(Key1;"Claim No.","Vehicle identification Number","Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount,Quantity,"Amount Refunded by TMC";
        }
        key(Key2;"Claim Type","Claim No.")
        {
            SumIndexFields = Amount,Quantity;
        }
        key(Key3;"Dealer Code","Claim Type","TNL Approved","Issue to Dealer")
        {
            SumIndexFields = Amount,Quantity;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD("TNL Approved",FALSE);
    end;

    trigger OnInsert()
    begin
        //IF WarHeader.GET("Claim No.","Vehicle identification Number") THEN
        IF WarHeader.GET("Claim No.") THEN
            IF NOT WarHeader."Warranty Closed" THEN BEGIN
               "Dealer Code" := WarHeader."Dealer Code";
               "Claim Date" := WarHeader."Process Date";
               VALIDATE("Vehicle identification Number",WarHeader."Vehicle Identification No.");
            END ELSE
                ERROR('Sorry you can not input material for a closed Warranty Claim');
    end;

    trigger OnModify()
    begin
        //IF WarHeader.GET("Claim No.","Vehicle identification Number") THEN
        IF WarHeader.GET("Claim No.") THEN BEGIN
          WarHeader.TESTFIELD(WarHeader."Warranty Closed",FALSE);
          //WarHeader.TESTFIELD(WarHeader."Claim Approved by TNL",FALSE); //santus
        END;
    end;

    var
        ItemRec: Record 27;
        ServiceCost: Record 5905;
        WarHeader: Record 50038;
        UserRec: Record 91;
        StockkeepRec: Record 5700;

    
    procedure SPrice(): Decimal
    var
        ItemRec: Record 27;
        SKU2: Record 5700;
        ProfitPct: Decimal;
        ItemCostMgt: Codeunit 5804;
        AverageCostLCY: Decimal;
        AverageCostACY: Decimal;
        InvtSetup: Record 313;
        PriceGrp: Record 50094;
    begin
        IF InvtSetup.GET() THEN;
        IF ItemRec.GET("No.") THEN BEGIN
          IF InvtSetup."Average Cost Calc. Type" = InvtSetup."Average Cost Calc. Type"::"Item & Location & Variant" THEN BEGIN
            ItemRec.SETRANGE("Location Filter",Location);
            ItemRec.SETRANGE("Variant Filter","Variant Code");
          END;
          ItemRec.SETFILTER("Date Filter",ItemRec.GETFILTER("Date Filter"));
          ItemCostMgt.CalculateAverageCost(ItemRec,AverageCostLCY,AverageCostACY);
        END;

        EXIT(AverageCostLCY);
    end;
}

