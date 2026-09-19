page 70229 "Part Sales To Dealer"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = CONST('N_PARTS'),
                            "Posting Date" = FILTER('01/01/22..31/12/23'),
                            "Entry Type" = CONST(Sale),
                            "Source No." = FILTER('TDP*'));
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
                field("Source No."; Rec."Source No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
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
            }
        }
    }

    actions
    {
    }
}

