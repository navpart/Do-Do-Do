page 50067 "Course Attendance List"
{
    PageType = List;
    SourceTable = "Course Attendance";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rec No."; Rec."Rec No.")
                {
                }
                field("Training Course Code"; Rec."Training Course Code")
                {
                }
                field("Course name"; Rec."Course name")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Business Unit"; Rec."Business Unit")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field(Cost; Rec.Cost)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Course Line No."; Rec."Course Line No.")
                {
                }
                field("Training Group"; Rec."Training Group")
                {
                }
            }
        }
    }

    actions
    {
    }
}

