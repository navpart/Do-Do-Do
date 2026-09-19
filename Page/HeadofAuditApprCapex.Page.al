page 70154 "Head of Audit Appr.-Capex"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = FILTER(Capex),
                            "Head of Department" = FILTER(Approved),
                            "Head of Audit" = FILTER(<> Approved),
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
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
            }
        }
    }

    actions
    {
    }
}

