table 50057 "Terminal Informations"
{

    fields
    {
        field(1; "Device ID"; Code[20])
        {
        }
        field(2; Description; Text[40])
        {
        }
        field(10; "Device IP"; Code[20])
        {
        }
        field(11; Disabled; Boolean)
        {
        }
        field(12; "Device No."; Integer)
        {
            BlankZero = true;
        }
        field(13; "Use Device IP"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Device ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

