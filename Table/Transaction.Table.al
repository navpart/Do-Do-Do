table 70042 Transaction
{

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(2; Submitted; Boolean)
        {
        }
        field(3; "Submitted by"; Code[20])
        {
        }
        field(4; "Date Submitted"; DateTime)
        {
        }
        field(5; "Submission Response Code"; Code[20])
        {
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

