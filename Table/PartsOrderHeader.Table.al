table 70162 "Parts Order Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; "Customer Name"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Phone No."; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Chassis No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Engine No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Model Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Order Time"; Time)
        {
            DataClassification = ToBeClassified;
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

