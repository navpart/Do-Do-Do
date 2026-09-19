page 70107 "e-Receipt List"
{
    ApplicationArea = All;
    CardPageID = "e-Receipt Card";
    PageType = List;
    Editable = false;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE ("Document Type"=FILTER('e-Receipt'),
                          "Cash/Cheque"=FILTER('Cheque'),
                           "Posted"=FILTER('No'));
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                    Width = 20;
                }
                field("Posting Date";Rec."Posting Date")
                {
                }
                field("Document Type";Rec."Document Type")
                {
                }
                field("Cash/Cheque";Rec."Cash/Cheque")
                {
                }
                field("Account Type";Rec."Account Type")
                {
                }
                field("Account No.";Rec."Account No.")
                {
                }
                field("Account Description";Rec."Account Description")
                {
                }
                field("Transaction Description";Rec."Transaction Description")
                {
                }
                field("Balance Account Type";Rec."Balance Account Type")
                {
                }
                field("Balance Account No.";Rec."Balance Account No.")
                {
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                    Caption = 'Department Code';
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch Code';
                }
                field(Amount;Rec.Amount)
                {
                }
                field("Created By";Rec."Created By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

