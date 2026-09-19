report 50069 "Payroll entries"
{
    // This report prints ALL the entries for an employee for the requested periods.
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./Payrollentries.rdl';
    ApplicationArea = All;


    dataset
    {
        dataitem("Payroll-Payslip Header."; "Payroll-Payslip Header.")
        {
            DataItemTableView = SORTING("Payroll Period", "Employee No");
            RequestFilterFields = "Payroll Period", "Employee No", Closed;
            RequestFilterHeading = 'Parameters for payslips';
            column(PIF_Audit_; 'PIF Audit')
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(DELCHR__Employee_No________; DELCHR("Employee No", '<>'))
            {
            }
            column(Payroll_Payslip_Header___Employee_Name_; "Employee Name")
            {
            }
            column(PRollRepTitle; PRollRepTitle)
            {
            }
            column(Employee_Caption; Employee_CaptionLbl)
            {
            }
            column(E_D_CodeCaption; E_D_CodeCaptionLbl)
            {
            }
            column(Payslip_TextCaption; Payslip_TextCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Payroll_Payslip_Header__Payroll_Period; "Payroll Period")
            {
            }
            column(Payroll_Payslip_Header__Employee_No; "Employee No")
            {
            }
            dataitem(DataItem1581; "Payroll-Payslip Lines.")
            {
                DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                               "Employee No" = FIELD("Employee No");
                DataItemTableView = SORTING("Payroll Period", "Employee No", "Payslip Group ID", "Pos. In Payslip Grp.");
                column(Payroll_Payslip_Lines___E_D_Code_; "E/D Code")
                {
                }
                column(PayEntryText; PayEntryText)
                {
                }
                column(ROUND__Amount_0_05_; ROUND(Amount, 0.05))
                {
                    DecimalPlaces = 2 : 2;
                }
                column(Payroll_Payslip_Lines__Payroll_Period; "Payroll Period")
                {
                }
                column(Payroll_Payslip_Lines__Employee_No; "Employee No")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    IF RecOfEDFile.GET("E/D Code") THEN
                        PayEntryText := RecOfEDFile."Payslip Text";

                end;
            }

            trigger OnAfterGetRecord()
            var
                PayEmp: Record 5200;
            begin
                IF NOT PayEmp.GET("Payroll-Payslip Header."."Employee No") THEN CurrReport.SKIP; //Added by Adam to skip Deleted? Employees//
                                                                                                 // Note: Employees are normally kept
                IF PayEmp.Blocked THEN CurrReport.SKIP; //Added by Adam to skip Blocked Employees

                PeriodRec.GET("Payroll Period");
                PRollRepTitle := 'Payroll entries for ' + DELCHR("Payroll Period", '<>');
                IF PeriodRec.Name <> '' THEN
                    PRollRepTitle := PRollRepTitle + ' (' + DELCHR(PeriodRec.Name, '<>') +
                                                     ')';
                IF Closed THEN
                    PRollRepTitle := PRollRepTitle + '  [Closed Entries] ';
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        PRollRepTitle: Text[80];
        CompanyData: Record 79;
        RecOfEDFile: Record 50001;
        PeriodRec: Record 50004;
        PayEntryText: Text[30];
        AmountToPrint: Text[15];
        Employee_CaptionLbl: Label 'Employee:';
        E_D_CodeCaptionLbl: Label 'E/D Code';
        Payslip_TextCaptionLbl: Label 'Payslip Text';
        AmountCaptionLbl: Label 'Amount';
}

