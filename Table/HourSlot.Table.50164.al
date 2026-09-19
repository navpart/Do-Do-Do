table 50164 "Hour Slot.."
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Hour; Decimal)
        {
            DecimalPlaces = 0 : 0;
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

