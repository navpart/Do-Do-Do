page 50022 "Cash Receipt List"
{
    ApplicationArea = All;
    Caption = 'Cash Receipt List';
    PageType = List;
    CardPageId = "Cash Receipt Card";
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = const(Receipt), "Cash/Cheque" = const(Cash), Posted = filter(false), Reject = filter(false));
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Description"; Rec."Account Description")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
    }
}
