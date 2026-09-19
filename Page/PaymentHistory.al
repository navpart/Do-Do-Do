page 50048 "Payment History"
{
    ApplicationArea = All;
    Caption = 'Payment History';
    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the customer entry''s posting date.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the customer account number that the entry is linked to.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the customer name that the entry is linked to.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the sales document number.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of sales document.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the amount of the entry in LCY.';
                }
            }
        }
    }
}
