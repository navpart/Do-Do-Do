page 50121 "Vehicle Details"
{
    PageType = List;
    SourceTable = "Reservation Entry";
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
                field(Description; Rec.Description)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

