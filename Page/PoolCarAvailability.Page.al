page 50602 "Pool Car Availability"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Pool Car Availability";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

