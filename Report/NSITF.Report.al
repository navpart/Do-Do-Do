report 50037 NSITF
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./NSITF.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            CalcFields = EDAmount;
            DataItemTableView = SORTING("Posting Group") WHERE("NSITF Number" = FILTER(<> ''));
            RequestFilterFields = "No.", "Global Dimension 1 Filter", "Period Filter";
            column(TODAY; TODAY)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(CoyInfo__NSITF_Number_; CoyInfo."NSITF Number")
            {
            }
            column(CoyInfo_Name; CoyInfo.Name)
            {
            }
            column(CoyInfo_Address; CoyInfo.Address)
            {
            }
            column(EmptyString; '')
            {
            }
            column(NSTIFEmployee; NSTIFEmployee)
            {
            }
            column(NSTIFEmployer; NSTIFEmployer)
            {
            }
            column(NSTIFEmployee_NSTIFEmployer; NSTIFEmployee + NSTIFEmployer)
            {
            }
            column(GrossPay; GrossPay)
            {
            }
            column(FullName; FullName)
            {
            }
            column(NSTIFEmployee_Control10; NSTIFEmployee)
            {
            }
            column(NSTIFEmployer_Control13; NSTIFEmployer)
            {
            }
            column(NSTIFEmployee_NSTIFEmployer_Control15; NSTIFEmployee + NSTIFEmployer)
            {
            }
            column(GrossPay_Control17; GrossPay)
            {
            }
            column(Employee__NSITF_Number_; "NSITF Number")
            {
            }
            column(Serno; Serno)
            {
            }
            column(EmptyString_Control1000000040; '')
            {
            }
            column(NSTIFEmployee_Control1000000041; NSTIFEmployee)
            {
            }
            column(NSTIFEmployer_Control1000000042; NSTIFEmployer)
            {
            }
            column(NSTIFEmployee_NSTIFEmployer_Control1000000043; NSTIFEmployee + NSTIFEmployer)
            {
            }
            column(GrossPay_Control1000000044; GrossPay)
            {
            }
            column(TotalAmount_for_the_period________Payroll_Period_; 'TotalAmount for the period : ' + "Payroll Period")
            {
            }
            column(NSTIFEmployee_Control1000000008; NSTIFEmployee)
            {
            }
            column(NSTIFEmployer_Control1000000009; NSTIFEmployer)
            {
            }
            column(NSTIFEmployee_NSTIFEmployer_Control1000000010; NSTIFEmployee + NSTIFEmployer)
            {
            }
            column(GrossPay_Control1000000011; GrossPay)
            {
            }
            column(NIGERIA_SOCIAL_INSURANCE_TRUST_FUNDCaption; NIGERIA_SOCIAL_INSURANCE_TRUST_FUNDCaptionLbl)
            {
            }
            column(LOCATION__Caption; LOCATION__CaptionLbl)
            {
            }
            column(PLOT_794__MOHD__BUHARI_WAY__P_M_B___GARKI__ABUJA_Caption; PLOT_794__MOHD__BUHARI_WAY__P_M_B___GARKI__ABUJA_CaptionLbl)
            {
            }
            column(SCHEDULE_OF_CONTRIBUTIONCaption; SCHEDULE_OF_CONTRIBUTIONCaptionLbl)
            {
            }
            column(Report_print_date_Caption; Report_print_date_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(ZONECaption; ZONECaptionLbl)
            {
            }
            column(ISOLOCaption; ISOLOCaptionLbl)
            {
            }
            column(MONTH_OF_REPORTING_Caption; MONTH_OF_REPORTING_CaptionLbl)
            {
            }
            column(STATE_OF_OPERATION__Caption; STATE_OF_OPERATION__CaptionLbl)
            {
            }
            column(MAINLANDCaption; MAINLANDCaptionLbl)
            {
            }
            column(LAGOSCaption; LAGOSCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption; EMPLOYER_NOCaptionLbl)
            {
            }
            column(NAMECaption; NAMECaptionLbl)
            {
            }
            column(ADDRESSCaption; ADDRESSCaptionLbl)
            {
            }
            column(S_NCaption; S_NCaptionLbl)
            {
            }
            column(NSITF_NumberCaption; NSITF_NumberCaptionLbl)
            {
            }
            column(NameCaption_Control1000000002; NameCaption_Control1000000002Lbl)
            {
            }
            column(Gross_PayCaption; Gross_PayCaptionLbl)
            {
            }
            column(Employee_ContributionCaption; Employee_ContributionCaptionLbl)
            {
            }
            column(Employer_ContributionCaption; Employer_ContributionCaptionLbl)
            {
            }
            column(Total_ContributionCaption; Total_ContributionCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                GrossPay := GetAmount(GrossED);
                NSTIFEmployee := GetAmount(NSITFEmployeeED);
                NSTIFEmployer := GetAmount(NSITFEmployerED);
            end;

            trigger OnPreDataItem()
            begin
                CoyInfo.GET;

                Serno := 0;

                Edcodes.RESET;
                Edcodes.SETRANGE(Edcodes."ED Type", Edcodes."ED Type"::"NSITF Employee");
                IF Edcodes.FIND('-') THEN NSITFEmployeeED := Edcodes."E/D Code";

                Edcodes.RESET;
                Edcodes.SETRANGE(Edcodes."ED Type", Edcodes."ED Type"::"NSITF Employer");
                IF Edcodes.FIND('-') THEN NSITFEmployerED := Edcodes."E/D Code";

                Edcodes.RESET;
                Edcodes.SETRANGE(Edcodes."ED Type", Edcodes."ED Type"::"NSITF Gross");
                IF Edcodes.FIND('-') THEN GrossED := Edcodes."E/D Code";

                //CurrReport.CREATETOTALS(GrossPay, NSTIFEmployee, NSTIFEmployer);

                "Payroll Period" := Employee.GETRANGEMIN(Employee."Period Filter");

                PeriodRec.GET("Payroll Period");
                PeriodText := PeriodRec.Name;
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
        Serno := 0;
    end;

    var
        "Payroll Period": Code[10];
        GrossPay: Decimal;
        GrossPayTot: Decimal;
        GrossPayGTot: Decimal;
        NSTIFEmployee: Decimal;
        NSITFEmplTot: Decimal;
        NSITFEmplGTot: Decimal;
        NSITFEmplrTot: Decimal;
        NSITFEmplrGTot: Decimal;
        NSTIFEmployer: Decimal;
        Serno: Integer;
        PayslipLineRec: Record 50006;
        GrossED: Code[10];
        NSITFEmployeeED: Code[10];
        NSITFEmployerED: Code[10];
        Edcodes: Record 50001;
        PeriodText: Text[30];
        PeriodRec: Record 50004;
        CoyInfo: Record 79;
        HPrinted: Boolean;
        NIGERIA_SOCIAL_INSURANCE_TRUST_FUNDCaptionLbl: Label 'NIGERIA SOCIAL INSURANCE TRUST FUND';
        LOCATION__CaptionLbl: Label 'LOCATION :';
        PLOT_794__MOHD__BUHARI_WAY__P_M_B___GARKI__ABUJA_CaptionLbl: Label 'PLOT 794, MOHD. BUHARI WAY, P.M.B , GARKI, ABUJA.';
        SCHEDULE_OF_CONTRIBUTIONCaptionLbl: Label 'SCHEDULE OF CONTRIBUTION';
        Report_print_date_CaptionLbl: Label 'Report print date:';
        PageCaptionLbl: Label 'Page';
        ZONECaptionLbl: Label 'ZONE';
        ISOLOCaptionLbl: Label 'ISOLO';
        MONTH_OF_REPORTING_CaptionLbl: Label 'MONTH OF REPORTING:';
        STATE_OF_OPERATION__CaptionLbl: Label 'STATE OF OPERATION :';
        MAINLANDCaptionLbl: Label 'MAINLAND';
        LAGOSCaptionLbl: Label 'LAGOS';
        EMPLOYER_NOCaptionLbl: Label 'EMPLOYER NO';
        NAMECaptionLbl: Label 'NAME';
        ADDRESSCaptionLbl: Label 'ADDRESS';
        S_NCaptionLbl: Label 'S/N';
        NSITF_NumberCaptionLbl: Label 'NSITF Number';
        NameCaption_Control1000000002Lbl: Label 'Name';
        Gross_PayCaptionLbl: Label 'Gross Pay';
        Employee_ContributionCaptionLbl: Label 'Employee Contribution';
        Employer_ContributionCaptionLbl: Label 'Employer Contribution';
        Total_ContributionCaptionLbl: Label 'Total Contribution';

    procedure GetAmount(ED: Code[20]): Decimal
    begin
        //Employee.SETRANGE(Employee."Period Filter","Payroll Period");
        Employee.SETRANGE(Employee."ED Filter", ED);
        Employee.CALCFIELDS(Employee.EDAmount);
        EXIT(Employee.EDAmount)
    end;
}

