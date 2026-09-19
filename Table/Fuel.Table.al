table 70012 Fuel
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Fuel Type"; Option)
        {
            OptionCaption = 'PMS,AGO';
            OptionMembers = PMS,AGO;
        }
        field(3; "Registration No."; Code[20])
        {
        }
        field(4; Quantity; Decimal)
        {
        }
        field(5; Date; DateTime)
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

