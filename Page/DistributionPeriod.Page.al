page 50183 "Distribution Period"
{
    PageType = Card;
    SourceTable = "Production Period";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code";Rec. "Period Code")
                {
                }
                field("Period Description";Rec. "Period Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

