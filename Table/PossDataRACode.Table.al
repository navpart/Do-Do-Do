table 50031 "Poss Data R/A Code"
{
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Action"; Option)
        {
            OptionCaption = ' ,Delete,Substitute';
            OptionMembers = " ",Delete,Substitute;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

