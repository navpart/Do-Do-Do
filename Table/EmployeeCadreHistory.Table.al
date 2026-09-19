table 50150 "Employee Cadre History"
{
    DrillDownPageID = 50308;
    LookupPageID = 50308;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Editable = false;
        }
        field(2; "No."; Code[20])
        {
            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                IF EmplRec.GET("No.") THEN
                    Name := EmplRec.FullName;
            end;
        }
        field(3; Name; Text[50])
        {
            Editable = false;
        }
        field(4; Activities; Option)
        {
            Description = 'Promotion, Review or Demotion';
            Editable = false;
            OptionCaption = 'Promotion,Salary Review';
            OptionMembers = Promotion,"Salary Review",Demotion;
        }
        field(5; Date; Date)
        {
            Editable = false;
        }
        field(6; "Previous Job Title"; Text[50])
        {
            Editable = false;
        }
        field(7; "New Job Title"; Text[50])
        {
            Editable = false;
        }
        field(8; "Previous Gross Salary"; Decimal)
        {
            Editable = false;
        }
        field(9; "New Gross Salary"; Decimal)
        {
            Editable = false;
        }
        field(10; Remark; Text[100])
        {
        }
        field(11; "User ID"; Code[20])
        {
        }
        field(12; Time; Time)
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID" := USERID;
        Time := Time;
    end;

    var
        EmplRec: Record Employee;
}

