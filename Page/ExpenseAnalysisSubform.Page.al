page 50110 "Expense Analysis Subform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Expense Analysis Line Curr. Yr";
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

