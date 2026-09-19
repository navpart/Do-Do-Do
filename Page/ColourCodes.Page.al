page 50131 "Colour Codes"
{
    CardPageID = "Colour Code card";
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

