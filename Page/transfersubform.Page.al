page 50108 "transfer subform"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Item Ledger Entry";
    SourceTableView = SORTING("Entry Type", "Item No.", "Location Code", "Posting Date", "Document No.")
                      WHERE(Quantity = FILTER(> 0));
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
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

