page 50130 "Online Dealer Order"
{
    PageType = Card;
    SourceTable = "Online Dealer Order";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Refrence No."; Rec."Refrence No.")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("Part No."; Rec."Part No.")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field(Process; Rec.Process)
                {
                }
                field("Tracker No."; Rec."Tracker No.")
                {
                }
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field("Required Q'ty"; Rec."Required Q'ty")
                {
                }
                field("Q'ty Supply"; Rec."Q'ty Supply")
                {
                }
                field("Supply Category"; Rec."Supply Category")
                {
                }
                field(Branch; Rec.Branch)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

