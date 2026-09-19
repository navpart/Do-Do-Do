namespace AL_TNL.AL_TNL;

report 50027 "Lost Sales"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LostSales.rdl';
    Caption = 'Lost Sales Report';
    UsageCategory = Lists;
    ApplicationArea = All;

    dataset
    {
        dataitem(DataItem8437; "Search Tracker Line")
        {
            DataItemTableView = SORTING("Document No.");
            RequestFilterFields = "Request by", "Part No", "Request Date", "Lost Quantity", "Location Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Parts_Enquiry__Part_No_; "Part No")
            {
            }

            column(Parts_Enquiry__Part_Description_; "Part Description")
            {
            }
            column(Parts_Enquiry__Stock_Type_; "Stock Type")
            {
            }
            column(Parts_Enquiry__Model_No__; "Model No.")
            {
            }
            column(Parts_Enquiry__Model_Name_; "Model Name")
            {
            }
            column(Parts_Enquiry__Location_Code_; "Location Code")
            {
            }
            column(Parts_Enquiry__Quantity_Demanded_; "Quantity Demanded")
            {
            }
            column(Parts_Enquiry__Quantity_Supplied_; "Quantity Supplied")
            {
            }
            column(Parts_Enquiry__Lost_Quantity_; "Lost Quantity")
            {
            }
            column(Parts_Enquiry__Request_Date_; "Request Date")
            {
            }

            column(Parts_Enquiry__Request_by_; "Request by")
            {
            }
            column(Item__Unit_Price_; Item."Unit Price")
            {
            }
            column(LossValue; LossValue)
            {
            }
            column(Parts_Enquiry__Non_Specification_; "Non Specification")
            {
            }
            column(Parts_Enquiry__Part_No__Control1000000040; "Part No")
            {
            }
            column(Parts_Enquiry__Quantity_Demanded__Control1000000041; "Quantity Demanded")
            {
            }
            column(Parts_Enquiry__Quantity_Supplied__Control1000000042; "Quantity Supplied")
            {
            }
            column(Parts_Enquiry__Lost_Quantity__Control1000000043; "Lost Quantity")
            {
            }

            column(Parts_Enquiry__Model_Name__Control1000000019; "Model Name")
            {
            }
            column(Parts_Enquiry__Model_No___Control1000000022; "Model No.")
            {
            }
            column(Parts_Enquiry__Part_Description__Control1000000025; "Part Description")
            {
            }
            column(Item__Unit_Price__Control1000000034; Item."Unit Price")
            {
            }
            column(LossValue_Control1000000055; LossValue)
            {
            }
            column(SNO; SNO)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SNH; SNH)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SO; SO)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SNQ; SNQ)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SN; SN)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LossValue_Control1000000056; LossValue)
            {
            }
            column(Parts_EnquiryCaption; Parts_EnquiryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Parts_Enquiry__Part_No__Control1000000011Caption; FIELDCAPTION("Part No"))
            {
            }
            column(Parts_Enquiry__Part_Description_Caption; FIELDCAPTION("Part Description"))
            {
            }
            column(Parts_Enquiry__Stock_Type_Caption; FIELDCAPTION("Stock Type"))
            {
            }
            column(Parts_Enquiry__Model_No__Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Parts_Enquiry__Model_Name_Caption; FIELDCAPTION("Model Name"))
            {
            }
            column(Parts_Enquiry__Location_Code_Caption; FIELDCAPTION("Location Code"))
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

            column(Unit_PriceCaption; Unit_PriceCaptionLbl)
            {
            }
            column(LossValueCaption; LossValueCaptionLbl)
            {
            }
            column(Parts_Enquiry__Non_Specification_Caption; FIELDCAPTION("Non Specification"))
            {
            }
            column(Parts_Enquiry__Part_No_Caption; FIELDCAPTION("Part No"))
            {
            }
            column(SNOCaption; SNOCaptionLbl)
            {
            }
            column(SNHCaption; SNHCaptionLbl)
            {
            }
            column(SOCaption; SOCaptionLbl)
            {
            }
            column(SNQCaption; SNQCaptionLbl)
            {
            }
            column(SNCaption; SNCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Parts_Enquiry_Search_Code; "Document No.")
            {
            }


            trigger OnAfterGetRecord()
            begin
                IF NOT showsum THEN;
                SN := 1;

                IF Item.GET("Part No") THEN BEGIN
                    Item.CALCFIELDS(Item."Qty. on Purch. Order", Item.Inventory);

                    IF Item.Inventory > 0 THEN
                        SNQ := 1
                    ELSE
                        SNQ := 0;
                    IF (Item.Inventory = 0) AND (Item."Qty. on Purch. Order" = 0) THEN
                        SNH := 1
                    ELSE
                        SNH := 0;
                    IF (Item.Inventory = 0) AND (Item."Qty. on Purch. Order" > 0) THEN
                        SNO := 1
                    ELSE
                        SNO := 0;

                    IF Item."Qty. on Purch. Order" > 0 THEN
                        SO := 1
                    ELSE
                        SO := 0;
                END;



                LossValue := "Lost Quantity" * Item."Unit Price";
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Part No");
                //CurrReport.CREATETOTALS(SN, SNQ, SO, SNH, SNO, LossValue);



            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Show Summary"; showsum)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Item: Record 27;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        ExportToExcel: Boolean;
        EXc: Integer;
        EXr: Integer;
        gFontSize: Integer;

        Bold: Boolean;
        Italic: Boolean;
        Underline: Boolean;
        Region: Code[10];
        Period: Date;
        c: Integer;
        i: Integer;
        j: Integer;
        nr: Integer;
        showsum: Boolean;
        SN: Decimal;
        SNQ: Decimal;
        SO: Decimal;
        SNH: Decimal;
        SNO: Decimal;
        LossValue: Decimal;
        Parts_EnquiryCaptionLbl: Label 'Parts Enquiry';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        LossValueCaptionLbl: Label 'Loss Value';
        SNOCaptionLbl: Label 'Total Loss Sales with Nil Stock On Hand But Qty On Order';
        SNHCaptionLbl: Label 'Total Loss Sales With Nil Stock On hand and On Order';
        SOCaptionLbl: Label 'Total Loss Sales With Stock On Order';
        SNQCaptionLbl: Label 'Total Loss Sales With Stock On Hand';
        SNCaptionLbl: Label 'Total Loss Sales Item Count';
        Grand_TotalCaptionLbl: Label 'Grand Total';
        SearchTrackerHeader: Record "Search Tracker Header";
        RequestDate: Date;
        Requestby: Code[100];

}
