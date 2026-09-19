report 50340 "Customer Credit Limit analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerCreditLimitanalysis.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Credit Limit (LCY)";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Credit_Limit__LCY__; "Credit Limit (LCY)")
            {
            }
            column(Customer__Balance__LCY__; "Balance (LCY)")
            {
            }
            column(Customer__Dealership_Credit_Limit_; "Dealership Credit Limit")
            {
            }
            column(Credit_Limit__LCY______Balance__LCY__; "Credit Limit (LCY)" - "Balance (LCY)")
            {
            }
            column(Customer__Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(Customer__Credit_Limit__LCY___Control1000000000; "Credit Limit (LCY)")
            {
            }
            column(Customer__Balance__LCY___Control1000000010; "Balance (LCY)")
            {
            }
            column(Credit_Limit__LCY______Balance__LCY___Control1000000013; "Credit Limit (LCY)" - "Balance (LCY)")
            {
            }
            column(Customer_Credit_Limit_AnalysisCaption; Customer_Credit_Limit_AnalysisCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Customer__No__Caption; Customer__No__CaptionLbl)
            {
            }
            column(Customer_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Customer__Credit_Limit__LCY__Caption; FIELDCAPTION("Credit Limit (LCY)"))
            {
            }
            column(Customer__Balance__LCY__Caption; FIELDCAPTION("Balance (LCY)"))
            {
            }
            column(Customer__Dealership_Credit_Limit_Caption; FIELDCAPTION("Dealership Credit Limit"))
            {
            }
            column(Credit_Limit__LCY______Balance__LCY__Caption; Credit_Limit__LCY______Balance__LCY__CaptionLbl)
            {
            }
            column(Customer__Global_Dimension_2_Code_Caption; FIELDCAPTION("Global Dimension 2 Code"))
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF Customer."Credit Limit (LCY)" <= 0 THEN
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("No.");
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
        Customer_Credit_Limit_AnalysisCaptionLbl: Label 'Customer Credit Limit Analysis';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Customer__No__CaptionLbl: Label 'Customer No.';
        Credit_Limit__LCY______Balance__LCY__CaptionLbl: Label 'Available Credit';
        Grand_TotalCaptionLbl: Label 'Grand Total';
}

