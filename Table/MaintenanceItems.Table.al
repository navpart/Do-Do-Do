table 70024 "Maintenance Items"
{

    fields
    {
        field(1; "Maintenance Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Maintenance Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Maintenance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

