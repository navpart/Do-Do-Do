page 50222 "Deposit Card"
{
    PageType = Card;
    SourceTable = "Deposit Management";
    SourceTableView = SORTING("Deposit No.")
                      WHERE(Posted = filter(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(control1)
            {
                field("Deposit No."; Rec."Deposit No.")
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Prev. Payments Exists"; Rec."Prev. Payments Exists")
                {
                }
                field("Ref. Order No."; Rec."Ref. Order No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //CLEAR(frmDatePicker);
                        /*IF "Document Date" = 0D THEN
                          frmDatePicker.SetCurrDate(TODAY)
                        ELSE
                          frmDatePicker.SetCurrDate("Document Date");
                        frmDatePicker.LOOKUPMODE(TRUE);
                        IF frmDatePicker.RUNMODAL = ACTION::LookupOK THEN
                          "Document Date" := frmDatePicker.GetCurrDate;  */

                    end;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Amount Deposited"; Rec."Amount Deposited")
                {
                }
                field("Prev. Amount Deposited"; Rec."Prev. Amount Deposited")
                {
                }
                field("Balance Amount"; Rec."Balance Amount")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Production Month"; Rec."Production Month")
                {
                }
                field("Cash Confirmation"; Rec."Cash Confirmation")
                {
                }
                field(Approved; Rec.Approved)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("P&ost")
            {
                Caption = 'P&ost';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD(Approved);
                    Rec.TESTFIELD("Amount Deposited");
                    Rec.TESTFIELD("Global Dimension 1 Code");
                    GPC.AccessGranted('17');
                    GPC.PostDeposit(Rec);
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
    }

    var
        GPC: Codeunit 50004;
}

