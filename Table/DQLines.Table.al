table 50050 "DQ Lines"
{

    fields
    {
        field(1; "DQ No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; DTC; Code[20])
        {
            TableRelation = DTC."DT Code";

            trigger OnValidate()
            begin
                IF DTCRec.GET(DTC) THEN
                    "Freeze Frame Data Saved" := DTCRec."Freeze Frame Data Saved";
                Status := DTCRec.Status;
            end;
        }
        field(4; "Freeze Frame Data Saved"; Option)
        {
            OptionCaption = ' ,Available,Not Available';
            OptionMembers = " ",Available,"Not Available";
        }
        field(5; Status; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
    }

    keys
    {
        key(Key1; "DQ No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DTCRec: Record DTC;
}

