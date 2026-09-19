report 50113 "Montly Payslip2"
{
    ApplicationArea = All;
    Caption = 'Montly Payslip2';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;

    RDLCLayout = 'Layout/MonthlyPayslip3.rdl';


    dataset

    {
        dataitem(Employee; Employee)
        {

            //RequestFilterFields = "No.", "Period Filter";

            DataItemTableView = sorting("No.");

            column(No_; "No.")
            {

            }
            column(FullName; FullName)
            {
            }
            column(Employee_Period_Filter; "Period Filter")
            {
            }

            column(PayAdviceTitle; PayAdviceTitle)
            {

            }
            column(DesigName; DesigName)
            {
            }
            column(BusinessUnit; BusinessUnit)
            {
            }

            dataitem(PayrollPayslipHeader;
            "Payroll-Payslip Header.")
            {

                RequestFilterHeading = 'Payslip Filters';
                RequestFilterFields = "Payroll Period", "Employee No";

                DataItemLink = "Employee No" = field("No.");
                DataItemTableView = sorting("Payroll Period", "Employee No");

                column(PayrollPeriod; "Payroll Period")
                {
                }
                column(EmployeeNo; "Employee No")
                {
                }
                column(EmployeeName; "Employee Name")
                {
                }

                dataitem(PayrollPayslipLines; "Payroll-Payslip Lines.")
                {
                    DataItemLink = "Payroll Period" = field("Payroll Period"), "Employee No" = FIELD("Employee No");
                    DataItemTableView = SORTING("Payslip Print Column", "E/D Code");

                    column(EDCode_PayrollPayslipLines; "E/D Code")
                    {
                    }
                    column(Payslip_Text; "Payslip Text")
                    {

                    }
                    column(Amount_PayrollPayslipLines; Amount)
                    {
                    }
                    column(Payslip_Print_Column; "Payslip Print Column")
                    {

                    }
                    column(ED_Type; "ED Type")
                    {

                    }
                }
                trigger OnAfterGetRecord()


                begin
                    PeriodRec.GET("Payroll Period");
                    IF PeriodRec.Name <> '' THEN
                        PayAdviceTitle := 'SALARY SLIP FOR ' + DELCHR(PeriodRec.Name, '<>');
                end;
            }

            trigger OnAfterGetRecord()

            begin
                IF Employee.Blocked THEN
                    CurrReport.SKIP;

                DeptName := Employee."Global Dimension 1 Code";

                IF DimValRec.GET('DEPARTMENT', DeptName) THEN
                    BusinessUnit := DimValRec.Name;

                IF DesigRec.GET(Designation) THEN
                    DesigName := DesigRec.Description
                ELSE
                    DesigName := '';

            end;

        }

    }



    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }



    }
    var
        PayAdviceTitle: Text[80];
        DeptName: Text[30];
        BusinessUnit: Text[30];
        DesigName: Text[30];
        DimValRec: Record 349;
        DesigRec: Record 50079;
        PeriodRec: Record 50004;

}
