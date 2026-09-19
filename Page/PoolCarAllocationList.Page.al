page 50596 "Pool Car Allocation List"
{
    ApplicationArea = All;
    CardPageID = "Pool Car Allocation Card";
    PageType = List;
    SourceTable = "Pool Car Allocation";
    SourceTableView = WHERE(Reject = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Allocation No."; Rec."Allocation No.")
                {
                }
                field("Request No."; Rec."Request No.")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("Expected Hours"; Rec."Expected Hours")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

