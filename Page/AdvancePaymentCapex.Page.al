page 70168 "Advance Payment-Capex"
{
    ApplicationArea = All;
    CardPageID = "Approved Capex Card4";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Adv. Paymt. Audit" = CONST(Approved),
                            "Service Delivery1" = FILTER('<> Satisfactory'),
                            "Document Type" = FILTER(Capex),
                            "Advance Voucher" = CONST(false),
                            Reject = FILTER(false));

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
                    Caption = 'Capex No.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Department Code"; Rec."Department Code")
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
                field(Reject; Rec.Reject)
                {
                }
            }
        }
    }

    actions
    {
    }
}

