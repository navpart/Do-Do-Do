page 70158 "Move to LPO -Capex"
{
    CardPageID = "Approved Capex Card2";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = filter(Capex),
                            "Move to LPO" = CONST(true),
                            "Voucher Raised" = filter(false),
                            Compliance = filter(false),
                            Reject = filter(false),
                            "Adv. Pymt. Required" = filter(false));
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
                    Caption = 'CApex No.';
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
            }
        }
    }

    actions
    {
    }
}

