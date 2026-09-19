page 70162 "Full  Payment Appr.-Capex"
{
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(Compliance = filter(true),
                            "Balance Paymt. Appr." = filter(true),
                            "Balance Paymt." = filter(false),
                            Closed = filter(false),
                            "Document Type" = filter(Capex),
                            Reject = filter(false),
                            "Bal. Paymt. Audit" = FILTER(<> Approved | Rejected));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("No."; Rec."No.")
                {
                    Caption = 'CAPEX No.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Head of Department"; Rec."Head of Department")
                {
                }
                field("Head of Audit"; Rec."Head of Audit")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field(Vendor; Rec.Vendor)
                {
                }
            }
        }
    }

    actions
    {
    }
}

