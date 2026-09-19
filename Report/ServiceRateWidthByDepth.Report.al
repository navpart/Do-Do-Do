report 50042 "Service Rate Width By Depth"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ServiceRateWidthByDepth.rdl';

    dataset
    {
        dataitem(CustomerData; Customer)
        {
            DataItemTableView = SORTING("No.")
                                WHERE("Line Item Demanded" = FILTER(> 0));
            RequestFilterFields = "No.", "Date Filter";
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
            column(Customer_GETFILTERS; CustomerData.GETFILTERS)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Lineded; Lineded)
            {
                DecimalPlaces = 0 : 0;
            }
            column(linesold; linesold)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servw; servw)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servd; servd)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servFu; servFu)
            {
                DecimalPlaces = 0 : 0;
            }
            column(qtyded; qtyded)
            {
                DecimalPlaces = 0 : 0;
            }
            column(qtysold; qtysold)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servqty; servqty)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Lineded_Control1000000023; Lineded)
            {
                DecimalPlaces = 0 : 0;
            }
            column(linesold_Control1000000024; linesold)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servwt; servwt)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servdt; servdt)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servFu_Control1000000027; servFu)
            {
                DecimalPlaces = 0 : 0;
            }
            column(servqtyt; servqtyt)
            {
                DecimalPlaces = 0 : 0;
            }
            column(qtysold_Control1000000033; qtysold)
            {
                DecimalPlaces = 0 : 0;
            }
            column(qtyded_Control1000000034; qtyded)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SERVICE_RATE_WIDTH__BY_DEPTHCaption; SERVICE_RATE_WIDTH__BY_DEPTHCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(ReportOptionsCaption; ReportOptionsCaptionLbl)
            {
            }
            column(Customer__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Line_Item_DemandedCaption; Line_Item_DemandedCaptionLbl)
            {
            }
            column(linesoldCaption; linesoldCaptionLbl)
            {
            }
            column(servwCaption; servwCaptionLbl)
            {
            }
            column(servdCaption; servdCaptionLbl)
            {
            }
            column(servFuCaption; servFuCaptionLbl)
            {
            }
            column(qtydedCaption; qtydedCaptionLbl)
            {
            }
            column(qtysoldCaption; qtysoldCaptionLbl)
            {
            }
            column(servqtyCaption; servqtyCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Lineded := 0;
                linesold := 0;
                servqty := 0;
                servqtyt := 0;
                servw := 0;
                servd := 0;
                servFu := 0;

                //IF PeriodFilter <> '' THEN

                SalesInvLine.SETCURRENTKEY("Sell-to Customer No.", "Posting Date", Type);
                SalesInvLine.SETRANGE("Sell-to Customer No.", CustomerData."No.");
                SalesInvLine.SETFILTER("Posting Date", '%1..%2', CustomerData.GETRANGEMIN("Date Filter"), CustomerData.GETRANGEMAX("Date Filter"));
                SalesInvLine.SETRANGE(Type, SalesInvLine.Type::Item);
                IF SalesInvLine.FINDSET THEN
                    REPEAT
                        Item.GET(SalesInvLine."No.");
                        IF Item."Inventory Posting Group" = 'N_PARTS' THEN BEGIN
                            CASE ReportOptions OF
                                0:
                                    BEGIN
                                        Lineded := Lineded + 1;
                                        IF SalesInvLine.Quantity > 0 THEN
                                            linesold := linesold + 1;
                                        qtyded := qtyded + SalesInvLine."Quantity Demanded";
                                        IF SalesInvLine.Quantity > 0 THEN
                                            qtysold := qtysold + SalesInvLine.Quantity;
                                    END;
                                1:
                                    BEGIN
                                        IF Item."Non Specification" = FALSE THEN BEGIN
                                            Lineded := Lineded + 1;
                                            IF SalesInvLine.Quantity > 0 THEN
                                                linesold := linesold + 1;
                                            qtyded := qtyded + SalesInvLine."Quantity Demanded";
                                            IF SalesInvLine.Quantity > 0 THEN
                                                qtysold := qtysold + SalesInvLine.Quantity;
                                        END;
                                    END;
                                2:
                                    BEGIN
                                        IF Item."Non Specification" = TRUE THEN BEGIN
                                            Lineded := Lineded + 1;
                                            IF SalesInvLine.Quantity > 0 THEN
                                                linesold := linesold + 1;
                                            qtyded := qtyded + SalesInvLine."Quantity Demanded";
                                            IF SalesInvLine.Quantity > 0 THEN
                                                qtysold := qtysold + SalesInvLine.Quantity;
                                        END;
                                    END;
                            END;
                        END;
                    UNTIL SalesInvLine.NEXT = 0;

                servqty := xQtyServiceRate;
                servw := xServiceRate;
                servd := xServiceRateDepth;
                servFu := "xFully Supplied";
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(qtyded, qtysold, servw, servd, servFu, Lineded, linesold, servqty);
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

    trigger OnPreReport()
    begin
        PeriodFilter := CustomerData.GETFILTER("Date Filter");
    end;

    var
        SalesInvHeader: Record 112;
        SalesInvLine: Record 113;
        Item: Record 27;
        ReportOptions: Option All,"TNL-Specification","Non-Specification";
        qtyded: Decimal;
        qtysold: Decimal;
        Lineded: Decimal;
        linesold: Decimal;
        servqty: Decimal;
        servqtyt: Decimal;
        servw: Decimal;
        servd: Decimal;
        servFu: Decimal;
        servwt: Decimal;
        servdt: Decimal;
        ExportToExcel: Boolean;
        "==============": Integer;
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
        ItemLedgerEntry: Record 32;
        "----------------------": Integer;
        TxtC: array[2] of Code[10];
        K: Integer;
        PeriodFilter: Text[30];
        SERVICE_RATE_WIDTH__BY_DEPTHCaptionLbl: Label 'SERVICE RATE WIDTH  BY DEPTH';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        ReportOptionsCaptionLbl: Label 'ReportOptions:';
        Line_Item_DemandedCaptionLbl: Label 'Line Item Demanded';
        linesoldCaptionLbl: Label 'Line Item Sold';
        servwCaptionLbl: Label 'Service Rates by Width%';
        servdCaptionLbl: Label 'Service Rate By Depth %';
        servFuCaptionLbl: Label 'Line Fully Supplied';
        qtydedCaptionLbl: Label 'Line Item Qty Demanded';
        qtysoldCaptionLbl: Label 'Line Item Qty Sold';
        servqtyCaptionLbl: Label 'Qty. Service Rate  %';

    
    procedure xServiceRate() "Service Rate": Decimal
    begin
        //CALCFIELDS("Line Item Demanded","Line Item Supplied");
        IF (Lineded <> 0) AND (linesold <> 0) THEN
            EXIT(ROUND((linesold / Lineded) * 100, 1))
        ELSE
            EXIT(0);
    end;

    
    procedure xQtyServiceRate() "Service Rate": Decimal
    begin
        //CALCFIELDS("Line Item Qty. Demanded","Line Item Qty. Supplied");
        IF (Lineded <> 0) AND (linesold <> 0) THEN
            IF (qtysold <> 0) AND (qtyded <> 0) THEN
                EXIT(ROUND((qtysold / qtyded) * 100, 1))
            ELSE
                EXIT(0);
    end;

    
    procedure "xFully Supplied"(): Decimal
    var
        ItemRec: Record 27;
        salesinv: Record 113;
        recCount: Integer;
    begin
        /*salesinv.SETCURRENTKEY("Sell-to Customer No.","Posting Date");
        salesinv.SETRANGE(salesinv."Sell-to Customer No.",Customer."No.");
        salesinv.SETFILTER(salesinv."Posting Date",PeriodFilter);
        salesinv.CALCFIELDS(salesinv."Fully Invoiced");
        salesinv.SETRANGE(salesinv."Fully Invoiced",TRUE);
        EXIT(salesinv.COUNT);*/

        recCount := 0;
        salesinv.SETCURRENTKEY("Sell-to Customer No.", "Posting Date");
        salesinv.SETRANGE(salesinv."Sell-to Customer No.", CustomerData."No.");
        salesinv.SETFILTER(salesinv."Posting Date", PeriodFilter);
        salesinv.SETRANGE(Type, salesinv.Type::Item);
        IF salesinv.FINDSET THEN
            REPEAT
                ItemRec.GET(salesinv."No.");
                IF ItemRec."Inventory Posting Group" = 'N_PARTS' THEN
                    IF ((salesinv."Quantity Demanded" <> 0) AND (salesinv."Quantity Demanded" = salesinv.Quantity)) THEN
                        recCount := recCount + 1;
            UNTIL salesinv.NEXT = 0;
        EXIT(recCount);

    end;

    
    procedure xServiceRateDepth(): Decimal
    begin
        //CALCFIELDS("Line Item Demanded","Line Item Supplied");
        IF linesold <> 0 THEN
            EXIT(ROUND("xFully Supplied" / linesold * 100, 1))
        ELSE
            EXIT(0);
    end;
}

