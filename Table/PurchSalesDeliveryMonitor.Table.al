table 50041 "Purch/Sales-Delivery Monitor"
{

    fields
    {
        field(1; "Chassis No."; Code[20])
        {
        }
        field(2; "Model Code"; Code[20])
        {
        }
        field(3; "Model Name"; Text[50])
        {
        }
        field(4; "Engine No."; Code[20])
        {
        }
        field(5; "Key No."; Code[10])
        {
        }
        field(6; "Colour Name"; Text[50])
        {
        }
        field(7; "PO No."; Code[10])
        {
        }
        field(8; Purchased; Boolean)
        {
            Editable = false;
        }
        field(9; "Purch. Rcpt. No."; Code[10])
        {
        }
        field(10; Sold; Boolean)
        {
            Editable = false;
        }
        field(11; "Sales Rcpt. No."; Code[10])
        {
        }
        field(12; Delivered; Boolean)
        {
            Editable = false;
        }
        field(13; Month; Code[10])
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

