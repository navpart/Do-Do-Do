table 50159 "Aging Item"
{

    fields
    {
        field(1; "Item No."; Code[20])
        {
        }
        field(2; Description; Text[70])
        {
        }
        field(3; Qty; Decimal)
        {
        }
        field(4; "Unit Cost"; Decimal)
        {
        }
        field(5; "Posting Group"; Code[10])
        {
        }
        field(6; "Last Purchase Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

