namespace AL_TNL.AL_TNL;

page 50078 "IOU Lookup"
{
    ApplicationArea = All;
    Caption = 'IOU Lookup';
    PageType = List;
    SourceTable = "IOU Register";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("120Isolo"; Rec."120Isolo")
                {
                    ToolTip = 'Specifies the value of the 120Isolo field.', Comment = '%';
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    ToolTip = 'Specifies the value of the 1st Approval Time field.', Comment = '%';
                }
                field("1st Approval to"; Rec."1st Approval to")
                {
                    ToolTip = 'Specifies the value of the 1st Approval to field.', Comment = '%';
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    ToolTip = 'Specifies the value of the 1st Approver field.', Comment = '%';
                }
                field("1st Approver's Comment"; Rec."1st Approver's Comment")
                {
                    ToolTip = 'Specifies the value of the 1st Approver''s Comment field.', Comment = '%';
                }
                field("1st Apprv. Status"; Rec."1st Apprv. Status")
                {
                    ToolTip = 'Specifies the value of the 1st Apprv. Status field.', Comment = '%';
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    ToolTip = 'Specifies the value of the 2nd Approval Time field.', Comment = '%';
                }
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    ToolTip = 'Specifies the value of the 2nd Approval to field.', Comment = '%';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    ToolTip = 'Specifies the value of the 2nd Approver field.', Comment = '%';
                }
                field("2nd Approver's Comment"; Rec."2nd Approver's Comment")
                {
                    ToolTip = 'Specifies the value of the 2nd Approver''s Comment field.', Comment = '%';
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
                    ToolTip = 'Specifies the value of the 2nd Apprv. Status field.', Comment = '%';
                }
                field("3rd Approval Time"; Rec."3rd Approval Time")
                {
                    ToolTip = 'Specifies the value of the 3rd Approval Time field.', Comment = '%';
                }
                field("3rd Approval to"; Rec."3rd Approval to")
                {
                    ToolTip = 'Specifies the value of the 3rd Approval to field.', Comment = '%';
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    ToolTip = 'Specifies the value of the 3rd Approver field.', Comment = '%';
                }
                field("3rd Approver's Comment"; Rec."3rd Approver's Comment")
                {
                    ToolTip = 'Specifies the value of the 3rd Approver''s Comment field.', Comment = '%';
                }
                field("3rd Apprv.Status"; Rec."3rd Apprv.Status")
                {
                    ToolTip = 'Specifies the value of the 3rd Apprv.Status field.', Comment = '%';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.', Comment = '%';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount Retired"; Rec."Amount Retired")
                {
                    ToolTip = 'Specifies the value of the Amount Retired field.', Comment = '%';
                }
                field(Approved; Rec.Approved)
                {
                    ToolTip = 'Specifies the value of the Approved field.', Comment = '%';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ToolTip = 'Specifies the value of the Approved By field.', Comment = '%';
                }
                field(Attachment; Rec.Attachment)
                {
                    ToolTip = 'Specifies the value of the Attachment field.', Comment = '%';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ToolTip = 'Specifies the value of the Bal. Account No. field.', Comment = '%';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ToolTip = 'Specifies the value of the Bal. Account Type field.', Comment = '%';
                }
                field("Collected By"; Rec."Collected By")
                {
                    ToolTip = 'Specifies the value of the Collected By field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field("Converted to Loan"; Rec."Converted to Loan")
                {
                    ToolTip = 'Specifies the value of the Converted to Loan field.', Comment = '%';
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ToolTip = 'Specifies the value of the Cost Amount field.', Comment = '%';
                }
                field("Current pending Person"; Rec."Current pending Person")
                {
                    ToolTip = 'Specifies the value of the Current pending Person field.', Comment = '%';
                }
                field("Customer Approved Amount"; Rec."Customer Approved Amount")
                {
                    ToolTip = 'Specifies the value of the Customer Approved Amount field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    ToolTip = 'Specifies the value of the Entry Date field.', Comment = '%';
                }
                field("Expected Retirement Date"; Rec."Expected Retirement Date")
                {
                    ToolTip = 'Specifies the value of the Expected Retirement Date field.', Comment = '%';
                }
                field("Expected Time of Payment"; Rec."Expected Time of Payment")
                {
                    ToolTip = 'Specifies the value of the Expected Time of Payment field.', Comment = '%';
                }
                field("Final Approval Time"; Rec."Final Approval Time")
                {
                    ToolTip = 'Specifies the value of the Final Approval Time field.', Comment = '%';
                }
                field("Final Approval to"; Rec."Final Approval to")
                {
                    ToolTip = 'Specifies the value of the Final Approval to field.', Comment = '%';
                }
                field("Final Approver's Comment"; Rec."Final Approver's Comment")
                {
                    ToolTip = 'Specifies the value of the Final Approver''s Comment field.', Comment = '%';
                }
                field("Final Approver's Name"; Rec."Final Approver's Name")
                {
                    ToolTip = 'Specifies the value of the Final Approver''s Name field.', Comment = '%';
                }
                field("Final Apprv. Status"; Rec."Final Apprv. Status")
                {
                    ToolTip = 'Specifies the value of the Final Apprv. Status field.', Comment = '%';
                }
                field("General Comment"; Rec."General Comment")
                {
                    ToolTip = 'Specifies the value of the General Comment field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("IOU No."; Rec."IOU No.")
                {
                    ToolTip = 'Specifies the value of the IOU No. field.', Comment = '%';
                }
                field("Mail Body"; Rec."Mail Body")
                {
                    ToolTip = 'Specifies the value of the Mail Body field.', Comment = '%';
                }
                field("Manual Voucher No."; Rec."Manual Voucher No.")
                {
                    ToolTip = 'Specifies the value of the Manual Voucher No. field.', Comment = '%';
                }
                field("Markup Amount"; Rec."Markup Amount")
                {
                    ToolTip = 'Specifies the value of the Markup Amount field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ToolTip = 'Specifies the value of the No. Printed field.', Comment = '%';
                }
                field(Paid; Rec.Paid)
                {
                    ToolTip = 'Specifies the value of the Paid field.', Comment = '%';
                }
                field("Paid By"; Rec."Paid By")
                {
                    ToolTip = 'Specifies the value of the Paid By field.', Comment = '%';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ToolTip = 'Specifies the value of the Payment Date field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                }
                field("Procurement No."; Rec."Procurement No.")
                {
                    ToolTip = 'Specifies the value of the Procurement No. field.', Comment = '%';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ToolTip = 'Specifies the value of the Procurement Type field.', Comment = '%';
                }
                field(Reject; Rec.Reject)
                {
                    ToolTip = 'Specifies the value of the Reject field.', Comment = '%';
                }
                field(Requester; Rec.Requester)
                {
                    ToolTip = 'Specifies the value of the Requester field.', Comment = '%';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ToolTip = 'Specifies the value of the Requester Name field.', Comment = '%';
                }
                field(Retired; Rec.Retired)
                {
                    ToolTip = 'Specifies the value of the Retired field.', Comment = '%';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ToolTip = 'Specifies the value of the Retirement Date field.', Comment = '%';
                }
                field("Send for 2nd Apprv."; Rec."Send for 2nd Apprv.")
                {
                    ToolTip = 'Specifies the value of the Send for 2nd Apprv. field.', Comment = '%';
                }
                field("Send for 3rd Apprv."; Rec."Send for 3rd Apprv.")
                {
                    ToolTip = 'Specifies the value of the Send for 3rd Apprv. field.', Comment = '%';
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    ToolTip = 'Specifies the value of the Send for Approval field.', Comment = '%';
                }
                field(Sender; Rec.Sender)
                {
                    ToolTip = 'Specifies the value of the Sender field.', Comment = '%';
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    ToolTip = 'Specifies the value of the Sent Time field.', Comment = '%';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ToolTip = 'Specifies the value of the Staff Name field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field(Treated; Rec.Treated)
                {
                    ToolTip = 'Specifies the value of the Treated field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
                field(Void; Rec.Void)
                {
                    ToolTip = 'Specifies the value of the Void field.', Comment = '%';
                }
                field("Voided By"; Rec."Voided By")
                {
                    ToolTip = 'Specifies the value of the Voided By field.', Comment = '%';
                }
            }
        }
    }
}
