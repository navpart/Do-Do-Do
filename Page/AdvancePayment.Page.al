page 70145 "Advance Payment"
{
    ApplicationArea = All;
    CardPageID = "Approved Opex card4";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Adv. Paymt. Audit" = CONST(Approved),
                            "Document Type" = FILTER(Opex),
                            "Service Delivery1" = FILTER('<> Satisfactory'),
                            "Advance Voucher" = CONST(false),
                            Reject = CONST(false));

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
                    Caption = 'Opex No.';
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
            }
        }
    }

    actions
    {
    }
}

