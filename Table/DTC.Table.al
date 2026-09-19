table 50051 DTC
{
    /* DrillDownPageID = 50361;
    LookupPageID = 50361 */;

    fields
    {
        field(1; "DT Code"; Code[20])
        {
        }
        field(2; "DT Symptoms"; Text[30])
        {
        }
        field(3; "Freeze Frame Data Saved"; Option)
        {
            OptionCaption = ' ,Available,Not Available';
            OptionMembers = " ",Available,"Not Available";
        }
        field(4; Status; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
    }

    keys
    {
        key(Key1; "DT Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

