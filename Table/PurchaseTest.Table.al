table 50139 "Purchase Test"
{

    fields
    {
        field(1; "Serial No."; Code[20])
        {
        }
        field(2; "Document No."; Code[10])
        {
        }
        field(3; "Purchase Date"; Date)
        {
        }
        field(4; Available; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Serial No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

