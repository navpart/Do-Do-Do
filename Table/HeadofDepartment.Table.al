table 70006 "Head of Department"
{

    fields
    {
        field(1; "Head of Department"; Code[30])
        {
            TableRelation = "User Setup";
        }
        field(2; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code;
        }
    }

    keys
    {
        key(Key1; "Head of Department")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

