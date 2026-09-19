page 50085 "Medical Transaction Types"
{
    PageType = Card;
    SourceTable = "Hospital Transaction Types";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type Code"; Rec."Type Code")
                {
                }
                field("Type Description"; Rec."Type Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

