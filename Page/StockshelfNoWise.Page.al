page 70227 "Stock shelf No. Wise"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = FILTER('N_PARTS|N_PARTCONS'),
                            "Remaining Quantity" = FILTER('<>0'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Name"; Rec."Item Name")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Shelf No"; Rec."Shelf No")
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

