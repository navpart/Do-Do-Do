table 70030 "Promo Items"
{

    fields
    {
        field(1; "Item No."; Code[20])
        {
        }
        field(2; Price; Decimal)
        {
        }
        field(3; "End Date"; Date)
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

