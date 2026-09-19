page 50226 "Cheque Receipt Mgt"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Cheque Receipt Mgt.";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                field("Cashier Code"; Rec."Cashier Code")
                {
                }
                field("Transaction date"; Rec."Transaction date")
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Banks Cheque code"; Rec."Banks Cheque code")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field("Cheque Value"; Rec."Cheque Value")
                {
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                }
                field("Post Dated Cheque"; Rec."Post Dated Cheque")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer  Name"; Rec."Customer  Name")
                {
                }
                field(Reference; Rec.Reference)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
            group(Treasurer)
            {
                Caption = 'Treasurer';
                field("Deposited Bank Account"; Rec."Deposited Bank Account")
                {
                }
                field("Date Presented to Bank"; Rec."Date Presented to Bank")
                {
                }
                field("Expected Clearing Date"; Rec."Expected Clearing Date")
                {
                }
                field("Date Cleared"; Rec."Date Cleared")
                {
                }
                field(Cleared; Rec.Cleared)
                {
                }
                field("Returned Date"; Rec."Returned Date")
                {
                }
                field(Returned; Rec.Returned)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Temporary Receipt")
            {
                Caption = 'Print Temporary Receipt';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 50300;
                Visible = false;

                trigger OnAction()
                begin
                    IF NOT Rec.Cleared THEN
                        REPORT.RUNMODAL(50300, TRUE, TRUE, Rec);
                end;
            }
            group(Print)
            {
                Caption = 'Print';
                action("Temporary Receipt")
                {
                    Caption = 'Temporary Receipt';
                    //RunObject = Report 50300;
                }
                action("Confirmed Receipt")
                {
                    Caption = 'Confirmed Receipt';
                    //RunObject = Report 50303;
                }
            }
        }
    }

    var
        ChqRcpt: Record 50134;
}

