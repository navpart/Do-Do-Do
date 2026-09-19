table 50004 "Payroll-Periods."
{

    fields
    {
        field(1; "Period Code"; Code[10])
        {
            NotBlank = true;


        }
        field(2; "Start Date"; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF Name = '' THEN
                    Name := FORMAT("Start Date", 0, '<MONTH TEXT>, <YEAR4>');
            end;
        }
        field(3; "End Date"; Date)
        {
            NotBlank = true;
        }
        field(4; Name; Text[40])
        {

            trigger OnValidate()
            begin
                IF (1 < CursorPos) AND (CursorPos < MAXSTRLEN("Search Name")) THEN BEGIN
                    "Search Name" := DELCHR(COPYSTR(Name, CursorPos), '<>');
                    "Search Name" := PADSTR("Search Name" + ' ' + DELCHR(COPYSTR(Name, 1, CursorPos - 1), '<>'), MAXSTRLEN("Search Name"));
                END
                ELSE
                    "Search Name" := Name;
            end;
        }
        field(5; Closed; Boolean)
        {
            Editable = false;
        }
        field(6; "Search Name"; Code[20])
        {
        }
        field(7; "ED Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-E/D Codes.";
        }
        field(8; "Employee Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(9; EDAmount; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                     "Employee No" = FIELD("Employee Filter"),
                                                                     "E/D Code" = FIELD("ED Filter"),
                                                                     "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                     "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(10; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(11; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(12; PeriodEDAmount; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Period Code"),
                                                                     "Employee No" = FIELD("Employee Filter"),
                                                                     "E/D Code" = FIELD("ED Filter"),
                                                                     "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                     "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
            FieldClass = FlowField;
        }
        field(13; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Periods.";
        }
        field(15; EDQuantity; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Quantity WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                       "Employee No" = FIELD("Employee Filter"),
                                                                       "E/D Code" = FIELD("ED Filter"),
                                                                       "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                       "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(16; "Mid Month"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Period Code")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    fieldgroups
    {
    }

    var
        CursorPos: Integer;
        LoanRec: Record "Loan.";
        TDRec: Record "Payroll-Periods.";
        Emp: Record Employee;


    procedure "GetTD B/F"(EmpNo: Code[20]; ED: Code[10]): Decimal
    begin
        /*
        IF TDRec.GET(EmpNo,ED) THEN
          EXIT(TDRec."TD Amount B/F")
        ELSE
          EXIT(0);
        */

    end;


    procedure "GetYTD B/F"(Emp: Code[20]; ED: Code[10]): Decimal
    begin
        /*
        IF TDRec.GET(Emp,ED) THEN
          EXIT(TDRec."YTD Amount B/F")
        ELSE
          EXIT(0);
        */

    end;


    procedure AmountTD(EmpNo: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETFILTER(PeriodRec."Period Filter", '..%1', ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);


        /*
        IF TDRec.GET(EmpNo,ED) THEN
          EXIT(PeriodRec.EDAmount) //  EXIT(PeriodRec.EDAmount+TDRec."TD Amount B/F")
        ELSE
        */
        EXIT(PeriodRec.EDAmount);

    end;


    procedure AmountWithinPeriod(EmpNo: Code[20]; ED: Code[10]; FromPer: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", FromPer, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);

        IF (FromPer < '2003-06') THEN FromPer := '2003-06';

        IF (FromPer >= '2003-04') AND (ToPer >= '2003-04') THEN
            IF TDRec.GET(EmpNo, ED) THEN
                EXIT(PeriodRec.EDAmount); //  EXIT(PeriodRec.EDAmount+TDRec."TD Amount B/F")

        EXIT(PeriodRec.EDAmount);
    end;


    procedure AmountYTD(EmpNo: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
        YearStart: Code[10];
    begin
        /*Get Year Start Period*/
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;


        PeriodRec.GET(ToPer);
        PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
        PeriodRec.FIND('-');
        YearStart := PeriodRec."Period Code";

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", YearStart, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);

        //error(PeriodRec.getfilters);

        /*
        IF TDRec.GET(EmpNo,ED) THEN
          EXIT(PeriodRec.EDAmount)  //  EXIT(PeriodRec.EDAmount+TDRec."YTD Amount B/F")
        ELSE
        */

        EXIT(PeriodRec.EDAmount);

    end;


    procedure CurrentAmount(EmpNo: Code[20]; ED: Code[10]; CurPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //IF NOT PeriodRec.GET(CurPer) THEN EXIT(0);

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", CurPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
        EXIT(PeriodRec.EDAmount);
    end;


    procedure QtyTD(EmpNo: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETFILTER(PeriodRec."Period Filter", '..%1', ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);
    end;


    procedure QtyWithinPeriod(EmpNo: Code[20]; ED: Code[10]; FromPer: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", FromPer, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);
    end;


    procedure QtyYTD(EmpNo: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
        YearStart: Code[10];
    begin
        /*Get Year Start Period*/
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;


        PeriodRec.GET(ToPer);
        PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
        PeriodRec.FIND('-');
        YearStart := PeriodRec."Period Code";

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", YearStart, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);

    end;


    procedure CurrentQty(EmpNo: Code[20]; ED: Code[10]; CurPer: Code[10]): Decimal
    var
        EmpRec: Record Employee;
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Employee Filter", EmpNo);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", CurPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);
        EXIT(PeriodRec.EDQuantity);
    end;


    procedure DepAmountTD(Dep: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETFILTER(PeriodRec."Period Filter", '..%1', ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
        EXIT(PeriodRec.EDAmount);
    end;


    procedure DepAmountWithinPeriod(Dep: Code[20]; ED: Code[10]; FromPer: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", FromPer, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);

        /*
        IF (FromPer <'2003-06') THEN FromPer := '2003-06';
        
        IF (FromPer >='2003-04') AND (ToPer >='2003-04') THEN
          IF TDRec.GET(EmpNo,ED) THEN
            EXIT(PeriodRec.EDAmount); //  EXIT(PeriodRec.EDAmount+TDRec."TD Amount B/F")
        */

        EXIT(PeriodRec.EDAmount);

    end;


    procedure DepAmountYTD(Dep: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
        YearStart: Code[10];
    begin
        /*Get Year Start Period*/
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;


        PeriodRec.GET(ToPer);
        PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
        PeriodRec.FIND('-');
        YearStart := PeriodRec."Period Code";

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", YearStart, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);

        EXIT(PeriodRec.EDAmount);

    end;


    procedure DepCurrentAmount(Dep: Code[20]; ED: Code[10]; CurPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", CurPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDAmount);
        EXIT(PeriodRec.EDAmount);
    end;


    procedure DepQtyTD(Dep: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETFILTER(PeriodRec."Period Filter", '..%1', ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);
    end;


    procedure DepQtyWithinPeriod(Dep: Code[20]; ED: Code[10]; FromPer: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", FromPer, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);
    end;


    procedure DepQtyYTD(Dep: Code[20]; ED: Code[10]; ToPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
        YearStart: Code[10];
    begin
        /*Get Year Start Period*/
        PeriodRec.RESET;

        IF ToPer = '' THEN BEGIN
            PeriodRec.SETFILTER(PeriodRec."End Date", '>=%1', CALCDATE('CM', TODAY));
            PeriodRec.FIND('-');
            ToPer := PeriodRec."Period Code";
        END;


        PeriodRec.GET(ToPer);
        PeriodRec.SETRANGE(PeriodRec."End Date", CALCDATE('-CY', PeriodRec."End Date"), PeriodRec."End Date");
        PeriodRec.FIND('-');
        YearStart := PeriodRec."Period Code";

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", YearStart, ToPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);

        EXIT(PeriodRec.EDQuantity);

    end;


    procedure DepCurrentQty(Dep: Code[20]; ED: Code[10]; CurPer: Code[10]): Decimal
    var
        DepRec: Record "Dimension Value";
        PeriodRec: Record "Payroll-Periods.";
    begin
        PeriodRec.RESET;
        //if not PeriodRec.get(CurPer) then exit(0);

        PeriodRec.SETRANGE(PeriodRec."Global Dimension 1 Filter", Dep);
        PeriodRec.SETRANGE(PeriodRec."ED Filter", ED);
        PeriodRec.SETRANGE(PeriodRec."Period Filter", CurPer);
        PeriodRec.CALCFIELDS(PeriodRec.EDQuantity);
        EXIT(PeriodRec.EDQuantity);
    end;
}

