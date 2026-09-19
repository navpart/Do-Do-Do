page 70024 "Posted Journal Voucher List"
{
    ApplicationArea = All;
    CardPageID = "Posted Journal Voucher Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = CONST(Journal),
                            "Cash/Cheque" = CONST(Cheque),
                            Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
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
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Modified By"; Rec."Modified By")
                {
                }
                field("Received by"; Rec."Received by")
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

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

