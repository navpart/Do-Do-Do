page 50118 "Search Tracker List"
{
    ApplicationArea = All;
    CardPageID = "Search Tracker Card";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Parts Enquiry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Request by"; Rec."Request by")
                {
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Search Code"; Rec."Search Code")
                {
                }
                field("Time of Request"; Rec."Time of Request")
                {
                }
            }
        }
    }

    actions
    {
    }
}

