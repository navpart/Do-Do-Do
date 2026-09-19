page 70148 "Awaiting balance Pay. Appr."
{
    ApplicationArea = All;
    CardPageID = "Approved Opex card2";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Advance Voucher" = CONST(true), "Document Type" = CONST(Opex), Reject = CONST(false),
                                                        "Balance Paymt. Appr." = CONST(false), Compliance = CONST(false));

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

