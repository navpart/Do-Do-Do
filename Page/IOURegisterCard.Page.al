page 70031 "IOU Register Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "IOU Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = "1st Approval toEditable";
                field("Current pending Person"; Rec."Current pending Person")
                {
                    Editable = false;
                }
                field("IOU No."; Rec."IOU No.")
                {
                    Editable = false;
                }
                field(Requester; Rec.Requester)
                {
                    Editable = false;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Editable = false;
                }

                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Purpose; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Staff No."; Rec."Account No.")
                {
                }
                field("Staff Name"; Rec."Account Name")
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ShowMandatory = true;
                }
                field("120Isolo"; Rec."120Isolo")
                {

                    trigger OnValidate()
                    begin
                        IF Rec."120Isolo" THEN
                            JobDetails_Visible := TRUE
                        ELSE
                            JobDetails_Visible := FALSE;
                    end;
                }
            }
            group("Job Details ")
            {
                Caption = 'Job Details';
                Visible = JobDetails_Visible;
                field("No."; Rec."No.")
                {
                }
                field("Customer Approved Amount"; Rec."Customer Approved Amount")
                {
                }
                field("Markup Amount"; Rec."Markup Amount")
                {
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                }
            }
            group(Sender)
            {
                Caption = 'Sender';
                field("1st Approval to"; Rec."1st Approval to")
                {
                    Caption = 'To';
                    Editable = "1st Approval toEditable";
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = "1st Approval toEditable";
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
                field("Sent By"; Rec.Sender)
                {
                    Caption = 'Sent By';
                    Editable = false;
                }
                field("Sent Time"; Rec."Sent Time")
                {
                }
            }
            group("Level 1")
            {
                Caption = 'Level 1';
                Visible = "1st ApprovalVisible";
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    Caption = 'To';
                    Editable = "2nd Approval toEditable";
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = "2nd Approval toEditable";
                }
                field("1st Apprv. Status"; Rec."1st Apprv. Status")
                {
                    Caption = 'Action';
                    Editable = "2nd Approval toEditable";

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
                    Caption = 'Time';
                    Editable = "2nd Approval toEditable";
                }
            }
            group("Level 2")
            {
                Caption = 'Level 2';
                Visible = "2nd ApprovalVisible";
                field("3rd Approval to"; Rec."3rd Approval to")
                {
                    Caption = 'To';
                    Editable = "3rd Approval toEditable";
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    Caption = 'Name';
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
                    Caption = 'Action';

                    trigger OnValidate()
                    begin
                        IF Rec."2nd Apprv. Status" = Rec."2nd Apprv. Status"::Approved THEN BEGIN
                            "3rd Approval toEditable" := TRUE;
                            "1st Apprv. StatusEditable" := FALSE;
                            "Final ApprovalVisible" := FALSE

                        END ELSE BEGIN
                            "3rd Approval toEditable" := TRUE;
                            "1st Apprv. StatusEditable" := TRUE;
                            "Final ApprovalVisible" := FALSE
                        END;
                    end;
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Time';
                }
            }
            group("Level 3")
            {
                Caption = 'Level 3';
                Visible = "Final ApprovalVisible";
                field("Final Apprv. Status"; Rec."Final Apprv. Status")
                {
                    Caption = 'Action';

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
                    Caption = 'Time';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = "Report";

                trigger OnAction()
                begin

                    IOURec.SETRANGE(IOURec."IOU No.", Rec."IOU No.");
                    IF IOURec.FINDFIRST THEN BEGIN
                        IOUReport.SETTABLEVIEW(IOURec);
                        IOUReport.RUN;
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        CustOnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."120Isolo" THEN
            JobDetails_Visible := TRUE
        ELSE
            JobDetails_Visible := FALSE;


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
    end;

    var
        IOURec: Record 50105;
        IOUReport: Report 50299;
        GPC: Codeunit 50004;

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
        JobDetails_Visible: Boolean;

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
    end;
}

