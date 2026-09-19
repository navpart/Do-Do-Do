table 50180 "GL Purchases"
{

    fields
    {
        field(1; "Document No."; Code[10])
        {
        }
        field(2; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

