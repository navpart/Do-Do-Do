page 50127 "Estimate Confirmations"
{
    CardPageID = "TNL-Work Order Card";
    PageType = List;
    SourceTable = "TNL Work Order";
    SourceTableView = WHERE("Send for Approval" = Filter(True),
                            "1st Approval Status" = FILTER(Approved),
                            "Send Estimate" = FILTER(True),
                            "2nd Approval Status" = FILTER(' ' | Rejected | "On hold"));
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
                field("Request Type"; rec."Request Type")
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

