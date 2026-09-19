page 50340 "DQ Inspection Details/Results"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "DQ Inspection Details/Result";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("DQ No."; Rec."DQ No.")
                {
                }
                field(Line; Rec.Line)
                {
                }
                field("Inspection Details/Result"; Rec."Inspection Details/Result")
                {
                }
            }
        }
    }

    actions
    {
    }
}

