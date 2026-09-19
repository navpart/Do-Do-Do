report 50153 "Employee Tax Records"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./EmployeeTaxRecords.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            CalcFields = EDAmount;
            DataItemTableView = SORTING("Global Dimension 1 Code", "Global Dimension 2 Code");
            RequestFilterFields = "No.", "Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Period_______PerName; 'Period : ' + PerName)
            {
            }
            column(Filters_______Employee_GETFILTERS__; 'Filters - ' + Employee.GETFILTERS())
            {
            }
            column(PGrpName_____Staff_Payroll_; PGrpName + ' Staff Payroll')
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
            column(TaxYTD; TaxYTD)
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(Employee_FullName; Employee.FullName)
            {
            }
            column(GrossTaxableNow; GrossTaxableNow)
            {
            }
            column(GrossTaxableYTD; GrossTaxableYTD)
            {
            }
            column(TaxFreeYTD; TaxFreeYTD)
            {
            }
            column(TaxNow; TaxNow)
            {
            }
            column(BCCount; BCCount)
            {
            }
            column(CCCount; CCCount)
            {
            }
            column(TaxYTD_Control46; TaxYTD)
            {
            }
            column(GrossTaxableNow_Control49; GrossTaxableNow)
            {
            }
            column(GrossTaxableYTD_Control50; GrossTaxableYTD)
            {
            }
            column(TaxFreeYTD_Control51; TaxFreeYTD)
            {
            }
            column(TaxNow_Control52; TaxNow)
            {
            }
            column(EMPLOYEE_TAX_RECORDSCaption; EMPLOYEE_TAX_RECORDSCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Employee_FullNameCaption; Employee_FullNameCaptionLbl)
            {
            }
            column(Gross_Taxable_This_MonthCaption; Gross_Taxable_This_MonthCaptionLbl)
            {
            }
            column(Gross_Taxable_YTDCaption; Gross_Taxable_YTDCaptionLbl)
            {
            }
            column(Tax_This_MonthCaption; Tax_This_MonthCaptionLbl)
            {
            }
            column(Tax_YTDCaption; Tax_YTDCaptionLbl)
            {
            }
            column(Tax_Free_YTDCaption; Tax_Free_YTDCaptionLbl)
            {
            }
            column(Employee__Global_Dimension_2_Code_Caption; FIELDCAPTION("Global Dimension 2 Code"))
            {
            }
            column(Employee__Global_Dimension_1_Code_Caption; FIELDCAPTION("Global Dimension 1 Code"))
            {
            }
            column(Employees_In_Budget_CenterCaption; Employees_In_Budget_CenterCaptionLbl)
            {
            }
            column(Employees_In_Cost_CenterCaption; Employees_In_Cost_CenterCaptionLbl)
            {
            }
            column(Cost_Center_TotalCaption; Cost_Center_TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                EmpName := Employee.FullName;
                BasicPay := EmpGrp.GetBasic(Employee."Employee Group");
                Grd := EmpGrp.GetGrade(Employee."Employee Group");
                Stp := EmpGrp.GetStep(Employee."Employee Group");

                IF DesigRec.GET(Employee.Designation) THEN
                    DesigName := DesigRec.Description
                ELSE
                    DesigName := '';

                /*Get ED Codes*/
                EDRec.SETRANGE(EDRec."Payslip Group ID", EDRec."Payslip Group ID"::"TAXABLE PAY");
                EDRec.FIND('-');
                GTCode := EDRec."E/D Code";

                EDRec.SETRANGE(EDRec."Payslip Group ID", EDRec."Payslip Group ID"::"TAX FREE PAY");
                EDRec.FIND('-');
                TFCode := EDRec."E/D Code";

                EDRec.SETRANGE(EDRec."Payslip Group ID", EDRec."Payslip Group ID"::"TAX DEDUCTED");
                EDRec.FIND('-');
                TCode := EDRec."E/D Code";

                /*Get Current Amounts*/
                //ERROR('=='+Employee."No." + '==');

                Emp2.GET(Employee."No.");
                Emp2.SETFILTER(Emp2."Period Filter", PerCode);

                Emp2.SETFILTER(Emp2."ED Filter", GTCode);
                Emp2.CALCFIELDS(Emp2.EDAmount);
                GrossTaxableNow := Emp2.EDAmount;

                Emp2.SETFILTER(Emp2."Period Filter", PerCode);
                Emp2.SETFILTER(Emp2."ED Filter", TCode);
                Emp2.CALCFIELDS(Emp2.EDAmount);
                TaxNow := Emp2.EDAmount;




                /*Get YTD Amounts*/
                GrossTaxableYTD := PayLines.EDAmountToDate(Employee."No.", PerCode, GTCode) + Employee."Gross Taxable YTD B/F";
                //  TaxFreeYTD      := PayLines.EDAmountToDate(Employee."No.",PerCode,TFCode) + Employee."Tax FreePay YTD B/F";
                TaxFreeYTD := Employee."Annual Tax Freepay" / 12 * MCount;

                TaxYTD := PayLines.EDAmountToDate(Employee."No.", PerCode, TCode) + Employee."Tax Paid YTD B/F";

                IF (GrossTaxableNow = 0) AND
                   (GrossTaxableYTD = 0) AND
                   (TaxFreeYTD = 0) AND
                   (TaxYTD = 0) AND
                   (TaxNow = 0)
                   THEN
                    CurrReport.SKIP;

                /*Count Employees*/
                EmpRec.COPYFILTERS(Employee);
                EmpRec.SETRANGE(EmpRec."Global Dimension 1 Code", Employee."Global Dimension 1 Code");
                BCCount := EmpRec.COUNT;
                EmpRec.SETRANGE(EmpRec."Global Dimension 2 Code", Employee."Global Dimension 2 Code");
                CCCount := EmpRec.COUNT;

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Global Dimension 2 Code");
                BCCount := 0;
                CCCount := 0;

                IF PerRec.GET(PerCode) THEN
                    PerName := PerRec.Name
                ELSE
                    ERROR('Please Indicate the Payroll Period In The Option Tab!');


                //CurrReport.CREATETOTALS(GrossTaxableNow, GrossTaxableYTD, TaxFreeYTD, TaxNow, TaxYTD);

                PStart := PerRec."Start Date";
                Per2.RESET;
                Per2.SETRANGE(Per2."Start Date", CALCDATE('-CY', PerRec."Start Date"), PerRec."Start Date");
                MCount := Per2.COUNT;
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
        EmpGrp: Record 50009;
        BasicPay: Decimal;
        EmpName: Text[100];
        Grd: Code[2];
        Stp: Code[2];
        DesigName: Text[30];
        DesigRec: Record 50021;
        Dy: Integer;
        Mt: Integer;
        Yr: Integer;
        DStr: Code[2];
        CCCount: Integer;
        BCCount: Integer;
        EmpRec: Record 5200;
        BCName: Text[30];
        CCName: Text[30];
        GrossTaxableNow: Decimal;
        GrossTaxableYTD: Decimal;
        TaxFreeYTD: Decimal;
        TaxNow: Decimal;
        TaxYTD: Decimal;
        EDRec: Record 50001;
        GTCode: Code[10];
        TFCode: Code[10];
        TCode: Code[10];
        PayLines: Record 50006;
        PerCode: Code[10];
        PerRec: Record 50004;
        PerName: Text[30];
        Emp2: Record 5200;
        "Show All": Boolean;
        PGrpRec: Record 50011;
        PGrpName: Text[30];
        MCount: Integer;
        PStart: Date;
        Per2: Record 50004;
        EMPLOYEE_TAX_RECORDSCaptionLbl: Label 'EMPLOYEE TAX RECORDS';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_FullNameCaptionLbl: Label 'Name';
        Gross_Taxable_This_MonthCaptionLbl: Label 'Gross Taxable This Month';
        Gross_Taxable_YTDCaptionLbl: Label 'Gross Taxable YTD';
        Tax_This_MonthCaptionLbl: Label 'Tax This Month';
        Tax_YTDCaptionLbl: Label 'Tax YTD';
        Tax_Free_YTDCaptionLbl: Label 'Tax Free YTD';
        Employees_In_Budget_CenterCaptionLbl: Label 'Employees In Budget Center';
        Employees_In_Cost_CenterCaptionLbl: Label 'Employees In Cost Center';
        Cost_Center_TotalCaptionLbl: Label 'Cost Center Total';

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
}

