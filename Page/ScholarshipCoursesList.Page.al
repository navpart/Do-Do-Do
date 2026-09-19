page 50077 "Scholarship Courses List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Scholarship Courses";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Group; Rec.Group)
                {
                }
                field("Course Code"; Rec."Course Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Bonding Period"; Rec."Bonding Period")
                {
                }
                field("Staff Count"; Rec."Staff Count")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Employee Filter"; Rec."Employee Filter")
                {
                }
            }
        }
    }

    actions
    {
    }
}

