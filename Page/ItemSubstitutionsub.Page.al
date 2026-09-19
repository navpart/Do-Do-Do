page 50154 "Item Substitution sub"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Item Substitution";
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
                field("Substitute No."; Rec."Substitute No.")
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

