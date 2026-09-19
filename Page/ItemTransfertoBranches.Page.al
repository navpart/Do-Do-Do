page 70225 "Item Transfer to Branches"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = FILTER('N_PARTS'),
                            "Document Type" = FILTER('Transfer Receipt'),
                            "Location Code" = FILTER('114SER|100PH|112ABJ|120ISO|111EKET|123ORE'),
                            "Posting Date" = FILTER('01/01/22..31/12/23'));

    layout
    {
        area(content)
        {
            group("Total Qty")
            {
            }
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
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
                field("Unit Cost"; Rec."Cost Amount (Actual)" / Rec.Quantity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

