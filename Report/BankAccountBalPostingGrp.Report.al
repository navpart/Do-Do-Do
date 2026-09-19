report 50013 "Bank Account Bal/ Posting Grp"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BankAccountBalPostingGrp.rdl';

    dataset
    {
        dataitem(DataItem4558; "Bank Account")
        {
            CalcFields = Balance, "Balance at Date", "Balance (LCY)", "Balance at Date (LCY)", "Net Change", "Net Change (LCY)";
            DataItemTableView = SORTING("Bank Acc. Posting Group");
            RequestFilterFields = "Bank Acc. Posting Group", "No.", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Filters_______GETFILTERS__; 'Filters : ' + GETFILTERS())
            {
            }
            column(Bank_Account__Bank_Acc__Posting_Group_; "Bank Acc. Posting Group")
            {
            }
            column(Bank_Account__No__; "No.")
            {
            }
            column(Bank_Account_Name; Name)
            {
            }
            column(Bank_Account__Currency_Code_; "Currency Code")
            {
            }
            column(Bank_Account__Bank_Account_No__; "Bank Account No.")
            {
            }
            column(Bank_Account__Net_Change__LCY__; "Net Change (LCY)")
            {
            }
            column(Bank_Account__Balance__LCY__; "Balance (LCY)")
            {
            }
            column(Bank_Account__Net_Change_; "Net Change")
            {
            }
            column(Bank_Account_Balance; Balance)
            {
            }
            column(TotalFor___________Bank_Acc__Posting_Group_; TotalFor + '   ' + "Bank Acc. Posting Group")
            {
            }
            column(Bank_Account__Balance__LCY___Control1000000029; "Balance (LCY)")
            {
            }
            column(Bank_Account__Net_Change__LCY___Control1000000030; "Net Change (LCY)")
            {
            }
            column(Bank_Account_Balance_Control1000000034; Balance)
            {
            }
            column(Bank_Account__Net_Change__Control1000000035; "Net Change")
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Bank_Account__Balance__LCY___Control1000000036; "Balance (LCY)")
            {
            }
            column(Bank_Account__Net_Change__LCY___Control1000000037; "Net Change (LCY)")
            {
            }
            column(Bank_Account_Balance_Control1000000040; Balance)
            {
            }
            column(Bank_Account__Net_Change__Control1000000041; "Net Change")
            {
            }
            column(Bank_AccountCaption; Bank_AccountCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Bank_Account__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Bank_Account_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Bank_Account__Currency_Code_Caption; FIELDCAPTION("Currency Code"))
            {
            }
            column(Bank_Account__Bank_Account_No__Caption; FIELDCAPTION("Bank Account No."))
            {
            }
            column(Net_Change__LCY_Caption; Net_Change__LCY_CaptionLbl)
            {
            }
            column(Bank_Account__Balance__LCY__Caption; FIELDCAPTION("Balance (LCY)"))
            {
            }
            column(Net_Change_FCYCaption; Net_Change_FCYCaptionLbl)
            {
            }
            column(Balance_FCYCaption; Balance_FCYCaptionLbl)
            {
            }
            column(Foreign_CurrencyCaption; Foreign_CurrencyCaptionLbl)
            {
            }
            column(Local_CurrencyCaption; Local_CurrencyCaptionLbl)
            {
            }
            column(Bank_Account__Bank_Acc__Posting_Group_Caption; FIELDCAPTION("Bank Acc. Posting Group"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Bank Acc. Posting Group");
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
        Bank_AccountCaptionLbl: Label 'Bank Account';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_Change__LCY_CaptionLbl: Label 'Net Change (LCY)';
        Net_Change_FCYCaptionLbl: Label 'Net Change FCY';
        Balance_FCYCaptionLbl: Label 'Balance FCY';
        Foreign_CurrencyCaptionLbl: Label 'Foreign Currency';
        Local_CurrencyCaptionLbl: Label 'Local Currency';
}

