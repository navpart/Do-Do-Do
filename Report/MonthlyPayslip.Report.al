report 50045 "Monthly Payslip-"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/MonthlyPayslip.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("No.");
            //PrintOnlyIfDetail = true;
            RequestFilterHeading = 'Payslip Filters';
            RequestFilterFields = "No.", "Period Filter";

            column(Employee_No_; "No.")
            {
            }
            column(Employee_Period_Filter; "Period Filter")
            {
            }
            column(EmployeeNo; EmployeeNo)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(DesigName; DesigName)
            {
            }
            column(BusinessUnit; BusinessUnit)
            {
            }
            dataitem(DataItem2942; "Payroll-Payslip Header.")
            {
                DataItemLink = "Employee No" = FIELD("No."), "Payroll Period" = FIELD("Period Filter");

                DataItemTableView = SORTING("Payroll Period", "Employee No");
                RequestFilterFields = "Payroll Period", "Employee No";
                RequestFilterHeading = 'Parameters for payslips';
                column(Payroll_Payslip_Header__Payroll_Period; "Payroll Period")
                {
                }
                column(Payroll_Payslip_Header__Employee_No; "Employee No")
                {
                }
                column(EmployeeName_PayrollPayslipHeader; "Employee Name")
                {
                }
                column(PayAdviceTitle; PayAdviceTitle)
                {
                }
                column(DeptName; DeptName)
                {
                }
                dataitem(DataItem1581; "Payroll-Payslip Lines.")
                {
                    DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                                   "Employee No" = FIELD("Employee No");
                    DataItemTableView = SORTING("Payslip Print Column", "E/D Code");
                    //WHERE("ED Type" = FILTER(<> "Other Emoluments" & <> "Gross Emolument" & <> "Emolument Net" & <> "Deduction Emolument"));
                    PrintOnlyIfDetail = false;
                    column(EDCode_PayrollPayslipLines; "E/D Code")
                    {
                    }
                    column(Units_PayrollPayslipLines; Units)
                    {
                    }
                    column(Rate_PayrollPayslipLines; Rate)
                    {
                    }
                    column(Quantity_PayrollPayslipLines; Quantity)
                    {
                    }
                    column(Flag_PayrollPayslipLines; Flag)
                    {
                    }
                    column(Amount_PayrollPayslipLines; Amount)
                    {
                    }
                    column(GlobalDimension1Code_PayrollPayslipLines; "Global Dimension 1 Code")
                    {
                    }
                    column(GlobalDimension2Code_PayrollPayslipLines; "Global Dimension 2 Code")
                    {
                    }
                    column(PayslipText_PayrollPayslipLines; "Payslip Text")
                    {
                    }
                    column(PayslipPrintColumn_PayrollPayslipLines; "Payslip Print Column")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin

                        CASE "Payslip appearance" OF
                            0: /* Nonzero and Code */
                                IF Amount = 0 THEN
                                    CurrReport.SKIP
                                ELSE
                                    PayEntryText := "E/D Code";
                            1: /* Always and Code */
                                PayEntryText := "E/D Code";
                            2: /* Always and Text */
                                IF RecOfEDFile.GET("E/D Code") THEN
                                    PayEntryText := RecOfEDFile."Payslip Text"

                                ELSE
                                    PayEntryText := '*' + "E/D Code";
                            3: /* Non-zero & text */
                                IF Amount = 0 THEN
                                    CurrReport.SKIP
                                ELSE
                                    IF RecOfEDFile.GET("E/D Code") THEN
                                        PayEntryText := RecOfEDFile."Payslip Text"
                                    ELSE
                                        PayEntryText := '*' + "E/D Code";
                            4: /* Does not appear */
                                CurrReport.SKIP;
                            5: /* Heading */
                                BEGIN
                                    IF RecOfEDFile.GET("E/D Code") THEN
                                        IF RecOfEDFile."Payslip Text" <> '' THEN
                                            PayEntryText := RecOfEDFile."Payslip Text"
                                        ELSE
                                            PayEntryText := "E/D Code"
                                    ELSE
                                        PayEntryText := '*' + PayEntryText;
                                END
                        END;

                        /*IF "Payslip appearance" = 5 THEN
                          UNDEFINED('genSELECTLINES',0,'J')
                        ELSE*/
                        /* Process which column to print */
                        IF RecOfEDFile.GET("E/D Code") THEN BEGIN
                            CASE RecOfEDFile."Payslip Column" OF
                                1: /* Column 2 */
                                    IF "Underline Amount" = 1 THEN
                                        UnderlineID := 'E'
                                    ELSE IF "Underline Amount" = 2 THEN
                                        UnderlineID := 'F'
                                    ELSE
                                        UnderlineID := 'D';
                                2: /* Column 3 */
                                    IF "Underline Amount" = 1 THEN
                                        UnderlineID := 'H'
                                    ELSE IF "Underline Amount" = 2 THEN
                                        UnderlineID := 'I'
                                    ELSE
                                        UnderlineID := 'G';
                                ELSE
                                    /* column 1 */
                                    IF "Underline Amount" = 1 THEN
                                        UnderlineID := 'B'
                                    ELSE IF "Underline Amount" = 2 THEN
                                        UnderlineID := 'C'
                                    ELSE
                                        UnderlineID := 'A';
                            END; /*CASE*/
                        END;
                        /* UNDEFINED('genSELECTLINES',"Overline Column",UnderlineID);*/

                        /*  END*/
                        /*ELSE
                         UNDEFINED('genSELECTLINES',0,'A');*/

                        PayAdviceTitle := 'Test';

                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    /* IF NOT Payrec.GET("Employee No") THEN   // Adam
                        CurrReport.SKIP; */


                    /*  UserSetup.GET(USERID);
                     IF NOT UserSetup."Payroll-Admin" THEN BEGIN
                         IF UserSetup."Employee No." <> "Employee No" THEN
                             ERROR('You cannot view another Employee record, kindly mind your business!');
                     END; */


                    /* IF Payrec.Blocked THEN CurrReport.SKIP;
                    EmployeeName := Payrec."First Name" + '  ' + Payrec."Last Name";
                    DeptName := Payrec."Global Dimension 1 Code";

                    IF DimValRec.GET('DEPARTMENT', DeptName) THEN
                        BusinessUnit := DimValRec.Name;

                    IF DesigRec.GET(Payrec.Designation) THEN
                        DesigName := DesigRec.Description
                    ELSE
                        DesigName := '';


                    PeriodRec.GET("Payroll Period");
                    IF PeriodRec.Name <> '' THEN
                        PayAdviceTitle := 'SALARY SLIP FOR ' + DELCHR(PeriodRec.Name, '<>'); */


                end;
            }
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
        PayAdviceTitle: Text[80];
        CompanyData: Record 79;
        RecOfEDFile: Record 50001;
        PeriodRec: Record 50004;
        PayEntryText: Text[35];
        AmountToPrint: Text[15];
        UnderlineID: Text[1];
        PaySlipText: Text[30];
        Payrec: Record 5200;
        EDTextTable: array[101, 2] of Text[35];
        GrossText: Text[35];
        NetText: Text[35];
        DeductionText: Text[35];
        EDamtTable: array[101, 2] of Decimal;
        Gross: Decimal;
        TDeduction: Decimal;
        NetPay: Decimal;
        i: Integer;
        Ei: Integer;
        Di: Integer;
        GrossPrinted: Boolean;
        TotalDPrinted: Boolean;
        BusinessUnit: Text[30];
        DeptName: Text[30];
        DesigName: Text[30];
        Even: Boolean;
        SN: Integer;
        DesigRec: Record 50079;
        DimValRec: Record 349;
        EarningsCaptionLbl: Label 'Earnings';
        DeductionsCaptionLbl: Label 'Deductions';
        The_Net_Salary_stated_above_is_due_to_you_at_the_end_of_this_month_CaptionLbl: Label 'The Net Salary stated above is due to you at the end of this month.';
        EmployeeName: Text[100];
        EmployeeNo: Code[10];
        UserSetup: Record 91;
}

