report 50087 "Salary Variance Report by Dim"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./SalaryVarianceReportbyDim.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Department; "Dimension Value")
        {
            DataItemTableView = SORTING("Dimension Code", Code)
                                WHERE("Dimension Code" = FILTER('DEPARTMENT'));
            RequestFilterFields = "Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }

            column(USERID; USERID)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(ColumnTAB_1_; ColumnTAB[1])
            {
            }
            column(ColumnTAB_2_; ColumnTAB[2])
            {
            }
            column(ColumnTAB_3_; ColumnTAB[3])
            {
            }
            column(ColumnTAB_4_; ColumnTAB[4])
            {
            }
            column(ColumnTAB_5_; ColumnTAB[5])
            {
            }
            column(ColumnTAB_6_; ColumnTAB[6])
            {
            }
            column(ColumnTAB_7_; ColumnTAB[7])
            {
            }
            column(ColumnTAB_8_; ColumnTAB[8])
            {
            }
            column(ColumnTAB_9_; ColumnTAB[9])
            {
            }
            column(ColumnTAB_10_; ColumnTAB[10])
            {
            }
            column(ColumnTAB_1__Control1000000039; ColumnTAB[1])
            {
            }
            column(ColumnTAB_2__Control1000000040; ColumnTAB[2])
            {
            }
            column(ColumnTAB_3__Control1000000041; ColumnTAB[3])
            {
            }
            column(ColumnTAB_4__Control1000000042; ColumnTAB[4])
            {
            }
            column(ColumnTAB_5__Control1000000043; ColumnTAB[5])
            {
            }
            column(ColumnTAB_6__Control1000000044; ColumnTAB[6])
            {
            }
            column(ColumnTAB_7__Control1000000045; ColumnTAB[7])
            {
            }
            column(ColumnTAB_8__Control1000000046; ColumnTAB[8])
            {
            }
            column(ColumnTAB_9__Control1000000047; ColumnTAB[9])
            {
            }
            column(ColumnTAB_10__Control1000000048; ColumnTAB[10])
            {
            }
            column(ColumnTAB_11_; ColumnTAB[11])
            {
            }
            column(ColumnTAB_12_; ColumnTAB[12])
            {
            }
            column(ColumnTAB_13_; ColumnTAB[13])
            {
            }
            column(ColumnTAB_14_; ColumnTAB[14])
            {
            }
            column(ColumnTAB_15_; ColumnTAB[15])
            {
            }
            column(ColumnTAB_16_; ColumnTAB[16])
            {
            }
            column(ColumnTAB_17_; ColumnTAB[17])
            {
            }
            column(ColumnTAB_18_; ColumnTAB[18])
            {
            }
            column(ColumnTAB_19_; ColumnTAB[19])
            {
            }
            column(ColumnTAB_20_; ColumnTAB[20])
            {
            }
            column(ThisPeriod1; ThisPeriod1)
            {
            }
            column(LastPeriod1; LastPeriod1)
            {
            }
            column(Variance1; Variance1)
            {
            }
            column(ThisPeriod2; ThisPeriod2)
            {
            }
            column(LastPeriod2; LastPeriod2)
            {
            }
            column(Variance2; Variance2)
            {
            }
            column(Variances_1_; Variances[1])
            {
            }
            column(Variances_2_; Variances[2])
            {
            }
            column(Variances_3_; Variances[3])
            {
            }
            column(Variances_4_; Variances[4])
            {
            }
            column(Variances_5_; Variances[5])
            {
            }
            column(Variances_6_; Variances[6])
            {
            }
            column(Variances_7_; Variances[7])
            {
            }
            column(Variances_8_; Variances[8])
            {
            }
            column(Variances_9_; Variances[9])
            {
            }
            column(Variances_10_; Variances[10])
            {
            }
            column(ThisPeriod1_Control1000000075; ThisPeriod1)
            {
            }
            column(LastPeriod1_Control1000000076; LastPeriod1)
            {
            }
            column(Variance1_Control1000000077; Variance1)
            {
            }
            column(ThisPeriod2_Control1000000078; ThisPeriod2)
            {
            }
            column(LastPeriod2_Control1000000079; LastPeriod2)
            {
            }
            column(Variance2_Control1000000080; Variance2)
            {
            }
            column(Variances_1__Control1000000081; Variances[1])
            {
            }
            column(Variances_2__Control1000000082; Variances[2])
            {
            }
            column(Variances_3__Control1000000083; Variances[3])
            {
            }
            column(Variances_4__Control1000000084; Variances[4])
            {
            }
            column(Variances_5__Control1000000085; Variances[5])
            {
            }
            column(Variances_6__Control1000000086; Variances[6])
            {
            }
            column(Variances_7__Control1000000087; Variances[7])
            {
            }
            column(Variances_8__Control1000000088; Variances[8])
            {
            }
            column(Variances_9__Control1000000089; Variances[9])
            {
            }
            column(Variances_10__Control1000000090; Variances[10])
            {
            }
            column(Variances_20_; Variances[20])
            {
            }
            column(Variances_11_; Variances[11])
            {
            }
            column(Variances_12_; Variances[12])
            {
            }
            column(Variances_13_; Variances[13])
            {
            }
            column(Variances_14_; Variances[14])
            {
            }
            column(Variances_15_; Variances[15])
            {
            }
            column(Variances_16_; Variances[16])
            {
            }
            column(Variances_17_; Variances[17])
            {
            }
            column(Variances_18_; Variances[18])
            {
            }
            column(Variances_19_; Variances[19])
            {
            }
            column(Department_Department_Name; Department.Name)
            {
            }
            column(Wages_and_Salaries_Summary__Comparative_ReportCaption; Wages_and_Salaries_Summary__Comparative_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(This_PeriodCaption; This_PeriodCaptionLbl)
            {
            }
            column(Last_PeriodCaption; Last_PeriodCaptionLbl)
            {
            }
            column(VarianceCaption; VarianceCaptionLbl)
            {
            }
            column(This_PeriodCaption_Control1000000020; This_PeriodCaption_Control1000000020Lbl)
            {
            }
            column(Last_PeriodCaption_Control1000000021; Last_PeriodCaption_Control1000000021Lbl)
            {
            }
            column(VarianceCaption_Control1000000022; VarianceCaption_Control1000000022Lbl)
            {
            }
            column(This_PeriodCaption_Control1000000033; This_PeriodCaption_Control1000000033Lbl)
            {
            }
            column(Last_PeriodCaption_Control1000000034; Last_PeriodCaption_Control1000000034Lbl)
            {
            }
            column(VarianceCaption_Control1000000035; VarianceCaption_Control1000000035Lbl)
            {
            }
            column(This_PeriodCaption_Control1000000036; This_PeriodCaption_Control1000000036Lbl)
            {
            }
            column(Last_PeriodCaption_Control1000000037; Last_PeriodCaption_Control1000000037Lbl)
            {
            }
            column(VarianceCaption_Control1000000038; VarianceCaption_Control1000000038Lbl)
            {
            }
            column(Department_Dimension_Code; "Dimension Code")
            {
            }
            column(Department_Code; Code)
            {
            }

            trigger OnAfterGetRecord()
            begin
                payHeader.SETCURRENTKEY("Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code");
                payHeader.SETRANGE("Payroll Period", "Period Code");
                payHeader.SETRANGE("Global Dimension 1 Code", Department.Code);
                ThisPeriod1 := payHeader.COUNT;
                payHeader.SETRANGE("Payroll Period", "Last Period Code");
                LastPeriod1 := payHeader.COUNT;
                Variance1 := LastPeriod1 - ThisPeriod1;

                PeriodRec.GET("Period Code");
                PeriodRec.SETRANGE(PeriodRec."Period Filter", "Period Code");
                PeriodRec.SETRANGE(PeriodRec."ED Filter", NetED);
                PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Department.Code);
                PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
                ThisPeriod2 := PeriodRec.EDAmount;

                PeriodRec.GET("Last Period Code");
                PeriodRec.SETRANGE(PeriodRec."Period Filter", "Last Period Code");
                PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
                LastPeriod2 := PeriodRec.EDAmount;
                Variance2 := LastPeriod2 - ThisPeriod2;

                FOR i := 1 TO c DO BEGIN
                    PeriodRec.GET("Period Code");
                    /*
                      FOR i:= 1 TO c DO
                        BEGIN
                          IF EdTAB[i]<>'' THEN
                            SumED
                          ELSE
                            FOR j := 1 TO NoOfPlus[i]+1 DO
                              SumFormular;
                        end;
                    */
                    //  MESSAGE(NewFormularED[i]);
                    PeriodRec.SETFILTER(PeriodRec."ED Filter", NewFormularED[i]);
                    PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Department.Code);
                    //  PeriodRec.SETRANGE(PeriodRec."Global Dimension 2 Filter",Project.Code);
                    PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
                    ThisPeriod := PeriodRec.EDAmount;



                    PeriodRec.GET("Last Period Code");
                    PeriodRec.SETRANGE(PeriodRec."Period Filter", "Period Code");
                    PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
                    LastPeriod := PeriodRec.EDAmount;
                    Variance := LastPeriod - ThisPeriod;
                    Variances[i] := Variance;
                END;

                /*
                //===============
                FOR i:= 1 TO c DO
                  BEGIN
                    IF EdTAB[i]<>'' THEN
                      SumED
                    ELSE
                      FOR j := 1 TO NoOfPlus[i]+1 DO
                        SumFormular;
                
                    BuTotal[i] := BuTotal[i]+Variances[i];
                    ccTotal[i] := ccTotal[i]+Variances[i];
                    CoTotal[i] := CoTotal[i]+Variances[i];
                    bu := bu+Variances[i];
                    cc := cc+Variances[i];
                  END;
                
                TotalVariance := 0;
                IF SumUp THEN
                  BEGIN
                    FOR i := 1 TO NoOfCommas+1 DO
                      BEGIN
                        TotalVariance:= TotalVariance + Variances[TotalCols[i]];
                      END;
                  END;
                
                ZeroLine := TRUE;
                FOR i := 1 TO NoOfColumns DO
                  BEGIN
                    IF (Variances[i]<>0) THEN ZeroLine := FALSE;
                  END;
                
                IF ZeroLine THEN
                  CurrReport.SKIP;
                */

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO(Code);

                PeriodRec.SETFILTER("Period Code", '..' + "Period Code");
                PeriodRec.FIND('+');
                PeriodRec.NEXT(-1);
                "Last Period Code" := PeriodRec."Period Code";

                //error("Last Period Code");

                /*
                ReportDefinition.GET("Report EDs");
                ColumnTAB[1] := ReportDefinition."Column Text 1";
                EdTAB[1] := ReportDefinition."Column ED 1";
                ColumnTAB[2] := ReportDefinition."Column Text 2";
                EdTAB[2] := ReportDefinition."Column ED 2";
                ColumnTAB[3] := ReportDefinition."Column Text  3";
                EdTAB[3] := ReportDefinition."Column ED 3";
                ColumnTAB[4] := ReportDefinition."Column Text 4";
                EdTAB[4] := ReportDefinition."Column ED 4";
                ColumnTAB[5] := ReportDefinition."Column Text 5";
                EdTAB[5] := ReportDefinition."Column ED 5";
                ColumnTAB[6] := ReportDefinition."Column Text 6";
                EdTAB[6] := ReportDefinition."Column ED 6";
                ColumnTAB[7] := ReportDefinition."Column Text 7";
                EdTAB[7] := ReportDefinition."Column ED 7";
                ColumnTAB[8] := ReportDefinition."Column Text 8";
                EdTAB[8] := ReportDefinition."Column ED 8";
                ColumnTAB[9] := ReportDefinition."Column Text 9";
                EdTAB[9] := ReportDefinition."Column ED 9";
                ColumnTAB[10] := ReportDefinition."Column Text 10";
                EdTAB[10] := ReportDefinition."Column ED 10";
                ColumnTAB[11] := ReportDefinition."Column Text 11";
                EdTAB[11] := ReportDefinition."Column ED 11";
                ColumnTAB[12] := ReportDefinition."Column Text 12";
                EdTAB[12] := ReportDefinition."Column ED 12";
                ColumnTAB[13] := ReportDefinition."Column Text  13";
                EdTAB[13] := ReportDefinition."Column ED 13";
                ColumnTAB[14] := ReportDefinition."Column Text 14";
                EdTAB[14] := ReportDefinition."Column ED 14";
                ColumnTAB[15] := ReportDefinition."Column Text 15";
                EdTAB[15] := ReportDefinition."Column ED 15";
                ColumnTAB[16] := ReportDefinition."Column Text 16";
                EdTAB[16] := ReportDefinition."Column ED 16";
                ColumnTAB[17] := ReportDefinition."Column Text 17";
                EdTAB[17] := ReportDefinition."Column ED 17";
                ColumnTAB[18] := ReportDefinition."Column Text 18";
                EdTAB[18] := ReportDefinition."Column ED 18";
                ColumnTAB[19] := ReportDefinition."Column Text 19";
                EdTAB[19] := ReportDefinition."Column ED 19";
                ColumnTAB[20] := ReportDefinition."Column Text 20";
                EdTAB[20] := ReportDefinition."Column ED 20";
                c := 1;
                WHILE (c<20) AND (EdTAB[c]<>'') DO BEGIN
                c:= c+1;
                END;
                IF (EdTAB[c]='') THEN c:= c-1;
                IF c<1 THEN
                 ERROR('There is no ED on the Report definition Line');
                
                */
                //=============================================================

                LastFieldNo := FIELDNO(Code);

                PeriodRec.SETFILTER("Period Code", '..' + "Period Code");
                PeriodRec.FIND('+');
                PeriodRec.NEXT(-1);
                "Last Period Code" := PeriodRec."Period Code";

                PeriodName.GET("Period Code");
                ReportDefinition.GET("Report EDs");
                ReportTitle := ReportDefinition.Title;

                ColumnTAB[1] := ReportDefinition."Column Text 1";
                EdTAB[1] := ReportDefinition."Column ED 1";
                EdTypeTAB[1] := ReportDefinition."Column Type 1";
                EdValueTypeTAB[1] := ReportDefinition."Column Value Type 1";

                ColumnTAB[2] := ReportDefinition."Column Text 2";
                EdTAB[2] := ReportDefinition."Column ED 2";
                EdTypeTAB[2] := ReportDefinition."Column Type 2";
                EdValueTypeTAB[2] := ReportDefinition."Column Value Type 2";

                ColumnTAB[3] := ReportDefinition."Column Text  3";
                EdTAB[3] := ReportDefinition."Column ED 3";
                EdTypeTAB[3] := ReportDefinition."Column Type 3";
                EdValueTypeTAB[3] := ReportDefinition."Column Value Type 3";

                ColumnTAB[4] := ReportDefinition."Column Text 4";
                EdTAB[4] := ReportDefinition."Column ED 4";
                EdTypeTAB[4] := ReportDefinition."Column Type 4";
                EdValueTypeTAB[4] := ReportDefinition."Column Value Type 4";

                ColumnTAB[5] := ReportDefinition."Column Text 5";
                EdTAB[5] := ReportDefinition."Column ED 5";
                EdTypeTAB[5] := ReportDefinition."Column Type 5";
                EdValueTypeTAB[5] := ReportDefinition."Column Value Type 5";

                ColumnTAB[6] := ReportDefinition."Column Text 6";
                EdTAB[6] := ReportDefinition."Column ED 6";
                EdTypeTAB[6] := ReportDefinition."Column Type 6";
                EdValueTypeTAB[6] := ReportDefinition."Column Value Type 6";

                ColumnTAB[7] := ReportDefinition."Column Text 7";
                EdTAB[7] := ReportDefinition."Column ED 7";
                EdTypeTAB[7] := ReportDefinition."Column Type 7";
                EdValueTypeTAB[7] := ReportDefinition."Column Value Type 7";

                ColumnTAB[8] := ReportDefinition."Column Text 8";
                EdTAB[8] := ReportDefinition."Column ED 8";
                EdTypeTAB[8] := ReportDefinition."Column Type 8";
                EdValueTypeTAB[8] := ReportDefinition."Column Value Type 8";

                ColumnTAB[9] := ReportDefinition."Column Text 9";
                EdTAB[9] := ReportDefinition."Column ED 9";
                EdTypeTAB[9] := ReportDefinition."Column Type 9";
                EdValueTypeTAB[9] := ReportDefinition."Column Value Type 9";

                ColumnTAB[10] := ReportDefinition."Column Text 10";
                EdTAB[10] := ReportDefinition."Column ED 10";
                EdTypeTAB[10] := ReportDefinition."Column Type 10";
                EdValueTypeTAB[10] := ReportDefinition."Column Value Type 10";

                ColumnTAB[11] := ReportDefinition."Column Text 11";
                EdTAB[11] := ReportDefinition."Column ED 11";
                EdTypeTAB[11] := ReportDefinition."Column Type 11";
                EdValueTypeTAB[11] := ReportDefinition."Column Value Type 11";

                ColumnTAB[12] := ReportDefinition."Column Text 12";
                EdTAB[12] := ReportDefinition."Column ED 12";
                EdTypeTAB[12] := ReportDefinition."Column Type 12";
                EdValueTypeTAB[12] := ReportDefinition."Column Value Type 12";

                ColumnTAB[13] := ReportDefinition."Column Text  13";
                EdTAB[13] := ReportDefinition."Column ED 13";
                EdTypeTAB[13] := ReportDefinition."Column Type 13";
                EdValueTypeTAB[13] := ReportDefinition."Column Value Type 13";


                ColumnTAB[14] := ReportDefinition."Column Text 14";
                EdTAB[14] := ReportDefinition."Column ED 14";
                EdTypeTAB[14] := ReportDefinition."Column Type 14";
                EdValueTypeTAB[14] := ReportDefinition."Column Value Type 14";

                ColumnTAB[15] := ReportDefinition."Column Text 15";
                EdTAB[15] := ReportDefinition."Column ED 15";
                EdTypeTAB[15] := ReportDefinition."Column Type 15";
                EdValueTypeTAB[15] := ReportDefinition."Column Value Type 15";

                ColumnTAB[16] := ReportDefinition."Column Text 16";
                EdTAB[16] := ReportDefinition."Column ED 16";
                EdTypeTAB[16] := ReportDefinition."Column Type 16";
                EdValueTypeTAB[16] := ReportDefinition."Column Value Type 16";

                ColumnTAB[17] := ReportDefinition."Column Text 17";
                EdTAB[17] := ReportDefinition."Column ED 17";
                EdTypeTAB[17] := ReportDefinition."Column Type 17";
                EdValueTypeTAB[17] := ReportDefinition."Column Value Type 17";

                ColumnTAB[18] := ReportDefinition."Column Text 18";
                EdTAB[18] := ReportDefinition."Column ED 18";
                EdTypeTAB[18] := ReportDefinition."Column Type 18";
                EdValueTypeTAB[18] := ReportDefinition."Column Value Type 18";

                ColumnTAB[19] := ReportDefinition."Column Text 19";
                EdTAB[19] := ReportDefinition."Column ED 19";
                EdTypeTAB[19] := ReportDefinition."Column Type 19";
                EdValueTypeTAB[19] := ReportDefinition."Column Value Type 19";

                ColumnTAB[20] := ReportDefinition."Column Text 20";
                EdTAB[20] := ReportDefinition."Column ED 20";
                EdTypeTAB[20] := ReportDefinition."Column Type 20";
                EdValueTypeTAB[20] := ReportDefinition."Column Value Type 20";


                FormularED[1] := ReportDefinition."Formular 1";
                FormularED[2] := ReportDefinition."Formular 2";
                FormularED[3] := ReportDefinition."Formular 3";
                FormularED[4] := ReportDefinition."Formular 4";
                FormularED[5] := ReportDefinition."Formular 5";
                FormularED[6] := ReportDefinition."Formular 6";
                FormularED[7] := ReportDefinition."Formular 7";
                FormularED[8] := ReportDefinition."Formular 8";
                FormularED[9] := ReportDefinition."Formular 9";
                FormularED[10] := ReportDefinition."Formular 10";
                FormularED[11] := ReportDefinition."Formular 11";
                FormularED[12] := ReportDefinition."Formular 12";
                FormularED[13] := ReportDefinition."Formular 13";
                FormularED[14] := ReportDefinition."Formular 14";
                FormularED[15] := ReportDefinition."Formular 15";
                FormularED[16] := ReportDefinition."Formular 16";
                FormularED[17] := ReportDefinition."Formular 17";
                FormularED[18] := ReportDefinition."Formular 18";
                FormularED[19] := ReportDefinition."Formular 19";
                FormularED[20] := ReportDefinition."Formular 20";

                FOR j := 1 TO 20 DO
                    CommaED[j] := FormularED[j];

                ColumnTAB[21] := ReportDefinition."Line Total Text";
                Totalling := ReportDefinition."Line Total Columns";
                TotallingTemp := ReportDefinition."Line Total Columns";
                TL := STRLEN(TotallingTemp);
                NoOfCommas := 0;

                IF TL > 0 THEN BEGIN
                    FOR c := 1 TO TL DO BEGIN
                        tStr := COPYSTR(TotallingTemp, c, 1);
                        IF tStr = ',' THEN
                            NoOfCommas := NoOfCommas + 1;
                    END;

                    FOR c := 1 TO NoOfCommas + 1 DO
                        EVALUATE(TotalCols[c], SELECTSTR(c, TotallingTemp));
                END;

                FOR Cols := 1 TO 20 DO BEGIN
                    TL := STRLEN(FormularED[Cols]);
                    CommaED[Cols] := DELCHR(CommaED[Cols], '=', '+');
                    NoOfPlus[Cols] := 0;
                    IF (TL > 0) THEN BEGIN
                        FOR c := 1 TO TL DO BEGIN
                            FStr := COPYSTR(FormularED[Cols], c, 1);
                            IF FStr = '+' THEN BEGIN
                                NoOfPlus[Cols] := NoOfPlus[Cols] + 1;
                                CommaED[Cols] := INSSTR(CommaED[Cols], ',', c);
                            END;
                        END;

                        IF NoOfPlus[Cols] > 0 THEN BEGIN
                            FOR c := 1 TO NoOfPlus[Cols] + 1 DO BEGIN
                                EVALUATE(SummationED[Cols, c], SELECTSTR(c, CommaED[Cols]));                                   //**
                                NewFormularED[Cols] := NewFormularED[Cols] + '|' + SummationED[Cols, c];
                            END;
                            IF COPYSTR(NewFormularED[Cols], STRLEN(NewFormularED[Cols]), 1) = '|' THEN
                                NewFormularED[Cols] := COPYSTR(NewFormularED[Cols], 1, STRLEN(NewFormularED[Cols]) - 1);

                            IF COPYSTR(NewFormularED[Cols], 1, 1) = '|' THEN
                                NewFormularED[Cols] := COPYSTR(NewFormularED[Cols], 2, STRLEN(NewFormularED[Cols]) - 1);

                        END;
                    END
                END;



                //error(NewFormularED[1]);

                /*
                   FOR ColCount:=1 TO 20 DO
                    BEGIN
                      FOR c:=1 TO NoOfPlus[ColCount] + 1 DO
                        MESSAGE(format(ColCount) + '--->'+SummationED[ColCount,c]);
                    END;
                */

                IF Totalling = '' THEN
                    SumUp := FALSE
                ELSE
                    SumUp := TRUE;

                prvperiodyes := FALSE;
                prvyearyes := FALSE;
                c := 1;

                WHILE ((c < 20) AND ((EdTAB[c] <> '') OR (FormularED[c] <> ''))) DO BEGIN
                    IF EdTypeTAB[c] = EdTypeTAB[c] ::"PRV Year" THEN
                        prvyearyes := TRUE;
                    IF EdTypeTAB[c] = EdTypeTAB[c] ::"PRV Period" THEN
                        prvperiodyes := TRUE;

                    c := c + 1;
                END;

                IF (EdTAB[c] = '') AND (FormularED[c] = '') THEN c := c - 1;
                IF c < 1 THEN
                    ERROR('There is no ED on the Report definition Line');


                PeriodRec.GET("Period Code");
                PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
                PeriodRec.FIND('-');
                "Year Start" := PeriodRec."Period Code";

                PeriodRec.GET("Period Code");

                //PeriodRec.SETFILTER("Period Code",'..'+"Period Code");
                //PeriodRec.FIND('+');
                //IF prvperiodyes THEN BEGIN

                PeriodRec.NEXT(-1);
                "Last Period Code" := PeriodRec."Period Code";

                IF prvyearyes THEN BEGIN
                    PeriodRec.RESET;
                    PeriodRec.GET("Year Start");
                    PeriodRec.NEXT(-1);
                    "prv Year end" := PeriodRec."Period Code";

                    PeriodRec.GET("prv Year end");
                    PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
                    PeriodRec.FIND('-');
                    "prv year start" := PeriodRec."Period Code";
                END;

                //CurrReport.CREATETOTALS(SerNo, TotalVariance, Variances);

                //SETRANGE("Posting Group",DefaultPostingGroup);
                //Employee.SETRANGE(Employee."Global Dimension 1 Code",Department.Code);


                payHeader.RESET;
                payHeader.SETCURRENTKEY("Global Dimension 1 Code", "Global Dimension 2 Code");
                //payHeader.SETRANGE("Global Dimension 1 Code",Department.Code);
                //EmpFind.SETRANGE("Posting Group",DefaultPostingGroup);
                IF NOT payHeader.FIND('-') THEN
                    CurrReport.SKIP;


                FOR q := 1 TO NoOfColumns DO
                    BuTotal[q] := 0;

                bu := 0;
                BUTotalVariance := 0;
                CoTotalVariance := 0;


                SerNo := 0;
                SerNo1 := 0;

                FOR j := 1 TO 20 DO
                    Variances[j] := 0;


                ED.SETRANGE(ED."Payslip Group ID", ED."Payslip Group ID"::"NET PAY DUE");
                ED.FIND('-');
                NetED := ED."E/D Code";

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
        Emp: Record 5200;
        ThisPeriod1: Integer;
        LastPeriod1: Integer;
        Variance1: Integer;
        ThisPeriod2: Decimal;
        LastPeriod2: Decimal;
        Variance2: Decimal;
        payHeader: Record 50007;
        PeriodRec: Record 50004;
        "Period Code": Code[10];
        "Last Period Code": Code[10];
        ED: Record 50001;
        CumED: Record 50001;
        NetED: Code[10];
        ReportDefinition: Record 50020;
        "Report EDs": Integer;
        ColumnTAB: array[21] of Text[60];
        EdTAB: array[21] of Code[10];
        EdTypeTAB: array[21] of Option " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        EdValueTypeTAB: array[21] of Option Amount,Quantity;
        Variances: array[21] of Decimal;
        i: Integer;
        ThisPeriod: Decimal;
        LastPeriod: Decimal;
        Variance: Decimal;
        c: Integer;
        NoOfCommas: Integer;
        tStr: Code[10];
        SumUp: Boolean;
        NoOfColumns: Integer;
        SummationED: array[21, 21] of Code[10];
        SummationTemp: array[21] of Text[100];
        FormularED: array[21] of Text[100];
        CommaED: array[20] of Text[100];
        ColCount: Integer;
        NoOfPlus: array[20] of Integer;
        Cols: Integer;
        FStr: Text[100];
        aTemp: Code[10];
        j: Integer;
        "prv Year end": Code[10];
        "prv year start": Code[10];
        prvyearyes: Boolean;
        prvperiodyes: Boolean;
        ReportTitle: Text[60];
        EmpFind: Record 5200;
        gpc: Codeunit 50004;
        DefaultPostingGroup: Code[20];
        BuTotal: array[21] of Decimal;
        ccTotal: array[21] of Decimal;
        CoTotal: array[21] of Decimal;
        q: Integer;
        bu: Decimal;
        cc: Decimal;
        PostGroup: Record 50021;
        "Exclude Period in Cummulative": Boolean;
        BFRec: Record 50004;
        ZeroLine: Boolean;
        SerNo: Decimal;
        SerNo1: Integer;
        DimRec: Record 349;
        ShowDepartmentalTotals: Boolean;
        ShowEmployeeDetails: Boolean;
        TotalVariance: Decimal;
        BUTotalVariance: Decimal;
        CoTotalVariance: Decimal;
        TotalCols: array[21] of Integer;
        Totalling: Code[250];
        TotallingTemp: Code[250];
        T1: Code[2];
        P1: Integer;
        P2: Integer;
        TL: Integer;
        PeriodName: Record 50004;
        "Year Start": Code[10];
        NewFormularED: array[21] of Code[250];
        Wages_and_Salaries_Summary__Comparative_ReportCaptionLbl: Label 'Wages and Salaries(Summary) Comparative Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        This_PeriodCaptionLbl: Label 'This Period';
        Last_PeriodCaptionLbl: Label 'Last Period';
        VarianceCaptionLbl: Label 'Variance';
        This_PeriodCaption_Control1000000020Lbl: Label 'This Period';
        Last_PeriodCaption_Control1000000021Lbl: Label 'Last Period';
        VarianceCaption_Control1000000022Lbl: Label 'Variance';
        This_PeriodCaption_Control1000000033Lbl: Label 'This Period';
        Last_PeriodCaption_Control1000000034Lbl: Label 'Last Period';
        VarianceCaption_Control1000000035Lbl: Label 'Variance';
        This_PeriodCaption_Control1000000036Lbl: Label 'This Period';
        Last_PeriodCaption_Control1000000037Lbl: Label 'Last Period';
        VarianceCaption_Control1000000038Lbl: Label 'Variance';

    procedure SumED()
    begin
        CumED.GET(EdTAB[i]);
        IF EdValueTypeTAB[i] = EdValueTypeTAB::Amount THEN BEGIN
            CASE EdTypeTAB[i] OF
                EdTypeTAB::" ":
                    Variances[i] := Variances[i] + BFRec.DepCurrentAmount(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"Cum. to Date":
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepAmountTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepAmountTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::YTD:
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"PRV Year":
                    Variances[i] := Variances[i] + BFRec.DepAmountWithinPeriod(Department.Code, CumED."E/D Code", "prv year start", "prv Year end");

                EdTypeTAB::"PRV Period":
                    Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Last Period Code");
            END;
        END
        ELSE BEGIN
            CASE EdTypeTAB[i] OF
                EdTypeTAB::" ":
                    Variances[i] := Variances[i] + BFRec.DepCurrentQty(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"Cum. to Date":
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepQtyTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepQtyTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::YTD:
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"PRV Year":
                    Variances[i] := Variances[i] + BFRec.DepQtyWithinPeriod(Department.Code, CumED."E/D Code", "prv year start", "prv Year end");

                EdTypeTAB::"PRV Period":
                    Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Last Period Code");
            END;
        END;
    end;

    procedure SumFormular()
    begin
        CumED.GET(SummationED[i, j]);
        IF EdValueTypeTAB[i] = EdValueTypeTAB::Amount THEN BEGIN
            CASE EdTypeTAB[i] OF
                EdTypeTAB::" ":
                    Variances[i] := Variances[i] + BFRec.DepCurrentAmount(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"Cum. to Date":
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepAmountTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepAmountTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::YTD:
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"PRV Year":
                    Variances[i] := Variances[i] + BFRec.DepAmountWithinPeriod(Department.Code, CumED."E/D Code", "prv year start", "prv Year end");

                EdTypeTAB::"PRV Period":
                    Variances[i] := Variances[i] + BFRec.DepAmountYTD(Department.Code, CumED."E/D Code", "Last Period Code");
            END;
        END
        ELSE BEGIN
            CASE EdTypeTAB[i] OF
                EdTypeTAB::" ":
                    Variances[i] := Variances[i] + BFRec.DepCurrentQty(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"Cum. to Date":
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepQtyTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepQtyTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::YTD:
                    IF "Exclude Period in Cummulative" THEN
                        Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Last Period Code")
                    ELSE
                        Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Period Code");

                EdTypeTAB::"PRV Year":
                    Variances[i] := Variances[i] + BFRec.DepQtyWithinPeriod(Department.Code, CumED."E/D Code", "prv year start", "prv Year end");

                EdTypeTAB::"PRV Period":
                    Variances[i] := Variances[i] + BFRec.DepQtyYTD(Department.Code, CumED."E/D Code", "Last Period Code");
            END;
        END;
    end;
}

