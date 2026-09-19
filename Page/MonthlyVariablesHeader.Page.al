page 50297 "Monthly Variables Header."
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
                field("Employee No"; Rec."Employee No")
                {
                }
            }
            part(lines; "Monthly Variables Lines sub.")
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
        DefaultPostingGroup: Code[20];
        LinesRec: Record 50141;
        PeriodRec: Record 50004;
        CurrentPeriod: Code[10];
        UserSetup: Record 91;
        OpenPeriodFilter: Code[30];
        EmpRec: Record 5200;
        Msg1: Text[200];
        PenaType: Integer;
        SelectedPenalty: Integer;
        Options: Text[100];
        PenaltyED: Code[10];
        PenaltyQty: Decimal;
        PenaltyAmount: Decimal;
        PenaltyPercent: Decimal;
        Wind: Dialog;
        StaffNo: Code[20];
        GrpLines: Record 50008;
        EDText: Text[30];
        EDRec: Record 50001;
}

