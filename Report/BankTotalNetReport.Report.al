report 50085 "Bank Total Net Report"
{
    // This report prints the payment schedules to banks.
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BankTotalNetReport.rdl';
    ApplicationArea = All;


    dataset
    {
        dataitem(DataItem6885; "Payroll-Banks.")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(Payroll_Banks__Name; Name)
            {
            }
            column(Report_print_date_Caption; Report_print_date_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(BANK_REPORTCaption; BANK_REPORTCaptionLbl)
            {
            }
            column(BankCaption; BankCaptionLbl)
            {
            }
            column(Payroll_Banks__Code; Code)
            {
            }
            dataitem(EmployeeData; Employee)
            {
                CalcFields = EDAmount;
                DataItemLink = Bank = FIELD(Code);
                DataItemTableView = SORTING(Bank, "Last Name", "First Name", "Middle Name")
                                    WHERE("Mode of payment" = CONST(Bank),
                                          Blocked = CONST(false));
                PrintOnlyIfDetail = false;
                RequestFilterFields = "Period Filter", Bank, "No.", "ED Filter";
                RequestFilterHeading = 'Period and Bank';
                column(PeriodText; PeriodText)
                {
                }
                column(Employee__Bank_Account_; "Bank Account")
                {
                }
                column(Employee__No__; "No.")
                {
                }
                column(Employee__First_Name_; "First Name")
                {
                }
                column(Employee__Middle_Name_; "Middle Name")
                {
                }
                column(Employee__Last_Name_; "Last Name")
                {
                }
                column(TotalNet; TotalNet)
                {
                }
                column(Account_NumberCaption; Account_NumberCaptionLbl)
                {
                }
                column(Employee__No__Caption; FIELDCAPTION("No."))
                {
                }
                column(Employee__First_Name_Caption; FIELDCAPTION("First Name"))
                {
                }
                column(Employee__Middle_Name_Caption; FIELDCAPTION("Middle Name"))
                {
                }
                column(Employee__Last_Name_Caption; FIELDCAPTION("Last Name"))
                {
                }
                column(PERIODCaption; PERIODCaptionLbl)
                {
                }
                column(Total_Net_AmountCaption; Total_Net_AmountCaptionLbl)
                {
                }
                column(Employee_Bank; Bank)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF EmployeeData.Blocked THEN CurrReport.SKIP;

                    SETRANGE("ED Filter", NetED);
                    CALCFIELDS(EDAmount);

                    NetAmount := EDAmount;
                    SETRANGE("ED Filter");
                    SETRANGE("ED Type Filter", "ED Type Filter"::"Emolument Net");

                    CALCFIELDS(EmployeeData."Emolument EDAmount");
                    EmolumentNet := EmployeeData."Emolument EDAmount";

                    TotalNet := NetAmount + EmolumentNet;

                    //IF EDAmount = 0 THEN
                    //  CurrReport.SKIP;

                    BankTotal := BankTotal + TotalNet;
                end;

                trigger OnPreDataItem()
                begin

                    CompanyData.GET;
                    SETRANGE("ED Filter", NetED);
                    //CurrReport.CREATETOTALS(EDAmount);

                    PerCode := EmployeeData.GETRANGEMAX(EmployeeData."Period Filter");
                    PeriodRec.GET(PerCode);
                    PeriodText := PeriodRec.Name;

                    //CurrReport.CREATETOTALS(NetAmount, EmolumentNet, TotalNet);
                end;
            }
            dataitem(Totals; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(for_Naira____FORMAT_TotalNet_______Covering_Payment_of_Salaries_for_the_above_listed_staff_for_____PeriodText; 'for Naira ' + FORMAT(TotalNet) + ', Covering Payment of Salaries for the above listed staff for ' + PeriodText)
                {
                }
                column(TotalNet_Control1000000035; TotalNet)
                {
                }
                column(TotalsCaption; TotalsCaptionLbl)
                {
                }
                column(Please_Receive_Cheque_NumberCaption; Please_Receive_Cheque_NumberCaptionLbl)
                {
                }
                column(Please_Credit_Their_Accounts_AccordinglyCaption; Please_Credit_Their_Accounts_AccordinglyCaptionLbl)
                {
                }
                column(Checked_By_Caption; Checked_By_CaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(DateCaption_Control1000000022; DateCaption_Control1000000022Lbl)
                {
                }
                column(Approved_By__Caption; Approved_By__CaptionLbl)
                {
                }
                column(Approved_By__Caption_Control1000000024; Approved_By__Caption_Control1000000024Lbl)
                {
                }
                column(DateCaption_Control1000000025; DateCaption_Control1000000025Lbl)
                {
                }
                column(Totals_Number; Number)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                BankTotal := 0;
            end;

            trigger OnPreDataItem()
            begin
                PayEds.RESET;
                PayEds.SETRANGE(PayEds."Payslip Group ID", PayEds."Payslip Group ID"::"NET PAY DUE");
                PayEds.FIND('-');
                NetED := PayEds."E/D Code";
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
        HeaderText: Text[40];
        newBANK: Boolean;
        FirstRec: Boolean;
        PageWasBroken: Boolean;
        StoreRec: Record 5200;
        PeriodRec: Record 50004;
        BankRec: Record 50012;
        PayEds: Record 50001;
        BankTotal: Decimal;
        NetED: Code[20];
        PeriodText: Text[30];
        PerCode: Code[20];
        NetAmount: Decimal;
        EmolumentNet: Decimal;
        TotalNet: Decimal;
        Report_print_date_CaptionLbl: Label 'Report print date:';
        PageCaptionLbl: Label 'Page';
        BANK_REPORTCaptionLbl: Label 'BANK REPORT';
        BankCaptionLbl: Label 'Bank';
        Account_NumberCaptionLbl: Label 'Account Number';
        PERIODCaptionLbl: Label 'PERIOD';
        Total_Net_AmountCaptionLbl: Label 'Total Net Amount';
        TotalsCaptionLbl: Label 'Totals';
        Please_Receive_Cheque_NumberCaptionLbl: Label 'Please Receive Cheque Number';
        Please_Credit_Their_Accounts_AccordinglyCaptionLbl: Label 'Please Credit Their Accounts Accordingly';
        Checked_By_CaptionLbl: Label 'Checked By:';
        DateCaptionLbl: Label 'Date';
        DateCaption_Control1000000022Lbl: Label 'Date';
        Approved_By__CaptionLbl: Label 'Approved By :';
        Approved_By__Caption_Control1000000024Lbl: Label 'Approved By :';
        DateCaption_Control1000000025Lbl: Label 'Date';
}

