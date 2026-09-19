table 50029 "Part Order Celling"
{

    fields
    {
        field(1; "Celling Code"; Code[10])
        {
        }
        field(2; "Lower Band"; Decimal)
        {
        }
        field(3; "Higher Band"; Decimal)
        {
        }
        field(4; "Maximum Qty"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Celling Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

