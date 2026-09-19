page 50412 "Stock by Location"
{
    PageType = List;
    SourceTable = "Item";
    ApplicationArea = All;
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
                field("Item No Category"; Rec."Item No Category")
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
                field("Abuja Inventory"; Rec."Abuja Inventory")
                {
                }
                field("Portharcourt Inventory"; Rec."Portharcourt Inventory")
                {
                }
                field("Isolo Inventory"; Rec."Isolo Inventory")
                {
                }
                field("Dojo Inventory"; Rec."Dojo Inventory")
                {
                }
                field("Dojo Oregun  Inventory"; Rec."Dojo Oregun  Inventory")
                {
                }
            }
        }
    }

    actions
    {
    }
}

