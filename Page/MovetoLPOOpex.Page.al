page 70134 "Move to LPO Opex"
{
    ApplicationArea = All;
    CardPageID = "Approved Opex card2";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Move to LPO" = CONST(true),
                            "Voucher Raised" = CONST(false),
                            Compliance = CONST(false),
                            "Adv. Pymt. Required" = CONST(false),
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
            }
        }
    }

    actions
    {
    }
}

