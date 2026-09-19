report 50162 "Service Rate Detail/Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ServiceRateDetailSummary.rdl';

    dataset
    {
        dataitem(DataItem1570; "Sales Invoice Line")
        {
            DataItemTableView = SORTING("Sell-to Customer No.", "Document No.", "No.")
                                WHERE(Type = CONST(Item),
                                      "Posting Group" = CONST('N_PARTS'));
            RequestFilterFields = "Sell-to Customer No.", "Posting Date";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(ReportOptions; ReportOptions)
            {
            }
            column(Sales_Invoice_Line__Sell_to_Customer_No__; "Sell-to Customer No.")
            {
            }
            column(Sales_Invoice_Line__Document_No__; "Document No.")
            {
            }
            column(Sales_Invoice_Line__Shipment_Date_; "Shipment Date")
            {
            }
            column(Sales_Invoice_Line__No__; "No.")
            {
            }
            column(Sales_Invoice_Line_Quantity; Quantity)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sales_Invoice_Line__Fully_Invoiced_; "Fully Invoiced")
            {
            }
            column(LnSup; LnSup)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Lndem; Lndem)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sales_Invoice_Line__Quantity_Demanded_; "Quantity Demanded")
            {
            }
            column(TotalFor_________Sell_to_Customer_No___; TotalFor + '  ' + ("Sell-to Customer No."))
            {
            }
            column(Sales_Invoice_Line_Quantity_Control1000000019; Quantity)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FuInv; FuInv)
            {
            }
            column(LnSup_Control1000000047; LnSup)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Lndem_Control1000000048; Lndem)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sales_Invoice_Line__Quantity_Demanded__Control1000000025; "Quantity Demanded")
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Sales_Invoice_Line_Quantity_Control1000000010; Quantity)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FuInv_Control1000000016; FuInv)
            {
            }
            column(LnSup_Control1000000020; LnSup)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Lndem_Control1000000021; Lndem)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sales_Invoice_Line__Quantity_Demanded__Control1000000013; "Quantity Demanded")
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(SERVICE_RATE_BY_PART_NO__BASISCaption; SERVICE_RATE_BY_PART_NO__BASISCaptionLbl)
            {
            }
            column(ReportOptionsCaption; ReportOptionsCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__Document_No__Caption; FIELDCAPTION("Document No."))
            {
            }
            column(Sales_Invoice_Line__Shipment_Date_Caption; FIELDCAPTION("Shipment Date"))
            {
            }
            column(Sales_Invoice_Line__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Sales_Invoice_Line_QuantityCaption; Sales_Invoice_Line_QuantityCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__Fully_Invoiced_Caption; FIELDCAPTION("Fully Invoiced"))
            {
            }
            column(Line_DemandedCaption; Line_DemandedCaptionLbl)
            {
            }
            column(Line_SuppliedCaption; Line_SuppliedCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__Sell_to_Customer_No__Caption; FIELDCAPTION("Sell-to Customer No."))
            {
            }
            column(Sales_Invoice_Line_Line_No_; "Line No.")
            {
            }
            column(OrderType_SalesInvoiceLine; "Order Type")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Item.GET("No.");

                IF ReportOptions = 1 THEN
                    IF Item."Non Specification" = TRUE THEN
                        CurrReport.SKIP;

                IF ReportOptions = 2 THEN
                    IF Item."Non Specification" = FALSE THEN
                        CurrReport.SKIP;

                Lndem := 1;
                IF Quantity <> 0 THEN
                    LnSup := 1
                ELSE
                    LnSup := 0;
                IF "Fully Invoiced" THEN
                    FuInv := 1 ELSE
                    FuInv := 0;

                SalesInvHeader.SETRANGE("No.", "Document No.");
                IF SalesInvHeader.FINDFIRST THEN
                    OrderNo := SalesInvHeader."Order No.";

                PartEnquiry.SETRANGE("Document No.", OrderNo);
                IF PartEnquiry.FINDFIRST THEN
                    OrderType := PartEnquiry."Order Type";

                CASE OrderType OF
                    0:
                        OrderText := '';
                    1:
                        OrderText := 'Created Demand';
                    2:
                        OrderText := 'Stock Replenishment';
                    3:
                        OrderText := 'VOR';
                END;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Sell-to Customer No.");
                
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
        Item: Record 27;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for  ';
        Lndem: Decimal;
        LnSup: Decimal;
        FuInv: Decimal;
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
        ExportToExcel: Boolean;
        ReportOptions: Option All,"TNL-Specification","Non-Specification";
        PartEnquiry: Record 50095;
        SalesInvHeader: Record 112;
        OrderNo: Code[10];
        OrderType: Option;
        OrderText: Text[30];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SERVICE_RATE_BY_PART_NO__BASISCaptionLbl: Label 'SERVICE RATE BY PART NO. BASIS';
        ReportOptionsCaptionLbl: Label 'ReportOptions:';
        Sales_Invoice_Line_QuantityCaptionLbl: Label 'Qty. Supplied';
        Line_DemandedCaptionLbl: Label 'Line Demanded';
        Line_SuppliedCaptionLbl: Label 'Line Supplied';
}

