page 70136 "Payment Vouncher"
{
    CardPageID = "Approved Opex card3";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Voucher Raised" = CONST(true),
                            Closed = CONST(false),
                            "Document Type" = CONST(Opex),
                            Reject = CONST(false));
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
                    Caption = 'Opex No.';
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
                field(Vendor; Rec.Vendor)
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

