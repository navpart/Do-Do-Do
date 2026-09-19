table 50116 "Delivery Test"
{

    fields
    {
        field(1; Chassis; Code[20])
        {
        }
        field(2; "Posting Date"; Code[10])
        {
        }
        field(3; "Document No."; Code[10])
        {
        }
        field(4; "Customer No."; Code[10])
        {
        }
        field(5; "Item No."; Code[20])
        {
        }
        field(6; Description; Text[40])
        {
        }
        field(7; Delivered; Boolean)
        {
        }
        field(8; "Delivery Date"; Date)
        {
        }
        field(9; "Document Type"; Option)
        {
            OptionCaption = ' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo';
            OptionMembers = " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo","Transfer Shipment","Transfer Receipt","Service Shipment","Service Invoice","Service Credit Memo";
        }
    }

    keys
    {
        key(Key1; Chassis)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

