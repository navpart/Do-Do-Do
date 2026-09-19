table 70043 "ECR Transactions"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Transaction Type"; Text[30])
        {
        }
        field(3; "Transaction Date"; DateTime)
        {
        }
        field(4; "Terminal ID"; Code[30])
        {
        }
        field(5; "Response Description"; Text[30])
        {
        }
        field(6; "Response Code"; Code[10])
        {
        }
        field(7; "Mode of Payment"; Text[30])
        {
        }
        field(8; "Masked PAN"; Text[30])
        {
        }
        field(9; "Holder Name"; Text[150])
        {
        }
        field(10; "ECR ID"; Code[10])
        {
        }
        field(11; "Card Type"; Text[30])
        {
        }
        field(12; "Card Expiry Date"; Date)
        {
        }
        field(13; "Approval Code"; Code[10])
        {
        }
        field(14; "Document No."; Code[20])
        {
        }
        field(15; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

