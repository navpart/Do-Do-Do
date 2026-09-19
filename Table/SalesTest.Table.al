table 50171 "Sales Test"
{

    fields
    {
        field(1; "Serial No."; Code[20])
        {
        }
        field(2; "Sales Date"; Date)
        {
        }
        field(3; "Sales Amount"; Decimal)
        {
        }
        field(4; "Dealer No."; Code[10])
        {
        }
        field(5; "Dealer Name"; Text[50])
        {
        }
        field(6; "Purchased Date"; Date)
        {
        }
        field(7; "Item No."; Code[20])
        {
        }
        field(8; "Model No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Serial No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

