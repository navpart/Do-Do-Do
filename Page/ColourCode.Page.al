page 70170 "Colour Code"
{
    PageType = List;
    SourceTable = "Colour Codes";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Group Code"; Rec."Product Group Code")
                {
                }
                field("Colour Code"; Rec."Colour Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

