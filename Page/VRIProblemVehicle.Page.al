page 50396 "VRI Problem Vehicle"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = WHERE("Problem Vehicle" = FILTER(True));

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
                field("VRI Inspector Code"; Rec."VRI Inspector Code")
                {
                }
                field("VRI Inspector Name"; Rec."VRI Inspector Name")
                {
                }
                field("VRI Inspector Department"; Rec."VRI Inspector Department")
                {
                }
                field("VRI Operative Location"; Rec."VRI Operative Location")
                {
                }
                field("VRI Operative Unit"; Rec."VRI Operative Unit")
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

