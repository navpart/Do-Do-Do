page 50028 "Monthly Var. Header Survey."
{
    PageType = List;
    SourceTable = "Monthly Variables Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("Period Name"; Rec."Period Name")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Is Closed"; Rec."Is Closed")
                {
                }
            }
        }
    }

    actions
    {
    }
}

