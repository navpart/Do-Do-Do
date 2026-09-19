page 50115 "Expense Analysis Subform 2"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Expense Analysis Line Prev. Yr";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Month; Rec.Month)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

