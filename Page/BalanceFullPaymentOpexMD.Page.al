page 70186 "Balance/Full Payment Opex-MD"
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(ListMD = FILTER(true),
                            Compliance = CONST(true),
                            "Balance Paymt. Appr." = CONST(true),
                            "Balance Paymt." = CONST(false),
                            Closed = CONST(false),
                            "Document Type" = CONST(Opex),
                            Reject = CONST(false),
                            "Bal. Paymt. Audit" = CONST(Approved),
                            "Bal. Paymt. MD" = FILTER('' | "On-hold"));
    //"Voucher Raised" = CONST(false));

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
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                }
                field(Vendor; Rec.Vendor)
                {
                }
                field("Opex Type"; Rec."Opex Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

