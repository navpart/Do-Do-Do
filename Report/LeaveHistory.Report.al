report 50096 "Leave History"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LeaveHistory.rdl';

    dataset
    {
        dataitem(DataItem8187; "Leave Plan Lines Rev 2")
        {
            DataItemTableView = SORTING("Employee No.", "Leave Period", "Entry Type");
            RequestFilterFields = "Employee No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Leave_Plan_Lines_Rev_2__Employee_No__; "Employee No.")
            {
            }
            column(Leave_Plan_Lines_Rev_2__Leave_Period_; "Leave Period")
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_Start_Date_; "Actual Start Date")
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_End_Date_; "Actual End Date")
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_Duration_; "Actual Duration")
            {
            }
            column(Leave_HistoryCaption; Leave_HistoryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Leave_Plan_Lines_Rev_2__Employee_No__Caption; FIELDCAPTION("Employee No."))
            {
            }
            column(Leave_Plan_Lines_Rev_2__Leave_Period_Caption; FIELDCAPTION("Leave Period"))
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_Start_Date_Caption; FIELDCAPTION("Actual Start Date"))
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_End_Date_Caption; FIELDCAPTION("Actual End Date"))
            {
            }
            column(Leave_Plan_Lines_Rev_2__Actual_Duration_Caption; FIELDCAPTION("Actual Duration"))
            {
            }
            column(Leave_Plan_Lines_Rev_2_Serial_No; "Serial No")
            {
            }
            column(Leave_Plan_Lines_Rev_2_Entry_Type; "Entry Type")
            {
            }

            trigger OnPreDataItem()
            begin
                SETRANGE("Entry Type", "Entry Type"::ACTUAL);
                SETFILTER("Actual Start Date", '<=%1', actend);
                SETFILTER("Actual End Date", '>=%1&<=%2', actstart, actend);
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
        actstart: Date;
        actend: Date;
        Leave_HistoryCaptionLbl: Label 'Leave History';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

