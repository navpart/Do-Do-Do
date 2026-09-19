table 70021 "Periodic Maintenance"
{
    /* DrillDownPageID = 50273;
    LookupPageID = 50273;
 */
    fields
    {
        field(1; "Chasis No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Maintenace Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Maintenance Items"."Maintenance Code";
        }
        field(3; "Last Modified Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"No. Of Due Days" := "Last Modified Date" - "Current Date";
            end;
        }
        field(4; "No. Of Due Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Item Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Current Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"No. Of Due Days" := "Last Modified Date" - "Current Date";
                //"VRI Code" := "Item Description" / 30;
            end;
        }
        field(7; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(8; "No. of Due Mths"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "VRI Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VRI Table"."VRI Code";
        }
    }

    keys
    {
        key(Key1; "Chasis No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        vri: Record "VRI Table";
        PeriodicMaintenance: Record "Periodic Maintenance";

    local procedure ResetCDate()
    var
        PeriodicMaintenance: Record "Periodic Maintenance";
    begin
    end;


    procedure StyleResult(): Text
    begin
    end;
}

