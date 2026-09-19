page 50174 "Part Order Celling List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Part Order Celling";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Celling Code"; Rec."Celling Code")
                {
                }
                field("Lower Band"; Rec."Lower Band")
                {
                }
                field("Higher Band"; Rec."Higher Band")
                {
                }
                field("Maximum Qty"; Rec."Maximum Qty")
                {
                }
            }
        }
    }

    actions
    {
    }
}

