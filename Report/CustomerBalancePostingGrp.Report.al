report 50114 "Customer Balance /Posting Grp"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerBalancePostingGrp.rdl';

    dataset
    {
        dataitem(DataItem6836; Customer)
        {
            CalcFields = "Balance Due by Posting Date", "Net Change", "Net Change (LCY)";
            DataItemTableView = SORTING("Customer Posting Group");
            RequestFilterFields = "Customer Posting Group", "No.", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Filters________GETFILTERS__; 'Filters :  ' + GETFILTERS())
            {
            }
            column(Customer__Customer_Posting_Group_; "Customer Posting Group")
            {
            }
            column(PGrpName; PGrpName)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(DateFilter_Customer; "Date Filter")
            {
            }
            column(Customer__Balance_Due_by_Posting_Date_; "Balance Due by Posting Date")
            {
            }
            column(Customer__Net_Change_; "Net Change")
            {
            }
            column(Customer__No___Control1000000033; "No.")
            {
            }
            column(Customer_Name_Control1000000034; Name)
            {
            }
            column(Customer__Balance_Due_by_Posting_Date__Control1000000035; "Balance Due by Posting Date")
            {
            }
            column(Customer__Net_Change__Control1000000037; "Net Change")
            {
            }
            column(TotalFor____________Customer_Posting_Group_; TotalFor + '   ' + "Customer Posting Group")
            {
            }
            column(Customer__Balance_Due_by_Posting_Date__Control1000000039; "Balance Due by Posting Date")
            {
            }
            column(Customer__Net_Change__Control1000000041; "Net Change")
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Customer__Balance_Due_by_Posting_Date__Control1000000043; "Balance Due by Posting Date")
            {
            }
            column(Customer__Balance_By_Posting_GroupCaption; Customer__Balance_By_Posting_GroupCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Customer__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Net_Change__NAIRA_Caption; Net_Change__NAIRA_CaptionLbl)
            {
            }
            column(Net_Change__FCY_Caption; Net_Change__FCY_CaptionLbl)
            {
            }
            column(Customer__Customer_Posting_Group_Caption; FIELDCAPTION("Customer Posting Group"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Customer Posting Group");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        PGrp: Record 92;
        PGrpName: Text[30];
        ShowZeroBalance: Boolean;
        Customer__Balance_By_Posting_GroupCaptionLbl: Label 'Customer  Balance By Posting Group';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_Change__NAIRA_CaptionLbl: Label 'Net Change (NAIRA)';
        Net_Change__FCY_CaptionLbl: Label 'Net Change (FCY)';
}

