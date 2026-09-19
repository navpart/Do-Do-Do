table 50125 "DQ Inspection Details/Result"
{

    fields
    {
        field(1; "DQ No."; Code[20])
        {
        }
        field(2; Line; Integer)
        {
        }
        field(3; "Inspection Details/Result"; Text[100])
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; DTC; Code[20])
        {
            TableRelation = DTC."DT Code";

            trigger OnValidate()
            begin
                //IF DTCRec.GET(DTC) THEN
                //   "Freeze Frame Data Saved" := DTCRec."Freeze Frame Data Saved";
                //   Status := DTCRec.Status;
            end;
        }
        field(6; "Freeze Frame Data Saved"; Option)
        {
            OptionCaption = ' ,Available,Not Available';
            OptionMembers = " ",Available,"Not Available";
        }
        field(7; Status; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
        field(8; "Job Instruction"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "DQ No.", Line)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

