table 50048 "Hour Slot"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Slot Duration"; Decimal)
        {
        }
        field(3; "Hour Map"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(4; "Duration Units"; Option)
        {
            OptionCaption = 'Minutes,Hours';
            OptionMembers = Minutes,Hours;
        }
        field(5; "Break"; Boolean)
        {
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

