table 50146 "Employee Disciplinary Document"
{
    DataCaptionFields = "No.", Name, "Issue Type";

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                IF emprec.GET("No.") THEN
                    Name := emprec.FullName;
            end;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Name; Text[50])
        {
        }
        field(4; Date; Date)
        {
        }
        field(5; "Issue date"; Date)
        {
        }
        field(6; "Issue Type"; Option)
        {
            OptionCaption = 'Recoginition,Commendation,Warning,Query,Suspension,Other';
            OptionMembers = Recoginition,Commendation,Warning,"Query",Suspension,Other;
        }
        field(7; Description; Text[100])
        {
        }
        field(8; "Effective Date"; Date)
        {
        }
        field(9; "Suspension Duration"; DateFormula)
        {

            trigger OnLookup()
            begin
                "Expected Resumption Date" := CALCDATE("Suspension Duration", "Effective Date");
            end;
        }
        field(10; "Expected Resumption Date"; Date)
        {
        }
        field(11; "Warning/Query Response Time"; DateFormula)
        {

            trigger OnValidate()
            begin
                "Expected Response Date" := CALCDATE("Warning/Query Response Time", "Issue date");
            end;
        }
        field(12; "Expected Response Date"; Date)
        {
        }
        field(13; "Response Date"; Date)
        {
        }
        field(14; "Resumption Date"; Date)
        {
        }
        field(15; Remark; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Issue Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        emprec: Record Employee;
}

