page 70222 "Part Sales by TCSC"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = CONST('N_PARTS'),
                            "Posting Date" = FILTER('01/01/22..31/12/23'),
                            "Document Type" = CONST("Transfer Receipt"),
                            "Location Code" = CONST('150ISOLO'));
    ApplicationArea = All;

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
                field("Unit Cost"; Rec."Cost Amount (Actual)" / Rec.Quantity)
                {
                }
                field("TNL Selling Price to TCSC"; Rec."TNL Selling Price to TCSC")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Total Price"; ABS(Rec."TNL Selling Price to TCSC" * Rec.Quantity))
                {
                }
                field(Profit; ((ABS(Rec."TNL Selling Price to TCSC" * Rec.Quantity) - Rec."Cost Amount (Actual)") / Rec."Cost Amount (Actual)") * 100)
                {
                }
            }
        }
    }

    actions
    {
    }
}

