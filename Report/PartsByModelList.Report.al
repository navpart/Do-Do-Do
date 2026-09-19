report 50161 "Parts By Model List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartsByModelList.rdl';

    dataset
    {
        dataitem(DataItem2026; Model)
        {
            DataItemTableView = SORTING("Model No.");
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
            column(Model__Model_No__; "Model No.")
            {
            }
            column(Model__Model_Name_; "Model Name")
            {
            }
            // column(unitinoperation; unitinoperation)
            // {
            // }
            column(Model__Line_Items_; "Line Items")
            {
            }
            column(Model__Line_Items_with_Stock_Q_ty_; "Line Items with Stock Q'ty")
            {
            }
            column(ModelCaption; ModelCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Model__Model_No__Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Model__Model_Name_Caption; FIELDCAPTION("Model Name"))
            {
            }
            column(unitinoperationCaption; unitinoperationCaptionLbl)
            {
            }
            column(Model__Line_Items_Caption; FIELDCAPTION("Line Items"))
            {
            }
            column(Model__Line_Items_with_Stock_Q_ty_Caption; FIELDCAPTION("Line Items with Stock Q'ty"))
            {
            }
            dataitem(DataItem4229; "Parts By Model")
            {
                DataItemLink = "Model Code" = FIELD("Model No.");
                //The property 'DataItemTableView' shouldn't have an empty value.
                //DataItemTableView = '';
                RequestFilterFields = "Part Category", "Base Date";
                column(FORMAT_TODAY_0_4__Control1000000046; FORMAT(TODAY, 0, 4))
                {
                }

                column(USERID_Control1000000049; USERID)
                {
                }
                column(Parts_By_Model__Part_No__; "Part No.")
                {
                }
                column(Parts_By_Model__Part_Description_; "Part Description")
                {
                }
                column(Parts_By_Model__Q_ty_On_Hand_; "Q'ty On Hand")
                {
                }
                column(Parts_By_Model__Q_ty_On_Purchase_Order_; "Q'ty On Purchase Order")
                {
                }
                column(Parts_By_Model__Lost_Sales_Q_ty_; "Lost Sales Q'ty")
                {
                }
                column(Parts_By_Model__Part_Category_; "Part Category")
                {
                }
                column(Inv; Inv)
                {

                }
                column(Avesale; Avesale)
                {

                }
                column(Parts_By_Model__Part_No__Caption; FIELDCAPTION("Part No."))
                {
                }
                column(Parts_By_Model__Part_Description_Caption; FIELDCAPTION("Part Description"))
                {
                }
                column(Parts_By_Model__Q_ty_On_Hand_Caption; FIELDCAPTION("Q'ty On Hand"))
                {
                }
                column(Q_ty_On_OrderCaption; Q_ty_On_OrderCaptionLbl)
                {
                }
                column(Parts_By_Model__Lost_Sales_Q_ty_Caption; FIELDCAPTION("Lost Sales Q'ty"))
                {
                }
                column(Parts_By_Model__Part_Category_Caption; FIELDCAPTION("Part Category"))
                {
                }
                column(Total_Sales_12_MthsCaption; Total_Sales_12_MthsCaptionLbl)
                {
                }
                column(AvesaleCaption; AvesaleCaptionLbl)
                {
                }
                column(Parts_By_Model__Part_No__Caption_Control1000000038; FIELDCAPTION("Part No."))
                {
                }
                column(Parts_By_Model__Part_Description_Caption_Control1000000039; FIELDCAPTION("Part Description"))
                {
                }
                column(Parts_By_Model__Q_ty_On_Hand_Caption_Control1000000040; FIELDCAPTION("Q'ty On Hand"))
                {
                }
                column(Q_ty_On_OrderCaption_Control1000000041; Q_ty_On_OrderCaption_Control1000000041Lbl)
                {
                }
                column(Parts_By_Model__Lost_Sales_Q_ty_Caption_Control1000000042; FIELDCAPTION("Lost Sales Q'ty"))
                {
                }
                column(Parts_By_Model__Part_Category_Caption_Control1000000043; FIELDCAPTION("Part Category"))
                {
                }
                column(Total_Sales_12_MthsCaption_Control1000000044; Total_Sales_12_MthsCaption_Control1000000044Lbl)
                {
                }
                column(MADCaption; MADCaptionLbl)
                {
                }
                column(CurrReport_PAGENO_Control1000000047Caption; CurrReport_PAGENO_Control1000000047CaptionLbl)
                {
                }
                column(Parts_By_Model_Model_Code; "Model Code")
                {
                }
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
        Basedate: Date;
        ModelCaptionLbl: Label 'Model';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        unitinoperationCaptionLbl: Label 'Units in Operation';
        Q_ty_On_OrderCaptionLbl: Label 'Q''ty On Order';
        Total_Sales_12_MthsCaptionLbl: Label 'Total Sales 12 Mths';
        AvesaleCaptionLbl: Label 'MAD';
        Q_ty_On_OrderCaption_Control1000000041Lbl: Label 'Q''ty On Order';
        Total_Sales_12_MthsCaption_Control1000000044Lbl: Label 'Total Sales 12 Mths';
        MADCaptionLbl: Label 'MAD';
        CurrReport_PAGENO_Control1000000047CaptionLbl: Label 'Page';
}

