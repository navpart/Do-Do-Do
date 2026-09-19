page 50311 "Monthly Regular Variable List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
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
                field("E/d Code"; Rec."E/d Code")
                {
                }
                field("Recorded By"; Rec."Recorded By")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Closed; Rec.Closed)
                {
                }
            }
        }
    }

    actions
    {
    }
}

