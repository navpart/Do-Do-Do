report 50039 NHF
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout./NHF.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            CalcFields = EDAmount;
            DataItemTableView = SORTING("Posting Group") WHERE("NHF Number" = FILTER(<> ''), Blocked = CONST(false));
            RequestFilterFields = "No.", "Global Dimension 1 Filter", "Period Filter";
            column(TODAY; TODAY)
            {
            }
            column(PeriodText; PeriodText)
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
            column(NHFEmployee; NHFEmployee)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(FullName; FullName)
            {
            }
            column(NHFEmployee_Control10; NHFEmployee)
            {
            }
            column(BasicPay_Control17; BasicPay)
            {
            }
            column(Employee__NHF_Number_; "NHF Number")
            {
            }
            column(Serno; Serno)
            {
            }
            column(EmptyString_Control1000000040; '')
            {
            }
            column(NHFEmployee_Control1000000041; NHFEmployee)
            {
            }
            column(BasicPay_Control1000000044; BasicPay)
            {
            }
            column(TotalAmount_for_the_period________Payroll_Period_; 'TotalAmount for the period : ' + "Payroll Period")
            {
            }
            column(NHFEmployee_Control1000000008; NHFEmployee)
            {
            }
            column(BasicPay_Control1000000011; BasicPay)
            {
            }
            column(NATIONAL_HOUSING_FUNDCaption; NATIONAL_HOUSING_FUNDCaptionLbl)
            {
            }
            column(LOCATION__Caption; LOCATION__CaptionLbl)
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
            column(NHF_NumberCaption; NHF_NumberCaptionLbl)
            {
            }
            column(NameCaption_Control1000000002; NameCaption_Control1000000002Lbl)
            {
            }
            column(Basic_PayCaption; Basic_PayCaptionLbl)
            {
            }
            column(Employee_ContributionCaption; Employee_ContributionCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                BasicPay := Employee.GetBasic(Employee."No.");
                NHFEmployee := GetAmount(NHFEmployeeED);
            end;

            trigger OnPreDataItem()
            begin
                CoyInfo.GET;

                Serno := 0;

                Edcodes.RESET;
                Edcodes.SETRANGE(Edcodes."ED Type", Edcodes."ED Type"::NHF);
                IF Edcodes.FIND('-') THEN NHFEmployeeED := Edcodes."E/D Code";

                //CurrReport.CREATETOTALS(BasicPay, NHFEmployee);

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
        BasicPay: Decimal;
        GrossPayTot: Decimal;
        GrossPayGTot: Decimal;
        NHFEmployee: Decimal;
        NHFEmplTot: Decimal;
        NHFEmplGTot: Decimal;
        NHFEmplrTot: Decimal;
        NHFEmplrGTot: Decimal;
        NHFEmployer: Decimal;
        Serno: Integer;
        PayslipLineRec: Record 50006;
        BasicED: Code[10];
        NHFEmployeeED: Code[10];
        NHFEmployerED: Code[10];
        Edcodes: Record 50001;
        PeriodText: Text[30];
        PeriodRec: Record 50004;
        CoyInfo: Record 79;
        HPrinted: Boolean;
        NATIONAL_HOUSING_FUNDCaptionLbl: Label 'NATIONAL HOUSING FUND';
        LOCATION__CaptionLbl: Label 'LOCATION :';
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
        NHF_NumberCaptionLbl: Label 'NHF Number';
        NameCaption_Control1000000002Lbl: Label 'Name';
        Basic_PayCaptionLbl: Label 'Basic Pay';
        Employee_ContributionCaptionLbl: Label 'Employee Contribution';

    procedure GetAmount(ED: Code[20]): Decimal
    begin

        Employee.SETRANGE(Employee."ED Filter", ED);
        Employee.CALCFIELDS(Employee.EDAmount);
        EXIT(Employee.EDAmount)
    end;
}

