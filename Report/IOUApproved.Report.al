report 50349 "IOU Approved"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/IOUApproved.rdl';

    dataset
    {
        dataitem(DataItem9583; "IOU Register")
        {
            DataItemTableView = SORTING("IOU No.")
                                WHERE("Final Apprv. Status" = CONST(Approved),
                                      Treated = CONST(false));
            RequestFilterFields = "Entry Date", "Global Dimension 1 Code", "Global Dimension 2 Code";
            RequestFilterHeading = 'Approved IOU';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(IOU_Register__IOU_No__; "IOU No.")
            {
            }
            column(IOU_Register__Entry_Date_; "Entry Date")
            {
            }
            column(IOU_Register__Account_No__; "Account No.")
            {
            }
            column(IOU_Register__Account_Name_; "Account Name")
            {
            }
            column(IOU_Register_Description; Description)
            {
            }
            column(IOU_Register_Amount; Amount)
            {
            }
            column(IOU_Register__User_Id_; "User Id")
            {
            }
            column(IOU_Register__Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(IOU_Register__Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(IOU_Register__Final_Apprv__Status_; "Final Apprv. Status")
            {
            }
            column(IOU_Register_Amount_Control1000000000; Amount)
            {
            }
            column(Approved_IOUCaption; Approved_IOUCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Report_50349Caption; Report_50349CaptionLbl)
            {
            }
            column(IOU_Register__IOU_No__Caption; FIELDCAPTION("IOU No."))
            {
            }
            column(IOU_Register__Entry_Date_Caption; FIELDCAPTION("Entry Date"))
            {
            }
            column(IOU_Register__Account_No__Caption; FIELDCAPTION("Account No."))
            {
            }
            column(IOU_Register__Account_Name_Caption; FIELDCAPTION("Account Name"))
            {
            }
            column(IOU_Register_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(IOU_Register_AmountCaption; FIELDCAPTION(Amount))
            {
            }
            column(IOU_Register__User_Id_Caption; FIELDCAPTION("User Id"))
            {
            }
            column(IOU_Register__Global_Dimension_1_Code_Caption; FIELDCAPTION("Global Dimension 1 Code"))
            {
            }
            column(IOU_Register__Global_Dimension_2_Code_Caption; FIELDCAPTION("Global Dimension 2 Code"))
            {
            }
            column(IOU_Register__Final_Apprv__Status_Caption; FIELDCAPTION("Final Apprv. Status"))
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
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
        Approved_IOUCaptionLbl: Label 'Approved IOU';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Report_50349CaptionLbl: Label 'Report 50349';
        Total_AmountCaptionLbl: Label 'Total Amount';
}

