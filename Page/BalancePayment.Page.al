page 70140 "Balance Payment"
{
    ApplicationArea = All;
    CardPageID = "Approved Opex Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(Compliance = CONST(true),
                            "Balance Paymt." = CONST(true),
                            "Voucher Raised" = CONST(false),
                            Closed = CONST(false),
                            "Document Type" = CONST(Opex),
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

