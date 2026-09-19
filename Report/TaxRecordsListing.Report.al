report 50154 "Tax Records Listing"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./TaxRecordsListing.rdl';
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
            column(TAX_RECORDS_LISTINGCaption; TAX_RECORDS_LISTINGCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__Global_Dimension_2_Code_Caption; FIELDCAPTION("Global Dimension 2 Code"))
            {
            }
            column(Employee__Global_Dimension_1_Code_Caption; FIELDCAPTION("Global Dimension 1 Code"))
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(MonthCaption; MonthCaptionLbl)
            {
            }
            column(Taxable_Y_T_DCaption; Taxable_Y_T_DCaptionLbl)
            {
            }
            column(Tax_Paid_Y_T_DCaption; Tax_Paid_Y_T_DCaptionLbl)
            {
            }
            column(TaxCaption; TaxCaptionLbl)
            {
            }
            column(Annual_Free_PayCaption; Annual_Free_PayCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }
            dataitem("Payroll-Periods."; "Payroll-Periods.")
            {
                CalcFields = EDAmount;
                RequestFilterFields = "Period Code";
                column(TaxYTD; TaxYTD)
                {
                }
                column(Employee__No__; Employee."No.")
                {
                }
                column(Pname; Pname)
                {
                }
                column(Payroll_Periods___Period_Code_; "Period Code")
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
                column(TaxYTD_Control7; TaxYTD)
                {
                }
                column(Payroll_Periods___Period_Code__Control14; "Period Code")
                {
                }
                column(GrossTaxableYTD_Control16; GrossTaxableYTD)
                {
                }
                column(TaxFreeYTD_Control17; TaxFreeYTD)
                {
                }
                column(TaxNow_Control19; TaxNow)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT (PayHdr.GET("Payroll-Periods."."Period Code", Employee."No.")) THEN
                        CurrReport.SKIP;

                    "Payroll-Periods.".SETRANGE("Payroll-Periods."."Employee Filter", Employee."No.");
                    "Payroll-Periods.".SETRANGE("Payroll-Periods."."ED Filter", TCode);
                    "Payroll-Periods.".CALCFIELDS("Payroll-Periods.".EDAmount);
                    TaxNow := "Payroll-Periods.".EDAmount;

                    /*Get YTD Amounts*/
                    GrossTaxableYTD := PayLines.EDAmountToDate(Employee."No.", "Payroll-Periods."."Period Code", GTCode) +
                                                  Employee."Gross Taxable YTD B/F";
                    TaxFreeYTD := PayLines.EDAmountToDate(Employee."No.", "Payroll-Periods."."Period Code", TFCode) +
                                                  Employee."Tax FreePay YTD B/F";
                    TaxYTD := PayLines.EDAmountToDate(Employee."No.", "Payroll-Periods."."Period Code", TCode) +
                                                Employee."Tax Paid YTD B/F";
                    tTaxFreeYTD := tTaxFreeYTD + TaxFreeYTD;
                    tTaxNow := tTaxNow + TaxNow;
                    tTaxYTD := tTaxYTD + TaxYTD;
                    tGrossTaxableYTD := tGrossTaxableYTD + GrossTaxableYTD;

                end;
            }
            dataitem(DataItem5444; Integer)
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Global Dimension 2 Code");
                BCCount := 0;
                CCCount := 0;

                IF PerRec.GET(PerCode) THEN
                    PerName := PerRec.Name
                ELSE
                    ERROR('Please Indicate the Payroll Period In The Option Tab!');

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

    trigger OnInitReport()
    begin
        pn := '';
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
        Dy: Integer;
        Mt: Integer;
        Yr: Integer;
        DStr: Code[2];
        CCCount: Integer;
        BCCount: Integer;
        EmpRec: Record 5200;
        BCName: Text[50];
        CCName: Text[50];
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
        CTax: Decimal;
        PayHdr: Record 50007;
        pn: Code[20];
        Pname: Text[50];
        tGrossTaxableYTD: Decimal;
        tTaxFreeYTD: Decimal;
        tTaxNow: Decimal;
        tTaxYTD: Decimal;
        TAX_RECORDS_LISTINGCaptionLbl: Label 'TAX RECORDS LISTING';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        No_CaptionLbl: Label 'No.';
        NameCaptionLbl: Label 'Name';
        MonthCaptionLbl: Label 'Month';
        Taxable_Y_T_DCaptionLbl: Label 'Taxable Y-T-D';
        Tax_Paid_Y_T_DCaptionLbl: Label 'Tax Paid Y-T-D';
        TaxCaptionLbl: Label 'Tax';
        Annual_Free_PayCaptionLbl: Label 'Annual Free Pay';

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

