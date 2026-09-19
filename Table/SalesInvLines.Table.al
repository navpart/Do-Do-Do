table 50179 "Sales Inv. Lines"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Posting Group"; Code[10])
        {
        }
        field(5; "Invoice No."; Code[10])
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "User ID"; Code[30])
        {
        }
        field(8; "Sales Person"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

