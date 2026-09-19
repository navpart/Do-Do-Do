table 50143 "Job Goals"
{

    fields
    {
        field(1; No; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;Description;Text[30])
        {
        }
        field(4;"Job Goals & Key Results";Text[50])
        {
        }
        field(5;"Target Date";Text[50])
        {
        }
        field(6;Remarks;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;No,"Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

