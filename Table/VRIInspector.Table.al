table 50059 "VRI Inspector"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Name; Text[30])
        {
        }
        field(3; Department; Text[30])
        {
        }
        field(4; Unit; Text[30])
        {
        }
        field(5; Location; Code[20])
        {
            TableRelation = Location.Code;

            trigger OnValidate()
            begin
                Locarec.GET(Location);
                "Location Name" := Locarec.Name;
            end;
        }
        field(6; "Location Name"; Text[50])
        {
        }
        field(7; Address; Text[50])
        {
        }
        field(8; "Phone Nos"; Text[30])
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = ,Inspector,Supervisor;
        }
        field(10; "Staff Classification"; Option)
        {
            OptionCaption = 'Casual,Permanent Casual,Contract,Staff';
            OptionMembers = Casual,"Permanent Casual",Contract,Staff;
        }
        field(11; "Job Skill Level"; Text[30])
        {
        }
        field(12; "Refree Name"; Text[30])
        {
        }
        field(13; "Refree Phone No."; Text[30])
        {
        }
        field(14; "Refree Address"; Text[30])
        {
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

    var
        Locarec: Record 14;
}

