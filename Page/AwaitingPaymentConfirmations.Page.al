page 50240 "Awaiting Payment Confirmations"
{
    CardPageID = "TNL-Work Order Card";
    PageType = List;
    SourceTable = "TNL Work Order";
    SourceTableView = WHERE("Invoice Received" = FILTER('Yes'),
                            "Payment Confirmed" = FILTER('Yes'));
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

