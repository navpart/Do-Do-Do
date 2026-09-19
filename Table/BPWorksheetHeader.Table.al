table 70046 "BP Worksheet Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Comment; Text[250])
        {
        }
        field(3; "Service Advisor Name"; Text[250])
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

