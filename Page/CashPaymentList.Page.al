page 70009 "Cash Payment List"
{
    ApplicationArea = All;
    CardPageID = "Cash Payment Card";
    Editable = false;
    PageType = List;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = FILTER('Requisition'),
                            "Cash/Cheque" = FILTER('Cash'),
                            Posted = filter(false));

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

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

