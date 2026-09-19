page 70247 "Opex Advance HOD Paymt Appr."
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Adv. Pymt. Required" = CONST(true),
                            "Document Type" = CONST(Opex),
                            "Adv. Paymt. HOD" = FILTER('On-hold' | ' '),
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
            }
        }
    }

    actions
    {
    }
}

