table 70057 "Online Ordering Location"
{

    fields
    {
        field(1; Location; Code[10])
        {
        }
        field(2; "No."; Code[20])
        {
        }
        field(3; "Item No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Location, "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

