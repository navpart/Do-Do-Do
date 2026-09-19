table 50081 "Course Types"
{
    DataCaptionFields = "Course Type Code", Description;

    fields
    {
        field(1; "Course Type Code"; Code[10])
        {
        }
        field(2; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Course Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

