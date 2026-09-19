report 50186 "Customer - Detail Trial Bal.2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerDetailTrialBal2.rdl';
    Caption = 'Customer - Detail Trial Bal.2';
    ApplicationArea = All;
    UsageCategory = Lists;

    dataset
    {
        dataitem(CustomerData; Customer)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_CustDateFilter_; STRSUBSTNO(Text000, CustDateFilter))
            {
            }

            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; CustomerData.TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Post_Code_; "Post Code")
            {
            }
            column(Customer__Credit_Limit__LCY__; "Credit Limit (LCY)")
            {
            }
            column(StartBalance; StartBalance)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY_Control29; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Cust__Ledger_Entry___Amount__LCY__; CustLedgEntry."Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY____Cust__Ledger_Entry___Amount__LCY__; StartBalanceLCY + CustLedgEntry."Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(Customer___Detail_Trial_Bal_Caption; Customer___Detail_Trial_Bal_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(This_report_also_includes_customers_that_only_have_balances_Caption; This_report_also_includes_customers_that_only_have_balances_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_Caption; CustLedgEntry.FIELDCAPTION("Posting Date"))
            {
            }
            column(Cust__Ledger_Entry__Document_Type_Caption; Cust__Ledger_Entry__Document_Type_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; CustLedgEntry.FIELDCAPTION("Document No."))
            {
            }
            column(Cust__Ledger_Entry_DescriptionCaption; CustLedgEntry.FIELDCAPTION(Description))
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(Remaining_AmountCaption; Remaining_AmountCaptionLbl)
            {
            }
            column(Remaining_Amount__Naira_Caption; Remaining_Amount__Naira_CaptionLbl)
            {
            }
            column(Original_Amount__Naira_Caption; Original_Amount__Naira_CaptionLbl)
            {
            }
            column(Naira_BalanceCaption; Naira_BalanceCaptionLbl)
            {
            }
            column(Currency_CodeCaption; Currency_CodeCaptionLbl)
            {
            }
            column(Credit_LimitCaption; Credit_LimitCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            column(Total__LCY__Before_PeriodCaption; Total__LCY__Before_PeriodCaptionLbl)
            {
            }
            column(Customer_Date_Filter; "Date Filter")
            {
            }
            column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                CalcFields = Amount, "Remaining Amount", "Original Amt. (LCY)", "Remaining Amt. (LCY)", "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
                DataItemLink = "Customer No." = FIELD("No."),
                               "Posting Date" = FIELD("Date Filter"),
                               "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date");
                column(StartBalance___Amount; StartBalance + Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Amount__LCY__; StartBalanceLCY + "Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Cust__Ledger_Entry_Description; Description)
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount_; "Debit Amount")
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Remaining_Amount_; "Remaining Amount")
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustCurrencyCode; CustCurrencyCode)
                {
                }
                column(CustBalance; CustBalance)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Credit_Amount_; "Credit Amount")
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Original_Amt___LCY__; "Original Amt. (LCY)")
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Remaining_Amt___LCY__; "Remaining Amt. (LCY)")
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustBalanceLCY; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(StartBalance___Amount_Control47; StartBalance + Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Amount__LCY___Control1000000005; StartBalanceLCY + "Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(ContinuedCaption_Control46; ContinuedCaption_Control46Lbl)
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Cust__Ledger_Entry_Date_Filter; "Date Filter")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)", "Debit Amount", "Credit Amount");
                    CALCFIELDS("Original Amount", "Remaining Amt. (LCY)", "Debit Amount (LCY)", "Credit Amount (LCY)");

                    CustLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                        CustAmount := "Amount (LCY)";
                        CustRemainAmount := "Remaining Amt. (LCY)";
                        CustCurrencyCode := '';
                    END ELSE BEGIN
                        CustAmount := Amount;
                        CustRemainAmount := "Remaining Amount";
                        CustCurrencyCode := "Currency Code";
                    END;
                    CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";

                    CustBalance := CustBalance + CustLedgEntry.Amount;  //sgg
                    CustCurrencyCode := "Currency Code";                       //sgg

                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        CustEntryDueDate := 0D
                    ELSE
                        CustEntryDueDate := "Due Date";
                end;

                trigger OnPreDataItem()
                begin
                    CustLedgEntryExists := FALSE;
                    //CurrReport.CREATETOTALS(CustAmount, "Amount (LCY)");
                end;
            }
            dataitem(DataItem5444; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(Customer_Name_Control48; CustomerData.Name)
                {
                }
                column(StartBalance____Cust__Ledger_Entry__Amount; StartBalance + CustLedgEntry.Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Cust__Ledger_Entry___Amount__LCY___Control1000000006; StartBalanceLCY + CustLedgEntry."Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Customer_Name_Control15; CustomerData.Name)
                {
                }
                column(StartBalance____Cust__Ledger_Entry__Amount_Control17; StartBalance + CustLedgEntry.Amount)
                {
                    AutoFormatType = 1;
                }
                column(CustAmount; CustAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Cust__Ledger_Entry___Amount__LCY___Control1000000007; StartBalanceLCY + CustLedgEntry."Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT CustLedgEntryExists AND ((StartBalanceLCY = 0) OR NOT PrintAllHavingBal) THEN BEGIN
                        StartBalanceLCY := 0;
                        CurrReport.SKIP;
                    END;

                    IF NOT CustLedgEntryExists AND (NOT PrintAmountsInLCY) AND ((StartBalance = 0) OR NOT PrintAllHavingBal) THEN BEGIN
                        StartBalance := 0;
                        CurrReport.SKIP;
                    END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartBalanceLCY := 0;
                IF CustDateFilter <> '' THEN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change (LCY)", "Net Change");
                        StartBalanceLCY := "Net Change (LCY)";
                        StartBalance := "Net Change";
                        SETFILTER("Date Filter", CustDateFilter);
                    END;
                CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                CustBalanceLCY := StartBalanceLCY;
                CustBalance := StartBalance;
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                //CurrReport.CREATETOTALS(CustLedgEntry."Amount (LCY)", StartBalanceLCY, StartBalance);
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
        CustFilter := CustomerData.GETFILTERS;
        CustDateFilter := CustomerData.GETFILTER("Date Filter");
        IF PrintAmountsInLCY THEN BEGIN
            AmountCaption := CustLedgEntry.FIELDCAPTION("Amount (LCY)");
            RemainingAmtCaption := CustLedgEntry.FIELDCAPTION("Remaining Amt. (LCY)");
        END ELSE BEGIN
            AmountCaption := CustLedgEntry.FIELDCAPTION(Amount);
            RemainingAmtCaption := CustLedgEntry.FIELDCAPTION("Remaining Amount");
        END;
    end;

    var
        Text000: Label 'Period: %1';
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        PrintAllHavingBal: Boolean;
        CustFilter: Text[250];
        CustDateFilter: Text[30];
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        CustAmount: Decimal;
        CustRemainAmount: Decimal;
        CustBalanceLCY: Decimal;
        CustCurrencyCode: Code[10];
        CustEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalance: Decimal;
        CustLedgEntryExists: Boolean;
        CustBalance: Decimal;
        Customer___Detail_Trial_Bal_CaptionLbl: Label 'Customer - Detail Trial Bal.';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        This_report_also_includes_customers_that_only_have_balances_CaptionLbl: Label 'This report also includes customers that only have balances.';
        Cust__Ledger_Entry__Document_Type_CaptionLbl: Label 'Document Type';
        BalanceCaptionLbl: Label 'Balance';
        CreditCaptionLbl: Label 'Credit';
        DebitCaptionLbl: Label 'Debit';
        Remaining_AmountCaptionLbl: Label 'Remaining Amount';
        Remaining_Amount__Naira_CaptionLbl: Label 'Remaining Amount (Naira)';
        Original_Amount__Naira_CaptionLbl: Label 'Original Amount (Naira)';
        Naira_BalanceCaptionLbl: Label 'Naira Balance';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        Credit_LimitCaptionLbl: Label 'Credit Limit';
        LocationCaptionLbl: Label 'Location';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
        Total__LCY__Before_PeriodCaptionLbl: Label 'Total (LCY) Before Period';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control46Lbl: Label 'Continued';
}

