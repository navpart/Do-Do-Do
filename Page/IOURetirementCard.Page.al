page 50218 "IOU Retirement Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "IOU Retirement Header";

    layout
    {
        area(content)
        {
            group("IOU Retirement")
            {
                Caption = 'IOU Retirement';
                field("No."; Rec."No.")
                {
                    Editable = "No.Editable";

                    trigger OnValidate()
                    begin
                        ERROR('You cannot change the Retirement No.!');
                    end;
                }
                field("IOU No."; Rec."IOU No.")
                {

                    trigger OnValidate()
                    begin
                        IF Rec."1st Apprv. Status" = Rec."1st Apprv. Status"::Approved THEN
                            ERROR('You cannot change IOU No. after approval has been made!');
                    end;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    Caption = 'Entry Date';
                    Editable = "Entry DateEditable";
                }
                field("Staff No."; Rec."Staff No.")
                {
                    Editable = false;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Original IOU Amount"; Rec."Original IOU Amount")
                {
                }
                field("Amount To Retire"; Rec."Amount To Retire")
                {
                }
                field(BalAmt; BalAmt)
                {
                    Caption = 'Balance';
                    Editable = false;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field("Apply Entry"; Rec."Apply Entry")
                {
                }
            }
            part("Retirement Lines"; "Retirement Lines")
            {
                SubPageLink = "Retirement No." = FIELD("No."), "IOU No." = FIELD("IOU No.");
            }
            group(Approval)
            {
                Caption = 'Approval';
                field(Sender; Rec.Sender)
                {
                    Editable = "1st Approval toEditable";
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Caption = 'Sent Time';
                    Editable = false;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
                    Editable = "1st Approval toEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."Send for Approval" THEN
                            "1st Approval toEditable" := FALSE
                        ELSE
                            "1st Approval toEditable" := TRUE;
                    end;
                }
                field("1st Approval to"; Rec."1st Approval to")
                {
                    Caption = 'To';
                    Editable = "1st Approval toEditable";
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
            }
            group("Level 1")
            {
                Visible = "1st ApprovalVisible";
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    Caption = 'To';
                    Editable = "2nd Approval toEditable";
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("1st Apprv. Sta  tus"; Rec."1st Apprv. Status")
                {
                    Caption = 'Status';
                    Editable = "1st Apprv. StatusEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."1st Apprv. Status" = Rec."1st Apprv. Status"::Approved THEN BEGIN
                            "2nd Approval toEditable" := FALSE;
                            "Send for ApprovalEditable" := FALSE
                        END ELSE BEGIN
                            "2nd Approval toEditable" := TRUE;
                            "Send for ApprovalEditable" := TRUE
                        END;
                    end;
                }
                field("1st Approval T  ime"; Rec."1st Approval Time")
                {
                    Caption = 'Sent Time';
                    Editable = false;
                }
            }
            group("Level 2")
            {
                Visible = "2nd ApprovalVisible";
                field("3rd Approval to"; Rec."3rd Approval to")
                {
                    Caption = 'To';
                    Editable = "3rd Approval toEditable";
                }
                field("3rd Appro  ver"; Rec."3rd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
                    Caption = 'Status';
                    Editable = "2nd Apprv. StatusEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."2nd Apprv. Status" = Rec."2nd Apprv. Status"::Approved THEN BEGIN
                            "3rd Approval toEditable" := FALSE;
                            "1st Apprv. StatusEditable" := FALSE
                        END ELSE BEGIN
                            "3rd Approval toEditable" := TRUE;
                            "1st Apprv. StatusEditable" := TRUE
                        END;
                    end;
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Sent Time';
                    Editable = false;
                }
            }
            group("Level 3")
            {
                Visible = "Final ApprovalVisible";
                field("Final Apprv. Status"; Rec."Final Apprv. Status")
                {

                    trigger OnValidate()
                    begin
                        IF Rec."Final Apprv. Status" = Rec."Final Apprv. Status"::Approved THEN
                            "2nd Apprv. StatusEditable" := FALSE
                        ELSE
                            "2nd Apprv. StatusEditable" := TRUE;
                    end;
                }
                field("Final Approval Time"; Rec."Final Approval Time")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nction")
            {
                Caption = 'Fu&nction';
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        IOURetireHead.SETRANGE(IOURetireHead."No.", Rec."No.");
                        IF Rec.FINDFIRST THEN
                            REPORT.RUNMODAL(50350, TRUE, TRUE, IOURetireHead);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.TESTFIELD("Final Apprv. Status", 2);
                        IOURec.GET(Rec."IOU No.");
                        IOURec.TESTFIELD(IOURec."Converted to Loan", FALSE);
                        IF NOT CONFIRM(Text001, FALSE) THEN
                            EXIT ELSE BEGIN
                            GPC.PostIOURetirement(Rec);
                            CurrPage.UPDATE(FALSE);
                            IOURec.Posted := TRUE;
                        END;
                    end;
                }
                action("test report")
                {
                    Caption = 'Test Report';
                    Image = TestReport;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec."Test Report" := TRUE;

                        GLEntry2.SETRANGE(GLEntry2."Document No.", Rec."No.");
                        IF GLEntry2.FINDFIRST THEN
                            ERROR('This document has been posted before!');
                        IF Rec.Posted THEN ERROR('This document has been posted before!');
                        Rec.Testgl(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        BalAmt := 0;
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
        CustOnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        "Entry DateEditable" := TRUE;
        "2nd Apprv. StatusEditable" := TRUE;
        "1st Apprv. StatusEditable" := TRUE;
        "3rd Approval toEditable" := TRUE;
        "Send for ApprovalEditable" := TRUE;
        "2nd Approval toEditable" := TRUE;
        "1st Approval toEditable" := TRUE;
        "No.Editable" := TRUE;
        "Final ApprovalVisible" := TRUE;
        "2nd ApprovalVisible" := TRUE;
        "1st ApprovalVisible" := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Send for Approval" THEN
            "1st Approval toEditable" := FALSE
        ELSE
            "1st Approval toEditable" := TRUE;
        IF Rec."1st Apprv. Status" = Rec."1st Apprv. Status"::Approved THEN BEGIN
            "2nd Approval toEditable" := FALSE;
            "Send for ApprovalEditable" := FALSE
        END ELSE BEGIN
            "2nd Approval toEditable" := TRUE;
            "Send for ApprovalEditable" := TRUE
        END;
        IF Rec."2nd Apprv. Status" = Rec."2nd Apprv. Status"::Approved THEN BEGIN
            "3rd Approval toEditable" := FALSE;
            "1st Apprv. StatusEditable" := FALSE
        END ELSE BEGIN
            "3rd Approval toEditable" := TRUE;
            "1st Apprv. StatusEditable" := TRUE
        END;
        IF Rec."Final Apprv. Status" = Rec."Final Apprv. Status"::Approved THEN
            "2nd Apprv. StatusEditable" := FALSE
        ELSE
            "2nd Apprv. StatusEditable" := TRUE;

        //UserSetup.GET(USERID);
        IF UserSetup."User ID" = 'TOLULOPE' THEN
            "Entry DateEditable" := TRUE ELSE
            "Entry DateEditable" := FALSE;
    end;

    var
        IOURec: Record 50105;
        IOURetireHead: Record 50107;
        GPC: Codeunit 50004;
        Text001: Label 'Do you want to Post Retirement';
        BalAmt: Decimal;
        IOURetLine: Record 50106;
        UserSetup: Record 91;

        "1st ApprovalVisible": Boolean;

        "2nd ApprovalVisible": Boolean;

        "Final ApprovalVisible": Boolean;

        "No.Editable": Boolean;

        "1st Approval toEditable": Boolean;

        "2nd Approval toEditable": Boolean;

        "Send for ApprovalEditable": Boolean;

        "3rd Approval toEditable": Boolean;

        "1st Apprv. StatusEditable": Boolean;

        "2nd Apprv. StatusEditable": Boolean;

        "Entry DateEditable": Boolean;
        Text19002652: Label 'For Accounts Dept. ';
        Text19022435: Label '1st Approver''s Comment';
        GLEntry2: Record 17;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec."1st Apprv. Status" = Rec."1st Apprv. Status"::Approved THEN
            "No.Editable" := FALSE;

        IF Rec."Send for Approval" THEN
            "1st ApprovalVisible" := TRUE
        ELSE
            "1st ApprovalVisible" := FALSE;
        IF Rec."1st Apprv. Status" = Rec."1st Apprv. Status"::Approved THEN
            "2nd ApprovalVisible" := TRUE
        ELSE
            "2nd ApprovalVisible" := FALSE;
        IF Rec."2nd Apprv. Status" = Rec."2nd Apprv. Status"::Approved THEN
            "Final ApprovalVisible" := TRUE
        ELSE
            "Final ApprovalVisible" := FALSE;

        BalAmt := 0;
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
    end;
}

