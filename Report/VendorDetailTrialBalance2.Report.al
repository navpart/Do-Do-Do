report 50020 "Vendor-Detail Trial Balance2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/VendorDetailTrialBalance2.rdl';
    Caption = 'Vendor Detail Trial Balance FCY Vs LCY';
    UsageCategory = Lists;
    ApplicationArea = Basic, Suite, Service;

    dataset
    {
        dataitem(VendorData; Vendor)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Vendor Posting Group", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_VendDateFilter_; STRSUBSTNO(Text000, VendDateFilter))
            {
            }

            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Vendor_TABLECAPTION__________VendFilter; VendorData.TABLECAPTION + ': ' + VendFilter)
            {
            }
            column(AmountCaption; AmountCaption)
            {

            }
            column(RemainingAmtCaption; RemainingAmtCaption)
            {

            }
            column(Remaining_Amount_; 'Remaining Amount')
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(Amount_; 'Amount')
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(Vendor__No__; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(Vendor__Phone_No__; "Phone No.")
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
            column(StartBalance_Control29; StartBalance)
            {
                AutoFormatType = 1;
            }
            column(Vendor_Ledger_Entry__Amount; VendLedgEntry.Amount)
            {
                AutoFormatType = 1;
            }
            column(StartBalance____Vendor_Ledger_Entry__Amount; StartBalance + VendLedgEntry.Amount)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY_Control1000000013; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY____Vendor_Ledger_Entry___Amount__LCY__; StartBalanceLCY + VendLedgEntry."Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(Vendor___Detail_Trial_BalanceCaption; Vendor___Detail_Trial_BalanceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(This_report_also_includes_vendors_that_only_have_balances_Caption; This_report_also_includes_vendors_that_only_have_balances_CaptionLbl)
            {
            }
            column(Vendor_Ledger_Entry__Posting_Date_Caption; VendLedgEntry.FIELDCAPTION("Posting Date"))
            {
            }
            column(Vendor_Ledger_Entry__Document_Type_Caption; Vendor_Ledger_Entry__Document_Type_CaptionLbl)
            {
            }
            column(Vendor_Ledger_Entry__Document_No__Caption; VendLedgEntry.FIELDCAPTION("Document No."))
            {
            }
            column(Vendor_Ledger_Entry_DescriptionCaption; VendLedgEntry.FIELDCAPTION(Description))
            {
            }
            column(VendBalanceLCYCaption; VendBalanceLCYCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(FCYCaption; FCYCaptionLbl)
            {
            }
            column(NAIRACaption; NAIRACaptionLbl)
            {
            }
            column(Vendor__Phone_No__Caption; FIELDCAPTION("Phone No."))
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            column(Total__LCY__Before_PeriodCaption; Total__LCY__Before_PeriodCaptionLbl)
            {
            }
            column(Vendor_Date_Filter; "Date Filter")
            {
            }
            column(Vendor_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Vendor_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem(VendLedgEntry; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No."),
                               "Posting Date" = FIELD("Date Filter"),
                               "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Vendor No.", "Posting Date");
                column(StartBalance___Amount; StartBalance + Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Amount__LCY__; StartBalanceLCY + "Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Vendor_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Vendor_Ledger_Entry__Document_Type_; "Document Type")
                {
                }
                column(Vendor_Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Vendor_Ledger_Entry_Description; Description)
                {
                }
                column(VendAmount; VendAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendBalanceLCY; VendBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(VendRemainAmount; VendRemainAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendCurrencyCode; VendCurrencyCode)
                {
                }
                column(VendBalance; VendBalance)
                {
                    AutoFormatType = 1;
                }
                column(Vendor_Ledger_Entry__Remaining_Amt___LCY__; "Remaining Amt. (LCY)")
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Vendor_Ledger_Entry__Amount__LCY__; "Amount (LCY)")
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(StartBalance___Amount_Control53; StartBalance + Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Amount__LCY___Control1000000010; StartBalanceLCY + "Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(ContinuedCaption_Control46; ContinuedCaption_Control46Lbl)
                {
                }
                column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Vendor_Ledger_Entry_Vendor_No_; "Vendor No.")
                {
                }
                column(Vendor_Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Vendor_Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Vendor_Ledger_Entry_Date_Filter; "Date Filter")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");

                    VendLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                        VendAmount := "Amount (LCY)";
                        VendRemainAmount := "Remaining Amt. (LCY)";
                        VendCurrencyCode := '';
                    END
                    ELSE BEGIN
                        VendAmount := Amount;
                        VendRemainAmount := "Remaining Amount";
                        VendCurrencyCode := "Currency Code";
                    END;

                    VendBalance := VendBalance + Amount;
                    VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        VendEntryDueDate := 0D
                    ELSE
                        VendEntryDueDate := "Due Date";
                end;

                trigger OnPreDataItem()
                begin
                    VendLedgEntryExists := FALSE;
                    //CurrReport.CREATETOTALS(VendAmount, "Amount (LCY)", Amount);
                end;
            }
            dataitem(DataItem5444; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(Vendor_Name_Control27; VendorData.Name)
                {
                }
                column(StartBalance____Vendor_Ledger_Entry__Amount_Control55; StartBalance + VendLedgEntry.Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Vendor_Ledger_Entry___Amount__LCY___Control1000000011; StartBalanceLCY + VendLedgEntry."Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Vendor_Name_Control48; VendorData.Name)
                {
                }
                column(VendAmount_Control49; VendAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(StartBalance____Vendor_Ledger_Entry__Amount_Control56; StartBalance + VendLedgEntry.Amount)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY____Vendor_Ledger_Entry___Amount__LCY___Control1000000012; StartBalanceLCY + VendLedgEntry."Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Vendor_Ledger_Entry___Amount__LCY__; VendLedgEntry."Amount (LCY)")
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT VendLedgEntryExists AND ((StartBalanceLCY = 0) OR NOT PrintAllHavingBal) THEN BEGIN
                        StartBalanceLCY := 0;
                        CurrReport.SKIP;
                    END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartBalance := 0;
                IF VendDateFilter <> '' THEN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change");
                        StartBalance := -"Net Change";
                        SETFILTER("Date Filter", VendDateFilter);
                    END;

                CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                VendBalance := StartBalance;

                StartBalanceLCY := 0;
                IF VendDateFilter <> '' THEN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change (LCY)");
                        StartBalanceLCY := -"Net Change (LCY)";
                        SETFILTER("Date Filter", VendDateFilter);
                    END;
                CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                VendBalanceLCY := StartBalanceLCY;
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                //CurrReport.CREATETOTALS(VendLedgEntry."Amount (LCY)", StartBalanceLCY);
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
        VendFilter := VendorData.GETFILTERS;
        VendDateFilter := VendorData.GETFILTER("Date Filter");

        IF PrintAmountsInLCY THEN BEGIN
            AmountCaption := VendLedgEntry.FIELDCAPTION("Amount (LCY)");
            RemainingAmtCaption := VendLedgEntry.FIELDCAPTION("Remaining Amt. (LCY)");
        END ELSE BEGIN
            AmountCaption := VendLedgEntry.FIELDCAPTION(Amount);
            RemainingAmtCaption := VendLedgEntry.FIELDCAPTION("Remaining Amount");
        END;
    end;

    var
        Text000: Label 'Period: %1';
        VendFilter: Text[250];
        VendDateFilter: Text[30];
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendBalance: Decimal;
        VendBalanceLCY: Decimal;
        VendEntryDueDate: Date;
        StartBalance: Decimal;
        StartBalanceLCY: Decimal;
        PrintAllHavingBal: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        VendLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        VendCurrencyCode: Code[10];
        Vendor___Detail_Trial_BalanceCaptionLbl: Label 'Vendor - Detail Trial Balance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        This_report_also_includes_vendors_that_only_have_balances_CaptionLbl: Label 'This report also includes vendors that only have balances.';
        Vendor_Ledger_Entry__Document_Type_CaptionLbl: Label 'Document Type';
        VendBalanceLCYCaptionLbl: Label 'Balance (LCY)';
        BalanceCaptionLbl: Label 'Balance';
        FCYCaptionLbl: Label 'FCY';
        NAIRACaptionLbl: Label 'NAIRA';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
        Total__LCY__Before_PeriodCaptionLbl: Label 'Total (LCY) Before Period';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control46Lbl: Label 'Continued';
}

