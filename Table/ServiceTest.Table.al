table 50166 "Service Test"
{

    fields
    {
        field(1; "Serial No."; Code[20])
        {
            Editable = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Customer Name"; Text[50])
        {
            Editable = false;
        }
        field(4; Date; Date)
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

