page 70109 "Posted e-Receipt List"
{
    ApplicationArea = All;
    CardPageID = "Posted e-Receipt Voucher";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = CONST("e-Receipt"),
                            "Cash/Cheque" = CONST(Cheque),
                            Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Cash/Cheque"; Rec."Cash/Cheque")
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
                field("Posting Date"; Rec."Posting Date")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Navigate;
                end;
            }
        }
    }
}

