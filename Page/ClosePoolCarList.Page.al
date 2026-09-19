page 50601 "Close Pool Car List"
{
    ApplicationArea = All;
    CardPageID = "Close Pool Car";
    PageType = List;
    Editable = false;
    SourceTable = "Pool Car Allocation";

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
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Status; Rec.Status)
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
                field("Allocation Date"; Rec."Allocation Date")
                {
                }
                field("Actual Return Date"; Rec."Actual Return Date")
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

