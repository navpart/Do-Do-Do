page 50440 "Approved IOU"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "IOU Register";
    SourceTableView = SORTING("IOU No.")
                      WHERE(Posted = filter('No'),
                            Treated = FILTER('No'));

    layout
    {
        area(content)
        {
            group("IOU Payment")
            {
                Caption = 'IOU Payment';
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    Caption = 'Entry Date';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Purpose';
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                    Caption = 'Staff No';
                }
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Staff Name';
                    Editable = false;
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Expected Retirement Date"; Rec."Expected Retirement Date")
                {
                    Caption = 'Exp. Retirement Date';
                }
                field("Manual Voucher No."; Rec."Manual Voucher No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Visible = true;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field(Treated; Rec.Treated)
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Visible = false;
                }
                field(Approved; Rec.Approved)
                {
                    Visible = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field(Paid; Rec.Paid)
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TESTFIELD("Account Name");
                        Rec.TESTFIELD("Final Apprv. Status", 2);
                        /*IF "No. Printed" = '' THEN
                          ERROR('IOU %1 must be printed!',"IOU No.");*/
                        //GPC.AccessGranted('39');
                        Rec.TESTFIELD("Payment Date");
                        Rec.TESTFIELD("Expected Retirement Date");
                        IF Rec."Payment Date" > Rec."Expected Retirement Date" THEN
                            ERROR(Rec.FIELDCAPTION("Payment Date") + ' cannot come after '
                               + Rec.FIELDCAPTION("Expected Retirement Date"));
                        GPC.PostIOUPayment(Rec, FALSE);
                        PaidOnAfterValidate;

                    end;
                }
                field("Paid By"; Rec."Paid By")
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                    Visible = false;
                }
            }
            group(Sender)
            {
                field("1st Approval to"; Rec."1st Approval to")
                {
                    Caption = 'Send To';
                    Editable = "1st Approval toEditable";
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Editable = false;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Editable = "Send for ApprovalEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."Send for Approval" THEN
                            "1st Approval toEditable" := FALSE
                        ELSE
                            "1st Approval toEditable" := TRUE;
                    end;
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Editable = false;
                }
            }
            group("1st Approval")
            {
                Visible = "1st ApprovalVisible";
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    Caption = 'For Next Approval Send to';
                    Editable = "2nd Approval toEditable";
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Editable = false;
                }
                field("1st Apprv. Status"; Rec."1st Apprv. Status")
                {
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
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Editable = false;
                }
            }
            group("2nd Approval")
            {
                Visible = "2nd ApprovalVisible";
                field("3rd Approval to"; Rec."3rd Approval to")
                {
                    Caption = 'For Next Approval Send to';
                    Editable = "3rd Approval toEditable";
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    Editable = false;
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
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
                    Editable = false;
                }
            }
            group("Final Approval")
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
                separator(Control1)
                {
                }
                action("Cancel IOU")
                {
                    Caption = 'Cancel IOU';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.VALIDATE(Void, TRUE);
                        Rec.MODIFY;
                    end;
                }
            }
        }
        area(processing)
        {
            action("P&rint")
            {
                Caption = 'P&rint';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    IOURec.SETRANGE(IOURec."IOU No.", Rec."IOU No.");
                    IF IOURec.FINDFIRST THEN BEGIN
                        IOUReport.SETTABLEVIEW(IOURec);
                        IOUReport.RUN;
                    END;
                    //CurrForm.UPDATE(FALSE);
                    //REPORT.RUNMODAL(50299,TRUE,TRUE,Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        "2nd Apprv. StatusEditable" := TRUE;
        "1st Apprv. StatusEditable" := TRUE;
        "3rd Approval toEditable" := TRUE;
        "Send for ApprovalEditable" := TRUE;
        "2nd Approval toEditable" := TRUE;
        "1st Approval toEditable" := TRUE;
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

        IF Rec.Treated THEN
            CurrPage.EDITABLE(FALSE);
    end;

    var
        IOURec: Record 50105;
        IOUReport: Report 50299;
        GPC: Codeunit 50004;

        "1st ApprovalVisible": Boolean;

        "2nd ApprovalVisible": Boolean;

        "Final ApprovalVisible": Boolean;

        "1st Approval toEditable": Boolean;

        "2nd Approval toEditable": Boolean;

        "Send for ApprovalEditable": Boolean;

        "3rd Approval toEditable": Boolean;

        "1st Apprv. StatusEditable": Boolean;

        "2nd Apprv. StatusEditable": Boolean;

    local procedure PaidOnAfterValidate()
    begin
        CurrPage.UPDATE(FALSE);
    end;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
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
    end;
}

