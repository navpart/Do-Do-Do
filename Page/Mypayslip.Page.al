page 50147 "My payslip"
{
    //CardPageID = "Payslip Card";
    Editable = false;
    PageType = List;
    SourceTable = "Payroll-Payslip Header.";
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
                field("Period Start"; Rec."Period Start")
                {
                }
                field("Period End"; Rec."Period End")
                {
                }
                field("Period Name"; Rec."Period Name")
                {
                }
                field(Company; Rec.Company)
                {
                }
                field(Section; Rec.Section)
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field(Closed; Rec.Closed)
                {
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                }
                field("Tax Charged"; Rec."Tax Charged")
                {
                }
                field("Tax Deducted"; Rec."Tax Deducted")
                {
                }
                field("Taxable Pay"; Rec."Taxable Pay")
                {
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                }
                field("Net Pay Due"; Rec."Net Pay Due")
                {
                }
                field("Total Relief"; Rec."Total Relief")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Customer Number"; Rec."Customer Number")
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("ED Filter"; Rec."ED Filter")
                {
                }
                field("ED Value"; Rec."ED Value")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field(Grade; Rec.Grade)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("print payslip")
            {
                Caption = 'Print Payslip';
                Image = Print;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    UserSetup.GET(USERID);
                    PayrollPayslipHeader.SETRANGE("Payroll Period", Rec."Payroll Period");
                    PayrollPayslipHeader.SETRANGE("Employee No", UserSetup."Employee No.");
                    IF PayrollPayslipHeader.FINDFIRST THEN
                        //REPORT.RUNMODAL(50045, false, TRUE, PayrollPayslipHeader);
                        REPORT.RUNMODAL(50023, false, TRUE, PayrollPayslipHeader);

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.GET(USERID);
        Rec.FILTERGROUP(10);
        Rec.SETFILTER("Employee No", UserSetup."Employee No.");
        Rec.FILTERGROUP(0);
    end;

    var
        PayrollPayslipHeader: Record 50007;
        PayrollPayslipLines: Record 50006;
        USEREmployee: Code[10];
        UserSetup: Record 91;
}

