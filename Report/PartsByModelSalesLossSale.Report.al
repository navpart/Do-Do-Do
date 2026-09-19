report 50228 "Parts By Model Sales/Loss Sale"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartsByModelSalesLossSale.rdl';

    dataset
    {
        dataitem(DataItem8437; "Parts Enquiry")
        {
            DataItemTableView = SORTING("Model No.", "Part No")
                                WHERE("Part No" = FILTER(<> ''));
            RequestFilterFields = "Model No.", "Part No";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Parts_Enquiry__Model_No__; "Model No.")
            {
            }
            column(Parts_Enquiry__Part_No_; "Part No")
            {
            }
            column(Parts_Enquiry__Part_No__Control1000000014; "Part No")
            {
            }
            column(Parts_Enquiry__Part_Description_; "Part Description")
            {
            }
            column(Parts_Enquiry__Model_No___Control1000000020; "Model No.")
            {
            }
            column(Parts_Enquiry__Location_Code_; "Location Code")
            {
            }
            column(Parts_Enquiry__Frequency_of_Request_; "Frequency of Request")
            {
                
            }
            column(Parts_Enquiry__Quantity_Demanded_; "Quantity Demanded")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Quantity_Supplied_; "Quantity Supplied")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Lost_Quantity_; "Lost Quantity")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Quantity_On_Hand_; "Quantity On Hand")
            {
            }
            column(Parts_Enquiry__Quantity_On_Purchase_Order_; "Quantity On Purchase Order")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Part_No__Control1000000040; "Part No")
            {
            }
            column(Parts_Enquiry__Quantity_Demanded__Control1000000041; "Quantity Demanded")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Quantity_Supplied__Control1000000042; "Quantity Supplied")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Lost_Quantity__Control1000000043; "Lost Quantity")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Part_Description__Control1000000010; "Part Description")
            {
            }
            column(Parts_Enquiry__Frequency_of_Request__Control1000000007; "Frequency of Request")
            {
                
            }
            column(Parts_Enquiry__Quantity_On_Hand__Control1000000034; "Quantity On Hand")
            {
            }
            column(Parts_Enquiry__Quantity_On_Purchase_Order__Control1000000037; "Quantity On Purchase Order")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Model_No___Control1000000044; "Model No.")
            {
            }
            column(Parts_Enquiry__Quantity_Demanded__Control1000000045; "Quantity Demanded")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Quantity_Supplied__Control1000000046; "Quantity Supplied")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Lost_Quantity__Control1000000047; "Lost Quantity")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_Enquiry__Model_Name_; "Model Name")
            {
            }
            column(Parts_Enquiry__Frequency_of_Request__Control1000000013; "Frequency of Request")
            {
                
            }
            column(Parts_Enquiry__Quantity_On_Hand__Control1000000038; "Quantity On Hand")
            {
            }
            column(Parts_Enquiry__Quantity_On_Purchase_Order__Control1000000039; "Quantity On Purchase Order")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Parts_by_Models_Sales_Loss_SalesCaption; Parts_by_Models_Sales_Loss_SalesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Parts_Enquiry__Part_No__Control1000000014Caption; FIELDCAPTION("Part No"))
            {
            }
            column(Parts_Enquiry__Part_Description_Caption; FIELDCAPTION("Part Description"))
            {
            }
            column(Parts_Enquiry__Model_No___Control1000000020Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Parts_Enquiry__Location_Code_Caption; FIELDCAPTION("Location Code"))
            {
            }
            column(Parts_Enquiry__Frequency_of_Request_Caption; FIELDCAPTION("Frequency of Request"))
            {
            }
            column(Parts_Enquiry__Quantity_Demanded_Caption; FIELDCAPTION("Quantity Demanded"))
            {
            }
            column(Parts_Enquiry__Quantity_Supplied_Caption; FIELDCAPTION("Quantity Supplied"))
            {
            }
            column(Parts_Enquiry__Lost_Quantity_Caption; FIELDCAPTION("Lost Quantity"))
            {
            }
            column(Parts_Enquiry__Quantity_On_Hand_Caption; FIELDCAPTION("Quantity On Hand"))
            {
            }
            column(Parts_Enquiry__Quantity_On_Purchase_Order_Caption; FIELDCAPTION("Quantity On Purchase Order"))
            {
            }
            column(Parts_Enquiry__Model_No__Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Parts_Enquiry__Part_No_Caption; FIELDCAPTION("Part No"))
            {
            }
            column(Parts_Enquiry_Search_Code; "Search Code")
            {
            }
            column(Parts_Enquiry_Entry_No; "Entry No")
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Part No");
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
        Showdet: Boolean;
        Parts_by_Models_Sales_Loss_SalesCaptionLbl: Label 'Parts by Models Sales/Loss Sales';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

