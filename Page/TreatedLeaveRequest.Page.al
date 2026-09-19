page 50605 "Treated Leave Request"
{
    ApplicationArea = All;
    CardPageID = "Approve Leave request card";
    Editable = false;
    PageType = List;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE(Treated = CONST(true),
                            Reject = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Leave Category"; Rec."Leave Category")
                {
                }
                field("Request No."; Rec."Request No.")
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
                field(Treated; Rec.Treated)
                {
                }
                field(Employee; Rec.Employee)
                {
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                }
                field("Actual Duration"; Rec."Actual Duration")
                {
                }
                field("Leave Period"; Rec."Leave Period")
                {
                }
                field("Annual Duration"; Rec."Annual Duration")
                {
                }
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                }
            }
        }
    }

    actions
    {
    }
}

