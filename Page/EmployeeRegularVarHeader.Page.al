page 50301 "Employee Regular Var. Header."
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
            part(Lines; "Monthly Variables Lines sub.")
            {
                SubPageLink = "Payroll Period" = FIELD("Payroll Period"),
                              "E/D Code" = FIELD("E/d Code");
            }
        }
    }

    actions
    {
    }

    var
        PGrp: Record 50140;
        DefaultPostingGroup: Text[250];
        UserRec: Record 91;
        EmployeeRec: Record 5200;

    procedure GetPGrp(Grp: Code[10]): Text[30]
    begin
    end;
}

