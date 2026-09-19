page 50593 "Pool Car Request Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Pool Car Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Current Pending Person"; Rec."Current Pending Person")
                {
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Editable = false;
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                    Caption = 'Department';
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                }
                field("Take-off Location"; Rec."Take-off Location")
                {
                }
                field(Reason; Rec.Reason)
                {
                    ShowMandatory = true;
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                }
                field("Pickup Time"; Rec."Pickup Time")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("Return Time"; Rec."Return Time")
                {
                }
                field(Hours; Rec.Hours)
                {
                }
            }
            group("Requester's Action")
            {
                field("1st Approval"; Rec."1st Approval")
                {
                    Caption = 'Send To HOD';
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("HOD's Action")
            {
                field("2nd Approval"; Rec."2nd Approval")
                {
                    Caption = 'Send To ADMIN';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                    Caption = 'Action';
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("ADMIN's Action")
            {
                field("Final Approval"; Rec."Final Approval")
                {
                    Caption = 'Send To Allocator';
                }
                field("Final Approver"; Rec."Final Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                    Caption = 'Action';
                }
                field(Time; Rec."2nd Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group(Print)
            {
                action(Printing)
                {
                    Caption = 'P&rint';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                }
            }
        }
    }

    var
        Edit1: Boolean;
        Edit2: Boolean;
        Edit3: Boolean;
}

