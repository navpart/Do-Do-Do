page 70110 "Posted e-Receipt Voucher"
{
    ApplicationArea = All;
    Editable = false;
    PageType = Card;
    SourceTable = "Payment/Receipt.";

    layout
    {
        area(content)
        {
            group("Document Details")
            {
                Caption = 'Document Details';
                field("No."; Rec."No.")
                {
                    Caption = 'No.';

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Exchange rate"; Rec."Exchange rate")
                {
                }
            }
            group("Main Account")
            {
                Caption = 'Main Account';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch Code';
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
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Multiple Account"; Rec."Multiple Account")
                {
                }
            }
            group("Balancing Account")
            {
                Caption = 'Balancing Account';
                field("Balance Department Code"; Rec."Balance Department Code")
                {
                }
                field("Balance Branch Code"; Rec."Balance Branch Code")
                {
                }
                field("Balance Account Type"; Rec."Balance Account Type")
                {
                }
                field("Balance Account No."; Rec."Balance Account No.")
                {
                }
                field("Bal. Acc. Description"; Rec."Bal. Acc. Description")
                {
                    Caption = 'Account Description';
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Multiple Balance Account"; Rec."Multiple Balance Account")
                {
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
            }
            part(Multiline; 70012)
            {
                Editable = false;
                SubPageLink = "No." = FIELD("No."),
                              Type = FIELD("Document Type"),
                              "Cash/Cheque" = FIELD("Cash/Cheque");
                Visible = MultilineVisible;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print Document")
            {
                Caption = 'Print Document';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ReqRec.SETRANGE(ReqRec."Document Type", Rec."Document Type");
                    ReqRec.SETRANGE(ReqRec."No.", Rec."No.");
                    IF ReqRec.FINDFIRST THEN BEGIN
                        IF ReqRec."Multiple Balance Account" OR ReqRec."Multiple Account" THEN
                            REPORT.RUNMODAL(50425, TRUE, TRUE, ReqRec) ELSE
                            REPORT.RUNMODAL(50427, TRUE, TRUE, ReqRec);
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Multiple Account" OR Rec."Multiple Balance Account" THEN
            MultilineVisible := TRUE
        ELSE
            MultilineVisible := FALSE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Multiple Account" OR Rec."Multiple Balance Account" THEN
            MultilineVisible := TRUE
        ELSE
            MultilineVisible := FALSE;
    end;

    var
        operationType: Integer;
        Doctype: Option;
        Cashvalue: Option;
        DocumentType: Option Receipt,Requisition;
        Cashcheque: Option Cash,Cheque;
        cashRecLine: Record 50104;
        Doctext: Text[30];
        CashText: Text[30];
        ReqRec: Record 50103;
        posd: Text[30];
        pos: Boolean;
        ChangeExchangeRate: Page 511;
        GLReconcile: Page 345;
        GenJnlManagement: Codeunit 230;
        ReportPrint: Codeunit 228;
        CurrentJnlBatchName: Code[10];
        AccName: Text[30];
        BalAccName: Text[30];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        GLEntry: Record 17;
        UserRec: Record 91;
        GPC: Codeunit 50004;


        "FA Posting TypeVisible": Boolean;

        "Maintenance CodeVisible": Boolean;

        "Print DocumentVisible": Boolean;

        debalVisible: Boolean;

        MultilineVisible: Boolean;

        NavigateVisible: Boolean;
        Text19038076: Label 'Department Code';
        Text19077769: Label 'Branch Code';
}

