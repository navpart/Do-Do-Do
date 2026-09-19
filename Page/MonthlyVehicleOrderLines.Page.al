page 50133 "Monthly Vehicle Order Lines"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Monthly Vehicle Order Lines";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(group)
            {
                field("Period Starting"; Rec."Period Starting")
                {
                }
                field("PO Number"; Rec."PO Number")
                {
                    Visible = false;
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Group Code"; Rec."Model Group Code")
                {
                }
                field("Model Category"; Rec."Model Category")
                {
                }
                field(Colour; Rec.Colour)
                {
                }
                field("Colour Description"; Rec."Colour Description")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Colour Group"; Rec."Colour Group")
                {
                }
            }
        }
    }

    actions
    {
    }
}

