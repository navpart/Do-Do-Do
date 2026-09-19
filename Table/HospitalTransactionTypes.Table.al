table 50091 "Hospital Transaction Types"
{

    fields
    {
        field(1; "Type Code"; Code[10])
        {
        }
        field(2; "Type Description"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

