report 50109 "Phase In-Phase Out Report"
{
    // 12372-15110..13041-74040-02
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PhaseInPhaseOutReport.rdl';


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
            column(PHASE_IN___PHASE_OUT_REPORTCaption; PHASE_IN___PHASE_OUT_REPORTCaptionLbl)
            {
            }
            column(Item5__No__Caption; Item5.FieldCaption("No."))
            {
            }
            column(Item5_DescriptionCaption; Item5.FIELDCAPTION(Description))
            {
            }
            column(Item5__Qty__on_Purch__Order_Caption; Item5.FIELDCAPTION("Qty. on Purch. Order"))
            {
            }
            column(Item5__Stockvalue__Caption; Item5.FieldCaption("Stockvalue."))
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
            column(Item5__Old_DB_Date_Caption; Item5.FIELDCAPTION("Old DB Date"))
            {
            }
            column(Integer_Number; Number)
            {
            }
            dataitem(Item5; Item)
            {
                CalcFields = "Qty. on Purch. Order", Inventory, "Stockvalue.";
                DataItemTableView = SORTING("Inventory Posting Group")
                                    WHERE("Inventory Posting Group" = CONST('N_PARTS'));
                RequestFilterFields = "No.", "Inventory Posting Group";
                column(Phase_Out_; 'Phase Out')
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
                column(Dsls; Dsls)
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
                column(Item5__Old_DB_Date_; "Old DB Date")
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
                    CurYear := PhaseOutYr;
                    NoMvt := (CurYear <= ZeroMvtYears(Item5));
                    IF NOT NoMvt THEN CurrReport.SKIP;


                    //EndDate := WORKDATE;
                    //StartDate := 010190D;
                end;

                trigger OnPreDataItem()
                begin
                    //Item5.COPYFILTERS(Item);

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
        PhaseOutYr: Integer;
        PHASE_IN___PHASE_OUT_REPORTCaptionLbl: Label 'PHASE IN - PHASE OUT REPORT';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item5__Stockvalue__CaptionLbl: Label 'Inventory Value';
        DslsCaptionLbl: Label 'Days Since Last Sales';
        Qty_On_HandCaptionLbl: Label 'Qty On Hand';
        Last_Sales_DateCaptionLbl: Label 'Last Sales Date';
        Last_Purchase_DateCaptionLbl: Label 'Last Purchase Date';


    procedure ZeroMvtYears(ItemRec: Record 27): Integer
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

