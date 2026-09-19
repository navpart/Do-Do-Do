page 70133 "Managing Dir. Appr."
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    Editable = true;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(ListMD = FILTER(true),
                            "Head of Audit" = CONST(Approved),
                            "General Manager" = CONST(" "),
                            "Managing Director" = FILTER('<>Approved|Rejected'),
                            "Managing Director" = FILTER(" " | "On-hold"),
                            Reject = CONST(false),
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

