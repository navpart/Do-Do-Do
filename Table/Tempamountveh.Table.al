table 50043 "Temp amount veh."
{

    fields
    {
        field(1; "Item No."; Code[20])
        {
        }
        field(2; "Chassis No."; Code[20])
        {
        }
        field(3; "Engine Number"; Code[20])
        {
        }
        field(4; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Item No.", "Chassis No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

