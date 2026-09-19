table 50163 "In-stock"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "VRI Code"; Code[10])
        {
        }
        field(3; Date; Date)
        {
        }
        field(4; "Open COF"; Boolean)
        {
        }
        field(5; "COF No."; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

