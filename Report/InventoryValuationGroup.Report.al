report 50233 "Inventory Valuation Group"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/InventoryValuationGroup.rdl';

    dataset
    {
        dataitem(InvPostingGrpData; "Inventory Posting Group")
        {
            CalcFields = "Inventory Value", Quantity;
            DataItemTableView = WHERE("Show In Inventory Summary" = CONST(true));
            RequestFilterFields = "Code";
            RequestFilterHeading = 'Filter';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(As_On_______FORMAT_PeriodEnd_13__0_4_; 'As On : ' + FORMAT(PeriodEnd[13], 0, 4))
            {
            }
            column(LocArray_1_; LocArray[1])
            {
            }
            column(LocNameArray_1_; LocNameArray[1])
            {
            }
            column(LocArray_2_; LocArray[2])
            {
            }
            column(LocNameArray_2_; LocNameArray[2])
            {
            }
            column(LocNameArray_5_; LocNameArray[5])
            {
            }
            column(LocArray_5_; LocArray[5])
            {
            }
            column(LocArray_3_; LocArray[3])
            {
            }
            column(LocNameArray_3_; LocNameArray[3])
            {
            }
            column(LocArray_6_; LocArray[6])
            {
            }
            column(LocNameArray_6_; LocNameArray[6])
            {
            }
            column(LocArray_4_; LocArray[4])
            {
            }
            column(LocNameArray_4_; LocNameArray[4])
            {
            }
            column(Line_Total_; 'Line Total')
            {
            }
            column(value_As_At_____FORMAT_PeriodEnd_13__; 'value As At ' + FORMAT(PeriodEnd[13]))
            {
            }
            column(TodateValueArray_1_; TodateValueArray[1])
            {
            }
            column(TodateValueArray_2_; TodateValueArray[2])
            {
            }
            column(TodateValueArray_3_; TodateValueArray[3])
            {
            }
            column(TodateValueArray_4_; TodateValueArray[4])
            {
            }
            column(TodateValueArray_5_; TodateValueArray[5])
            {
            }
            column(TodateValueArray_6_; TodateValueArray[6])
            {
            }
            column(TodateLineTotal; TodateLineTotal)
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(ValueArray_1_; ValueArray[1])
            {
            }
            column(ValueArray_2_; ValueArray[2])
            {
            }
            column(ValueArray_3_; ValueArray[3])
            {
            }
            column(ValueArray_4_; ValueArray[4])
            {
            }
            column(ValueArray_5_; ValueArray[5])
            {
            }
            column(ValueArray_6_; ValueArray[6])
            {
            }
            column(LineTotal; LineTotal)
            {
            }
            column(INVENTORY_VALUATION_PER_PRODUCT_GROUPCaption; INVENTORY_VALUATION_PER_PRODUCT_GROUPCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
            {
            }
            column(Inventory_Posting_Group_Code; Code)
            {
            }
            dataitem(LoopRec; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = FILTER(1 .. 14));
                MaxIteration = 14;
                column(PeriodName_LoopRec_Number_; PeriodName[LoopRec.Number])
                {
                }
                column(ValueArray_1__Control1000000055; ValueArray[1])
                {
                }
                column(ValueArray_2__Control1000000056; ValueArray[2])
                {
                }
                column(ValueArray_3__Control1000000057; ValueArray[3])
                {
                }
                column(ValueArray_4__Control1000000062; ValueArray[4])
                {
                }
                column(ValueArray_5__Control1000000064; ValueArray[5])
                {
                }
                column(ValueArray_6__Control1000000066; ValueArray[6])
                {
                }
                column(LineTotal_Control1000000067; LineTotal)
                {
                }
                column(Period_Total_; 'Period Total')
                {
                }
                column(ValueArray_1__Control1000000079; ValueArray[1])
                {
                }
                column(ValueArray_2__Control1000000080; ValueArray[2])
                {
                }
                column(ValueArray_3__Control1000000081; ValueArray[3])
                {
                }
                column(ValueArray_4__Control1000000086; ValueArray[4])
                {
                }
                column(ValueArray_5__Control1000000088; ValueArray[5])
                {
                }
                column(ValueArray_6__Control1000000090; ValueArray[6])
                {
                }
                column(LineTotal_Control1000000091; LineTotal)
                {
                }
                column(LoopRec_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    CASE LoopRec.Number OF
                        1:
                            BEGIN
                                MinDate := 0D;
                                MaxDate := PeriodEnd[1];
                                PeriodName[1] := 'Upto ' + FORMAT(PeriodEnd[1]);
                            END;

                        14:
                            BEGIN
                                MinDate := PeriodStart[14];
                                MaxDate := 99991231D;
                                PeriodName[14] := 'From ' + FORMAT(PeriodStart[14]);
                            END;

                        2 .. 13:
                            BEGIN
                                MinDate := PeriodStart[LoopRec.Number];
                                MaxDate := PeriodEnd[LoopRec.Number];
                                PeriodName[LoopRec.Number] := FORMAT(PeriodStart[LoopRec.Number]) + ' to ' + FORMAT(PeriodEnd[LoopRec.Number]);
                            END;

                    END;

                    LineTotal := 0;
                    FOR i := 1 TO 10 DO BEGIN
                        InvPostingGrpData.SETRANGE("Location Filter", LocArray[i]);
                        InvPostingGrpData.SETFILTER("Date Filter", '%1..%2', MinDate, MaxDate);
                        InvPostingGrpData.CALCFIELDS("Inventory Value");
                        ValueArray[i] := InvPostingGrpData."Inventory Value";
                        LineTotal := LineTotal + ValueArray[i];
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    //CurrReport.CREATETOTALS(ValueArray, LineTotal);

                    FOR i := 1 TO 10 DO BEGIN
                        LocNameArray[i] := LocationRec.GetName(LocArray[i]);
                    END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*
                IF "Gen. Product Posting Group".GETFILTER("Gen. Product Posting Group"."Date Filter")<>'' THEN
                  BEGIN
                    MinDate := "Gen. Product Posting Group".GETRANGEMIN("Gen. Product Posting Group"."Date Filter");
                    MaxDate := "Gen. Product Posting Group".GETRANGEMAX("Gen. Product Posting Group"."Date Filter");
                  END;
                
                IF MaxDate<>0D THEN
                  ReportDate := MaxDate
                ELSE
                  IF MinDate<>0D THEN
                    ReportDate := MinDate
                  ELSE
                    ReportDate := WORKDATE;
                
                LineTotal := 0;
                FOR i:=1 TO 10 DO
                  BEGIN
                    "Gen. Product Posting Group".SETRANGE("Gen. Product Posting Group"."Location Filter",LocArray[i]);
                    "Gen. Product Posting Group".SETFILTER("Gen. Product Posting Group"."Date Filter",'%1..%2',0D,PeriodEnd[1]);
                    "Gen. Product Posting Group".CALCFIELDS("Gen. Product Posting Group"."Inventory Value");
                    ValueArray[i] := "Gen. Product Posting Group"."Inventory Value";
                //    message(format(LocArray[i]));
                    LineTotal := LineTotal + ValueArray[i];
                  END;
                
                if LocArray[10]='' then
                    ValueArray[10] := LineTotal;
                */

            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(StoresValue, VesselValue, LineTotal);
                //CurrReport.CREATETOTALS(ValueArray, LineTotal);

                FOR i := 1 TO 10 DO BEGIN
                    LocNameArray[i] := LocationRec.GetName(LocArray[i]);
                END;

                IF LocArray[10] = '' THEN BEGIN
                    LocNameArray[10] := 'Line Total';
                END;

                PeriodStart[13] := CALCDATE('-CM', PeriodEnd[13]);

                FOR i := 1 TO 11 DO BEGIN
                    PeriodEnd[13 - i] := CALCDATE('-1M', PeriodEnd[13 - i + 1]);
                    PeriodEnd[13 - i] := CALCDATE('CM', PeriodEnd[13 - i]);
                    PeriodStart[13 - i] := CALCDATE('-CM', PeriodEnd[13 - i]);
                END;

                PeriodStart[1] := 0D;
                PeriodEnd[1] := CALCDATE('-1D', PeriodStart[2]);


                PeriodStart[14] := CALCDATE('+1D', PeriodEnd[13]);
                PeriodEnd[14] := 99991231D;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Ending Period"; PeriodEnd[13])
                {
                    ApplicationArea = All;
                }
                field("Location 1"; LocArray[1])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
                    ApplicationArea = All;
                }
                field("Location 2"; LocArray[2])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
                    ApplicationArea = All;
                }
                field("Location 3"; LocArray[3])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
                    ApplicationArea = All;
                }
                field("Location 4"; LocArray[4])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
                    ApplicationArea = All;
                }
                field("Location 5"; LocArray[5])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
                    ApplicationArea = All;
                }
                field("Location 6"; LocArray[6])
                {
                    DrillDownPageID = "Location List";
                    TableRelation = Location;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        LocationRec: Record 14;
        ValueRec: Record 5802;
        StoresValue: Decimal;
        VesselValue: Decimal;
        ReportDate: Date;
        InvValue: Decimal;
        LocationType: Option Store,Vessel;
        LineTotal: Decimal;
        MinDate: Date;
        MaxDate: Date;
        LocArray: array[11] of Code[10];
        ValueArray: array[10] of Decimal;
        i: Integer;
        LocNameArray: array[10] of Text[30];
        PeriodStart: array[14] of Date;
        PeriodEnd: array[14] of Date;
        PeriodName: array[14] of Text[30];
        TodateValueArray: array[10] of Decimal;
        TodateLineTotal: Decimal;
        INVENTORY_VALUATION_PER_PRODUCT_GROUPCaptionLbl: Label 'INVENTORY VALUATION PER PRODUCT GROUP';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
}

