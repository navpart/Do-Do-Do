page 80022 "Reminder Calls"
{
    PageType = List;
    SourceTable = "Reminder Calls";
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
                field("Phone No."; Rec."Phone No.")
                {
                }
                field(Contact; Rec.Contact)
                {
                }
                field(Response; Rec.Response)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

