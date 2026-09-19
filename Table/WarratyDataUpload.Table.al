table 50546 "Warraty Data Upload"
{

    fields
    {
        field(1; "S/No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "DELIVERY DATE"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Model No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Model Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "DEALER N0"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Last Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Serial No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Warranty Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Expiration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Exterior Colour Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Engine No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Exterior Colour Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Key No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Purchase Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "S/No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

