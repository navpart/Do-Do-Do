namespace AL_TNL.AL_TNL;
using Microsoft.HumanResources.Employee;
using System.Security.User;

report 50025 "Monthly Payslip Others"
{
    Caption = 'Monthly Payslip Others';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;

    RDLCLayout = 'Layout/MonthlyPayslipOthers.rdl';

    dataset

    {
        dataitem(Employee; Employee)
        {

            //RequestFilterFields = "No.", "Period Filter";

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
                column(FullName; "Employee Name")
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

                trigger OnPreDataItem()
                var
                    UserSetup: Record "User Setup";

                begin
                    UserSetup.GET(UserId());
                    if not UserSetup."Payroll-Admin" then
                        Error('You do not have permission to print this report. Please contact your Payroll Administrator.');
                end;


                trigger OnAfterGetRecord()


                begin
                    PeriodRec.GET("Payroll Period");
                    IF PeriodRec.Name <> '' THEN
                        PayAdviceTitle := 'SALARY SLIP FOR ' + DELCHR(PeriodRec.Name, '<>');
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
        FullName: Text[50];


}
