table 70048 "Test Email Attachment"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Send; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin


            end;
        }
        field(4; "Customer No."; Code[10])
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

