page 70224 "Parts Sales and Transfers_lek"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Posting Date" = FILTER('01/01/22..31/12/22'),
                            "Document Type" = FILTER("Transfer Shipment" | "Sales Shipment" | "Sales Invoice" | "Sales Return Receipt" | "Sales Credit Memo"),
                            "Inventory Posting Group" = FILTER('N_PARTS'));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

