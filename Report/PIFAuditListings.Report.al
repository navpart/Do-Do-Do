report 50155 "PIF -Audit Listings"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./PIFAuditListings.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem("Monthly Variables Header."; "Monthly Variables Header.")
        {
            PrintOnlyIfDetail = true;
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Monthly_Variables_Header___Payroll_Period_; "Payroll Period")
            {
            }
            column(Monthly_Variables_Header___Employee_No_; "Employee No")
            {
            }
            column(Monthly_Variables_Header___Employee_Name_; "Employee Name")
            {
            }
            column(Monthly_Variables___Audit_ListingCaption; Monthly_Variables___Audit_ListingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Monthly_Variables_Lines___E_D_Code_Caption; "Monthly Variables Lines.".FIELDCAPTION("E/D Code"))
            {
            }
            column(Monthly_Variables_Lines__UnitsCaption; "Monthly Variables Lines.".FIELDCAPTION(Units))
            {
            }
            column(Monthly_Variables_Lines__QuantityCaption; "Monthly Variables Lines.".FIELDCAPTION(Quantity))
            {
            }
            column(Monthly_Variables_Lines__AmountCaption; "Monthly Variables Lines.".FIELDCAPTION(Amount))
            {
            }
            column(PeriodCaption; PeriodCaptionLbl)
            {
            }
            dataitem("Monthly Variables Lines."; "Monthly Variables Lines.")
            {
                DataItemLink = "Payroll Period" = FIELD("Payroll Period"),
                               "Employee No" = FIELD("Employee No");
                DataItemTableView = SORTING("Employee No", "Payroll Period");
                RequestFilterFields = "Employee No";
                column(Monthly_Variables_Lines___E_D_Code_; "E/D Code")
                {
                }
                column(Monthly_Variables_Lines__Units; Units)
                {
                }
                column(Monthly_Variables_Lines__Quantity; Quantity)
                {
                }
                column(Monthly_Variables_Lines__Amount; Amount)
                {
                }
                column(Monthly_Variables_Lines__Payroll_Period; "Payroll Period")
                {
                }
                column(Monthly_Variables_Lines__Employee_No; "Employee No")
                {
                }

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FIELDNO("Employee No");
                end;
            }
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
        Monthly_Variables___Audit_ListingCaptionLbl: Label 'Monthly Variables - Audit Listing';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        PeriodCaptionLbl: Label 'Period';
}

