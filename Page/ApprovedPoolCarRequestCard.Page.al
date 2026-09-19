page 50595 "Approved Pool Car Request Card"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    SourceTable = "Pool Car Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Request No."; Rec."Request No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Destination; Rec.Destination)
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                    Caption = 'Purpose';
                }
                field(Requester; Rec.Requester)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                    Caption = 'Department';
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("Pickup Time"; Rec."Pickup Time")
                {
                }
                field("Return Time"; Rec."Return Time")
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field(Hours; Rec.Hours)
                {
                }
            }
            group(Send)
            {
                field("1st Approval"; Rec."1st Approval")
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
                field(Sender; Rec.Sender)
                {
                    Caption = 'Sent by';
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Caption = 'Time';
                }
            }
            group("Level 1")
            {
                Caption = 'Level 1';
                field("2nd Approval"; Rec."2nd Approval")
                {
                    Caption = 'To';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                }
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                    Caption = 'Action';
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                }
            }
            group("Level 2")
            {
                field("Final Approval"; Rec."Final Approval")
                {
                    Caption = 'To';
                }
                field("Final Approver"; Rec."Final Approver")
                {
                    Caption = 'Name';
                }
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                    Caption = 'Action';
                }
                field(Time; Rec."2nd Approval Time")
                {
                    Caption = 'Time';
                }
            }
        }
    }

    actions
    {
    }
}

