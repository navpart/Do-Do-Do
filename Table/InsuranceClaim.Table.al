table 50168 "Insurance Claim"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; "Document No."; Code[10])
        {
        }
        field(4; Description; Text[50])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; Exist; Boolean)
        {
            Editable = false;
        }
        field(7; "Account No."; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

