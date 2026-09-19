report 50051 "Create New Payslips"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Posting Group", "Employee Group";

            trigger OnAfterGetRecord()
            begin

                IF Employee.Blocked THEN CurrReport.SKIP;
                Window.UPDATE(2, "No.");
                InfoCounter := InfoCounter + 1;
                Window.UPDATE(3, InfoCounter);

                IF PreviousIsJoiner THEN BEGIN
                    PreviousIsJoiner := FALSE;
                END;

                IF Employee."Employment Date" <> 0D THEN BEGIN
                    IF (DATE2DMY(Employee."Employment Date", 3) = DATE2DMY(PayPeriodRec."End Date", 3)) THEN BEGIN
                        IF (PayrollMonthofDate(Employee."Employment Date") > 1) THEN BEGIN
                            Skipped := PayrollMonthofDate(Employee."Employment Date") - 1;
                            PreviousIsJoiner := TRUE;
                        END;
                    END;
                END;
                IF NOT PayHeadRec.GET(PayPeriodRec."Period Code", "No.") THEN BEGIN

                    //{ Create the header record }
                    PayHeadRec."Payroll Period" := PayPeriodRec."Period Code";
                    PayHeadRec."Employee No" := "No.";
                    PayHeadRec."Posting Group" := "Posting Group";
                    BEGIN
                        PayHeadRec."Period Start" := PayPeriodRec."Start Date";
                        PayHeadRec."Period End" := PayPeriodRec."End Date";
                        PayHeadRec."Period Name" := PayPeriodRec.Name;
                    END;

                    BEGIN
                        PayHeadRec."Employee Name" := FullName;
                        PayHeadRec.Grade := Employee.Grade;
                        PayHeadRec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                        PayHeadRec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                        PayHeadRec."Customer Number" := Employee."SAM Number";
                        PayHeadRec.Designation := Designation;
                    END;
                    PayHeadRec.INSERT;

                    /* Create the payroll entry lines.
                    The entries are copied from the employee group entry lines.*/

                    //Send The Emolument Lines
                    SendEmol;

                    /* Delimit the Employee group lines appropriately */
                    EmpGrpLinesRec.INIT;
                    EmpGrpLinesRec.SETRANGE("E/D Code");
                    EmpGrpLinesRec.SETRANGE("Employee Group");
                    EmpGrpLinesRec."Employee Group" := "Employee Group";
                    EmpGrpLinesRec."E/D Code" := '';
                    EmpGrpLinesRec.SETRANGE("Employee Group", "Employee Group");

                    IF NOT (EmpGrpLinesRec.COUNT = 0) THEN BEGIN

                        /* Lock the Payroll Lines Entry file */
                        // PayLinesRec.LOCKTABLE(FALSE);
                        PayLinesRec.SETRANGE("E/D Code");

                        /* Transfer the E/D lines from Employe Group lines to Payroll Lines */
                        EmpGrpLinesRec.FIND('>');
                        BEGIN
                            PayLinesRec."Payroll Period" := PayHeadRec."Payroll Period";
                            PayLinesRec."Employee No" := PayHeadRec."Employee No";
                        END;
                        REPEAT /*WHILE (EmpGrpLinesRec."Employee Group" = "Employee Group") */
                            RecRate := 0;
                            RecQty := 0;
                            PayLinesRec.INIT;
                            EDFileRec.GET(EmpGrpLinesRec."E/D Code");

                            /******  Begins Overtime & Other VAriables Calculation SGG  **********/
                            /*
                             PaySetup.RESET;
                             Pa ySetup.FIND('-');
                             TaxFreeED := PaySetup."Taxfree Pay ED";
                             MonthlyDays := PaySetup."Monthly Working Days";
                             HrsInDay := PaySetup."Daily Working Hours";
                            */

                            //      FOR Cummulative Tax System

                            SendLines(TaxFreeED, Employee."Annual Tax Freepay" / 12, 0, 0);

                            VarRec.RESET;
                            VarRec.SETFILTER(VarRec."Payroll Period", PayLinesRec."Payroll Period" + '|''''');
                            VarRec.SETRANGE(VarRec."Employee No", PayLinesRec."Employee No");
                            IF VarRec.FIND('-') THEN
                                REPEAT
                                    SendLines(VarRec."E/D Code", VarRec.Amount, VarRec.Quantity, VarRec.Rate);
                                UNTIL (VarRec.NEXT = 0);


                            /******  Overtime & Other VAriables Calculation Ends SGG  **********/

                            EDFileRec.GET(EmpGrpLinesRec."E/D Code");
                            PayLinesRec."E/D Code" := EmpGrpLinesRec."E/D Code";

                            BEGIN
                                PayLinesRec."Payslip Group ID" := EDFileRec."Payslip Group ID";
                                PayLinesRec."ED Type" := EDFileRec."ED Type";
                                PayLinesRec."Control Type" := EDFileRec."Control Type";
                                PayLinesRec."Pos. In Payslip Grp." := EDFileRec."Pos. In Payslip Grp.";
                                PayLinesRec."Payslip appearance" := EDFileRec."Payslip appearance";
                                PayLinesRec.Units := EDFileRec.Units;
                                PayLinesRec.Rate := EDFileRec.Rate;
                                PayLinesRec."Overline Column" := EDFileRec."Overline Column";
                                PayLinesRec."Payslip Print Column" := EDFileRec."Payslip Print Column";
                                PayLinesRec."Underline Amount" := EDFileRec."Underline Amount";
                                PayLinesRec.Grade := Employee.Grade;
                            END;        /* Payslip Grp/Pos */
                            BEGIN
                                PayLinesRec."E/D Code" := EmpGrpLinesRec."E/D Code";
                                PayLinesRec.Units := EmpGrpLinesRec.Units;
                                PayLinesRec.Rate := EmpGrpLinesRec.Rate;
                                PayLinesRec.Quantity := EmpGrpLinesRec.Quantity;
                                PayLinesRec.Flag := EmpGrpLinesRec.Flag;
                                PayLinesRec.Amount := EmpGrpLinesRec."Default Amount";
                            END;   /* Rate,Units,Amount,... */

                            PayDays := MonthlyDays;
                            IF (Employee."No of Days") <> 0 THEN PayDays := Employee."No of Days";
                            //AWDays := PayDays;          //GenPCode.GetNoOfDays(PayPeriodRec."Start Date",PayPeriodRec."End Date");
                            IF (EDFileRec."Work Days Dependent") THEN BEGIN
                                PayLinesRec.VALIDATE(Quantity, PayDays);
                                //MESSAGE(EmpGrpLinesRec."E/D Code"+'==>'+PayLinesRec."E/D Code"+'==='+FORMAT(EmpGrpLinesRec.Rate));
                                //PayLinesRec.Amount := EmpGrpLinesRec.Quantity*PayDays;
                                //COMMIT;
                                //CurrReport.QUIT;
                            END;


                            PayLinesRec."Sequence No" := EDFileRec."Sequence No";   // Payslip sequence

                            IF BookGrLinesRec.GET("Posting Group", PayLinesRec."E/D Code")
                            THEN BEGIN
                                BEGIN
                                    PayLinesRec."Debit Account" := BookGrLinesRec."Debit Account No.";
                                    PayLinesRec."Credit Account" := BookGrLinesRec."Credit Account No.";
                                    PayLinesRec."Debit Acc. Type" := BookGrLinesRec."Debit Acc. Type";
                                    PayLinesRec."Credit Acc. Type" := BookGrLinesRec."Credit Acc. Type";
                                    //PayLinesRec."Region Code";:= Employee."Region Code";;
                                    PayLinesRec."Global Dimension 1 Code" := "Global Dimension 1 Code";
                                    PayLinesRec."Global Dimension 2 Code" := "Global Dimension 2 Code";

                                END; /* Debit/Credit accounts*/

                                IF BookGrLinesRec."Transfer Department Code" THEN
                                    PayLinesRec."Global Dimension 1 Code" := "Global Dimension 1 Code";
                                IF BookGrLinesRec."Transfer Project Code" THEN
                                    PayLinesRec."Global Dimension 2 Code" := "Global Dimension 2 Code";

                                IF (EmpGrpLinesRec."Default Amount" <> 0) OR (EDFileRec."Monthly Variable") OR
                                   (EDFileRec."Work Days Dependent") THEN BEGIN
                                    PayLinesRec.VALIDATE(PayLinesRec."E/D Code");

                                    IF (PayDays <> MonthlyDays) AND (EDFileRec.Prorate) THEN BEGIN
                                        IF PayDays > MonthlyDays THEN
                                            ERROR('Employee worked more than Monthly working days');
                                        IF NOT (EDFileRec."Absent Deduction") THEN
                                            PayLinesRec.Amount := ROUND((PayDays / MonthlyDays) * PayLinesRec.Amount);
                                    END;
                                    PayLinesRec."Posting Group" := Employee."Posting Group";
                                    IF PayLinesRec.INSERT(TRUE) THEN;
                                    //PayLinesRec.VALIDATE("E/D Code");
                                END;
                                PayLinesRec.VALIDATE("E/D Code");
                            END;
                        UNTIL (EmpGrpLinesRec.NEXT = 0);
                    END;

                    //Loan system START

                    //PayLinesRec.LOCKTABLE(FALSE);
                    PayLinesRec.SETRANGE("E/D Code");

                    LoanRec.SETCURRENTKEY(LoanRec."Staff No.", LoanRec."Start Period", LoanRec."Open(Y/N)", LoanRec."Suspended(Y/N)");
                    LoanRec.SETRANGE(LoanRec."Staff No.", Employee."No.");
                    LoanRec.SETFILTER(LoanRec."Start Period", '<=%1', PayPeriodRec."Period Code");
                    LoanRec.SETRANGE(LoanRec."Open(Y/N)", TRUE);
                    LoanRec.SETRANGE("Suspended(Y/N)", FALSE);
                    IF LoanRec.FIND('-') THEN
                        REPEAT
                            LoanRec.CALCFIELDS(LoanRec."Remaining Amount");
                            IF LoanRec."Remaining Amount" > 0 THEN BEGIN

                                PayLinesRec.INIT;
                                PayLinesRec."Payroll Period" := PayHeadRec."Payroll Period";
                                PayLinesRec."Employee No" := PayHeadRec."Employee No";
                                EDFileRec.GET(LoanRec."Loan ED Regular");
                                PayLinesRec."E/D Code" := LoanRec."Loan ED Regular";
                                PayLinesRec."Payslip Text" := LoanRec.Description;
                                PayLinesRec."Payslip Group ID" := EDFileRec."Payslip Group ID";
                                PayLinesRec."Payslip Group ID" := EDFileRec."Payslip Group ID";
                                PayLinesRec."ED Type" := EDFileRec."ED Type";
                                PayLinesRec."Control Type" := EDFileRec."Control Type";

                                PayLinesRec."Pos. In Payslip Grp." := EDFileRec."Pos. In Payslip Grp.";
                                PayLinesRec."Payslip appearance" := EDFileRec."Payslip appearance";
                                PayLinesRec.Units := EDFileRec.Units;
                                PayLinesRec.Rate := EDFileRec.Rate;
                                PayLinesRec."Overline Column" := EDFileRec."Overline Column";
                                PayLinesRec."Payslip Print Column" := EDFileRec."Payslip Print Column";
                                PayLinesRec."Underline Amount" := EDFileRec."Underline Amount";
                                PayLinesRec.Quantity := EmpGrpLinesRec.Quantity;
                                PayLinesRec.Flag := EmpGrpLinesRec.Flag;
                                PayLinesRec."Sequence No" := EDFileRec."Sequence No";   // Payslip sequence
                                PayLinesRec.Grade := Employee.Grade;
                                IF LoanRec."Monthly Repayment" > LoanRec."Remaining Amount" THEN
                                    PayLinesRec.Amount := LoanRec."Remaining Amount" ELSE
                                    PayLinesRec.Amount := LoanRec."Monthly Repayment";
                                PayLinesRec."Debit Acc. Type" := LoanRec."Counter Acct. Type";
                                PayLinesRec."Credit Acc. Type" := LoanRec."Acct. Type";
                                PayLinesRec."Debit Account" := LoanRec."Counter Acct. No.";
                                IF LoanRec."Acct. No." <> '' THEN
                                    PayLinesRec."Credit Account" := LoanRec."Acct. No."
                                ELSE
                                    PayLinesRec."Credit Account" := '';
                                //     PayLinesRec.Region    := Employee."Business Unit";
                                PayLinesRec."Global Dimension 1 Code" := "Global Dimension 1 Code";
                                PayLinesRec."Global Dimension 2 Code" := "Global Dimension 2 Code";
                                PayLinesRec."Loan ID" := LoanRec."Loan ID";

                                PayLinesRec."Posting Group" := Employee."Posting Group";
                                IF PayLinesRec.INSERT(TRUE) THEN;
                                PayLinesRec."Loan ID" := LoanRec."Loan ID";
                                PayLinesRec.MODIFY(TRUE);
                                COMMIT;
                            END; /*END FOR CHECK ON REMAINING AMOUNT=0*/
                        UNTIL (LoanRec.NEXT = 0);


                    //Loan system FINISH

                    COMMIT;
                END;

            end;

            trigger OnPreDataItem()
            begin

                PreviousIsJoiner := FALSE;
                //GetTaxTable; // Normalize the tax table for the current month

                Window.OPEN('Total Employees Selected : #1##########\' +
                             'Current Employee Number  : #2##########\' +
                             'Counter                  : #3##########');
                Window.UPDATE(1, COUNT);
                InfoCounter := 0;

                /***** For Cummulative Tax System Only *****/
                EDSetup.RESET;
                EDSetup.SETRANGE(EDSetup."Payslip Group ID", EDSetup."Payslip Group ID"::"TAX FREE PAY");
                EDSetup.FIND('-');
                TaxFreeED := EDSetup."E/D Code";//PaySetup."Taxfree Pay ED";

                PaySetup.GET;
                MonthlyDays := PaySetup."Monthly Working Days";
                HrsInDay := PaySetup."Monthly Working Hours";

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Period Code"; PayPeriodRec."Period Code")
                {
                    TableRelation = "Payroll-Periods.";
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

    trigger OnInitReport()
    begin
        IF NOT CONFIRM('Is the Monthly Working days correct in the Payroll Setup?', TRUE) THEN
            ERROR('');
    end;

    trigger OnPreReport()
    begin

        PayPeriodRec.GET(PayPeriodRec."Period Code");
        PayPeriodRec.SETRANGE("Period Code", PayPeriodRec."Period Code");
        EmpGrpLinesRec.SETRANGE("Employee Group");
        EmpGrpLinesRec.SETRANGE("E/D Code");
        PayLinesRec.SETRANGE("Payroll Period");
        PayLinesRec.SETRANGE("Employee No");
        PayLinesRec.SETRANGE("E/D Code");
    end;

    var
        "day Employeed": Integer;
        PayPeriodRec: Record 50004;
        PayHeadRec: Record 50007;
        PayLinesRec: Record 50006;
        EmpGrpLinesRec: Record 50008;
        EDFileRec: Record 50001;
        BookGrLinesRec: Record 50010;
        InfoCounter: Integer;
        Window: Dialog;
        LoanRec: Record 50013;
        EdgropRec: Record 50008;
        EdRec: Record 50001;
        RecRate: Decimal;
        RecQty: Decimal;
        emploMonth: Integer;
        PayMonth: Integer;
        emploday: Integer;
        emplodaywk: Integer;
        totaldays: Integer;
        Daysinmonth: Integer;
        "1stdayofmonth": Code[10];
        monthdig: Integer;
        daydig: Integer;
        dayin: Date;
        ok: Boolean;
        employr: Integer;
        "Absent Register": Record 5207;
        "Total Days": Decimal;
        Periodbegin: Date;
        PeriodEnd: Date;
        AbsentDeduct: Decimal;
        EmployeeGroupLinerec: Record 50008;
        PaySetup: Record 50018;
        TaxFreeED: Code[10];
        TaxFreeAmount: Decimal;
        EmptDate: Date;
        DisengDate: Date;
        PayDays: Integer;
        PBonusED: Code[10];
        PBonusAmount: Decimal;
        TaxableED: Code[10];
        TaxFreeYTD: Decimal;
        TaxableYTD: Decimal;
        TaxYTD: Decimal;
        AmountToTax: Decimal;
        TaxED: Code[10];
        NewTax: Decimal;
        PayLines2: Record 50006 temporary;
        MonthlyDays: Integer;
        HrsInDay: Integer;
        VarRec: Record 50017;
        GenPCode: Codeunit 50004;
        EDRec2: Record 50001;
        AWDays: Integer;
        UserSetupRec: Record 91;
        CurrentMonth: Decimal;
        DefaultPostingGroup: Code[20];
        PreviousIsJoiner: Boolean;
        EDSetup: Record 50001;
        EmolLinesRec: Record 50005;
        EmolHdr: Record 50000;
        TaxTable: array[100, 5] of Decimal;
        LookUpLower: array[100] of Decimal;
        LookUpUpper: array[100] of Decimal;
        LookUpRate: array[100] of Decimal;
        LookUpCummTax: array[100] of Decimal;
        LkRec: Record 50003;
        i: Integer;
        CurrTaxable: Decimal;
        NewEmpRec: Record 5200;
        iMx: Integer;
        TaxLine: Integer;
        Skipped: Integer;

    procedure partsalary(nodays: Integer; emplomonth: Integer) prodays: Integer
    begin
        IF emplomonth = PayMonth THEN BEGIN
            IF STRLEN(FORMAT(nodays)) = 1 THEN EVALUATE(daydig, ('0' + FORMAT(nodays)));
            IF STRLEN(FORMAT(emplomonth)) = 1 THEN EVALUATE(monthdig, ('0' + FORMAT(emplomonth)));

            Daysinmonth := DATE2DMY(dayin, 1);

        END;
    end;

    procedure SendLines(EDToSend: Code[10]; EDAmount: Decimal; EDQty: Decimal; EDRate: Decimal)
    begin
        /*Use The Following Lines to send to Payslip Lines*/

        IF PayLinesRec.GET(PayPeriodRec."Period Code", Employee."No.", EDToSend) THEN BEGIN
            PayLinesRec."E/D Code" := EDToSend;
            IF EDRec2.GET(EDToSend) THEN PayLinesRec."Payslip Text" := EDRec2."Payslip Text";
            PayLinesRec.VALIDATE(PayLinesRec.Amount, ROUND(EDAmount, 0.01));
            PayLinesRec."Payroll Period" := PayHeadRec."Payroll Period";
            PayLinesRec."Employee No" := PayHeadRec."Employee No";
            PayLinesRec."Payslip Group ID" := EDRec2."Payslip Group ID";
            PayLinesRec."Control Type" := EDRec2."Control Type";
            PayLinesRec."ED Type" := EDRec2."ED Type";

            PayLinesRec."Pos. In Payslip Grp." := EDRec2."Pos. In Payslip Grp.";
            PayLinesRec."Payslip appearance" := EDRec2."Payslip appearance";
            PayLinesRec.Units := EDRec2.Units;
            PayLinesRec.Rate := EDRate;
            PayLinesRec.Quantity := EDQty;

            PayLinesRec."Overline Column" := EDRec2."Overline Column";
            PayLinesRec."Payslip Print Column" := EDRec2."Payslip Print Column";
            PayLinesRec."Underline Amount" := EDRec2."Underline Amount";
            PayLinesRec.Flag := EmpGrpLinesRec.Flag;
            PayLinesRec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
            PayLinesRec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
            PayLinesRec."Sequence No" := EDRec2."Sequence No";   // Payslip sequence
            PayLinesRec.Grade := Employee.Grade;
            PayLinesRec.MODIFY(TRUE);
            //PayLinesRec.VALIDATE("E/D Code");
        END
        ELSE BEGIN
            PayLinesRec.INIT;
            IF EDRec2.GET(EDToSend) THEN PayLinesRec."Payslip Text" := EDRec2."Payslip Text";
            PayLinesRec."Payroll Period" := PayPeriodRec."Period Code";
            PayLinesRec."Employee No" := Employee."No.";
            PayLinesRec."E/D Code" := EDToSend;
            PayLinesRec.Amount := ROUND(EDAmount, 0.01);
            PayLinesRec."Payslip Group ID" := EDRec2."Payslip Group ID";

            PayLinesRec."Control Type" := EDRec2."Control Type";
            PayLinesRec."ED Type" := EDRec2."ED Type";

            PayLinesRec."Pos. In Payslip Grp." := EDRec2."Pos. In Payslip Grp.";
            PayLinesRec."Payslip appearance" := EDRec2."Payslip appearance";
            PayLinesRec.Units := EDRec2.Units;
            PayLinesRec.Rate := EDRec2.Rate;
            PayLinesRec."Overline Column" := EDRec2."Overline Column";
            PayLinesRec."Payslip Print Column" := EDRec2."Payslip Print Column";
            PayLinesRec."Underline Amount" := EDRec2."Underline Amount";
            PayLinesRec.Quantity := EmpGrpLinesRec.Quantity;
            PayLinesRec.Flag := EmpGrpLinesRec.Flag;
            PayLinesRec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
            PayLinesRec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
            PayLinesRec."Posting Group" := Employee."Posting Group";
            PayLinesRec."Sequence No" := EDRec2."Sequence No";      // Payslip sequence
            PayLinesRec.Grade := Employee.Grade;
            PayLinesRec.INSERT;
            //PayLinesRec.VALIDATE("E/D Code");
        END;


        /*
        {Use The Following Lines to send to Employee Group Lines}
        
        IF EdgropRec.GET(EmpGrpLinesRec."Employee Group",EDToSend) THEN
          BEGIN
            EdgropRec."Default Amount" := ROUND(EDAmount,0.01);
            EdgropRec.MODIFY;
          END
        ELSE
          BEGIN
            EdgropRec.INIT;
            EdgropRec."Employee Group" := EmpGrpLinesRec."Employee Group";
            EdgropRec."E/D Code"       := EDToSend;
            EdgropRec."Employee Name"  := EmpGrpLinesRec."Employee Group";
            EdgropRec."Default Amount" := ROUND(EDAmount,0.01);
            EdgropRec.INSERT
          END;
        */

    end;

    procedure GetPayDays(): Integer
    begin

        PayPeriodRec.GET(PayHeadRec."Payroll Period");
        EmptDate := Employee."Employment Date";
        DisengDate := Employee."Termination Date";
        IF (EmptDate = 0D) THEN BEGIN
            MESSAGE('Employee No %1 must have an Employment Date', Employee."No.");
            CurrReport.SKIP;
        END;

        PayDays := 0;
        IF (EmptDate > PayPeriodRec."Start Date") AND (EmptDate < PayPeriodRec."End Date") THEN BEGIN
            IF (DisengDate <> 0D) THEN BEGIN
                IF (DisengDate > PayPeriodRec."Start Date") AND (DisengDate < PayPeriodRec."End Date") THEN
                    PayDays := GenPCode.GetNoOfDays(EmptDate, DisengDate)
            END
            ELSE BEGIN
                PayDays := GenPCode.GetNoOfDays(PayPeriodRec."Start Date", EmptDate);
            END;
        END
        ELSE
            IF (DisengDate > PayPeriodRec."Start Date") AND (DisengDate < PayPeriodRec."End Date") THEN
                PayDays := GenPCode.GetNoOfDays(PayPeriodRec."Start Date", DisengDate);

        //MESSAGE(FORMAT(PayDays));
        //error(FORMAT(PayDays));
    end;

    procedure PayrollMonthofDate(InputDate: Date): Integer
    var
        locPeriodRec: Record 50004;
    begin
        locPeriodRec.SETRANGE(locPeriodRec."Start Date", 0D, InputDate);
        locPeriodRec.FIND('+');
        EXIT(DATE2DMY(locPeriodRec."End Date", 2));
    end;


    procedure SendEmol()
    begin
        EmolLinesRec.RESET;
        IF EmolLinesRec.FIND('-') THEN
            EmolLinesRec.SETRANGE(EmolLinesRec."Emolument Group", Employee."Employee Emolument Group");
        IF EmolLinesRec.FIND('-') THEN
            REPEAT

                /* Lock the Payroll Lines Entry file */
                // PayLinesRec.LOCKTABLE(FALSE);
                PayLinesRec.INIT;
                PayLinesRec."Payroll Period" := PayHeadRec."Payroll Period";
                PayLinesRec."Employee No" := PayHeadRec."Employee No";

                RecRate := 0;
                RecQty := 0;
                EDFileRec.GET(EmolLinesRec."E/D Code");

                RecRate := 0;
                RecQty := 0;
                PayLinesRec.INIT;
                EDFileRec.GET(EmolLinesRec."E/D Code");

                EDFileRec.GET(EmolLinesRec."E/D Code");
                PayLinesRec."E/D Code" := EmolLinesRec."E/D Code";

                BEGIN
                    PayLinesRec."Payslip Group ID" := EDFileRec."Payslip Group ID";
                    PayLinesRec."ED Type" := EDFileRec."ED Type";
                    PayLinesRec."Control Type" := EDFileRec."Control Type";
                    PayLinesRec."Pos. In Payslip Grp." := EDFileRec."Pos. In Payslip Grp.";
                    PayLinesRec."Payslip appearance" := EDFileRec."Payslip appearance";
                    PayLinesRec.Units := EDFileRec.Units;
                    PayLinesRec.Rate := EDFileRec.Rate;
                    PayLinesRec."Overline Column" := EDFileRec."Overline Column";
                    PayLinesRec."Payslip Print Column" := EDFileRec."Payslip Print Column";
                    PayLinesRec."Underline Amount" := EDFileRec."Underline Amount";
                    PayLinesRec.Grade := Employee.Grade;
                END;        /* Payslip Grp/Pos */
                BEGIN
                    PayLinesRec."E/D Code" := EmolLinesRec."E/D Code";
                    PayLinesRec.Units := EmolLinesRec.Units;
                    PayLinesRec.Rate := EmolLinesRec.Rate;
                    PayLinesRec.Quantity := EmolLinesRec.Quantity;
                    PayLinesRec.Flag := EmolLinesRec.Flag;
                    PayLinesRec.Amount := EmolLinesRec."Default Amount";
                END;   /* Rate,Units,Amount,... */

                PayDays := MonthlyDays;
                IF (Employee."No of Days") <> 0 THEN PayDays := Employee."No of Days";
                IF (EDFileRec."Work Days Dependent") THEN BEGIN
                    PayLinesRec.VALIDATE(Quantity, PayDays);
                END;


                PayLinesRec."Sequence No" := EDFileRec."Sequence No";   // Payslip sequence

                IF BookGrLinesRec.GET(Employee."Posting Group", PayLinesRec."E/D Code")
                THEN BEGIN
                    BEGIN
                        PayLinesRec."Debit Account" := BookGrLinesRec."Debit Account No.";
                        PayLinesRec."Credit Account" := BookGrLinesRec."Credit Account No.";
                        PayLinesRec."Debit Acc. Type" := BookGrLinesRec."Debit Acc. Type";
                        PayLinesRec."Credit Acc. Type" := BookGrLinesRec."Credit Acc. Type";
                        //PayLinesRec."Region Code";:= Employee."Region Code";;
                        PayLinesRec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                        PayLinesRec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";

                    END; /* Debit/Credit accounts*/

                    IF BookGrLinesRec."Transfer Department Code" THEN
                        PayLinesRec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    IF BookGrLinesRec."Transfer Project Code" THEN
                        PayLinesRec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";

                    IF (EmolLinesRec."Default Amount" <> 0) OR (EDFileRec."Monthly Variable") OR
                       (EDFileRec."Work Days Dependent") THEN BEGIN
                        PayLinesRec.VALIDATE(PayLinesRec."E/D Code");

                        IF (PayDays <> MonthlyDays) AND (EDFileRec.Prorate) THEN BEGIN
                            IF PayDays > MonthlyDays THEN
                                ERROR('Employee worked more than Monthly working days');
                            IF NOT (EDFileRec."Absent Deduction") THEN
                                PayLinesRec.Amount := ROUND((PayDays / MonthlyDays) * PayLinesRec.Amount);
                        END;
                        PayLinesRec."Posting Group" := Employee."Posting Group";
                        IF PayLinesRec.INSERT(TRUE) THEN;
                        //PayLinesRec.VALIDATE("E/D Code");
                    END;
                    PayLinesRec.VALIDATE("E/D Code");
                END;
            UNTIL (EmolLinesRec.NEXT = 0);

    end;

    procedure PreTaxCalc(): Decimal
    var
        Ret1: Decimal;
        PeriodRecs: Record 50004;
        EmployeeRec: Record 5200;
        CumTax: Decimal;
        TaxAmount: Decimal;
        PayLines2: Record 50006;
        j: Integer;
    begin


        CurrTaxable := 0;
        IF PayLines2.GET(PayLinesRec."Payroll Period", PayLinesRec."Employee No", TaxableED) THEN
            CurrTaxable := PayLines2.Amount * 12
        ELSE
            ERROR('Please Indicate the Taxable ED in The ED Table\\' +
                  'Using the payslip Group ID Field');

        TaxableYTD := PayLinesRec.EDAmountToDate(PayLinesRec."Employee No", PayLinesRec."Payroll Period", TaxableED) +
                      Employee."Gross Taxable YTD B/F" + CurrTaxable;

        TaxYTD := PayLinesRec.EDAmountToDate(PayLinesRec."Employee No", PayLinesRec."Payroll Period", TaxED) + Employee."Tax Paid YTD B/F";
        TaxFreeYTD := (Employee."Annual Tax Freepay" * (DATE2DMY(PayPeriodRec."End Date", 2) - Skipped)) / 12;


        AmountToTax := TaxableYTD - TaxFreeYTD;
        IF AmountToTax < 0 THEN AmountToTax := 0;

        PayLinesRec.UpdateTaxTable(Skipped);

        i := 0;
        CumTax := 0;

        FOR j := 1 TO iMx DO BEGIN
            IF (TaxTable[j, 1] <= AmountToTax) AND (AmountToTax <= TaxTable[j, 2]) THEN BEGIN
                CumTax := CumTax + (AmountToTax - TaxTable[j, 1]) * TaxTable[j, 3] / 100;
                EXIT(CumTax - TaxYTD);
            END
            ELSE
                CumTax := CumTax + (TaxTable[j, 2] - TaxTable[j, 1]) * TaxTable[j, 3] / 100;

        END;

        EXIT(CumTax - TaxYTD);
    end;

    procedure UpdateTaxTable(Skipped: Integer)
    var
        TaxLookUp: Record 50003;
    begin

        CurrentMonth := DATE2DMY(PayPeriodRec."End Date", 2);
        FOR i := 1 TO iMx DO BEGIN
            TaxTable[i, 1] := TaxTable[i, 4] * (CurrentMonth - Skipped) / (12);
            TaxTable[i, 2] := TaxTable[i, 5] * (CurrentMonth - Skipped) / (12);
        END;
    end;

    procedure GetTaxTable()
    begin
        LkRec.RESET;
        LkRec.SETRANGE(LkRec.TableId, 'TAX');
        LkRec.FIND('-');
        iMx := 0;
        REPEAT
            iMx := iMx + 1;
            IF iMx > ARRAYLEN(TaxTable) THEN
                ERROR('Tax Table too large');
            TaxTable[iMx, 1] := LkRec."Lower Amount";
            TaxTable[iMx, 2] := LkRec."Upper Amount";
            TaxTable[iMx, 3] := LkRec."Tax Rate %";
            TaxTable[iMx, 4] := LkRec."Annual Lower";
            TaxTable[iMx, 5] := LkRec."Annual Upper";
        UNTIL LkRec.NEXT = 0;
    end;
}

