table 50161 "Vehicle Brand"
{
    //LookupPageID = 70019;

    fields
    {
        field(1; "Vehicle Brand Code"; Code[20])
        {
        }
        field(2; "Vehicle Brand Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Vehicle Brand Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

