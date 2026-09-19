page 70119 "Bal/Full Payment Capex-MD"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = const(Capex),
                            Compliance = const(True),
                           "Balance Paymt." = const(false),
                            Closed = const(false),
                            Reject = const(false),
                            "Bal. Paymt. Audit" = const(Approved),
                            "Bal. Paymt. MD" = FILTER(' '),
                            "Balance Paymt. Appr." = const(True),
                            "Proposed Purchase Amount" = FILTER('>=100,000'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Opex No.';
                }
                field(Date; Rec.Date)
                {
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
                field("Capex Type"; Rec."Capex Type")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        CurrPage.EDITABLE := TRUE;
    end;
}

