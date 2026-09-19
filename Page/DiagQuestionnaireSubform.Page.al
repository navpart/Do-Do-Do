page 50359 "Diag. Questionnaire Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "DQ Inspection Details/Result";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection Details/Result"; Rec."Inspection Details/Result")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(DTC; Rec.DTC)
                {
                }
                field("Freeze Frame Data Saved"; Rec."Freeze Frame Data Saved")
                {
                }
                field("Job Instruction"; Rec."Job Instruction")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

