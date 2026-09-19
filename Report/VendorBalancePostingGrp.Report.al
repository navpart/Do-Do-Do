report 50015 "Vendor Balance /Posting Grp"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/VendorBalancePostingGrp.rdl';

    dataset
    {
        dataitem(DataItem3182; Vendor)
        {
            CalcFields = "Balance Due by Posting Date", "Net Change", "Net Change (LCY)";
            DataItemTableView = SORTING("Vendor Posting Group");
            RequestFilterFields = "Vendor Posting Group", "No.", "Date Filter";
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
            column(Vendor_GETFILTERS; GETFILTERS)
            {
            }
            column(Vendor__Vendor_Posting_Group_; "Vendor Posting Group")
            {
            }
            column(PGrpName; PGrpName)
            {
            }
            column(Vendor__No__; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(Vendor__Balance_Due_by_Posting_Date_; "Balance Due by Posting Date")
            {
            }
            column(Vendor__Net_Change_; "Net Change")
            {
            }
            column(Vendor__No___Control1000000033; "No.")
            {
            }
            column(Vendor_Name_Control1000000034; Name)
            {
            }
            column(Vendor__Balance_Due_by_Posting_Date__Control1000000035; "Balance Due by Posting Date")
            {
            }
            column(Vendor__Net_Change__Control1000000037; "Net Change")
            {
            }
            column(TotalFor____________Vendor_Posting_Group_; TotalFor + '   ' + "Vendor Posting Group")
            {
            }
            column(Vendor__Balance_Due_by_Posting_Date__Control1000000039; "Balance Due by Posting Date")
            {
            }
            column(Vendor__Net_Change__Control1000000041; "Net Change")
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Vendor__Balance_Due_by_Posting_Date__Control1000000043; "Balance Due by Posting Date")
            {
            }
            column(Vendor_Balance_By_Posting_GroupCaption; Vendor_Balance_By_Posting_GroupCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Vendor__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Vendor_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Net_Change__NAIRA_Caption; Net_Change__NAIRA_CaptionLbl)
            {
            }
            column(Net_Change__FCY_Caption; Net_Change__FCY_CaptionLbl)
            {
            }
            column(Vendor__Vendor_Posting_Group_Caption; FIELDCAPTION("Vendor Posting Group"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Vendor Posting Group");
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
        Vendor_Balance_By_Posting_GroupCaptionLbl: Label 'Vendor Balance By Posting Group';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_Change__NAIRA_CaptionLbl: Label 'Net Change (NAIRA)';
        Net_Change__FCY_CaptionLbl: Label 'Net Change (FCY)';
}

