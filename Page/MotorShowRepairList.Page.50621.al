page 50621 "Motor Show Repair List"
{
    CardPageID = "Motor Show Repair Card";
    PageType = List;
    SourceTable = "Motor Show Repair";
    SourceTableView = WHERE("2nd Approval Status" = FILTER(<> Approved),
                            Reject = filter(false),
                            "Send for Approval" = filter(false));
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
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                    Caption = 'Pupose';
                }
            }
        }
    }

    actions
    {
    }
}

