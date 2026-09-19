page 50302 "Monthly Reg. Var. Header."
{
    PageType = Card;
    SourceTable = "Monthly Variables Header.";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("E/d Code"; Rec."E/d Code")
                {
                }
                field("PaySlip Text"; Rec."PaySlip Text")
                {
                }
                field("Recorded By"; Rec."Recorded By")
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
            part(lines; "Monthly Variables Lines sub.")
            {
                SubPageLink = "Payroll Period" = FIELD("Payroll Period"),
                             "E/D Code" = FIELD("E/d Code");
                SubPageView = SORTING("Payroll Period", "E/D Code", "Employee No");
            }
        }
    }

    actions
    {
    }
}

