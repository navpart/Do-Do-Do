table 70058 "Online Ordering Selection"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; Location; Code[10])
        {
        }
        field(3; "Serial No."; Code[20])
        {
        }
        field(4; "Exterior Color Name"; Text[30])
        {
        }
        field(5; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(6; "Item No."; Code[20])
        {
        }
        field(7; "Engine No."; Code[20])
        {
        }
        field(8; "Key No."; Code[10])
        {
        }
        field(9; "Exterior Color Code"; Code[10])
        {
        }
        field(10; "Production Month"; Date)
        {
        }
        field(11; "Discount Approved"; Decimal)
        {
        }
        field(12; "Online Order No."; Code[50])
        {
        }
        field(13; "Sales Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Online Order No.")
        {
        }
    }

    fieldgroups
    {
    }
}

