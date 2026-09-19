report 50405 "Daily Flash Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/DailyFlashReport.rdl';

    dataset
    {
        dataitem(DataItem6836; Customer)
        {
            DataItemTableView = SORTING("No.")
                                WHERE("No." = FILTER('TDP*' | 'TCO*'));
            RequestFilterFields = "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(GETFILTER__Date_Filter__; GETFILTER("Date Filter"))
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Payments__LCY__; "Payments (LCY)")
            {
            }
            column(Customer__Cr__Memo_Amounts__LCY__; "Cr. Memo Amounts (LCY)")
            {
            }
            column(Inv__Amounts__LCY____Cr__Memo_Amounts__LCY__; "Inv. Amounts (LCY)" - "Cr. Memo Amounts (LCY)")
            {
            }
            column(Customer__Inv__Amounts__LCY__; "Inv. Amounts (LCY)")
            {
            }
            column(Customer__Outstanding_Orders__LCY__; "Outstanding Orders (LCY)")
            {
            }
            column(Customer__Payments__LCY___Control1000000013; "Payments (LCY)")
            {
            }
            column(Inv__Amounts__LCY____Cr__Memo_Amounts__LCY___Control1000000015; "Inv. Amounts (LCY)" - "Cr. Memo Amounts (LCY)")
            {
            }
            column(Customer__Outstanding_Orders__LCY___Control1000000019; "Outstanding Orders (LCY)")
            {
            }
            column(Flash_ReportCaption; Flash_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Customer__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Customer__Payments__LCY__Caption; Customer__Payments__LCY__CaptionLbl)
            {
            }
            column(Sales_ValueCaption; Sales_ValueCaptionLbl)
            {
            }
            column(Outstanding_OrdersCaption; Outstanding_OrdersCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF ("Inv. Amounts (LCY)" = 0) AND ("Cr. Memo Amounts (LCY)" = 0) AND ("Payments (LCY)" = 0) THEN
                    CurrReport.SKIP;
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
        Flash_ReportCaptionLbl: Label 'Flash Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DateCaptionLbl: Label 'Date';
        Customer__Payments__LCY__CaptionLbl: Label 'Payments Made';
        Sales_ValueCaptionLbl: Label 'Sales Value';
        Outstanding_OrdersCaptionLbl: Label 'Outstanding Orders';
        TotalCaptionLbl: Label 'Total';
}

