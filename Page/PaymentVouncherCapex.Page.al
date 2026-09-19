page 70160 "Payment Vouncher-Capex"
{
    CardPageID = "Approved Capex Card3";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = CONST(Capex),
                            "Voucher Raised" = filter(true),
                            Closed = filter(false),
                            Reject = filter(false));
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

