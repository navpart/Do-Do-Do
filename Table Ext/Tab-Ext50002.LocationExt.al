tableextension 50002 "Location Ext." extends Location
{
    fields
    {
        field(50001; "Stock Allocation %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Insured Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Stock Holding Value"; Decimal)
        {
            //FieldClass = FlowField;
            //CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Location Code" = FIELD(Code),
            // "Inventory Posting Group" = CONST(N_PARTS)));
            //Editable = false;

        }
        field(50004; "Phase out Transaction"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Phase in  Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Phase out  Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Slow Moving Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Ordering Paramenter"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50009; "Maximum Stock Period"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Lead Time"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                "Ordering Paramenter" := "Lead Time" + "Order Cycle" + "Safety Stock of Lead Time";
            end;
        }
        field(50011; "Period Unit"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Days,Weeks,Months,Years';
            OptionMembers = D,W,M,Y;
        }
        field(50012; "Stock in Transaction"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Order Cycle"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                "Ordering Paramenter" := "Lead Time" + "Order Cycle" + "Safety Stock of Lead Time";
            end;
        }
        field(50014; "Safety Stock of Lead Time"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                "Ordering Paramenter" := "Lead Time" + "Order Cycle" + "Safety Stock of Lead Time";
            end;
        }
        field(50015; "Obsolete Period"; DateFormula)
        {
        }
        field(50151; "Cost price buy"; Code[10])
        {
        }
        field(50152; "Cost price sell"; Code[10])
        {
        }
        field(50153; "Cost price reclass."; Code[10])
        {
        }
        field(50154; "Depreciation buy"; Code[10])
        {
        }
        field(50155; "Depreciation sell"; Code[10])
        {
        }
        field(50156; "Depreciation reclas."; Code[10])
        {
        }
        field(50157; "Appreciation buy"; Code[10])
        {
        }
        field(50158; "Appreciation sell"; Code[10])
        {
        }
        field(50159; "Appreciation reclas."; Code[10])
        {
        }
        field(50160; "Writing down buy"; Code[10])
        {
        }
        field(50161; "Writing down sell"; Code[10])
        {
        }
        field(50162; "Writing down reclas."; Code[10])
        {
        }
        field(50163; "New Location Code"; Code[10])
        {
        }
        field(50200; "Include in Grp Inv Report"; Boolean)
        {
        }
        field(50201; "Monitored Location"; Boolean)
        {
        }
        field(50202; "Main Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));

        }
        field(50203; "VRI Location"; Boolean)
        {
        }
        field(50204; "With Accessory"; Boolean)
        {
        }
    }
    var

        Location: Record Location;

    procedure GetName(LocCode: Code[10]): Text[30]
    begin
        IF Location.GET(LocCode) THEN
            EXIT(Location.Name)
        ELSE
            EXIT('');

    end;


}
