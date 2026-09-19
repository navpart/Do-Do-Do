page 70015 "Cash Payment Card"
{
    ApplicationArea = All;
    DataCaptionFields = "Cash/Cheque", "Document Type", "No.";
    PageType = Card;
    SourceTable = "Payment/Receipt.";
    SourceTableView = SORTING("Document Type", "Cash/Cheque", "No.");

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
                field("Created By"; Rec."Created By")
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

                    trigger OnValidate()
                    begin
                        MultipleAccountOnPush;
                        CurrPage.UPDATE;
                    end;
                }
                field("Collected By"; Rec."Collected By")
                {
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                }
                field("FA Posting Type"; Rec."FA Posting Type")
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
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Multiple Balance Account"; Rec."Multiple Balance Account")
                {

                    trigger OnValidate()
                    begin
                        MultipleBalanceAccountOnPush;
                        CurrPage.UPDATE;
                    end;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Apply Entry"; Rec."Apply Entry")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field("Received by"; Rec."Received by")
                {
                }
            }
            part(Multiline; "Payment/Receipt Bal. Line")
            {
                SubPageLink = "No." = FIELD("No."), Type = FIELD("Document Type"), "Cash/Cheque" = FIELD("Cash/Cheque");
                Visible = MultilineVisible;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Preview Posting")
            {
                Caption = 'Preview Posting';
                Image = TestReport;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF Rec.Posted THEN ERROR('This document has been posted before!');
                    Rec.Postgl(Rec, TRUE);
                end;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'F9';

                trigger OnAction()
                begin
                    IF Rec."Created By" = COPYSTR(USERID, 15) THEN
                        ERROR('You cannot post!');
                    GLEntry2.LOCKTABLE;
                    GLEntry2.SETRANGE(GLEntry2."Document No.", Rec."No.");
                    IF GLEntry2.FINDFIRST THEN
                        ERROR('This document has been posted before!');

                    IF Rec.Posted THEN ERROR('This document has been posted before!');
                    Rec.Postgl(Rec, FALSE);

                    UpdatePosting;
                end;
            }
            action(Print)
            {
                Caption = 'Print';
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
                            REPORT.RUNMODAL(50006, TRUE, TRUE, ReqRec) ELSE
                            REPORT.RUNMODAL(50003, TRUE, TRUE, ReqRec);
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        IF (Rec."Multiple Balance Account") OR (Rec."Multiple Account") THEN BEGIN
            debalVisible := TRUE;
            MultilineVisible := TRUE;
        END
        ELSE BEGIN
            debalVisible := FALSE;
            MultilineVisible := FALSE;
        END;
        IF Rec."Account Type" = Rec."Account Type"::"Fixed Asset" THEN BEGIN
            "FA Posting TypeVisible" := TRUE;
            "Maintenance CodeVisible" := TRUE;
        END
        ELSE BEGIN
            "FA Posting TypeVisible" := FALSE;
            "Maintenance CodeVisible" := FALSE;
        END;
    end;

    trigger OnInit()
    begin
        NavigateVisible := TRUE;
        debalVisible := TRUE;
        "Print DocumentVisible" := TRUE;
        "Maintenance CodeVisible" := TRUE;
        "FA Posting TypeVisible" := TRUE;
    end;

    trigger OnOpenPage()
    begin
        CurrPage.EDITABLE(TRUE);
        NavigateVisible := FALSE;
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
        //GPC: Codeunit "50004";
        "FA Posting TypeVisible": Boolean;

        "Maintenance CodeVisible": Boolean;

        "Print DocumentVisible": Boolean;

        debalVisible: Boolean;

        MultilineVisible: Boolean;

        NavigateVisible: Boolean;
        Text19038076: Label 'Department Code';
        Text19077769: Label 'Branch Code';
        GLEntry2: Record 17;

    procedure UpdatePosting()
    begin
        GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
        GLEntry.SETRANGE(GLEntry."Document No.", Rec."No.");
        IF GLEntry.FINDFIRST THEN BEGIN
            Rec.Posted := TRUE;
            Rec.MODIFY;
        END;
    end;

    local procedure AccountTypeOnAfterValidate()
    begin
        IF Rec."Account Type" = Rec."Account Type"::"Fixed Asset" THEN BEGIN
            "FA Posting TypeVisible" := TRUE;
            "Maintenance CodeVisible" := TRUE;
        END
        ELSE BEGIN
            "FA Posting TypeVisible" := FALSE;
            "Maintenance CodeVisible" := FALSE;
        END;
    end;

    local procedure Control1000000081OnActivate()
    begin
        UpdatePosting;
    end;

    local procedure Control1000000034OnActivate()
    begin
        UpdatePosting;
    end;

    local procedure MultipleBalanceAccountOnPush()
    begin
        IF Rec."Multiple Balance Account" THEN
            MultilineVisible := TRUE
        ELSE BEGIN
            cashRecLine.SETRANGE(cashRecLine.Type, Rec."Document Type");
            cashRecLine.SETRANGE(cashRecLine."Cash/Cheque", Rec."Cash/Cheque");
            cashRecLine.SETRANGE(cashRecLine."No.", Rec."No.");
            IF cashRecLine.FindFirst() THEN BEGIN
                IF CONFIRM('This Action will delete all balance Line for This Transaction/ Continue deletion ?', FALSE) THEN
                    cashRecLine.DELETEALL
                ELSE
                    EXIT;
            END
            ELSE
                MultilineVisible := FALSE;
        END;
    end;

    local procedure MultipleAccountOnPush()
    begin
        IF Rec."Multiple Account" THEN BEGIN
            debalVisible := TRUE;
            MultilineVisible := TRUE;
        END
        ELSE BEGIN
            cashRecLine.SETRANGE(cashRecLine.Type, Rec."Document Type");
            cashRecLine.SETRANGE(cashRecLine."Cash/Cheque", Rec."Cash/Cheque");
            cashRecLine.SETRANGE(cashRecLine."No.", Rec."No.");
            IF cashRecLine.FIND('-') THEN BEGIN
                IF CONFIRM('This Action will delete all balance Line for This Transaction/ Continue deletion ?', FALSE) THEN
                    cashRecLine.DELETEALL
                ELSE
                    EXIT;
            END
            ELSE BEGIN
                debalVisible := FALSE;
                MultilineVisible := FALSE;
            END
        END;
    end;
}

