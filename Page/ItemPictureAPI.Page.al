page 90061 "Item Picture API"
{
    PageType = List;
    SourceTable = Item;
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
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
                field("Picture Url"; Rec."Picture Url")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

