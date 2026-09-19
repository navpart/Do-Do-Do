table 50182 "Vat Input Template"
{

    fields
    {
        field(1; "No."; Code[40])
        {
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; "User ID"; Text[40])
        {
        }
        field(4; "Sum VAT Amount"; Decimal)
        {
        }
        field(5; Confirmed; Boolean)
        {
        }
        field(6; Description; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

