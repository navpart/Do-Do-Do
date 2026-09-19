page 50020 "Loan Types"
{
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Loan Types";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Loan Control Account"; Rec."Loan Control Account")
                {
                }
                field("Default Interest Percent"; Rec."Default Interest Percent")
                {
                }
                field("Default Journal Batch"; Rec."Default Journal Batch")
                {
                }
                field("Loan ED"; Rec."Loan ED")
                {
                }
                field("Up-Front Payment"; Rec."Up-Front Payment")
                {
                }
                field("Default Number of Payments"; Rec."Default Number of Payments")
                {
                }
            }
        }
    }

    actions
    {
    }
}

