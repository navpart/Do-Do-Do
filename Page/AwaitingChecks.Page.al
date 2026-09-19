page 50173 "Awaiting Checks"
{
    CardPageID = "TNL-Work Order Card";
    PageType = List;
    SourceTable = "TNL Work Order";
    SourceTableView = WHERE("Job Done" = filter('Satisfactory'),
                            "Payment Confirmed" = FILTER('Yes'),
                            "Transaction Close" = FILTER('No'),
                            "Payment Raised" = filter('No'));
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
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
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
                field("TNL Service Centre"; Rec."TNL Service Centre")
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
                field("Responsible Driver"; Rec."Responsible Driver")
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
                field("Payment Approval Comment"; Rec."Payment Approval Comment")
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
                field("Payment Raised"; Rec."Payment Raised")
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
                field("Payment Confirmed"; Rec."Payment Confirmed")
                {
                }
                field("Invoice Received"; Rec."Invoice Received")
                {
                }
                field("Collector Id"; Rec."Collector Id")
                {
                }
                field("Collector Name"; Rec."Collector Name")
                {
                }
                field("Collection Time"; Rec."Collection Time")
                {
                }
                field("Transaction Close"; Rec."Transaction Close")
                {
                }
                field("Close User Id"; Rec."Close User Id")
                {
                }
                field("Close Time"; Rec."Close Time")
                {
                }
                field("Closer Name"; Rec."Closer Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

