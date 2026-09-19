table 50117 "First Aid Box Drug Header"
{

    fields
    {
        field(1; "Drug Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Maker/ Distributor"; Text[50])
        {
        }
        field(4; "Country of Origin"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Drug Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

