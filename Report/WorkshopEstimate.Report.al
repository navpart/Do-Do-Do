report 50403 "Workshop Estimate"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/WorkshopEstimate.rdl';

    dataset
    {
        dataitem(DataItem7672; "Customer Order Table.")
        {
            DataItemTableView = SORTING("Customer Order Form No.");
            RequestFilterFields = "Customer Order Form No.";
            column(Customer_Order_Table___Customer_Name_; "Customer Name")
            {
            }
            column(Customer_Order_Table__Address; Address)
            {
            }
            column(Customer_Order_Table___Telephone_No__; "Telephone No.")
            {
            }
            column(Customer_Order_Table___Vehicle_Registration_No__; "Vehicle Registration No.")
            {
            }
            column(Customer_Order_Table___Frame_No__VIN_; "Frame No./VIN")
            {
            }
            column(Customer_Order_Table___Job_Details_; "Job Details")
            {
            }
            column(RegDate; RegDate)
            {
            }
            column(Customer_Order_Table___Model_Name_; "Model Name")
            {
            }
            column(Customer_Order_Table___Service_Advisor_s_Name_; "Service Advisor's Name")
            {
            }
            column(JobType; JobType)
            {
            }
            column(Customer_Order_Table___Odometer_Reading_At_Reception_; "Odometer Reading At Reception")
            {
            }
            column(Customer_Order_Table___Customer_Order_Form_No__; "Customer Order Form No.")
            {
            }
            column(ClaimNo; ClaimNo)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }

            column(USERID; USERID)
            {
            }
            column(Customer_Order_Table___Reception_Date_; "Reception Date")
            {
            }
            column(Customer_Order_Table___Reception_Time_; "Reception Time")
            {
            }
            column(GRP_M_; "GRP&M")
            {
            }
            column(GRTLabour; GRTLabour)
            {
            }
            column(GRTotal; GRTotal)
            {
            }
            column(BPP_M_; "BPP&M")
            {
            }
            column(BPLabour; BPLabour)
            {
            }
            column(BPTotal; BPTotal)
            {
            }
            column(GRSundry; GRSundry)
            {
            }
            column(BPSundry; BPSundry)
            {
            }
            column(VATEstimate; VATEstimate)
            {
            }
            column(TotalEstimate; TotalEstimate)
            {
            }
            column(TotalValue; TotalValue)
            {
            }
            column(Customer_Order_Table___Customer_Name_Caption; FIELDCAPTION("Customer Name"))
            {
            }
            column(Customer_Order_Table__AddressCaption; FIELDCAPTION(Address))
            {
            }
            column(Customer_Order_Table___Telephone_No__Caption; FIELDCAPTION("Telephone No."))
            {
            }
            column(CLAIM_NO_Caption; CLAIM_NO_CaptionLbl)
            {
            }
            column(Customer_Order_No_Caption; Customer_Order_No_CaptionLbl)
            {
            }
            column(Reception_Date_Time_Caption; Reception_Date_Time_CaptionLbl)
            {
            }
            column(Odometer_Reading_Caption; Odometer_Reading_CaptionLbl)
            {
            }
            column(Customer_Req__TypeCaption; Customer_Req__TypeCaptionLbl)
            {
            }
            column(Service_Advisor_Caption; Service_Advisor_CaptionLbl)
            {
            }
            column(Veh__Frame_VIN_Caption; Veh__Frame_VIN_CaptionLbl)
            {
            }
            column(Vehicle_Reg__No_Caption; Vehicle_Reg__No_CaptionLbl)
            {
            }
            column(Job_Detail_Caption; Job_Detail_CaptionLbl)
            {
            }
            column(Vehicle_Model_Name_Caption; Vehicle_Model_Name_CaptionLbl)
            {
            }
            column(Vehicle_Reg__Date_Caption; Vehicle_Reg__Date_CaptionLbl)
            {
            }
            column(Additional_Job_Caption; Additional_Job_CaptionLbl)
            {
            }
            column(S_NCaption; S_NCaptionLbl)
            {
            }
            column(Job_Part_DescriptionCaption; Job_Part_DescriptionCaptionLbl)
            {
            }
            column(Part_NoCaption; Part_NoCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Amount__N_Caption; Amount__N_CaptionLbl)
            {
            }
            column(ESTIMATECaption; ESTIMATECaptionLbl)
            {
            }
            column(TPAO_992__OJULARI_ROAD__LEKKI_PENINSULA_SCHEME__LAGOS_Caption; TPAO_992__OJULARI_ROAD__LEKKI_PENINSULA_SCHEME__LAGOS_CaptionLbl)
            {
            }
            column(TEL__01_4401311__01_2772250_EXT_118__1137__3411Caption; TEL__01_4401311__01_2772250_EXT_118__1137__3411CaptionLbl)
            {
            }
            column(KMCaption; KMCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(GR_TOTAL_PARTS___MATERIALSCaption; GR_TOTAL_PARTS___MATERIALSCaptionLbl)
            {
            }
            column(GR_TOTAL_LABOURCaption; GR_TOTAL_LABOURCaptionLbl)
            {
            }
            column(GR_SUM_TOTALCaption; GR_SUM_TOTALCaptionLbl)
            {
            }
            column(BP_TOTAL_PARTS___MATERIALSCaption; BP_TOTAL_PARTS___MATERIALSCaptionLbl)
            {
            }
            column(BP_TOTAL_LABOURCaption; BP_TOTAL_LABOURCaptionLbl)
            {
            }
            column(BP_SUM_TOTALCaption; BP_SUM_TOTALCaptionLbl)
            {
            }
            column(GR_SUNDRYCaption; GR_SUNDRYCaptionLbl)
            {
            }
            column(BP_SUNDRYCaption; BP_SUNDRYCaptionLbl)
            {
            }
            column(Terms_of_Delivery_Caption; Terms_of_Delivery_CaptionLbl)
            {
            }
            column(Payment_Method__CASH__CHEQUE__E_TRANSFER__POS_Caption; Payment_Method__CASH__CHEQUE__E_TRANSFER__POS_CaptionLbl)
            {
            }
            column(I_have_recceived_an_explanation_and_agreed_to_the_terms_above_and_accepted_these_terms_and_conditions_Caption; I_have_recceived_an_explanation_and_agreed_to_the_terms_above_and_accepted_these_terms_and_conditions_CaptionLbl)
            {
            }
            column(TOTAL_AMOUNTCaption; TOTAL_AMOUNTCaptionLbl)
            {
            }
            column(DISCOUNTCaption; DISCOUNTCaptionLbl)
            {
            }
            column(VATCaption; VATCaptionLbl)
            {
            }
            column(CUSTOMER_SIGNATURECaption; CUSTOMER_SIGNATURECaptionLbl)
            {
            }
            column(GRAND_TOTALCaption; GRAND_TOTALCaptionLbl)
            {
            }
            dataitem(CustomerOrderLineData; "Customer Order Line")
            {
                DataItemLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
                column(Customer_Order_Line__No__; "No.")
                {
                }
                column(Customer_Order_Line_Quantity; Quantity)
                {
                }
                column(Customer_Order_Line_Description; Description)
                {
                }
                column(Customer_Order_Line_Amount; Amount)
                {
                }
                column(Sn; Sn)
                {
                }
                column(Customer_Order_Line_Customer_Order_Form_No_; "Customer Order Form No.")
                {
                }
                column(Customer_Order_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Sn += 1;

                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::GR);
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::Item);
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        "GRP&M" := CustOrderLine.Amount;
                    END;

                    CustOrderLine.RESET;
                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::GR);
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::Labour);
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        GRTLabour := CustOrderLine.Amount;
                    END;

                    CustOrderLine.RESET;
                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::GR);
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::"Sundry Spares");
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        GRSundry := CustOrderLine.Amount;
                    END;

                    GRTotal := "GRP&M" + GRTLabour + GRSundry;

                    CustOrderLine.RESET;
                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::"B&P");
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::Item);
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        "BPP&M" := CustOrderLine.Amount;
                    END;

                    CustOrderLine.RESET;
                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::"B&P");
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::Labour);
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        BPLabour := CustOrderLine.Amount;
                    END;

                    CustOrderLine.RESET;
                    CustOrderLine.SETCURRENTKEY("Job Type", "Line Type", "Customer Order Form No.");
                    CustOrderLine.SETRANGE("Job Type", CustomerOrderLineData."Job Type"::"B&P");
                    CustOrderLine.SETRANGE("Line Type", CustomerOrderLineData."Line Type"::"Sundry Spares");
                    CustOrderLine.SETRANGE("Customer Order Form No.", CustomerOrderLineData."Customer Order Form No.");
                    IF CustOrderLine.FINDFIRST THEN BEGIN
                        CustOrderLine.CALCSUMS(Amount);
                        BPSundry := CustOrderLine.Amount;
                    END;

                    BPTotal := "BPP&M" + BPLabour + BPSundry;


                    TotalEstimate := (GRTotal + BPTotal);

                    IF COFRec.GET(CustomerOrderLineData."Customer Order Form No.") THEN
                        IF COFRec."No VAT" = TRUE THEN
                            VATEstimate := 0 ELSE
                            VATEstimate := TotalEstimate * 0.075;

                    TotalValue := GRTotal + BPTotal + VATEstimate;
                end;

                trigger OnPreDataItem()
                begin
                    Sn := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF VRIRec.GET("Vehicle Registration No.") THEN
                    ClaimNo := VRIRec."Claim No.";

                IF "B & P" = TRUE THEN
                    JobType := 'B&P';
                IF "General Repair" = TRUE THEN
                    JobType := 'GR';

                IF ServItem.GET("Vehicle Registration No.") THEN
                    RegDate := ServItem."Sales Date";
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
        Sn: Integer;
        "GRP&M": Decimal;
        GRTLabour: Decimal;
        GRSundry: Decimal;
        GRTotal: Decimal;
        "BPP&M": Decimal;
        BPLabour: Decimal;
        BPSundry: Decimal;
        BPTotal: Decimal;
        CustOrderLine: Record 50122;
        ClaimNo: Code[20];
        VRIRec: Record 50058;
        TotalEstimate: Decimal;
        VATEstimate: Decimal;
        TotalValue: Decimal;
        JobType: Text[10];
        RegDate: Date;
        ServItem: Record 5940;
        COFRec: Record 50119;
        CLAIM_NO_CaptionLbl: Label 'CLAIM NO:';
        Customer_Order_No_CaptionLbl: Label 'Customer Order No.';
        Reception_Date_Time_CaptionLbl: Label 'Reception Date/Time:';
        Odometer_Reading_CaptionLbl: Label 'Odometer Reading:';
        Customer_Req__TypeCaptionLbl: Label 'Customer Req. Type';
        Service_Advisor_CaptionLbl: Label 'Service Advisor:';
        Veh__Frame_VIN_CaptionLbl: Label 'Veh. Frame/VIN:';
        Vehicle_Reg__No_CaptionLbl: Label 'Vehicle Reg. No:';
        Job_Detail_CaptionLbl: Label 'Job Detail:';
        Vehicle_Model_Name_CaptionLbl: Label 'Vehicle Model Name:';
        Vehicle_Reg__Date_CaptionLbl: Label 'Vehicle Reg. Date:';
        Additional_Job_CaptionLbl: Label 'Additional Job:';
        S_NCaptionLbl: Label 'S/N';
        Job_Part_DescriptionCaptionLbl: Label 'Job/Part Description';
        Part_NoCaptionLbl: Label 'Part No';
        QuantityCaptionLbl: Label 'Quantity';
        Amount__N_CaptionLbl: Label 'Amount =N=';
        ESTIMATECaptionLbl: Label 'ESTIMATE';
        TPAO_992__OJULARI_ROAD__LEKKI_PENINSULA_SCHEME__LAGOS_CaptionLbl: Label 'TPAO 992, OJULARI ROAD, LEKKI PENINSULA SCHEME, LAGOS ';
        TEL__01_4401311__01_2772250_EXT_118__1137__3411CaptionLbl: Label 'TEL: 01-4401311, 01-2772250 EXT:118, 1137, 3411';
        KMCaptionLbl: Label 'KM';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        GR_TOTAL_PARTS___MATERIALSCaptionLbl: Label 'GR TOTAL PARTS / MATERIALS';
        GR_TOTAL_LABOURCaptionLbl: Label 'GR TOTAL LABOUR';
        GR_SUM_TOTALCaptionLbl: Label 'GR SUM TOTAL';
        BP_TOTAL_PARTS___MATERIALSCaptionLbl: Label 'BP TOTAL PARTS / MATERIALS';
        BP_TOTAL_LABOURCaptionLbl: Label 'BP TOTAL LABOUR';
        BP_SUM_TOTALCaptionLbl: Label 'BP SUM TOTAL';
        GR_SUNDRYCaptionLbl: Label 'GR SUNDRY';
        BP_SUNDRYCaptionLbl: Label 'BP SUNDRY';
        Terms_of_Delivery_CaptionLbl: Label 'Terms of Delivery:';
        Payment_Method__CASH__CHEQUE__E_TRANSFER__POS_CaptionLbl: Label 'Payment Method: CASH, CHEQUE, E-TRANSFER, POS.';
        I_have_recceived_an_explanation_and_agreed_to_the_terms_above_and_accepted_these_terms_and_conditions_CaptionLbl: Label 'I have recceived an explanation and agreed to the terms above and accepted these terms and conditions.';
        TOTAL_AMOUNTCaptionLbl: Label 'TOTAL AMOUNT';
        DISCOUNTCaptionLbl: Label 'DISCOUNT';
        VATCaptionLbl: Label 'VAT';
        CUSTOMER_SIGNATURECaptionLbl: Label 'CUSTOMER SIGNATURE';
        GRAND_TOTALCaptionLbl: Label 'GRAND TOTAL';
}

