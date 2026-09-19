page 70233 "Return GRN Report"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = CONST('N_PARTS'),
                           "Document Type" = CONST("Sales Return Receipt"));
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
                field("Unit Cost"; Rec."Cost Amount (Actual)" / Rec.Quantity)
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field(Profit; ((ABS(Rec."Sales Amount (Actual)") - Rec."Cost Amount (Actual)") / Rec."Cost Amount (Actual)") * 100)
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

