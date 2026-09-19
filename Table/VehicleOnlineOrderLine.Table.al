table 70050 "Vehicle Online Order Line"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Item No."; Code[30])
        {
            TableRelation = Item."No.";
        }
        field(4; "Desired Colour"; Text[250])
        {
        }
        field(5; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(6; "Selected Colour"; Text[250])
        {
        }
        field(7; "Item Description"; Text[100])
        {
        }
        field(8; "Discount Amount"; Decimal)
        {
        }
        field(9; "Discount Amount Requested"; Decimal)
        {
        }
        field(10; "Discount Amount Approved"; Decimal)
        {
        }
        field(11; "Unit Price"; Decimal)
        {
        }
        field(12; "Unit Discount Requested"; Decimal)
        {
        }
        field(13; "Unit Discount Approved"; Decimal)
        {
        }
        field(16; "Document Type"; Option)
        {
            Editable = true;
            OptionCaption = ' ,Quote,Order,Invoice';
            OptionMembers = " ",Quote,"Order",Invoice;
        }
        field(17; "VAT  Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Currency: Record 4;
        UserSetup: Record 91;
}

