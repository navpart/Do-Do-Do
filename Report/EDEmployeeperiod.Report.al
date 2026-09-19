report 50067 "E/D-Employee-period"
{
    // For upto 12 selected periods, this report prints the amounts for an E/D for
    // an employee, for each of this periods. The total amount for the periods is
    // also printed for each employee.
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./EDEmployeeperiod.rdl';
    ApplicationArea = All;


    dataset
    {
        dataitem(DataItem7581; "Payroll-E/D Codes.")
        {
            DataItemTableView = SORTING("E/D Code");
            PrintOnlyIfDetail = false;
            RequestFilterFields = "E/D Code";
            column(CompanyData_Name; CompanyData.Name)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(Payroll_E_D_Codes___E_D_Code_; "E/D Code")
            {
            }
            column(ReqPeriodsArray_1___Period_Code_; ReqPeriodsArray[1]."Period Code")
            {
            }
            column(ReqPeriodsArray_2___Period_Code_; ReqPeriodsArray[2]."Period Code")
            {
            }
            column(ReqPeriodsArray_3___Period_Code_; ReqPeriodsArray[3]."Period Code")
            {
            }
            column(ReqPeriodsArray_4___Period_Code_; ReqPeriodsArray[4]."Period Code")
            {
            }
            column(ReqPeriodsArray_5___Period_Code_; ReqPeriodsArray[5]."Period Code")
            {
            }
            column(ReqPeriodsArray_6___Period_Code_; ReqPeriodsArray[6]."Period Code")
            {
            }
            column(Employee_Entries_per_period_Caption; Employee_Entries_per_period_CaptionLbl)
            {
            }
            column(Report_print_date_Caption; Report_print_date_CaptionLbl)
            {
            }
            column(E_D_Code_Caption; E_D_Code_CaptionLbl)
            {
            }
            column(TotalsCaption; TotalsCaptionLbl)
            {
            }
            dataitem(DataItem1581; "Payroll-Payslip Lines.")
            {
                DataItemLink = "E/D Code" = FIELD("E/D Code");
                DataItemTableView = SORTING("E/D Code", "Employee No", "Payroll Period");
                PrintOnlyIfDetail = false;
                RequestFilterFields = "Employee No";
                RequestFilterHeading = 'Employees';
                column(EDAmountsArray_6_; EDAmountsArray[6])
                {
                }
                column(EDAmountsArray_7_; EDAmountsArray[7])
                {
                }
                column(EDAmountsArray_5_; EDAmountsArray[5])
                {
                }
                column(EDAmountsArray_4_; EDAmountsArray[4])
                {
                }
                column(EDAmountsArray_2_; EDAmountsArray[2])
                {
                }
                column(EDAmountsArray_3_; EDAmountsArray[3])
                {
                }
                column(EDAmountsArray_1_; EDAmountsArray[1])
                {
                }
                column(DELCHR__EmployeeName_______; DELCHR(EmployeeName, '<>'))
                {
                }
                column(EmpCount; EmpCount)
                {
                }
                column(EDAmountsArray_1__Control24; EDAmountsArray[1])
                {
                }
                column(EDAmountsArray_2__Control25; EDAmountsArray[2])
                {
                }
                column(EDAmountsArray_3__Control26; EDAmountsArray[3])
                {
                }
                column(EDAmountsArray_4__Control27; EDAmountsArray[4])
                {
                }
                column(EDAmountsArray_5__Control28; EDAmountsArray[5])
                {
                }
                column(EDAmountsArray_6__Control29; EDAmountsArray[6])
                {
                }
                column(EDAmountsArray_7__Control30; EDAmountsArray[7])
                {
                }
                column(EmpText; EmpText)
                {
                }
                column(Number_of_employees______________________Caption; Number_of_employees______________________CaptionLbl)
                {
                }
                column(TOTAL_AMOUNTSCaption; TOTAL_AMOUNTSCaptionLbl)
                {
                }
                column(NB__Report_is_for_Employee_Numbers_Caption; NB__Report_is_for_Employee_Numbers_CaptionLbl)
                {
                }
                column(Payroll_Payslip_Lines__Payroll_Period; "Payroll Period")
                {
                }
                column(Payroll_Payslip_Lines__Employee_No; "Employee No")
                {
                }
                column(Payroll_Payslip_Lines__E_D_Code; "E/D Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    FoundPos := 0;
                    CASE "Payroll Period" OF

                        ReqPeriodsArray[1]."Period Code":
                            BEGIN
                                EDAmountsArray[1] := Amount;
                                FoundPos := 1;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                        ReqPeriodsArray[2]."Period Code":
                            BEGIN
                                EDAmountsArray[2] := Amount;
                                FoundPos := 2;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                        ReqPeriodsArray[3]."Period Code":
                            BEGIN
                                EDAmountsArray[3] := Amount;
                                FoundPos := 3;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                        ReqPeriodsArray[4]."Period Code":
                            BEGIN
                                EDAmountsArray[4] := Amount;
                                FoundPos := 4;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                        ReqPeriodsArray[5]."Period Code":
                            BEGIN
                                EDAmountsArray[5] := Amount;
                                FoundPos := 5;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                        ReqPeriodsArray[6]."Period Code":
                            BEGIN
                                EDAmountsArray[6] := Amount;
                                FoundPos := 6;
                                EDAmountsArray[7] := EDAmountsArray[7] + Amount;
                            END;
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    /* CurrReport.CREATETOTALS(EDAmountsArray[1], EDAmountsArray[2], EDAmountsArray[3],
                                     EDAmountsArray[4], EDAmountsArray[5], EDAmountsArray[6],
                                     EDAmountsArray[7], EDAmountsArray[8], EDAmountsArray[9],
                                     EDAmountsArray[10]); */
                    /***EDAmountsArray[11], EDAmountsArray[12]);***/

                    EmpText := GETFILTER("Employee No");

                end;
            }

            trigger OnAfterGetRecord()
            begin
                EmpCount := 0;
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
        CompanyData: Record 79;
        EmployeeRec: Record 5200;
        EmployeeName: Text[40];
        ReqPeriodsArray: array[12] of Record 50004;
        EDAmountsArray: array[13] of Decimal;
        ArrayIndex: Integer;
        ArrayTop: Integer;
        FoundPos: Integer;
        EmpCount: Integer;
        EmpText: Text[50];
        Employee_Entries_per_period_CaptionLbl: Label 'Employee Entries per period.';
        Report_print_date_CaptionLbl: Label 'Report print date:';
        E_D_Code_CaptionLbl: Label 'E/D Code:';
        TotalsCaptionLbl: Label 'Totals';
        Number_of_employees______________________CaptionLbl: Label 'Number of employees.....................:';
        TOTAL_AMOUNTSCaptionLbl: Label 'TOTAL AMOUNTS';
        NB__Report_is_for_Employee_Numbers_CaptionLbl: Label 'NB: Report is for Employee Numbers:';
}

