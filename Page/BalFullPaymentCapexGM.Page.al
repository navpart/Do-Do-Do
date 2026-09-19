page 70124 "Bal/Full Payment Capex-GM"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = filter('Capex'),
                            Compliance = filter(true),
                            "Balance Paymt." = filter(false),
                            Closed = filter(false),
                            Reject = filter(false),
                            "Bal. Paymt. Audit" = filter('Approved'),
                            "Bal. Paymt. GM" = FILTER(<> 'Approved|Rejected'),
                            "Balance Paymt. Appr." = filter(true),
                            "Proposed Purchase Amount" = FILTER(< '100,000'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Capex No.';
                }
                field(Date; Rec.Date)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                }
                field(Vendor; Rec.Vendor)
                {
                }
                field("Capex Type"; Rec."Capex Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

