page 50248 "Transaction-Closure"
{
    CardPageID = "Motor Show Repair Card";
    PageType = List;
    SourceTable = "Motor Show Repair";
    SourceTableView = WHERE(Close = FILTER(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field(Requester; Rec.Requester)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                }
                field(Approved; Rec.Approved)
                {
                }
                field("Approved by"; Rec."Approved by")
                {
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                }
                field("1st Approval"; Rec."1st Approval")
                {
                }
                field("2nd Approval"; Rec."2nd Approval")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("1st Approver"; Rec."1st Approver")
                {
                }
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                }
                field("1st Approval's Comment"; Rec."1st Approval's Comment")
                {
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                }
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                }
                field("2nd Approval's Comment"; Rec."2nd Approval's Comment")
                {
                }
                field(Treated; Rec.Treated)
                {
                }
                field(Sender; Rec.Sender)
                {
                }
                field("Sent Time"; Rec."Sent Time")
                {
                }
                field("Current Pending Person"; Rec."Current Pending Person")
                {
                }
                field("Mail Body"; Rec."Mail Body")
                {
                }
                field(Hours; Rec.Hours)
                {
                }
                field(Days; Rec.Days)
                {
                }
                field(Employee; Rec.Employee)
                {
                }
                field("Final Approval"; Rec."Final Approval")
                {
                }
                field("Final Approver"; Rec."Final Approver")
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
                field("Take-off Location"; Rec."Take-off Location")
                {
                }
                field(Reject; Rec.Reject)
                {
                }
                field("Auto Show Location"; Rec."Auto Show Location")
                {
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("KM Covered"; Rec."KM Covered")
                {
                }
                field("Reference No."; Rec."Reference No.")
                {
                }
                field("Responsible Dealer"; Rec."Responsible Dealer")
                {
                }
                field("Job Done"; Rec."Job Done")
                {
                }
                field("Payment Approver"; Rec."Payment Approver")
                {
                }
                field("Payment Approval Status"; Rec."Payment Approval Status")
                {
                }
                field("Payment Approval Time"; Rec."Payment Approval Time")
                {
                }
                field("Payment Approval"; Rec."Payment Approval")
                {
                }
                field("Send for Payment Approval"; Rec."Send for Payment Approval")
                {
                }
                field("Sent Payment Approval Time"; Rec."Sent Payment Approval Time")
                {
                }
                field("Payment Confirmed"; Rec."Payment Confirmed")
                {
                }
                field("Related Job"; Rec."Related Job")
                {
                }
                field("3rd Approval"; Rec."3rd Approval")
                {
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                }
                field("3rd Approval Status"; Rec."3rd Approval Status")
                {
                }
                field("3rd Approval Time"; Rec."3rd Approval Time")
                {
                }
                field("3rd Approval Comment"; Rec."3rd Approval Comment")
                {
                }
                field("Job Done Time"; Rec."Job Done Time")
                {
                }
                field("Job Done Id"; Rec."Job Done Id")
                {
                }
                field("Job Done Name"; Rec."Job Done Name")
                {
                }
                field(Close; Rec.Close)
                {
                }
                field("Job Closing Officer"; Rec."Job Closing Officer")
                {
                }
                field("Close Date"; Rec."Close Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

