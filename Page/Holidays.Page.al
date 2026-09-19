page 50317 Holidays
{
    PageType = List;
    SourceTable = "Holidays";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
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

