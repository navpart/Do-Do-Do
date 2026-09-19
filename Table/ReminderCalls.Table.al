table 50130 "Reminder Calls"
{

    fields
    {
        field(1; "Appointment No."; Code[10])
        {
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; "Phone No."; Code[11])
        {
        }
        field(5; Contact; Text[50])
        {
        }
        field(6; Response; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,Not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","Not Ready";
        }
    }

    keys
    {
        key(Key1; "Appointment No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

