table 50136 "Stock Aging"
{

    fields
    {
        field(1; "Chassis No."; Code[30])
        {
        }
        field(2; "Model Code"; Code[20])
        {
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Quantity; Decimal)
        {
        }
        field(5; "Engine No."; Code[20])
        {
        }
        field(6; Color; Text[30])
        {
        }
        field(7; Location; Code[10])
        {
        }
        field(8; "Date In Stock"; Date)
        {
        }
        field(9; "Ages in Days"; Decimal)
        {
        }
        field(10; "Ages in Months"; Decimal)
        {
            DecimalPlaces = 0 : 10;
        }
        field(11; Cost; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Chassis No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

