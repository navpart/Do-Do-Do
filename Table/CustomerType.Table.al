table 70047 "Customer Type"
{
    DrillDownPageID = 80053;
    LookupPageID = 80053;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Code Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

