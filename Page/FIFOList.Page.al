page 50403 "FIFO List"
{
    PageType = Card;
    SourceTable = "Item Ledger Entry";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Purchase Date"; Rec."Purchase Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

