table 70072 "Sales Custom Doc"
{

    fields
    {
        field(1; "Sales Order"; Code[10])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Document Link"; Text[250])
        {
        }
        field(4; "Item No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Sales Order", "Line No", "Document Link")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

