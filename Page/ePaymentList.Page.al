page 70097 "e-Payment List"
{
    ApplicationArea = All;
    CardPageID = "e-Payment Card";
    PageType = List;
    Editable = false;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = FILTER('e-Pay'),
                            "Cash/Cheque" = FILTER('Cheque'),
                            "Posted" = filter('No'),
                           "Reject" = filter('No'));

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Description"; Rec."Account Description")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Balance Account Type"; Rec."Balance Account Type")
                {
                }
                field("Balance Account No."; Rec."Balance Account No.")
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
                field("Received by"; Rec."Received by")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Balance Amount"; Rec."Balance Amount")
                {
                }
                field("Balance Total"; Rec."Balance Total")
                {
                }
                field("Detail Balance"; Rec."Detail Balance")
                {
                }
            }
        }
    }

    actions
    {
    }
}

