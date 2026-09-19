table 50158 "Estimated Materia Requirement"
{

    fields
    {
        field(1; "Estimate Code"; Code[10])
        {
        }
        field(2; "Line no."; Integer)
        {
        }
        field(3; "Line Type"; Option)
        {
            OptionCaption = ' ,Item,Labour,Sublet';
            OptionMembers = " ",Item,Labour,Sublet;
        }
        field(4; "No."; Code[20])
        {
            TableRelation = IF ("Line Type" = CONST(Item)) Item."No."
            ELSE
            IF ("Line Type" = CONST(Labour)) Resource."No."
            ELSE
            IF ("Line Type" = CONST(Sublet)) "Service Cost".Code;

            trigger OnValidate()
            begin
                IF "Est.Header".GET("Estimate Code") THEN;
                CASE "Line Type" OF
                    "Line Type"::Item:
                        IF Itemrec.GET("No.") THEN BEGIN
                            Description := Itemrec.Description;
                            /* IF "Est.Header"."Estimate Factor" <> 0 THEN
                                "Unit Price" := Itemrec."Unit Price" * "Est.Header"."Estimate Factor"
                            ELSE
                                "Unit Price" := Itemrec."Unit Price"; */
                        END;
                    "Line Type"::Labour:
                        IF Resrec.GET("No.") THEN BEGIN
                            Description := Resrec.Name;
                            "Unit Price" := Resrec."Unit Price";
                        END;
                    "Line Type"::Sublet:
                        IF Servrec.GET("No.") THEN BEGIN
                            Description := Servrec.Description;
                            "Unit Price" := Servrec."Default Unit Price";
                        END;
                END;
            end;
        }
        field(5; Description; Text[50])
        {
        }
        field(6; "Quantity/Labour Hrs"; Decimal)
        {

            trigger OnValidate()
            begin

                Amount := "Quantity/Labour Hrs" * "Unit Price";
            end;
        }
        field(7; "Unit Price"; Decimal)
        {
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; Remark; Text[50])
        {
        }
        field(10; "Operation Code"; Code[20])
        {
            TableRelation = "Fault Setup Header";
        }
        field(11; "Additional Jobs"; Boolean)
        {
        }
        field(12; "Estimate Factor"; Decimal)
        {
        }
        field(13; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(14; Variant; Code[20])
        {
            //TableRelation = IF "(Line Type"=filter(Item)) "Item Variant".Code WHERE ("Item No."=FIELD("No."));
        }
        field(15; Temp; Boolean)
        {
            Description = 'for Page format';
        }
    }

    keys
    {
        key(Key1; "Estimate Code", "Line no.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Quantity/Labour Hrs";
        }
        key(Key2; "Additional Jobs", "Estimate Code")
        {
            SumIndexFields = Amount, "Quantity/Labour Hrs";
        }
        key(Key3; "Operation Code", "Line no.", "Line Type")
        {
            SumIndexFields = Amount, "Quantity/Labour Hrs";
        }
    }

    fieldgroups
    {
    }

    var
        Itemrec: Record Item;
        Resrec: Record Resource;
        Servrec: Record "Service Cost";
        faultmat: Record "Fault Setup Header";
        "Est.Header": Record "Estimate Header";
}

