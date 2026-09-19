report 50116 "TNL Stock Analysis Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLStockAnalysisReport.rdl';


    dataset
    {
        dataitem(ItemData; Item)
        {
            CalcFields = "Sales (Qty.)", Inventory, "Qty. on Purch. Order", "Last Purchase Date";
            DataItemTableView = SORTING("Inventory Posting Group")
                                WHERE("Inventory Posting Group" = filter('N_PARTS'));
            RequestFilterFields = "No.", "Shelf No.", "Variant Filter", "Location Filter", "Inventory Posting Group";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(GETFILTERS; GETFILTERS)
            {
            }
            column(V1; 1)
            {
            }
            column(V2; 2)
            {
            }
            column(Text050; Text050)
            {
            }
            column(V3; 3)
            {
            }
            column(V6; 6)
            {
            }
            column(V5; 5)
            {
            }
            column(V4; 4)
            {
            }
            column(V7; 7)
            {
            }
            column(V8; 8)
            {
            }
            column(V9; 9)
            {
            }
            column(V10; 10)
            {
            }
            column(V11; 11)
            {
            }
            column(V12; 12)
            {
            }
            column(Text051; Text051)
            {
            }
            column(V1_Control1000000036; 1)
            {
            }
            column(V2_Control1000000037; 2)
            {
            }
            column(V3_Control1000000041; 3)
            {
            }
            column(V4_Control1000000042; 4)
            {
            }
            column(V5_Control1000000043; 5)
            {
            }
            column(V6_Control1000000060; 6)
            {
            }
            column(V7_Control1000000061; 7)
            {
            }
            column(V8_Control1000000062; 8)
            {
            }
            column(V9_Control1000000063; 9)
            {
            }
            column(V10_Control1000000064; 10)
            {
            }
            column(V11_Control1000000065; 11)
            {
            }
            column(V12_Control1000000066; 12)
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Unit_Cost_; "Unit Cost")
            {
            }
            column(Item_Inventory; Inventory)
            {
            }
            column(OnOrder; OnOrder)
            {
            }
            column(Item__Last_Sales_Date_; "Last Sales Date")
            {

            }
            column(SalQty_1_; SalQty[1])
            {

            }
            column(SalQty_2_; SalQty[2])
            {

            }
            column(SalQty_3_; SalQty[3])
            {

            }
            column(SalQty_4_; SalQty[4])
            {

            }
            column(SalQty_5_; SalQty[5])
            {

            }
            column(SalQty_6_; SalQty[6])
            {

            }
            column(SalQty_7_; SalQty[7])
            {

            }
            column(SalQty_8_; SalQty[8])
            {

            }
            column(SalQty_9_; SalQty[9])
            {

            }
            column(SalQty_10_; SalQty[10])
            {

            }
            column(SalQty_11_; SalQty[11])
            {

            }
            column(SalQty_12_; SalQty[12])
            {

            }
            column(Item__Model_No__; "Model No.")
            {
            }
            column(Item__Last_Purchase_Date_; "Last Purchase Date")
            {
            }
            column(SalFrq_1_; SalFrq[1])
            {

            }
            column(SalFrq_2_; SalFrq[2])
            {

            }
            column(SalFrq_3_; SalFrq[3])
            {

            }
            column(SalFrq_4_; SalFrq[4])
            {

            }
            column(SalFrq_5_; SalFrq[5])
            {

            }
            column(SalFrq_6_; SalFrq[6])
            {

            }
            column(SalFrq_7_; SalFrq[7])
            {

            }
            column(SalFrq_8_; SalFrq[8])
            {

            }
            column(SalFrq_9_; SalFrq[9])
            {

            }
            column(SalFrq_10_; SalFrq[10])
            {

            }
            column(SalFrq_11_; SalFrq[11])
            {

            }
            column(SalFrq_12_; SalFrq[12])
            {

            }
            column(TNL_STOCK_ANALYSIS_REPORTCaption; TNL_STOCK_ANALYSIS_REPORTCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_NoCaption; Item_NoCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Unit_costCaption; Unit_costCaptionLbl)
            {
            }
            column(Qty__On_HandCaption; Qty__On_HandCaptionLbl)
            {
            }
            column(Qty__On_Purch__OrderCaption; Qty__On_Purch__OrderCaptionLbl)
            {
            }
            column(Last_Sales_DateCaption; Last_Sales_DateCaptionLbl)
            {
            }
            column(Item__Model_No__Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Item__Last_Purchase_Date_Caption; FIELDCAPTION("Last Purchase Date"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                ItemData.CALCFIELDS("Sales (Qty.)", "Qty. on Purch. Order", Inventory);

                ItemRec.GET("No.");
                ItemRec.CALCFIELDS(ItemRec."Qty. on Purch. Order");
                OnOrder := ItemRec."Qty. on Purch. Order";

                ItemCostMgt.CalculateAverageCost(ItemRec, AverageCostLCY, AverageCostACY);

                StockCoverMonth := (ItemData."Sales (Qty.)" / PeriodDays);
                IF (StockCoverMonth <> 0) THEN
                    StockCoverMonth := (ItemData.Inventory / StockCoverMonth) / 30
                ELSE
                    StockCoverMonth := 0;
                SalesAnalysis(ItemData);
            end;

            trigger OnPreDataItem()
            begin
                IF (FORMAT(PeriodLength) = '') THEN ERROR('Please Enter the Period Length');

                PeriodStarting := CALCDATE('-(' + FORMAT(PeriodLength) + ') +1D', PeriodEnding);
                PeriodDays := PeriodEnding - PeriodStarting + 1;

                ItemData.SETRANGE("Date Filter", PeriodStarting, PeriodEnding);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Period Covering"; PeriodLength)
                {
                    ApplicationArea = All;
                }
                field("Period Ending Date"; PeriodEnding)
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

    trigger OnInitReport()
    begin

    end;

    trigger OnPostReport()
    begin

    end;

    var
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
        EXc: Integer;
        EXr: Integer;
        gFontSize: Integer;
        Text000: Label 'Excel not found.';
        Text001: Label 'You must enter a file name.';
        Text002: Label 'You must enter an Excel worksheet name.';
        Text003: Label 'The file %1 does not exist.';
        Text004: Label 'The Excel worksheet %1 does not exist.';
        Text005: Label 'Creating Excel worksheet...\\';
        Text006: Label '%1%3%4%3Page %2';
        Text007: Label 'Reading Excel worksheet...\\';
        Text008: Label ': Filter ';
        Text009: Label ' can not be converted into an Excel formula.';
        Text010: Label ': Operator ';
        Text011: Label ' is not valid.';
        Text012: Label ': Filter containing more than 1 comparison operator can not be converted into an Excel formula.';
        Text013: Label '&B';
        Text014: Label '&D';
        Text015: Label '&P';
        Text016: Label 'A1';
        Text017: Label 'SUMIF';
        Text018: Label '#N/A';
        Text019: Label 'GLAcc';
        Text020: Label 'Period';
        Text021: Label 'Budget';
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
        TxtC: array[2] of Code[10];
        K: Integer;
        SalQty: array[15] of Decimal;
        Text050: Label 'Quantity Sold This Month Ago';
        SalFrq: array[15] of Integer;
        model: Record 50014;
        itl: Record 32;
        Text051: Label 'Sales Frequency This Month Ago';
        TNL_STOCK_ANALYSIS_REPORTCaptionLbl: Label 'TNL STOCK ANALYSIS REPORT';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item_NoCaptionLbl: Label 'Item No';
        DescriptionCaptionLbl: Label 'Description';
        Unit_costCaptionLbl: Label 'Unit cost';
        Qty__On_HandCaptionLbl: Label 'Qty. On Hand';
        Qty__On_Purch__OrderCaptionLbl: Label 'Qty. On Purch. Order';
        Last_Sales_DateCaptionLbl: Label 'Last Sales Date';

    procedure SalesAnalysis(var It: Record 27)
    begin
        K := 1;
        itl.SETCURRENTKEY("Item No.", "Posting Date", "Entry Type");
        REPEAT
            //Date Formula

            TxtC[1] := '-' + FORMAT(K) + 'M+1D';
            TxtC[2] := '-' + FORMAT(K - 1) + 'M';

            //Sales last 12 Months

            It.SETRANGE(It."Date Filter", CALCDATE(TxtC[1], PeriodEnding), CALCDATE(TxtC[2], PeriodEnding));
            It.CALCFIELDS(It."Sales (Qty.)");
            SalQty[K] := It."Sales (Qty.)";
            itl.SETRANGE(itl."Posting Date", CALCDATE(TxtC[1], PeriodEnding), CALCDATE(TxtC[2], PeriodEnding));
            itl.SETRANGE(itl."Item No.", It."No.");
            itl.SETRANGE(itl."Entry Type", itl."Entry Type"::Sale);
            IF itl.FIND('-') THEN
                SalFrq[K] := itl.COUNT
            ELSE
                SalFrq[K] := 0;
            K := K + 1;
        UNTIL K = 13;
    end;


    procedure bin()
    begin

    end;
}

