table 50541 "Scholarship Courses Grp-r"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Staff Count"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Scholarship Register" WHERE("Course Group" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(4; "Date Filter"; Date)
        {
        }
        field(5; "Employee Filter"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

