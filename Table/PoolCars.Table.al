table 70005 "Pool Cars"
{

    fields
    {
        field(1; "Registration No."; Code[20])
        {
        }
        field(2; "Model Name"; Code[50])
        {
        }
        field(3; "Driver No."; Code[10])
        {
        }
        field(4; "Driver Name"; Text[50])
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Routine,Emergency';
            OptionMembers = " ",Routine,Emergency;
        }
    }

    keys
    {
        key(Key1; "Registration No.", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

