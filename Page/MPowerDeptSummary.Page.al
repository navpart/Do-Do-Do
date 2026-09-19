page 50072 "MPower Dept Summary"
{
    PageType = Card;
    SourceTable = "ManPower Analysis By Dept";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Total Budget"; Rec."Total Budget")
                {
                }
                field("Total Employees"; Rec."Total Employees")
                {
                }
            }
        }
    }

    actions
    {
    }
}

