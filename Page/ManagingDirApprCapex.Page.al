page 70157 "Managing Dir. Appr.-Capex"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = CONST(Capex),
                            "Head of Audit" = CONST(Approved),
                            "General Manager" = CONST(" "),
                            "Managing Director" = FILTER(<> Approved),
                            Reject = CONST(false),
                            "Proposed Purchase Amount" = FILTER(> 100000));

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

