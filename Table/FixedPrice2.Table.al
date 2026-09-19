table 50126 "Fixed Price2"
{

    fields
    {
        field(1; "Item No"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Unit Cost"; Decimal)
        {
            DecimalPlaces = 0 : 6;
        }
    }

    keys
    {
        key(Key1; "Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

