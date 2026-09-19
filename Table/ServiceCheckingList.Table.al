table 50131 "Service Checking List"
{

    fields
    {
        field(1; "Prev Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Service Type"; Option)
        {
            OptionCaption = ' ,Inspection,Replacement,Adjustment,Repack,Repair';
            OptionMembers = " ",Inspection,Replacement,Adjustment,Repack,Repair;
        }
        field(4; "Corresponding Operation code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Prev Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

