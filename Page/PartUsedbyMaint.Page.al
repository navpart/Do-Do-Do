page 50413 "Part Used by Maint."
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Entry Type" = FILTER("Negative Adjmt."),
                            "Document No." = FILTER('TCFO*'));
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
                field("Prod. Gr."; Rec."Prod. Gr.")
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
                field(Quantity; Rec.Quantity)
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

