table 50133 "Resource Allocation Table"
{

    fields
    {
        field(1; "Resoource No."; Code[20])
        {
        }
        field(2; "Resource Name"; Text[50])
        {
        }
        field(3; "Job Order No."; Code[20])
        {
        }
        field(4; "Job Allocated Date"; Date)
        {
        }
        field(5; "Allocated Hour"; Decimal)
        {
        }
        field(6; "Start Time"; Time)
        {
        }
        field(7; "End Time"; Time)
        {
        }
        field(8; "Line No."; Integer)
        {
        }
        field(9; Remarks; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Job Order No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = "Allocated Hour";
        }
    }

    fieldgroups
    {
    }
}

