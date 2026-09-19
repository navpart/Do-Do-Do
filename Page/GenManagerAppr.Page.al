page 70132 "Gen. Manager Appr."
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(ListGM = FILTER(true),
                            "Head of Audit" = CONST(Approved),
                            "General Manager" = FILTER('<>Approved|Rejected'),
                            "Managing Director" = CONST(" "),
                            Reject = CONST(false),
                            "Document Type" = CONST(Opex));

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

