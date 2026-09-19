page 70156 "Gen. Manager Appr.-Capex"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = FILTER(Capex),
                            "Head of Audit" = FILTER(Approved),
                            "General Manager" = FILTER(" "),
                            "Managing Director" = FILTER(" "),
                            Reject = FILTER('No'),
                            "Proposed Purchase Amount" = FILTER(> '100,001'),
                            "Capex Type" = FILTER(<> "Fixed Asset"));

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

