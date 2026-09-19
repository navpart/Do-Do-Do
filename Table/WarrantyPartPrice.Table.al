table 70016 "Warranty Part Price"
{

    fields
    {
        field(1; "Item No."; Code[30])
        {
        }
        field(2; Price; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

