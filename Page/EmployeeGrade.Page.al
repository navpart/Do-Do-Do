page 50029 "Employee Grade"
{
    PageType = Card;
    SourceTable = "Employee Grade";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
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

