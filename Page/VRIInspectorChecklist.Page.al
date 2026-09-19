page 50272 "VRI Inspector Check list"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = WHERE(Arrived = FILTER(True));

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
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Exterior Colour"; Rec."Exterior Colour")
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
                field("VRI Inspector Code"; Rec."VRI Inspector Code")
                {
                }
                field("VRI Inspector Name"; Rec."VRI Inspector Name")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Open VRI Form")
            {
                Caption = 'Open VRI Form';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50392;
                RunPageOnRec = true;
            }
        }
    }
}

