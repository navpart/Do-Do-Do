page 60023 "Payslip Header Survey."
{
    CardPageID = "Payslip Card";
    PageType = List;
    SourceTable = "Payroll-Payslip Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Payroll Period"; Rec."Payroll Period")
                {
                    Editable = false;
                }
                field("Period Start"; Rec."Period Start")
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
                field("ED Value"; Rec."ED Value")
                {
                }
                field("Taxable Pay"; Rec."Taxable Pay")
                {
                }
                field("Total Relief"; Rec."Total Relief")
                {
                }
                field("Tax Deducted"; Rec."Tax Deducted")
                {
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                }
                field("Net Pay Due"; Rec."Net Pay Due")
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
        area(navigation)
        {
            group(Process)
            {
                action("Create New Payslip")
                {
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 50051;
                }
            }
        }
    }
}

