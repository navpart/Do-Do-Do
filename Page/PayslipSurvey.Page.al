page 50033 "Payslip Survey"
{
    Editable = false;
    PageType = List;
    SourceTable = "Payroll-Payslip Lines.";
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
                field("Employee No"; Rec."Employee No")
                {
                }
                field("E/D Code"; Rec."E/D Code")
                {
                }
                field("Payslip Text"; Rec."Payslip Text")
                {
                }
                field(Units; Rec.Units)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Loan ID"; Rec."Loan ID")
                {
                }
                field("Debit Account"; Rec."Debit Account")
                {
                }
                field("Credit Account"; Rec."Credit Account")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Payslip Print Column"; Rec."Payslip Print Column")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Payslip appearance"; Rec."Payslip appearance")
                {
                }
                field("Payslip Column"; Rec."Payslip Column")
                {
                }
                field("Payslip Group ID"; Rec."Payslip Group ID")
                {
                }
                field("Pos. In Payslip Grp."; Rec."Pos. In Payslip Grp.")
                {
                }
                field("ED Type"; Rec."ED Type")
                {
                }
                field("Overline Column"; Rec."Overline Column")
                {
                }
                field("Underline Amount"; Rec."Underline Amount")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Group" := ActivePostingGroup;
    end;

    trigger OnOpenPage()
    begin
        Rec.FILTERGROUP(10);
        ActivePostingGroup := Rec.GETFILTER("Posting Group");
        Rec.FILTERGROUP(0);
    end;

    var
        ActivePostingGroup: Code[20];
}

