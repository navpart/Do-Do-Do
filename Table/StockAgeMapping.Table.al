table 50178 "Stock Age Mapping"
{

    fields
    {
        field(1; "S/N"; Integer)
        {
        }
        field(2; "Item No."; Code[20])
        {
        }
        field(3; Date; Date)
        {
        }
        field(4; "Inv. No."; Code[10])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; Charges; Code[20])
        {
        }
        field(7; "Posted Amount"; Decimal)
        {
        }
        field(8; "Serial No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "S/N")
        {
            Clustered = true;
        }
        key(Key2; "Serial No.", Date)
        {
            SumIndexFields = "Posted Amount";
        }
    }

    fieldgroups
    {
    }
}

