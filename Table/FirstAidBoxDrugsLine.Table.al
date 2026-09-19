table 50118 "First Aid Box Drugs Line"
{

    fields
    {
        field(1; "Drug Code"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Batch No."; Code[20])
        {
        }
        field(5; "Production Date"; Date)
        {
        }
        field(6; "Purchased Date"; Date)
        {
        }
        field(7; "Expiring Date"; Date)
        {
        }
        field(8; "Supplier Name"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Drug Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

