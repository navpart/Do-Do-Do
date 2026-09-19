table 50140 "Report Usage"
{

    fields
    {
        field(1; "Report No."; Integer)
        {
        }
        field(2; "User ID"; Code[20])
        {
        }
        field(3; "Last Used Date"; Date)
        {
        }
        field(4; "No. Times used"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Report No.", "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

