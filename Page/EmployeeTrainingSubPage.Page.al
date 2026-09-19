page 50069 "Employee Training Sub Page"
{
    AutoSplitKey = false;
    Caption = 'Employee Training';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Course Attendance";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field(Comments; Rec.Comments)
                {
                    Caption = 'Employee Comment';
                }
                field(Cost; Rec.Cost)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        CatRec: Record 50083;
        TCourseRec: Record 50082;
        TotalCost: Decimal;
        AvgCost: Decimal;
        RecCount: Integer;
}

