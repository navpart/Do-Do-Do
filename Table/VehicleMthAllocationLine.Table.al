table 50035 "Vehicle Mth. Allocation Line"
{

    fields
    {
        field(1; "Allocation Code"; Code[20])
        {
            TableRelation = "Production Period"."Period Code";
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Model No."; Code[20])
        {
        }
        field(5; "Model Name"; Text[50])
        {
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(7; "Chasis No."; Code[20])
        {
        }
        field(8; Colour; Code[20])
        {
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(11; "Unit Price"; Decimal)
        {
        }
        field(12; Amount; Decimal)
        {
        }
        field(13; Released; Boolean)
        {

            trigger OnValidate()
            begin
                IF Released THEN BEGIN
                    SaleSetup.GET();
                    "Date Released" := TODAY;
                    "Released By" := USERID;
                    "Latest Picking Date" := CALCDATE(SaleSetup."Vehicle Delivery Lapse Period", "Date Released");
                END
                ELSE BEGIN
                    "Date Released" := 0D;
                    "Released By" := '';
                    "Latest Picking Date" := 0D;
                END;
            end;
        }
        field(14; "Date Released"; Date)
        {
            Editable = false;
        }
        field(15; "Released By"; Code[10])
        {
            Editable = false;
        }
        field(16; "Driver Name"; Text[50])
        {
        }
        field(17; "Order No."; Code[20])
        {
        }
        field(18; Variant; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."),
                                                       Inventory = CONST(1),
                                                       Allocated = filter(false),
                                                       Colour = FIELD(Colour));

            trigger OnValidate()
            begin
                IF VarRec.GET("Item No.", Variant) THEN BEGIN
                    VarRec.CALCFIELDS(VarRec."Chassis No.", VarRec."Key No.", VarRec."Engine No.");
                    "Chasis No." := VarRec."Chassis No.";
                    "Unit Price" := SPrice;
                    "Key No." := VarRec."Key No.";
                    "Engine No." := VarRec."Engine No.";
                END;
            end;
        }
        field(19; "Seat Option"; Text[50])
        {
        }
        field(20; Transimision; Code[10])
        {
        }
        field(21; "Item No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_CARS'));
        }
        field(22; Location; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = filter(false));
        }
        field(23; Selected; Boolean)
        {

            trigger OnValidate()
            begin
                IF Selected THEN BEGIN
                    Amount := "Unit Price" * Quantity;
                    "Date Selected" := TODAY;
                END
                ELSE BEGIN
                    Amount := 0;
                    "Date Selected" := 0D;
                END;
            end;
        }
        field(24; "Date Selected"; Date)
        {
        }
        field(25; "A/C"; Code[10])
        {
        }
        field(26; "Fuel Type"; Code[10])
        {
        }
        field(27; "Engine No."; Code[20])
        {
        }
        field(28; "Key No."; Code[10])
        {
        }
        field(29; "Colour Description"; Text[50])
        {
        }
        field(30; Picked; Boolean)
        {

            trigger OnValidate()
            begin
                IF Picked THEN
                    "Date Picked" := TODAY
                ELSE
                    "Date Picked" := 0D;
            end;
        }
        field(31; "Date Picked"; Date)
        {
            Editable = false;
        }
        field(32; "Picked by"; Code[20])
        {
        }
        field(33; "Latest Picking Date"; Date)
        {
        }
        field(34; Body; Code[20])
        {
        }
        field(35; Type; Code[20])
        {
        }
        field(36; Rim; Code[20])
        {
        }
        field(37; "Serial No."; Code[20])
        {
        }
        field(38; Tracking; Integer)
        {
            TableRelation = "Item Ledger Entry"."Entry No." WHERE("Item No." = FIELD("Item No."),
                                                                   "Remaining Quantity" = FILTER(> 0),
                                                                   "Serial No." = FILTER(<> ''),
                                                                   "On Transfer Line" = filter(false));

            trigger OnValidate()
            begin
                IF TracSpec.GET(Tracking) THEN BEGIN
                    "Serial No." := TracSpec."Serial No.";
                    "Chasis No." := TracSpec."Serial No.";
                    "Engine No." := TracSpec."Engine No.";
                    "Key No." := TracSpec."Key No.";
                    Colour := TracSpec."Exterior Colour Code";
                END;
            end;
        }
        field(39; Invoiced; Boolean)
        {
        }
        field(40; "Picked Not Invoice"; Decimal)
        {
            CalcFormula = sum("Vehicle Mth. Allocation Line".Quantity where("Allocation Code" = field("Allocation Code"),
            "Customer No." = field("Customer No."), "Item No." = field("Item No."), Picked = filter(true), Invoiced = filter(false)));

            FieldClass = FlowField;
        }
        field(41; "Quantity Invoiced"; Decimal)
        {
            CalcFormula = Sum("Vehicle Mth. Allocation Line".Quantity WHERE("Allocation Code" = FIELD("Allocation Code"),
                                                                             "Customer No." = FIELD("Customer No."),
                                                                             "Item No." = FIELD("Item No."),
                                                                             Picked = filter(true),
                                                                             Invoiced = filter(true)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Allocation Code", "Customer No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Unit Price";
        }
        key(Key2; Selected, "Date Selected")
        {
            SumIndexFields = Amount, "Unit Price";
        }
        key(Key3; Selected, "Date Selected", Released, Picked, "Allocation Code", "Customer No.")
        {
            SumIndexFields = Amount, "Unit Price";
        }
        key(Key4; Invoiced, Picked, "Item No.", "Customer No.", "Allocation Code")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }

    var
        VarRec: Record 5401;
        SaleSetup: Record 311;
        TracSpec: Record 32;


    procedure SPrice(): Decimal
    var
        ItemRec: Record 27;
        SKU2: Record 5700;
        ProfitPct: Decimal;
        //ItemCostMgt: Codeunit 5804;
        AverageCostLCY: Decimal;
        AverageCostACY: Decimal;
        InvtSetup: Record 313;
        PriceGrp: Record 50094;
    begin
        InvtSetup.GET;
        //ItemRec.RESET;
        IF ItemRec.GET("Item No.") THEN BEGIN
            IF InvtSetup."Average Cost Calc. Type" = InvtSetup."Average Cost Calc. Type"::Item THEN BEGIN
                ItemRec.SETRANGE("Location Filter", Location);
                ItemRec.SETRANGE("Variant Filter", Variant);
            END;
            ItemRec.SETFILTER("Date Filter", ItemRec.GETFILTER("Date Filter"));
            //ItemCostMgt.CalculateAverageCost(ItemRec,AverageCostLCY,AverageCostACY);
            //ItemCostMgt.CalculateAverageCost(Itemrec,"Average Cost",AverageCostACY);

        END;

        ProfitPct := PriceGrp.ProfitMarkupToOnCost(ItemRec."Profit %");
        EXIT(AverageCostLCY * (100 + ProfitPct) / 100);
    end;
}

