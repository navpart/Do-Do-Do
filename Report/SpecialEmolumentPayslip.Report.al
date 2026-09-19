report 50046 "Special Emolument Payslip"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/SpecialEmolumentPayslip.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {

            PrintOnlyIfDetail = true;
            RequestFilterHeading = 'Payslip Filters';

            column(Employee_No_; "No.")
            {
            }
            column(Designation_Employee; Employee.Designation)
            {
            }
            column(DesignationDOS_Employee; Employee."Designation(DOS)")
            {
            }
            column(Employee_Period_Filter; "Period Filter")
            {
            }
            dataitem("Payroll-Payslip Header."; "Payroll-Payslip Header.")
            {
                DataItemLink = "Employee No" = FIELD("No."), "Payroll Period" = FIELD("Period Filter");
                DataItemTableView = SORTING("Payroll Period", "Employee No");
                RequestFilterFields = "Payroll Period", "Employee No";
                RequestFilterHeading = 'Parameters for Payslips';

                column(Payroll_Payslip_Header__Payroll_Period; "Payroll Period")
                {
                }
                column(EmployeeName_PayrollPayslipHeader; "Payroll-Payslip Header."."Employee Name")
                {
                }
                column(PayAdviceTitle; PayAdviceTitle)
                {
                }
                column(DeptName; DeptName)
                {
                }
                column(DesigName; DesigName)
                {
                }
                column(Designation_PayrollPayslipHeader; "Payroll-Payslip Header.".Designation)
                {
                }
                column(Payroll_Payslip_Header__Employee_No; "Employee No")
                {
                }
                column(PayrollPeriod_PayrollPayslipHeader; "Payroll-Payslip Header."."Payroll Period")
                {
                }
                dataitem("Payroll-Payslip Lines."; "Payroll-Payslip Lines.")
                {
                    DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                                   "Employee No" = FIELD("Employee No");
                    DataItemTableView = SORTING("Payslip Print Column", "E/D Code")
                                        WHERE("ED Type" = FILTER(<> "Other Emoluments" & <> "Gross Emolument" & <> "Emolument Net" & <> "Deduction Emolument"));
                    PrintOnlyIfDetail = false;
                    column(PayrollPeriod_PayrollPayslipLines; "Payroll-Payslip Lines."."Payroll Period")
                    {
                    }
                    column(EmployeeNo_PayrollPayslipLines; "Payroll-Payslip Lines."."Employee No")
                    {
                    }
                    column(EDCode_PayrollPayslipLines; "Payroll-Payslip Lines."."E/D Code")
                    {
                    }
                    column(Units_PayrollPayslipLines; "Payroll-Payslip Lines.".Units)
                    {
                    }
                    column(Rate_PayrollPayslipLines; "Payroll-Payslip Lines.".Rate)
                    {
                    }
                    column(Quantity_PayrollPayslipLines; "Payroll-Payslip Lines.".Quantity)
                    {
                    }
                    column(Flag_PayrollPayslipLines; "Payroll-Payslip Lines.".Flag)
                    {
                    }
                    column(Amount_PayrollPayslipLines; "Payroll-Payslip Lines.".Amount)
                    {
                    }
                    column(DebitAccount_PayrollPayslipLines; "Payroll-Payslip Lines."."Debit Account")
                    {
                    }
                    column(CreditAccount_PayrollPayslipLines; "Payroll-Payslip Lines."."Credit Account")
                    {
                    }
                    column(GlobalDimension1Code_PayrollPayslipLines; "Payroll-Payslip Lines."."Global Dimension 1 Code")
                    {
                    }
                    column(GlobalDimension2Code_PayrollPayslipLines; "Payroll-Payslip Lines."."Global Dimension 2 Code")
                    {
                    }
                    column(AmountToBook_PayrollPayslipLines; "Payroll-Payslip Lines.".AmountToBook)
                    {
                    }
                    column(PayslipGroupID_PayrollPayslipLines; "Payroll-Payslip Lines."."Payslip Group ID")
                    {
                    }
                    column(PosInPayslipGrp_PayrollPayslipLines; "Payroll-Payslip Lines."."Pos. In Payslip Grp.")
                    {
                    }
                    column(Payslipappearance_PayrollPayslipLines; "Payroll-Payslip Lines."."Payslip appearance")
                    {
                    }
                    column(DebitAccType_PayrollPayslipLines; "Payroll-Payslip Lines."."Debit Acc. Type")
                    {
                    }
                    column(CreditAccType_PayrollPayslipLines; "Payroll-Payslip Lines."."Credit Acc. Type")
                    {
                    }
                    column(ChangeOthers_PayrollPayslipLines; "Payroll-Payslip Lines.".ChangeOthers)
                    {
                    }
                    column(HasBeenChanged_PayrollPayslipLines; "Payroll-Payslip Lines.".HasBeenChanged)
                    {
                    }
                    column(ChangeCounter_PayrollPayslipLines; "Payroll-Payslip Lines.".ChangeCounter)
                    {
                    }
                    column(PayslipColumn_PayrollPayslipLines; "Payroll-Payslip Lines."."Payslip Column")
                    {
                    }
                    column(SReportappearance_PayrollPayslipLines; "Payroll-Payslip Lines."."S. Report appearance")
                    {
                    }
                    column(OverlineColumn_PayrollPayslipLines; "Payroll-Payslip Lines."."Overline Column")
                    {
                    }
                    column(UnderlineAmount_PayrollPayslipLines; "Payroll-Payslip Lines."."Underline Amount")
                    {
                    }
                    column(LoanID_PayrollPayslipLines; "Payroll-Payslip Lines."."Loan ID")
                    {
                    }
                    column(PayslipPrintColumn_PayrollPayslipLines; "Payroll-Payslip Lines."."Payslip Print Column")
                    {
                    }
                    column(PayslipText_PayrollPayslipLines; "Payroll-Payslip Lines."."Payslip Text")
                    {
                    }
                    column(VariableUnit_PayrollPayslipLines; "Payroll-Payslip Lines."."Variable Unit")
                    {
                    }
                    column(MonthlyVariable_PayrollPayslipLines; "Payroll-Payslip Lines."."Monthly Variable")
                    {
                    }
                    column(PostingGroup_PayrollPayslipLines; "Payroll-Payslip Lines."."Posting Group")
                    {
                    }
                    column(EDType_PayrollPayslipLines; "Payroll-Payslip Lines."."ED Type")
                    {
                    }
                    column(ControlType_PayrollPayslipLines; "Payroll-Payslip Lines."."Control Type")
                    {
                    }
                    column(SequenceNo_PayrollPayslipLines; "Payroll-Payslip Lines."."Sequence No")
                    {
                    }
                    column(Grade_PayrollPayslipLines; "Payroll-Payslip Lines.".Grade)
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

                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Payslip appearance", '<>%1', 4);
                    end;
                }
                dataitem(Emoluments; "Payroll-Payslip Lines.")
                {
                    DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                                   "Employee No" = FIELD("Employee No");
                    DataItemLinkReference = "Payroll-Payslip Header.";
                    DataItemTableView = WHERE("ED Type" = FILTER("Other Emoluments" | "Gross Emolument" | "Emolument Net" | "Deduction Emolument"));
                    PrintOnlyIfDetail = false;
                    column(PayrollPeriod_Emoluments; Emoluments."Payroll Period")
                    {
                    }
                    column(EmployeeNo_Emoluments; Emoluments."Employee No")
                    {
                    }
                    column(EDCode_Emoluments; Emoluments."E/D Code")
                    {
                    }
                    column(Units_Emoluments; Emoluments.Units)
                    {
                    }
                    column(Rate_Emoluments; Emoluments.Rate)
                    {
                    }
                    column(Quantity_Emoluments; Emoluments.Quantity)
                    {
                    }
                    column(Flag_Emoluments; Emoluments.Flag)
                    {
                    }
                    column(Amount_Emoluments; Emoluments.Amount)
                    {
                    }
                    column(DebitAccount_Emoluments; Emoluments."Debit Account")
                    {
                    }
                    column(CreditAccount_Emoluments; Emoluments."Credit Account")
                    {
                    }
                    column(GlobalDimension1Code_Emoluments; Emoluments."Global Dimension 1 Code")
                    {
                    }
                    column(GlobalDimension2Code_Emoluments; Emoluments."Global Dimension 2 Code")
                    {
                    }
                    column(AmountToBook_Emoluments; Emoluments.AmountToBook)
                    {
                    }
                    column(PayslipGroupID_Emoluments; Emoluments."Payslip Group ID")
                    {
                    }
                    column(PosInPayslipGrp_Emoluments; Emoluments."Pos. In Payslip Grp.")
                    {
                    }
                    column(Payslipappearance_Emoluments; Emoluments."Payslip appearance")
                    {
                    }
                    column(DebitAccType_Emoluments; Emoluments."Debit Acc. Type")
                    {
                    }
                    column(CreditAccType_Emoluments; Emoluments."Credit Acc. Type")
                    {
                    }
                    column(ChangeOthers_Emoluments; Emoluments.ChangeOthers)
                    {
                    }
                    column(HasBeenChanged_Emoluments; Emoluments.HasBeenChanged)
                    {
                    }
                    column(ChangeCounter_Emoluments; Emoluments.ChangeCounter)
                    {
                    }
                    column(PayslipColumn_Emoluments; Emoluments."Payslip Column")
                    {
                    }
                    column(SReportappearance_Emoluments; Emoluments."S. Report appearance")
                    {
                    }
                    column(OverlineColumn_Emoluments; Emoluments."Overline Column")
                    {
                    }
                    column(UnderlineAmount_Emoluments; Emoluments."Underline Amount")
                    {
                    }
                    column(LoanID_Emoluments; Emoluments."Loan ID")
                    {
                    }
                    column(PayslipPrintColumn_Emoluments; Emoluments."Payslip Print Column")
                    {
                    }
                    column(PayslipText_Emoluments; Emoluments."Payslip Text")
                    {
                    }
                    column(VariableUnit_Emoluments; Emoluments."Variable Unit")
                    {
                    }
                    column(MonthlyVariable_Emoluments; Emoluments."Monthly Variable")
                    {
                    }
                    column(PostingGroup_Emoluments; Emoluments."Posting Group")
                    {
                    }
                    column(EDType_Emoluments; Emoluments."ED Type")
                    {
                    }
                    column(ControlType_Emoluments; Emoluments."Control Type")
                    {
                    }
                    column(SequenceNo_Emoluments; Emoluments."Sequence No")
                    {
                    }
                    column(Grade_Emoluments; Emoluments.Grade)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF (Emoluments."ED Type" = Emoluments."ED Type"::"Gross Emolument") THEN
                            GrossEmol := Emoluments.Amount;

                        EGross := GrossEmol;


                        IF (Emoluments."ED Type" = Emoluments."ED Type"::"Emolument Net") THEN
                            ENetPay := Emoluments.Amount;

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

                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Payslip appearance", '<>%1', 4);

                        i := 0;
                        Ei := 0;
                        Di := 0;

                        GrossEmol := 0;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT Payrec.GET("Payroll-Payslip Header."."Employee No") THEN
                        CurrReport.SKIP;

                    UserSetup.GET(USERID);
                    IF NOT UserSetup."Payroll-Admin" THEN BEGIN
                        IF UserSetup."Employee No." <> "Payroll-Payslip Header."."Employee No" THEN
                            ERROR('You cannot view another Employee record, kindly mind your business!');
                    END;

                    IF Payrec.Blocked THEN CurrReport.SKIP;
                    BusinessUnit := Payrec."Business Unit";
                    IF DesigRec.GET(Payrec.Designation) THEN
                        DesigName := DesigRec.Description
                    ELSE
                        DesigName := '';



                    PeriodRec.GET("Payroll Period");
                    IF PeriodRec.Name <> '' THEN
                        PayAdviceTitle := 'SALARY SLIP FOR ' + DELCHR(PeriodRec.Name, '<>');

                    FOR i := 1 TO 100 DO BEGIN
                        EDamtTable[i, 1] := 0; // Earning
                        EDamtTable[i, 2] := 0; // Deduction
                        EmolAmtTable[i, 1] := 0; // Emolument Earning
                        EmolAmtTable[i, 2] := 0; // Emolument Deduction
                    END;

                    Gross := 0;
                    TDeduction := 0;
                    NetPay := 0;
                    Ei := 0;
                    Di := 0;

                    EGross := 0;
                    ETDeduction := 0;
                    ENetPay := 0;
                    EEi := 0;
                    EDi := 0;
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

    trigger OnPreReport()
    begin
        SN := 0;
    end;

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
        GrossEmol: Decimal;
        EmolTextTable: array[101, 2] of Text[35];
        EmolAmtTable: array[101, 2] of Decimal;
        EGross: Decimal;
        ETDeduction: Decimal;
        ENetPay: Decimal;
        EGrossText: Text[35];
        ENetText: Text[35];
        EDeductionText: Text[35];
        EEi: Integer;
        EDi: Integer;
        EGrossPrinted: Boolean;
        ETotalDPrinted: Boolean;
        EarningsCaptionLbl: Label 'Earnings';
        DeductionsCaptionLbl: Label 'Deductions';
        The_Net_Salary_stated_above_is_due_to_you_at_the_end_of_this_month_CaptionLbl: Label 'The Net Salary stated above is due to you at the end of this month.';
        EarningsCaption_Control1000000020Lbl: Label 'Earnings';
        DeductionsCaption_Control1000000021Lbl: Label 'Deductions';
        OTHER_EMOLUMENTSCaptionLbl: Label 'OTHER EMOLUMENTS';
        The_Net_Emolument_Stated_above_is_due_to_you_at_the_end_of_this_month_CaptionLbl: Label 'The Net Emolument Stated above is due to you at the end of this month.';
        UserSetup: Record 91;
}

