page 70163 "Balance Payment-Capex"
{
    ApplicationArea = All;
    CardPageID = BalanceCapexCard;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = filter('Capex'),
                            Compliance = filter('Yes'),
                            "Balance Paymt." = filter('Yes'),
                            "Voucher Raised" = filter('No'),
                            Closed = filter('No'),
                            Reject = filter('No'));

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

