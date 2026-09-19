page 50083 "New Leave Payment List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Leave Payment Rev 2";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Period"; Rec."Leave Period")
                {
                }
                field("Leave Plan No."; Rec."Leave Plan No.")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Total Days Paid For"; Rec."Total Days Paid For")
                {
                }
            }
        }
    }

    actions
    {
    }
}

