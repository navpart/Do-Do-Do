page 50432 "New VRI Entry"
{
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = SORTING("VRI Code")
                      WHERE("VRI Code" = FILTER('TVI*'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                }
            }
        }
    }

    actions
    {
    }
}

