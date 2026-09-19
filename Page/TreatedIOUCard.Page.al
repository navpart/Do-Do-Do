page 50375 "Treated IOU Card"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "IOU Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("IOU No."; Rec."IOU No.")
                {
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
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
            group(Sender)
            {
                field("1st Approval to"; Rec."1st Approval to")
                {
                    Caption = 'To';
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
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
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    Caption = 'To';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                }
                field("1st Apprv. Status"; Rec."1st Apprv. Status")
                {
                    Caption = 'Action';
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                }
                field("1st Approver's Comment"; Rec."1st Approver's Comment")
                {
                    Caption = 'Comment';
                }
            }
            group("Level 2")
            {
                Caption = 'Level 2';
                field("3rd Approval to"; Rec."3rd Approval to")
                {
                    Caption = 'To';
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    Caption = 'Name';
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
                    Caption = 'Action';
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Time';
                }
                field("2nd Approver's Comment"; Rec."2nd Approver's Comment")
                {
                    Caption = 'Comment';
                }
            }
            group("Level 3")
            {
                Caption = 'Level 3';
                field("Final Apprv. Status"; Rec."Final Apprv. Status")
                {
                    Caption = 'Action';
                }
                field("Final Approval Time"; Rec."Final Approval Time")
                {
                    Caption = 'Time';
                }
                field("Final Approver's Comment"; Rec."Final Approver's Comment")
                {
                    Caption = 'Comment';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("&Print")
            {
                Caption = '&Print';
                Image = Print;
                Promoted = true;

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

    var
        IOURec: Record 50105;
        IOUReport: Report 50299;
        GPC: Codeunit 50004;
}

