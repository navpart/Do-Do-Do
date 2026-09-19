page 80009 "Estimate List"
{
    CardPageID = "Estimate Card";
    PageType = List;
    SourceTable = "Estimate Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Model No.";Rec."Model No.")
                {
                }
                field("Model Name";Rec."Model Name")
                {
                }
                field("Customer No.";Rec."Customer No.")
                {
                }
                field("Customer Name";Rec."Customer Name")
                {
                }
                field("Operation Code";Rec."Operation Code")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes ;Notes)
            {
            }
            systempart(Links ;Links)
            {
            }
        }
    }

    actions
    {
    }
}

