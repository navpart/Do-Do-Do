table 50037 "Production Period"
{
    DataCaptionFields = "Period Code", "Period Description";

    fields
    {
        field(1; "Period Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Period Description"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Period Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

