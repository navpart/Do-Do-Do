page 50185 "Dealer Monthly Allocation List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Mth. Allocation Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(control1)
            {
                field("Allocation Code"; Rec."Allocation Code")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Teller No."; Rec."Teller No.")
                {
                }
                field(Bank; Rec.Bank)
                {
                }
                field("Teller Date"; Rec."Teller Date")
                {
                }
                field("Amount Allocated"; Rec."Amount Allocated")
                {
                }
            }
        }
    }

    actions
    {
    }
}

