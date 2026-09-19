table 50175 "Transfer Test"
{

    fields
    {
        field(1; "Serial No."; Code[20])
        {
        }
        field(2; "Location Code"; Code[10])
        {
        }
        field(3; "Not Transferred"; Boolean)
        {
            Editable = false;
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

