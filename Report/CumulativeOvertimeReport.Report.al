report 50146 "Cumulative Overtime Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./CumulativeOvertimeReport.rdl';

    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("Global Dimension 1 Code", "Global Dimension 2 Code");
            RequestFilterFields = "Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Filters_______Employee_GETFILTERS__; 'Filters - ' + Employee.GETFILTERS())
            {
            }
            column(COPYSTR_PeriodName_1__1_3_; COPYSTR(PeriodName[1], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_2__1_3_; COPYSTR(PeriodName[2], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_4__1_3_; COPYSTR(PeriodName[4], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_3__1_3_; COPYSTR(PeriodName[3], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_8__1_3_; COPYSTR(PeriodName[8], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_7__1_3_; COPYSTR(PeriodName[7], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_6__1_3_; COPYSTR(PeriodName[6], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_5__1_3_; COPYSTR(PeriodName[5], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_11__1_3_; COPYSTR(PeriodName[11], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_10__1_3_; COPYSTR(PeriodName[10], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_12__1_3_; COPYSTR(PeriodName[12], 1, 3))
            {
            }
            column(COPYSTR_PeriodName_9__1_3_; COPYSTR(PeriodName[9], 1, 3))
            {
            }
            column(YTD_Overtime_; 'YTD Overtime')
            {
            }
            column(Employee__Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(Employee__Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(BCName; BCName)
            {
            }
            column(CCName; CCName)
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(DesigName; DesigName)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(PeriodAmt_1_; PeriodAmt[1])
            {
            }
            column(PeriodPct_1_; PeriodPct[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodPct_2_; PeriodPct[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_2_; PeriodAmt[2])
            {
            }
            column(PeriodPct_4_; PeriodPct[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_4_; PeriodAmt[4])
            {
            }
            column(PeriodPct_3_; PeriodPct[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_3_; PeriodAmt[3])
            {
            }
            column(PeriodPct_8_; PeriodPct[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_8_; PeriodAmt[8])
            {
            }
            column(PeriodPct_7_; PeriodPct[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_7_; PeriodAmt[7])
            {
            }
            column(PeriodAmt_5_; PeriodAmt[5])
            {
            }
            column(PeriodPct_5_; PeriodPct[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_6_; PeriodAmt[6])
            {
            }
            column(PeriodPct_6_; PeriodPct[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodPct_12_; PeriodPct[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_12_; PeriodAmt[12])
            {
            }
            column(PeriodPct_11_; PeriodPct[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_11_; PeriodAmt[11])
            {
            }
            column(PeriodAmt_9_; PeriodAmt[9])
            {
            }
            column(PeriodPct_9_; PeriodPct[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PeriodAmt_10_; PeriodAmt[10])
            {
            }
            column(PeriodPct_10_; PeriodPct[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(YTDPct; YTDPct)
            {
                DecimalPlaces = 0 : 0;
            }
            column(YTDAmount; YTDAmount)
            {
            }
            column(BCCount; BCCount)
            {
            }
            column(CCCount; CCCount)
            {
            }
            column(EMPLOYEE_MONTHLY_VARIABLESCaption; EMPLOYEE_MONTHLY_VARIABLESCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(EmpNameCaption; EmpNameCaptionLbl)
            {
            }
            column(DesignationCaption; DesignationCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Monthly_Basic_PayCaption; Monthly_Basic_PayCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control60; EmptyStringCaption_Control60Lbl)
            {
            }
            column(EmptyStringCaption_Control62; EmptyStringCaption_Control62Lbl)
            {
            }
            column(EmptyStringCaption_Control64; EmptyStringCaption_Control64Lbl)
            {
            }
            column(EmptyStringCaption_Control66; EmptyStringCaption_Control66Lbl)
            {
            }
            column(EmptyStringCaption_Control68; EmptyStringCaption_Control68Lbl)
            {
            }
            column(EmptyStringCaption_Control70; EmptyStringCaption_Control70Lbl)
            {
            }
            column(EmptyStringCaption_Control72; EmptyStringCaption_Control72Lbl)
            {
            }
            column(EmptyStringCaption_Control74; EmptyStringCaption_Control74Lbl)
            {
            }
            column(EmptyStringCaption_Control76; EmptyStringCaption_Control76Lbl)
            {
            }
            column(EmptyStringCaption_Control78; EmptyStringCaption_Control78Lbl)
            {
            }
            column(EmptyStringCaption_Control80; EmptyStringCaption_Control80Lbl)
            {
            }
            column(EmptyStringCaption_Control14; EmptyStringCaption_Control14Lbl)
            {
            }
            column(Employee__Global_Dimension_2_Code_Caption; FIELDCAPTION("Global Dimension 2 Code"))
            {
            }
            column(Employee__Global_Dimension_1_Code_Caption; FIELDCAPTION("Global Dimension 1 Code"))
            {
            }
            column(Employees_In_DepartmentCaption; Employees_In_DepartmentCaptionLbl)
            {
            }
            column(Employees_In_ProjectCaption; Employees_In_ProjectCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                EmpName := Employee.FullName;
                Grd := EmpGrp.GetGrade(Employee."Employee Group");
                Stp := EmpGrp.GetStep(Employee."Employee Group");

                IF DesigRec.GET(Employee.Designation) THEN
                    DesigName := DesigRec.Description
                ELSE
                    DesigName := '';

                IF StateRec.GET(Employee.State) THEN
                    StateName := StateRec."Colour Code"
                ELSE
                    StateName := '';

                EmpRec.COPYFILTERS(Employee);
                EmpRec.SETRANGE(EmpRec."Global Dimension 1 Code", Employee."Global Dimension 2 Code");
                //BCCount := EmpRec.COUNT;
                EmpRec.SETRANGE(EmpRec."Global Dimension 2 Code", Employee."Global Dimension 2 Code");
                //CCCount := EmpRec.COUNT;

                BasicPay := EmpGrp.GetBasic(Employee."Employee Group");
                IF (BasicPay = 0) THEN CurrReport.SKIP;

                /*
                OTRec.RESET;
                OTRec.SETRANGE(OTRec."Employee No.",Employee."No.");
                OTRec.SETRANGE(OTRec.Period,PeriodCode[j]);
                IF not OTRec.FIND('-')  THEN CurrReport.SKIP;
                */

                FOR j := 1 TO 12 DO BEGIN
                    OTRec.RESET;
                    OTRec.SETRANGE(OTRec."Payroll Period", PeriodCode[j]);
                    OTRec.SETRANGE(OTRec."Employee No", Employee."No.");
                    OTRec.CALCFIELDS(OTRec.VariableAmount);
                    IF OTRec.FIND('-') THEN BEGIN
                        OTRec.CALCFIELDS(OTRec.VariableAmount);
                        PeriodAmt[j] := OTRec.VariableAmount;
                        IF (PeriodAmt[j] > 0) THEN
                            PeriodPct[j] := (PeriodAmt[j] / BasicPay) * 100
                        ELSE
                            PeriodPct[j] := 0;

                        IF OTRec."Payroll Period" <= TodayPeriod THEN BEGIN
                            YTDAmount := YTDAmount + PeriodAmt[j];
                            IF (YTDAmount > 0) THEN BEGIN
                                YTDPct := (YTDAmount / (BasicPay * 12)) * 100 + PeriodPct[j];
                                YTDPct := ROUND(YTDPct, 10, '>');
                            END
                            ELSE
                                YTDPct := 0;
                        END;
                    END
                    ELSE BEGIN
                        PeriodAmt[j] := 0;
                        PeriodPct[j] := 0;
                        IF OTRec."Payroll Period" <= TodayPeriod THEN BEGIN
                            YTDAmount := YTDAmount + PeriodAmt[j];
                            IF (YTDAmount > 0) THEN BEGIN
                                YTDPct := (YTDAmount / (BasicPay * 12)) * 100 + PeriodPct[j];
                                YTDPct := ROUND(YTDPct, 10, '>');
                            END
                            ELSE
                                YTDPct := 0;
                        END;
                    END
                END;

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Global Dimension 2 Code");

                DateRec.SETRANGE(DateRec."Period Type", DateRec."Period Type"::Year);
                DateRec.SETRANGE(DateRec."Period No.", RepYear);
                DateRec.FIND('-');
                YearStart := DateRec."Period Start";
                YearEnd := DateRec."Period End";
                j := 1;

                PeriodRec.RESET;
                PeriodRec.SETRANGE(PeriodRec."Start Date", YearStart, YearEnd);
                IF PeriodRec.FIND('-') THEN
                    REPEAT
                        PeriodCode[j] := PeriodRec."Period Code";
                        PeriodName[j] := PeriodRec.Name;
                        j := j + 1;
                    UNTIL (PeriodRec.NEXT = 0)
                ELSE
                    ERROR('There is no Payroll Period withing  the Year %1', RepYear);

                PeriodRec.RESET;
                tdy := '<=' + FORMAT(TODAY);
                PeriodRec.SETFILTER(PeriodRec."Start Date", tdy);
                tdy := '>=' + FORMAT(TODAY);
                PeriodRec.SETFILTER(PeriodRec."End Date", tdy);
                IF PeriodRec.FIND('-') THEN
                    TodayPeriod := PeriodRec."Period Code"
                ELSE
                    ERROR('There is no Payroll Period Covering Today');
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
        PeriodRec.SETRANGE(PeriodRec."Start Date", YearStart);
        PeriodRec.SETRANGE(PeriodRec."End Date", YearEnd);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        EmpGrp: Record 50009;
        BasicPay: Decimal;
        EmpName: Text[100];
        Grd: Code[2];
        Stp: Code[2];
        DesigName: Text[30];
        DesigRec: Record 50021;
        StateRec: Record 50067;
        StateName: Text[30];
        Dy: Integer;
        Mt: Integer;
        Yr: Integer;
        DStr: Code[2];
        CCCount: Integer;
        BCCount: Integer;
        EmpRec: Record 5200;
        BCName: Text[30];
        CCName: Text[30];
        OTRec: Record 50016;
        PeriodCode: array[13] of Code[10];
        PeriodName: array[13] of Text[30];
        PeriodAmt: array[13] of Decimal;
        PeriodPct: array[13] of Decimal;
        PeriodRec: Record 50004;
        YTDAmount: Decimal;
        YTDPct: Decimal;
        RepYear: Integer;
        YearStart: Date;
        YearEnd: Date;
        DateRec: Record 2000000007;
        j: Integer;
        TodayPeriod: Code[10];
        TodayYearStart: Date;
        TodayYearEnd: Date;
        tdy: Code[20];
        EMPLOYEE_MONTHLY_VARIABLESCaptionLbl: Label 'EMPLOYEE MONTHLY VARIABLES';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        EmpNameCaptionLbl: Label 'Name';
        DesignationCaptionLbl: Label 'Designation';
        EmptyStringCaptionLbl: Label '%';
        Monthly_Basic_PayCaptionLbl: Label 'Monthly Basic Pay';
        EmptyStringCaption_Control60Lbl: Label '%';
        EmptyStringCaption_Control62Lbl: Label '%';
        EmptyStringCaption_Control64Lbl: Label '%';
        EmptyStringCaption_Control66Lbl: Label '%';
        EmptyStringCaption_Control68Lbl: Label '%';
        EmptyStringCaption_Control70Lbl: Label '%';
        EmptyStringCaption_Control72Lbl: Label '%';
        EmptyStringCaption_Control74Lbl: Label '%';
        EmptyStringCaption_Control76Lbl: Label '%';
        EmptyStringCaption_Control78Lbl: Label '%';
        EmptyStringCaption_Control80Lbl: Label '%';
        EmptyStringCaption_Control14Lbl: Label '%';
        Employees_In_DepartmentCaptionLbl: Label 'Employees In Department';
        Employees_In_ProjectCaptionLbl: Label 'Employees In Project';

    
    procedure FormatDate(Dt: Date): Text[20]
    begin
        IF Dt = 0D THEN EXIT('');

        Dy := DATE2DMY(Dt, 1);
        Mt := DATE2DMY(Dt, 2);
        Yr := DATE2DMY(Dt, 3);

        IF Dy < 10 THEN
            DStr := '0' + FORMAT(Dy)
        ELSE
            DStr := FORMAT(Dy);
        EXIT(DStr + ' ' + COPYSTR(FORMAT(Dt, 0, '<Month text>'), 1, 3) + ' ' + FORMAT(Yr, 0));
    end;

   
    procedure GetPeriodOVT(Emp: Code[10]; Per: Code[10]): Decimal
    begin
        OTRec.RESET;
        OTRec.SETRANGE(OTRec."Payroll Period", Per);
        OTRec.SETRANGE(OTRec."Employee No", Emp);
        OTRec.CALCFIELDS(OTRec.VariableAmount);
        EXIT(OTRec.VariableAmount);
    end;
}

