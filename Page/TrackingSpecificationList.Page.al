page 50229 "Tracking Specification List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Tracking Specification";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Production Month"; Rec."Production Month")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Interior Colour Code"; Rec."Interior Colour Code")
                {
                }
                field("Interior Colour Name"; Rec."Interior Colour Name")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

