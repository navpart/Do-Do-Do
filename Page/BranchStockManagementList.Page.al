page 70036 "Branch Stock Management List"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = Item;
    SourceTableView = WHERE("Inventory Posting Group" = filter('N_PARTS'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
                field("Variant Filter"; Rec."Variant Filter")
                {
                }
                field("Inventory (All Locations)"; Rec."Inventory (All Locations)")
                {
                }
                field("Stock Value Posted to G/L"; Rec."Stock Value Posted to G/L")
                {
                }
                field("Sales (Qty.)"; Rec."Sales (Qty.)")
                {
                }
                field("Location Filter"; Rec."Location Filter")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Locrec: Record 14;
        CummVal: Decimal;
        LocFilt: Code[20];
}

