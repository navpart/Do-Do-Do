page 70115 "TNL Vehicle Serial No."
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Inventory Posting Group" = FILTER('N_CARS'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                }
            }
        }
    }

    actions
    {
    }
}

