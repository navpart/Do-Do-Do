page 50395 "VRI Pass to Sales"
{
     ApplicationArea = All;
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = WHERE("Pass to Sales/Marketing" = FILTER(True));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field("VRI Location"; Rec."VRI Location")
                {
                }
                field("VRI Date"; Rec."VRI Date")
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
                field(Status; Rec.Status)
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

