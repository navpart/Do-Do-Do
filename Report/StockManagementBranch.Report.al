report 50179 "Stock Management Branch"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockManagementBranch.rdl';

    dataset
    {
        dataitem(DataItem8129; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group")
                                WHERE("Inventory Posting Group" = CONST('N_PARTS'));
            RequestFilterFields = "No.", "Inventory Posting Group", "Location Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Net_Change_; "Net Change")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Item__Qty__on_Sales_Order_; "Qty. on Sales Order")
            {
            }
            column(LastSalesDate; LastSalesDate)
            {
            }
            column(MIP; MIP)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SOQ; SOQ)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Avsales; Avsales)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TQS; TQS)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Item__Unit_Cost_; "Unit Cost")
            {
            }
            column(SalFrq; SalFrq)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Item__Net_Change_Caption; Item__Net_Change_CaptionLbl)
            {
            }
            column(Item__Qty__on_Sales_Order_Caption; FIELDCAPTION("Qty. on Sales Order"))
            {
            }
            column(LastSalesDateCaption; LastSalesDateCaptionLbl)
            {
            }
            column(MIPCaption; MIPCaptionLbl)
            {
            }
            column(SOQCaption; SOQCaptionLbl)
            {
            }
            column(AvsalesCaption; AvsalesCaptionLbl)
            {
            }
            column(TQSCaption; TQSCaptionLbl)
            {
            }
            column(Item__Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
            {
            }
            column(SalFrqCaption; SalFrqCaptionLbl)
            {
            }
            column(Item__Inventory_Posting_Group_Caption; FIELDCAPTION("Inventory Posting Group"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                MIP := 0;
                SOQ := 0;
                TQS := 0;
                Itementry.RESET;
                //Itementry.SETCURRENTKEY("Item No.","Posting Date","Entry Type");
                Itementry.SETCURRENTKEY("Entry Type", "Item No.", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
                Itementry.SETRANGE(Itementry."Item No.", "No.");
                Itementry.SETRANGE(Itementry."Entry Type", Itementry."Entry Type"::Purchase);
                Itementry.SETRANGE(Itementry."Location Code", Loc);
                IF Itementry.FIND('+') THEN
                    LastPurchDate := Itementry."Posting Date"
                ELSE
                    LastPurchDate := 0D;
                Itementry.SETRANGE(Itementry."Item No.", "No.");
                Itementry.SETRANGE(Itementry."Entry Type", Itementry."Entry Type"::Sale);
                IF Itementry.FIND('+') THEN
                    LastSalesDate := Itementry."Posting Date"
                ELSE
                    LastSalesDate := 0D;
                Notra := 0;
                TQS := 0;
                Itementry.RESET;
                //Itementry.SETCURRENTKEY("Item No.","Location Code","Variant Code","Posting Date");
                Itementry.SETCURRENTKEY("Entry Type", "Item No.", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
                IF "Use Item Setup" THEN BEGIN
                    StockOutPeriod := "Phase-Out  Period";
                    StockOutTran := "Phase-Out Transaction";
                    StockInPeriod := "Phase-In  Period";
                    StockInTran := "Phase-In Transaction";
                    SlwPeriod := "Slow Moving Period";
                    ObsPeriod := "Obsolete Period";
                    MaxPeriod := "Maximum Period";
                    LeadTime := "Lead Time Period";
                    PeriodUnit := "Period Unit";
                    ReOrPeriod := "Lead Time Period" + "Order Cycle" + "Safety Stock of Lead Time";
                    SafetyTime := "Safety Stock of Lead Time";
                    "Reorder Period" := ReOrPeriod
                END
                ELSE BEGIN
                    IF Invgroup.GET(Loc) THEN BEGIN
                        StockOutPeriod := Invgroup."Phase out  Period";
                        StockOutTran := Invgroup."Phase out Transaction";
                        StockInPeriod := Invgroup."Phase in  Period";
                        StockInTran := Invgroup."Stock in Transaction";
                        SlwPeriod := Invgroup."Slow Moving Period";
                        ObsPeriod := Invgroup."Obsolete Period";
                        ReOrPeriod := Invgroup."Lead Time" + Invgroup."Order Cycle" + Invgroup."Safety Stock of Lead Time";
                        MaxPeriod := Invgroup."Maximum Stock Period";
                        LeadTime := Invgroup."Lead Time";
                        SafetyTime := Invgroup."Safety Stock of Lead Time";
                        PeriodUnit := Invgroup."Period Unit";
                    END;
                END;
                BEGIN
                    consdate := CALCDATE(('-90D'), repdate);
                    Itementry.SETRANGE(Itementry."Item No.", "No.");
                    Itementry.SETRANGE(Itementry."Posting Date", consdate, repdate);
                    Itementry.SETRANGE(Itementry."Entry Type", Itementry."Entry Type"::Sale);
                    IF Itementry.FIND('-') THEN BEGIN
                        Notra := Itementry.COUNT;
                        Itementry.CALCSUMS(Itementry."Invoiced Quantity");
                        TQS := Itementry."Invoiced Quantity";
                    END;
                    CalSOQ(DataItem8129);
                END;
                IF (SOQ <> 0) THEN BEGIN
                    purchReq.INIT;
                    purchReq."Location Code" := Loc;
                    purchReq.VALIDATE(purchReq."Item No.", "No.");
                    purchReq."Reorder Quantity" := SOQ;
                    purchReq."Ordered Qty" := SOQ;
                    purchReq."Transaction Date" := repdate;
                    purchReq."MIP(Sales)" := MIP;
                    IF NOT purchReq.INSERT THEN purchReq.MODIFY;
                END;

                //END;
                SalFrq := Notra;
                Itementry.SETRANGE(Itementry."Posting Date", consdate, repdate);
                Itementry.SETRANGE(Itementry."Entry Type", Itementry."Entry Type"::Sale);
                Itementry.SETRANGE(Itementry."Location Code", Loc);
                IF Itementry.FIND('-') THEN BEGIN
                    Itementry.CALCSUMS(Itementry."Invoiced Quantity");
                    TQS := -Itementry."Invoiced Quantity";
                END;
                IF "Perfomance Status" <> "Perfomance Status"::Obsolete THEN;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Inventory Posting Group");
                //Itementry.SETCURRENTKEY("Item No.","Location Code","Variant Code","Posting Date");
                Itementry.SETCURRENTKEY("Entry Type", "Item No.", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
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
        Invgroup: Record 14;
        consdate: Date;
        Itementry: Record 32;
        repdate: Date;
        Notra: Integer;
        Avsales: Decimal;
        bedate: Date;
        UpdateRec: Boolean;
        purchReq: Record 50028;
        "Per Item": Boolean;
        StockOutPeriod: DateFormula;
        StockOutTran: Integer;
        StockInPeriod: DateFormula;
        StockInTran: Integer;
        ObsPeriod: DateFormula;
        SlwPeriod: DateFormula;
        ReOrPeriod: Decimal;
        MaxPeriod: Decimal;
        LeadTime: Decimal;
        SafetyTime: Decimal;
        PeriodUnit: Option Day,Weeks,Month,Year;
        Considered: Boolean;
        LastSalesDate: Date;
        LastPurchDate: Date;
        Activeonly: Boolean;
        MIP: Decimal;
        SOQ: Decimal;
        TQS: Decimal;
        Loc: Code[20];
        "=== Excel related Var begin": Integer;
        PeriodLength: DateFormula;
        PeriodEnding: Date;
        PeriodStarting: Date;
        PeriodDays: Integer;
        StockCoverMonth: Decimal;
        ItemCostMgt: Codeunit 5804;
        CalculateStdCost: Codeunit 5812;
        AverageCostLCY: Decimal;
        AverageCostACY: Decimal;
        ItemRec: Record 27;
        OnOrder: Decimal;
        ExportToExcel: Boolean;
        "==============": Integer;
        EXc: Integer;
        EXr: Integer;
        gFontSize: Integer;
        /* XlApp: Automation ;
        XlWorkBook: Automation ;
        XlWorkSheet: Automation ;
        XlWorksheets: Automation ;
        XlRange: Automation ; */
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
        model: Record 50014;
        SalFrq: Integer;
        ConCount: Integer;
        CountOk: Boolean;
        edate: Date;
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item__Net_Change_CaptionLbl: Label 'On Hand';
        LastSalesDateCaptionLbl: Label 'Last Sales Date';
        MIPCaptionLbl: Label 'Max Inventory Position';
        SOQCaptionLbl: Label 'Suggested Order Qty';
        AvsalesCaptionLbl: Label 'Daily. Ave. Demand';
        TQSCaptionLbl: Label 'Q''ty Sold 90 days';
        SalFrqCaptionLbl: Label 'Sales Frequency';

    procedure CalSOQ(item: Record 27)
    begin
        TQS := 0;
        //Calculate Maximum Inventory
        bedate := CALCDATE(('-' + FORMAT(MaxPeriod) + COPYSTR(FORMAT(PeriodUnit), 1, 1)), repdate);
        item.SETFILTER(item."Date Filter", '%1..%2', bedate, repdate);
        item.SETFILTER(item."Location Filter", Loc);
        item.CALCFIELDS(item."Sales (Qty.)", item."Negative Adjmt. (Qty.)", item.Inventory, item."Qty. on Purch. Order", item."Qty. on Sales Order");
        TQS := item."Sales (Qty.)";
        IF MaxPeriod <> 0 THEN
            Avsales := ROUND(item."Sales (Qty.)" / MaxPeriod, 0.1);
        IF Avsales > 0 THEN BEGIN
            MIP := Avsales * ReOrPeriod;
            item."Reorder Point" := ReOrPeriod * Avsales;
            item."Safety Stock Quantity" := SafetyTime * Avsales;
            item.SETFILTER(item."Date Filter", '..%1', repdate);
            item.CALCFIELDS(item.Inventory, item."Net Change", item."Qty. on Purch. Order", item."Qty. on Sales Order");
            //SOQ := ((MaxPeriod * Avsales) - "Net Change" + "Qty. on Sales Order"); {SOQ is based on Maximum Period}
            SOQ := (MIP - item."Net Change" + item."Qty. on Sales Order");
            /*suspended for the purpose of considering Maximum Period*/
            IF Considered THEN
                SOQ := SOQ - item."Qty. on Purch. Order";
        END
        ELSE BEGIN
            MIP := 0;
            item."Reorder Point" := 0;
            SOQ := 0;
        END;

    end;
}

