page 50404 "Warehouse Parts"
{
    PageType = Card;
    SourceTable = "Stockkeeping Unit";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
            }
        }
    }

    actions
    {
    }
}

