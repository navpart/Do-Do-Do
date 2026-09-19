page 50047 "MP Budget Names"
{
    PageType = Card;
    SourceTable = "MP Budget Name";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
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

