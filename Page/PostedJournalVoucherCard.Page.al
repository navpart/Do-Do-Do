page 70029 "Posted Journal Voucher Card"
{
    ApplicationArea = All;
    DataCaptionFields = "Cash/Cheque", "Document Type", "No.";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Payment/Receipt.";
    SourceTableView = WHERE("Document Type" = CONST(Journal),
                            "Cash/Cheque" = CONST(Cheque),
                            Posted = filter(true));

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
                Caption = '&Print Document';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = "Print DocumentVisible";

                trigger OnAction()
                begin
                    ReqRec.SETRANGE(ReqRec."Document Type", Rec."Document Type");
                    ReqRec.SETRANGE(ReqRec."No.", Rec."No.");
                    IF ReqRec.FINDFIRST THEN BEGIN
                        IF ReqRec."Multiple Balance Account" OR ReqRec."Multiple Account" THEN
                            REPORT.RUNMODAL(50005, TRUE, TRUE, ReqRec) ELSE
                            REPORT.RUNMODAL(50011, TRUE, TRUE, ReqRec);
                    END;
                end;
            }
            action(Navigate)
            {
                Caption = 'Na&vigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = NavigateVisible;

                trigger OnAction()
                begin
                    Rec.Navigate;
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


    procedure UpdatePosting()
    begin
        IF NOT Rec.Posted THEN BEGIN
            GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
            GLEntry.SETRANGE(GLEntry."Document No.", Rec."No.");
            IF GLEntry.FIND('-') THEN
                Rec.Posted := TRUE;
            Rec.MODIFY;
        END
        ELSE BEGIN
            GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
            GLEntry.SETRANGE(GLEntry."Document No.", Rec."No.");
            IF NOT GLEntry.FIND('-') THEN
                Rec.Posted := FALSE;
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
            IF cashRecLine.FIND('-') THEN BEGIN
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

