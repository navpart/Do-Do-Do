report 50108 "Zero Movement Report"
{
    // 12372-15110..13041-74040-02
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ZeroMovementReport.rdl';


    dataset
    {
        dataitem(DataItem5444; Integer)
        {
            MaxIteration = 1;
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Report_Date_______FORMAT_WORKDATE_; 'Report Date : ' + FORMAT(WORKDATE))
            {
            }
            column(ZERO_Movement_ReportCaption; ZERO_Movement_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption; Item.FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption; Item.FIELDCAPTION(Description))
            {
            }
            column(Item__Qty__on_Purch__Order_Caption; Item.FIELDCAPTION("Qty. on Purch. Order"))
            {
            }
            column(Item__Stockvalue__Caption; Item.FieldCaption("Stockvalue."))
            {
            }
            column(DslsCaption; DslsCaptionLbl)
            {
            }
            column(Qty_On_HandCaption; Qty_On_HandCaptionLbl)
            {
            }
            column(Last_Sales_DateCaption; Last_Sales_DateCaptionLbl)
            {
            }
            column(Last_Purchase_DateCaption; Last_Purchase_DateCaptionLbl)
            {
            }
            column(Integer_Number; Number)
            {
            }
            dataitem(Item; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = filter('N_PARTS'));
                RequestFilterFields = "No.", "Inventory Posting Group", "Variant Filter", "Location Filter", "Date Filter";
                column(Filters_______GETFILTERS; 'Filters : ' + GETFILTERS)
                {
                }
                column(Zero_Movement_Since_The_Last_5_Years__from______FORMAT_StartDate______to_____FORMAT_EndDate_______; 'Zero Movement Since The Last 5 Years  from (' + FORMAT(StartDate) + ' to ' + FORMAT(EndDate) + ')')
                {
                }
                column(Item__No__; "No.")
                {
                }
                column(Item_Description; Description)
                {
                }
                column(Item__Qty__on_Purch__Order_; "Qty. on Purch. Order")
                {
                }
                column(Item__Stockvalue__; "Stockvalue.")
                {
                }
                column(Dsls; Dsls)
                {
                }
                column(Item_Inventory; Inventory)
                {
                }
                column(Item__Last_Sales_Date_; "Last Sales Date")
                {
                }
                column(Item__Last_Purchase_Date_; "Last Purchase Date")
                {
                }
                column(Item__Qty__on_Purch__Order__Control1000000060; "Qty. on Purch. Order")
                {
                }
                column(Item__Stockvalue___Control1000000061; "Stockvalue.")
                {
                }
                column(Item_Inventory_Control1000000067; Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CurYear := 5;
                    NoMvt := (CurYear <= ZeroMvtYears(Item));
                    IF NOT NoMvt THEN CurrReport.SKIP;
                end;

                trigger OnPreDataItem()
                begin

                    EndDate := WORKDATE;
                    StartDate := CALCDATE('-5Y', WORKDATE);

                    //CurrReport.CREATETOTALS("Qty. on Purch. Order", Inventory, "Stockvalue.");
                end;
            }
            dataitem(Item2; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = filter('N_PARTS'));
                column(Zero_Movement_In_The_Last_4_Years__from______FORMAT_StartDate______to_____FORMAT_EndDate_______; 'Zero Movement In The Last 4 Years  from (' + FORMAT(StartDate) + ' to ' + FORMAT(EndDate) + ')')
                {
                }
                column(Item2__No__; "No.")
                {
                }
                column(Item2_Description; Description)
                {
                }
                column(Item2__Qty__on_Purch__Order_; "Qty. on Purch. Order")
                {
                }
                column(Item2__Stockvalue__; "Stockvalue.")
                {
                }
                column(Dsls_Control1000000029; Dsls)
                {
                }
                column(Item2_Inventory; Inventory)
                {
                }
                column(Item2__Last_Sales_Date_; "Last Sales Date")
                {
                }
                column(Item2__Last_Purchase_Date_; "Last Purchase Date")
                {
                }
                column(Item2__Qty__on_Purch__Order__Control1000000071; "Qty. on Purch. Order")
                {
                }
                column(Item2__Stockvalue___Control1000000072; "Stockvalue.")
                {
                }
                column(Item2_Inventory_Control1000000073; Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CurYear := 4;
                    NoMvt := (CurYear = ZeroMvtYears(Item2));
                    IF NOT NoMvt THEN CurrReport.SKIP;
                end;

                trigger OnPreDataItem()
                begin
                    Item2.COPYFILTERS(Item);

                    EndDate := WORKDATE;
                    StartDate := CALCDATE('-4Y', WORKDATE);
                end;
            }
            dataitem(Item3; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = filter('N_PARTS'));
                column(Zero_Movement_In_The_Last_3_Years__from______FORMAT_StartDate______to_____FORMAT_EndDate_______; 'Zero Movement In The Last 3 Years  from (' + FORMAT(StartDate) + ' to ' + FORMAT(EndDate) + ')')
                {
                }
                column(Item3__No__; "No.")
                {
                }
                column(Item3_Description; Description)
                {
                }
                column(Item3__Qty__on_Purch__Order_; "Qty. on Purch. Order")
                {
                }
                column(Item3__Stockvalue__; "Stockvalue.")
                {
                }
                column(Dsls_Control1000000037; Dsls)
                {
                }
                column(Item3_Inventory; Inventory)
                {
                }
                column(Item3__Last_Sales_Date_; "Last Sales Date")
                {
                }
                column(Item3__Last_Purchase_Date_; "Last Purchase Date")
                {
                }
                column(Item3__Qty__on_Purch__Order__Control1000000075; "Qty. on Purch. Order")
                {
                }
                column(Item3__Stockvalue___Control1000000076; "Stockvalue.")
                {
                }
                column(Item3_Inventory_Control1000000077; Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CurYear := 3;
                    NoMvt := (CurYear = ZeroMvtYears(Item3));
                    IF NOT NoMvt THEN CurrReport.SKIP;
                end;

                trigger OnPreDataItem()
                begin
                    Item3.COPYFILTERS(Item);

                    EndDate := WORKDATE;
                    StartDate := CALCDATE('-3Y', WORKDATE);
                end;
            }
            dataitem(Item4; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = filter('N_PARTS'));
                column(Zero_Movement_In_The_Last_2_Years__from______FORMAT_StartDate______to_____FORMAT_EndDate_______; 'Zero Movement In The Last 2 Years  from (' + FORMAT(StartDate) + ' to ' + FORMAT(EndDate) + ')')
                {
                }
                column(Item4__No__; "No.")
                {
                }
                column(Item4_Description; Description)
                {
                }
                column(Item4__Qty__on_Purch__Order_; "Qty. on Purch. Order")
                {
                }
                column(Item4__Stockvalue__; "Stockvalue.")
                {
                }
                column(Dsls_Control1000000045; Dsls)
                {
                }
                column(Item4_Inventory; Inventory)
                {
                }
                column(Item4__Last_Sales_Date_; "Last Sales Date")
                {
                }
                column(Item4__Last_Purchase_Date_; "Last Purchase Date")
                {
                }
                column(Item4__Qty__on_Purch__Order__Control1000000079; "Qty. on Purch. Order")
                {
                }
                column(Item4__Stockvalue___Control1000000080; "Stockvalue.")
                {
                }
                column(Item4_Inventory_Control1000000081; Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CurYear := 2;
                    NoMvt := (CurYear = ZeroMvtYears(Item4));
                    IF NOT NoMvt THEN CurrReport.SKIP;
                end;

                trigger OnPreDataItem()
                begin
                    Item4.COPYFILTERS(Item);

                    EndDate := WORKDATE;
                    StartDate := CALCDATE('-2Y', WORKDATE);
                end;
            }
            dataitem(Item5; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = filter('N_PARTS'));
                column(Zero_Movement_Since_The_Last_1_Year__from______FORMAT_StartDate______to_____FORMAT_EndDate_______; 'Zero Movement Since The Last 1 Year  from (' + FORMAT(StartDate) + ' to ' + FORMAT(EndDate) + ')')
                {
                }
                column(Item5__No__; "No.")
                {
                }
                column(Item5_Description; Description)
                {
                }
                column(Item5__Qty__on_Purch__Order_; "Qty. on Purch. Order")
                {
                }
                column(Item5__Stockvalue__; "Stockvalue.")
                {
                }
                column(Dsls_Control1000000053; Dsls)
                {
                }
                column(Item5_Inventory; Inventory)
                {
                }
                column(Item5__Last_Sales_Date_; "Last Sales Date")
                {
                }
                column(Item5__Last_Purchase_Date_; "Last Purchase Date")
                {
                }
                column(Item5__Qty__on_Purch__Order__Control1000000083; "Qty. on Purch. Order")
                {
                }
                column(Item5__Stockvalue___Control1000000084; "Stockvalue.")
                {
                }
                column(Item5_Inventory_Control1000000085; Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CurYear := 1;
                    NoMvt := (CurYear = ZeroMvtYears(Item5));
                    IF NOT NoMvt THEN CurrReport.SKIP;


                    //EndDate := WORKDATE;
                    //StartDate := 010190D;
                end;

                trigger OnPreDataItem()
                begin
                    Item5.COPYFILTERS(Item);

                    EndDate := WORKDATE;
                    StartDate := CALCDATE('-1Y', WORKDATE);
                end;
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
        NoMvt: Boolean;
        CurYear: Integer;
        ZeroMvtSince: Integer;
        EndDate: Date;
        StartDate: Date;
        Dsls: Text[30];
        ZERO_Movement_ReportCaptionLbl: Label 'ZERO Movement Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item__Stockvalue__CaptionLbl: Label 'Inventory Value';
        DslsCaptionLbl: Label 'Days Since Last Sales';
        Qty_On_HandCaptionLbl: Label 'Qty On Hand';
        Last_Sales_DateCaptionLbl: Label 'Last Sales Date';
        Last_Purchase_DateCaptionLbl: Label 'Last Purchase Date';


    procedure ZeroMvtYears(ItemRec: Record Item): Integer
    begin
        ItemRec.CALCFIELDS(ItemRec."Sales (Qty.)", ItemRec."Last Sales Date");
        IF (ItemRec."Last Sales Date" <> 0D) THEN
            ZeroMvtSince := WORKDATE - ItemRec."Last Sales Date"
        ELSE
            IF (ItemRec."Old DB Date" <> 0D) THEN
                ZeroMvtSince := WORKDATE - ItemRec."Old DB Date"
            ELSE
                ZeroMvtSince := 999999;

        IF (ZeroMvtSince = 999999) THEN
            Dsls := '-'
        ELSE
            Dsls := FORMAT(ZeroMvtSince);

        EXIT(ROUND(ZeroMvtSince / 365, 1, '<'));
    end;
}

