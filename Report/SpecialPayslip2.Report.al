report 50038 "Special Payslip-2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./SpecialPayslip2.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("Global Dimension 1 Code");
            PrintOnlyIfDetail = true;
            RequestFilterHeading = 'Payslip Filters';
            column(Employee_No_; "No.")
            {
            }
            column(Employee_Period_Filter; "Period Filter")
            {
            }
            dataitem("Payroll-Payslip Header."; "Payroll-Payslip Header.")
            {
                DataItemLink = "Employee No" = FIELD("No."),
                               "Payroll Period" = FIELD("Period Filter");
                DataItemTableView = SORTING("Payroll Period", "Employee No");
                RequestFilterFields = "Payroll Period", "Employee No";
                RequestFilterHeading = 'Parameters for payslips';
                column(Payroll_Payslip_Header__Payroll_Period; "Payroll Period")
                {
                }
                column(Payroll_Payslip_Header__Employee_No; "Employee No")
                {
                }
                dataitem("Payroll-Payslip Lines."; "Payroll-Payslip Lines.")
                {
                    DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                                   "Employee No" = FIELD("Employee No");
                    DataItemTableView = SORTING("Payslip Print Column", "E/D Code")
                                        WHERE("S. Report appearance" = FILTER(<> "Does not appear" & <> Heading));
                    PrintOnlyIfDetail = false;

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

                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("S. Report appearance", '<>%1&<>%2', 4, 5);
                    end;
                }
                dataitem(PaySlipPage; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(PayAdviceTitle; PayAdviceTitle)
                    {
                    }
                    column(Designation_______Payroll_Payslip_Header___Designation; 'Designation:   ' + "Payroll-Payslip Header.".Designation)
                    {
                    }
                    column(DELCHR__Payroll_Payslip_Header____Employee_No____________________Payroll_Payslip_Header____Employee_Name__; DELCHR("Payroll-Payslip Header."."Employee No", '<>') + ':   ' + ("Payroll-Payslip Header."."Employee Name"))
                    {
                    }
                    column(Business_Unit____BusinessUnit; 'Business Unit: ' + BusinessUnit)
                    {
                    }
                    column(Department_______Department; 'Department:    ' + Department)
                    {
                    }
                    column(EarningsCaption; EarningsCaptionLbl)
                    {
                    }
                    column(DeductionsCaption; DeductionsCaptionLbl)
                    {
                    }
                    column(PaySlipPage_Number; Number)
                    {
                    }
                    dataitem(PaySlipLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(< 101),
                                                  Number = FILTER(> 0));
                        column(EDTextTable_i_1_; EDTextTable[i, 1])
                        {
                        }
                        column(EDamtTable_i_1_; EDamtTable[i, 1])
                        {
                        }
                        column(EDTextTable_i_2_; EDTextTable[i, 2])
                        {
                        }
                        column(EDamtTable_i_2_; EDamtTable[i, 2])
                        {
                        }
                        column(EDTextTable_i_1__Control8; EDTextTable[i, 1])
                        {
                        }
                        column(EDamtTable_i_1__Control9; EDamtTable[i, 1])
                        {
                        }
                        column(EDTextTable_i_2__Control66; EDTextTable[i, 2])
                        {
                        }
                        column(EDamtTable_i_2__Control67; EDamtTable[i, 2])
                        {
                        }
                        column(EDTextTable_i_2__Control50; EDTextTable[i, 2])
                        {
                        }
                        column(EDamtTable_i_2__Control51; EDamtTable[i, 2])
                        {
                        }
                        column(EDTextTable_i_1__Control48; EDTextTable[i, 1])
                        {
                        }
                        column(EDamtTable_i_1__Control49; EDamtTable[i, 1])
                        {
                        }
                        column(TotalEarning2; TotalEarning2)
                        {
                        }
                        column(Total_Earning_; 'Total Earning')
                        {
                        }
                        column(TotalDed2; TotalDed2)
                        {
                        }
                        column(Total_Deduction_; 'Total Deduction')
                        {
                        }
                        column(NetText________FORMAT_TotalEarning2_TotalDed2_; NetText + '    ' + FORMAT(TotalEarning2 - TotalDed2))
                        {
                        }
                        column(The_Net_Salary_stated_above_is_due_to_you_at_the_end_of_this_month_Caption; The_Net_Salary_stated_above_is_due_to_you_at_the_end_of_this_month_CaptionLbl)
                        {
                        }
                        column(PaySlipLoop_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF i > 0 THEN
                                IF (EDamtTable[i, 1] = 0) AND (EDamtTable[i, 2] = 0) THEN
                                    CurrReport.BREAK;
                        end;

                        trigger OnPreDataItem()
                        begin
                            i := 0;

                            //CurrReport.CREATETOTALS(TotalEarning2, TotalDed2);
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        GrossPrinted := FALSE;
                        TotalDPrinted := FALSE;
                    end;
                }

                trigger OnAfterGetRecord()
                begin

                    IF NOT Payrec.GET("Payroll-Payslip Header."."Employee No") THEN   // Adam
                        CurrReport.SKIP;
                    IF Payrec.Blocked THEN CurrReport.SKIP;                 //Added to skip Blocked Employees
                    BusinessUnit := Payrec."Business Unit";
                    Department := Payrec."Global Dimension 1 Code";
                    Designation := Payrec.Designation;

                    PeriodRec.GET("Payroll Period");
                    IF PeriodRec.Name <> '' THEN
                        PayAdviceTitle := 'SALARY SLIP FOR ' + DELCHR(PeriodRec.Name, '<>');

                    FOR i := 1 TO 100 DO BEGIN
                        EDamtTable[i, 1] := 0; // Earning
                        EDamtTable[i, 2] := 0; // Deduction
                    END;

                    Gross := 0;
                    TDeduction := 0;
                    NetPay := 0;
                    Ei := 0;
                    Di := 0;


                    TaxableAmount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*
                if "Payroll-Employees.".Blocked then
                CurrReport.SKIP;
                */

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
        Department: Text[30];
        Designation: Text[30];
        TotalEarning2: Decimal;
        TotalDed2: Decimal;
        LookRec: Record 50003;
        TaxableAmount: Decimal;
        EarningsCaptionLbl: Label 'Earnings';
        DeductionsCaptionLbl: Label 'Deductions';
        The_Net_Salary_stated_above_is_due_to_you_at_the_end_of_this_month_CaptionLbl: Label 'The Net Salary stated above is due to you at the end of this month.';
}

