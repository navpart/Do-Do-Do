table 50017 "Monthly Variables Lines."
{

    fields
    {
        field(1; "Payroll Period"; Code[10])
        {
            Editable = false;
            TableRelation = "Payroll-Periods.";

            trigger OnValidate()
            begin
                GetParam();
            end;
        }
        field(2; "Employee No"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                GetParam();
                // Added by Adams
                IF TheEmployeeRec.GET("Employee No") THEN BEGIN
                    "Posting Group" := TheEmployeeRec."Posting Group";
                    "Global Dimension 1 Code" := TheEmployeeRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := TheEmployeeRec."Global Dimension 2 Code";
                END;
            end;
        }
        field(3; "E/D Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-E/D Codes."."E/D Code" WHERE("Monthly Variable" = filter(true));

            trigger OnLookup()
            begin

            end;

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                "E/DFileRec".GET("E/D Code");
                "Payslip Text" := "E/DFileRec"."Payslip Text";

                /* Transfer Units, Rate, Payslip Group ID. and Pos in Payslip Group */
                BEGIN
                    "Payslip Group ID" := "E/DFileRec"."Payslip Group ID";
                    "Pos. In Payslip Grp." := "E/DFileRec"."Pos. In Payslip Grp.";
                    "Payslip appearance" := "E/DFileRec"."Payslip appearance";
                    Units := "E/DFileRec".Units;
                    Rate := "E/DFileRec".Rate;
                    "Overline Column" := "E/DFileRec"."Overline Column";
                    "Underline Amount" := "E/DFileRec"."Underline Amount";
                    "Variable Unit" := "E/DFileRec"."Variable Unit";
                    "Monthly Variable" := "E/DFileRec"."Monthly Variable";
                END;

                /* Calculate the amount if neither quantities nor yes flag are required*/
                IF ("Variable Unit" = 0) AND NOT ("E/DFileRec"."Yes/No Req.") THEN BEGIN

                    Amount := CalcAmount("E/DFileRec", Rec, Amount, "E/D Code");
                    IF Rec.Amount <> xRec.Amount THEN BEGIN
                        /* Change the entries that are computed using this new amount */
                        CalcCompute(Rec, Amount, TRUE, "E/D Code");
                        /*BDC*/

                        /* If this new entry contributes to the value of another line
                          then compute that other line's value and insert it appropriately*/
                        CalcFactor1(Rec);

                        /* Go through all the lines and change where necessary */
                        ChangeAllOver(Rec, FALSE);

                        /* Reset the ChangeOthers flag in all lines */
                        ResetChangeFlags(Rec);
                    END
                END;

                /* Transfer from Booking Group Lines */
                EmployeeRec.GET("Employee No");
                IF BookGrLinesRec.GET(EmployeeRec."Posting Group", "E/D Code") THEN BEGIN
                    BEGIN
                        "Debit Account" := BookGrLinesRec."Debit Account No.";
                        "Credit Account" := BookGrLinesRec."Credit Account No.";
                        "Debit Acc. Type" := BookGrLinesRec."Debit Acc. Type";
                        "Credit Acc. Type" := BookGrLinesRec."Credit Acc. Type";
                        /*BDC
                            "Department Code" := BookGrLinesRec.Department;
                            "Project Code" := BookGrLinesRec.Project;
                        */
                    END;
                    /*BDC
                      IF NOT BookGrLinesRec."Transfer Department" THEN
                        "Department Code" := ''
                      ELSE
                      IF "Department Code" = '' THEN
                          "Department Code" := EmployeeRec.Department;

                      IF NOT BookGrLinesRec."Transfer Project" THEN
                        "Project Code" := ''
                      ELSE
                      IF "Project Code" = '' THEN
                        "Project Code" := EmployeeRec.Project;

                      IF BookGrLinesRec."Debit Acc. Type" = 1 THEN
                        IF "Debit Account" = '' THEN
                          IF EmployeeRec."Customer Number" <> '' THEN
                            "Debit Account" := EmployeeRec."Customer Number" ;

                      IF BookGrLinesRec."Credit Acc. Type" = 1 THEN
                        IF "Credit Account" = '' THEN
                          IF EmployeeRec."Customer Number"  <> '' THEN
                            "Credit Account" := EmployeeRec."Customer Number" ;
                    */

                    IF BookGrLinesRec."Transfer Department Code" THEN
                        "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
                    IF BookGrLinesRec."Transfer Project Code" THEN
                        "Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";
                END;

            end;
        }
        field(4; Units; Text[10])
        {
            Editable = false;
        }
        field(5; Rate; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                IF ("Variable Unit" = 0) THEN
                    /* User cannot edit the rate if the E/D code has no units*/
                  Rec.Rate := xRec.Rate
                ELSE BEGIN
                    Amount := Quantity * Rate;

                    /*Check for rounding, Maximum and minimum */
                    "E/DFileRec".GET("E/D Code");
                    Amount := ChkRoundMaxMin("E/DFileRec", Amount);
                END

            end;
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                IF ("Variable Unit" = 0) THEN
                    /* User cannot enter quantity if the E/D code has no units*/
                  Rec.Quantity := xRec.Quantity
                ELSE BEGIN
                    //  Amount := Quantity * Rate;
                    //IF ("Variable Unit" = "Variable Unit"::Hours) THEN
                    // Amount := rounD((BasicPay * Rate  * Quantity)/(HrsInDay*DaysInMonth));

                    IF ("Variable Unit" = "Variable Unit"::Hours) THEN
                        Amount := (BasicPay * Rate * Quantity) / (HrsInDay);

                    IF ("Variable Unit" = "Variable Unit"::Days) THEN
                        Amount := ROUND((BasicPay * Rate * Quantity) / DaysInMonth);

                    /*Check for rounding, Maximum and minimum */
                    "E/DFileRec".GET("E/D Code");
                    Amount := ChkRoundMaxMin("E/DFileRec", Amount);
                END

            end;
        }
        field(7; Flag; Boolean)
        {

            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                "E/DFileRec".GET("E/D Code");
                IF NOT ("E/DFileRec"."Yes/No Req.") THEN
                    Flag := FALSE
                ELSE
                    Amount := CalcAmount("E/DFileRec", Rec, Amount, "E/D Code");

            end;
        }
        field(8; Amount; Decimal)
        {
            DecimalPlaces = 0 : 2;

            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                "E/DFileRec".GET("E/D Code");
                IF NOT ("E/DFileRec"."Edit Amount") THEN
                    Rec.Amount := xRec.Amount
                ELSE
                    /*Check for rounding, Maximum and minimum */
                  Amount := ChkRoundMaxMin("E/DFileRec", Amount);

            end;
        }
        field(9; "Debit Account"; Code[20])
        {
            TableRelation = IF ("Debit Acc. Type" = filter("G/L Account")) "G/L Account"
            ELSE
            IF ("Debit Acc. Type" = filter(Customer)) Customer;

            trigger OnValidate()
            begin
                IF "Debit Account" <> '' THEN
                    CASE "Debit Acc. Type" OF
                        "Debit Acc. Type"::"G/L Account":
                            FinanceAccRec.GET("Debit Account");
                        "Debit Acc. Type"::Customer:
                            CustomerAccRec.GET("Debit Account");
                        "Debit Acc. Type"::Vendor:
                            SupplierAccRec.GET("Debit Account");
                    END;
            end;
        }
        field(10; "Credit Account"; Code[20])
        {
            TableRelation = IF ("Credit Acc. Type" = filter('Finance')) "G/L Account"
            ELSE
            IF ("Credit Acc. Type" = filter('Customer')) Customer;

            trigger OnValidate()
            begin
                IF "Credit Account" <> '' THEN
                    CASE "Credit Acc. Type" OF
                        "Credit Acc. Type"::"G/L Account":
                            FinanceAccRec.GET("Credit Account");
                        "Credit Acc. Type"::Customer:
                            CustomerAccRec.GET("Credit Account");
                        "Credit Acc. Type"::Vendor:
                            SupplierAccRec.GET("Credit Account");
                    END;
            end;
        }
        field(11; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(13; AmountToBook; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(14; "Payslip Group ID"; Option)
        {
            OptionMembers = ,"GROSS PAY","TAXABLE PAY","TAX CHARGED","TAX DEDUCTED","TOTAL DEDUCTIONS","NET PAY DUE";
        }
        field(15; "Pos. In Payslip Grp."; Integer)
        {
        }
        field(16; "Payslip appearance"; Option)
        {
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading;
        }
        field(17; "Debit Acc. Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Customer,Supplier;
        }
        field(18; "Credit Acc. Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Customer,Supplier;
        }
        field(19; ChangeOthers; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(20; HasBeenChanged; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(21; ChangeCounter; Integer)
        {
            Editable = false;
            InitValue = 0;
        }
        field(22; "Payslip Column"; Option)
        {
            InitValue = "2";
            OptionMembers = "1","2","3";
        }
        field(23; "S. Report appearance"; Option)
        {
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading;
        }
        field(24; "Overline Column"; Option)
        {
            InitValue = "None";
            OptionMembers = "None","1","2","3","1-2","2-3","1-3";
        }
        field(25; "Underline Amount"; Option)
        {
            InitValue = "None";
            OptionMembers = "None",Underline,"Double Underline";
        }
        field(26; "Loan ID"; Code[10])
        {
            TableRelation = "Loan.";
        }
        field(27; "Payslip Print Column"; Option)
        {
            OptionMembers = " ",Postive,Negative,"Total Earning","Total Deduction","Net Earning";
        }
        field(28; "Payslip Text"; Text[100])
        {
        }
        field(29; "Variable Unit"; Option)
        {
            Editable = false;
            OptionMembers = " ",Hours,Days;

            trigger OnValidate()
            begin
                IF NOT "Monthly Variable" THEN "Variable Unit" := 0;
            end;
        }
        field(30; "Monthly Variable"; Boolean)
        {
            Description = 'Added for Overtime';
            Editable = false;
        }
        field(31; "Posting Group"; Code[20])
        {
            Description = 'Added by Adams';
        }
        field(32; "Old Payroll No."; Code[10])
        {
        }
        field(33; "Employee Name"; Code[10])
        {
        }
        field(34; "Cost Centre Code"; Code[10])
        {
        }
        field(35; "Department Code"; Code[10])
        {
        }
        field(37; "Lapse Period"; Time)
        {
        }
        field(38; Name; Code[10])
        {
        }
        field(39; Taxable; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee No", "E/D Code")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code", "Debit Acc. Type", "Debit Account", "Credit Acc. Type", "Credit Account", "Loan ID")
        {
        }
        key(Key3; "Payroll Period", "Employee No", "Payslip Group ID", "Pos. In Payslip Grp.")
        {
        }
        key(Key4; "E/D Code", "Employee No", "Payroll Period")
        {
        }
        key(Key5; "Employee No", "Payroll Period")
        {
        }
        key(Key6; "Payroll Period", "Employee No", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
        key(Key7; "Global Dimension 2 Code", "Global Dimension 1 Code")
        {
        }
        key(Key8; "Payslip Print Column", "E/D Code")
        {
        }
        key(Key9; "Payroll Period", "E/D Code", "Employee No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF NOT ProllHeader.GET("Payroll Period", "Employee No") THEN
            EXIT;

        IF ProllHeader."Is Closed" THEN
            ERROR('Entries for Employee %1/ in Period %2/ are closed. ' +
                   'Nothing can be deleted', "Employee No", "Payroll Period");

        /* Go through all the lines and make any appropriate Changes */
        ChangeOthers := FALSE;
        ChangeDueToDelete(Rec);

        /* Set the 'Change' flags to false in all the lines */
        ResetChangeFlags(Rec);

    end;

    trigger OnInsert()
    begin
        GetParam();
        // Added by Adams
        IF TheEmployeeRec.GET("Employee No") THEN
            "Posting Group" := TheEmployeeRec."Posting Group";
    end;

    trigger OnModify()
    begin

        GetParam();


    end;

    var
        "E/DFileRec": Record "Payroll-E/D Codes.";
        ConstEDFileRec: Record "Payroll-E/D Codes.";
        ProllHeader: Record "Monthly Variables Header.";
        ProllRecStore: Record "Monthly Variables Lines.";
        ProllFactorRec: Record "Monthly Variables Lines.";
        ProllEntryRec: Record "Monthly Variables Lines.";
        ChangeOthersRec: Record "Monthly Variables Lines.";
        LookHeaderRec: Record "Payroll-Lookup Header.";
        LookLinesRec: Record "Payroll-Lookup Lines.";
        BackOneRec: Integer;
        ReturnAmount: Decimal;
        PrevLookRec: Record "Payroll-Lookup Lines.";
        InputAmount: Decimal;
        ComputedTotal: Decimal;
        AmountToAdd: Decimal;
        FactorRecAmount: Decimal;
        AmtToAdd: Decimal;
        EmployeeRec: Record Employee;
        BookGrLinesRec: Record "Payroll-Posting Group Line.";
        RoundPrec: Decimal;
        RoundDir: Text[1];
        IsComputed: Boolean;
        FinanceAccRec: Record "G/L Account";
        CustomerAccRec: Record Customer;
        SupplierAccRec: Record Vendor;
        MaxChangeCount: Integer;
        PayLines2: Record "Payroll-Payslip Lines.";
        CurYear: Integer;
        PeriodRec: Record "Payroll-Periods.";
        PerStart: Date;
        Per1: Code[10];
        YearStart: Date;
        TaxableED: Code[10];
        TaxfreeED: Code[10];
        PaySetup: Record "Payroll Setup.";
        HrsInDay: Integer;
        DaysInMonth: Integer;
        BasicPay: Decimal;
        NewEDRec: Record "Payroll-E/D Codes.";
        EmpGrplines: Record "Payroll-Employee Group Lines.";
        EmpGrpCode: Code[10];
        TheEmployeeRec: Record "Employee";
        DimMgt: Codeunit DimensionManagement;


    procedure SpecialRelation("FieldNo.": Integer)
    begin

        /* Force NO-EDIT of field already has a value or if Employee payroll details
          for the period are already closed*/
        IF "E/D Code" <> '' THEN
            EXIT;

        /* If Period+Employee has already been closed then stop edit */
        IF CheckClosed THEN
            ERROR('Entries for Employee %1 for period %2 ' +
                   'have already been closed.', "Employee No", "Payroll Period");

    end;


    procedure CalcAmount(EDFileRec: Record "Payroll-E/D Codes."; EntryLineRec: Record "Monthly Variables Lines."; EntryLineAmount: Decimal; EDCode: Code[20]): Decimal
    begin

        /* If NO is in the flag field return amount to 0*/
        IF (EDFileRec."Yes/No Req.") AND NOT (EntryLineRec.Flag) THEN
            EXIT(0);

        /* If Factor Of is Nil then do not change then check if amount is computed by
          others*/

        IF EDFileRec."Factor Of" = '' THEN
            IF NOT AmountIsComputed(ReturnAmount, EntryLineRec, EDFileRec,
                                     EntryLineAmount, EDCode) THEN
                /*BDC*/
            EXIT(EntryLineRec.Amount)
            ELSE BEGIN
                /*Check for rounding, Maximum and minimum */
                ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);
                EXIT(ReturnAmount);
            END;

        /* Get the record from the current file based on Factor Of */
        IF NOT ProllFactorRec.GET(EntryLineRec."Employee No", EDFileRec."Factor Of") THEN BEGIN
            EXIT(EmpGrpValue(EntryLineAmount));
        END
        ELSE


            IF ProllFactorRec."E/D Code" = EDCode THEN
                ProllFactorRec.Amount := EntryLineAmount;

        IF EDFileRec."Table Look Up" = '' THEN
            ReturnAmount := (ProllFactorRec.Amount * EDFileRec.Percentage) / 100

        ELSE

            IF NOT LookHeaderRec.GET(EDFileRec."Table Look Up") THEN BEGIN
                MESSAGE('Table Lookup Not Registered Yet');
                EXIT(EntryLineRec.Amount)
            END
            ELSE BEGIN

                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SETRANGE(TableId, EDFileRec."Table Look Up");


                CASE LookHeaderRec.Type OF
                    0, 2:
                        BEGIN

                            IF ProllFactorRec.Amount > -1 THEN BEGIN
                                LookLinesRec."Lower Code" := '';
                                InputAmount := ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                                LookLinesRec."Lower Amount" := InputAmount;
                                LookLinesRec.SETRANGE("Lower Code", '');
                            END
                            ELSE
                                EXIT(LookHeaderRec."Min. Extract Amount")
                        END;
                    ELSE BEGIN
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := EDFileRec."E/D Code";
                        LookLinesRec.SETRANGE("Upper Amount", 0);
                        LookLinesRec.SETRANGE("Lower Amount", 0);
                    END
                END;

                CASE LookHeaderRec.Type OF
                    0, 1:
                        BEGIN

                            IF LookLinesRec.FIND('=') THEN
                                ReturnAmount := LookLinesRec."Extract Amount"
                            ELSE
                                IF LookLinesRec.FIND('>') THEN BEGIN
                                    BackOneRec := LookLinesRec.NEXT(-1);
                                    ReturnAmount := LookLinesRec."Extract Amount";
                                END
                                ELSE
                                    IF LookHeaderRec.Type = 0 THEN BEGIN
                                        IF LookLinesRec.FIND('+') THEN
                                            ReturnAmount := LookLinesRec."Extract Amount";
                                    END
                                    ELSE
                                        EXIT(EntryLineRec.Amount);
                        END;

                    2:
                        ReturnAmount := (CalcTaxAmt(LookLinesRec, InputAmount)) *
                                            LookHeaderRec."Output Factor";
                END;


                IF (LookHeaderRec."Max. Extract Amount" <> 0) AND
                   (ReturnAmount > LookHeaderRec."Max. Extract Amount") THEN
                    ReturnAmount := LookHeaderRec."Max. Extract Amount"
                ELSE
                    IF (ReturnAmount < LookHeaderRec."Min. Extract Amount") THEN
                        ReturnAmount := LookHeaderRec."Min. Extract Amount";


                IF LookHeaderRec."Rounding Precision" = 0 THEN
                    RoundPrec := 0.01
                ELSE
                    RoundPrec := LookHeaderRec."Rounding Precision";
                CASE LookHeaderRec."Rounding Direction" OF
                    1:
                        RoundDir := '>';
                    2:
                        RoundDir := '<';
                    ELSE
                        RoundDir := '=';
                END;
                ReturnAmount := ROUND(ReturnAmount, RoundPrec, RoundDir);

                LookLinesRec.RESET
            END;

        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);

        EXIT(ReturnAmount);

    end;



    procedure CheckClosed(): Boolean
    begin

        ProllHeader.GET("Payroll Period", "Employee No");
        EXIT(ProllHeader."Is Closed");

    end;


    procedure CalcTaxAmt(var LDetailsRec: Record "Payroll-Lookup Lines."; TaxTableInput: Decimal): Decimal
    begin

        /* Copy all current filters of LookUpRec */
        PrevLookRec := LDetailsRec;
        /* COPYFILTERS(LDetailsRec );          */
        /*BDC
        PrevLookRec.COPYFILTERS(LDetailsRec);
        */
        IF LDetailsRec.FIND('=') THEN
            /*Record found where Lower Amount is equal to TaxTableInput*/
          IF PrevLookRec.NEXT(-1) = 0 THEN
                ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
            ELSE
                /* Call function to get the tax amount from the graduated tax table.*/
            ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
        ELSE
            IF LDetailsRec.FIND('>') THEN
                /*Record found where Lower Amount is just larger than TaxTableInput.
                 Therefore TaxableInput should be in previus range (= record)*/
          IF LDetailsRec.NEXT(-1) = 0 THEN
                    /* The lowest taxable amount is larger than the input amount */
            ReturnAmount := 0
                ELSE
                    ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
            ELSE
                /*TaxableInput is larger than the table's greatest lower amount*/
                IF LDetailsRec.NEXT(-1) = 0 THEN
                    ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
                ELSE
                    /* Call function to get the tax amount from the graduated tax table.*/
            ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput);

        EXIT(ReturnAmount);

    end;


    procedure CalcGraduated(var WantedLookRec: Record "Payroll-Lookup Lines."; InputToTable: Decimal): Decimal
    begin

        /* Create a copy of the valid Look Up table Record */
        PrevLookRec := WantedLookRec;
        /*BDC
        COPYFILTERS(WantedLookRec );
       */
        IF PrevLookRec.NEXT(-1) = 0 THEN
            ReturnAmount := (InputToTable * WantedLookRec."Tax Rate %") / 100
        ELSE BEGIN
            /* Compute tax for the amount of money that is within the range of the
              Wanted Look Up Record then add the Cumulative Tax Payable amount from
              the previous Look Up record*/

            ReturnAmount := (InputToTable - PrevLookRec."Upper Amount");
            ReturnAmount := (ReturnAmount * WantedLookRec."Tax Rate %") / 100;
            ReturnAmount := ReturnAmount + PrevLookRec."Cum. Tax Payable";
        END;
        EXIT(ReturnAmount);

    end;


    procedure CalcCompute(EntryRecParam: Record "Monthly Variables Lines."; AmountInLine: Decimal; "CalledFromEdCode?": Boolean; EDCode: Code[20])
    begin

        ConstEDFileRec.GET(EntryRecParam."E/D Code");
        "E/DFileRec" := ConstEDFileRec;
        IF "E/DFileRec".Compute = '' THEN
            EXIT;

        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", EntryRecParam."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", EntryRecParam."Employee No");

        /* If the entry line to be computed does not exist then EXIT */
        ProllEntryRec := EntryRecParam;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        IF NOT ProllEntryRec.FIND('=') THEN
            EXIT;

        IF "CalledFromEdCode?" THEN BEGIN
            IF "E/DFileRec"."Add/Subtract" = 2 THEN
                /* Subtract */
            ComputedTotal := -AmountInLine
            ELSE
                /* Add */
            ComputedTotal := AmountInLine
        END
        ELSE
            ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Period/Employee combination*/
        ProllEntryRec := EntryRecParam;
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.FIND('>');

        REPEAT
        BEGIN

            IF EDCode = ProllEntryRec."E/D Code" THEN
                /* We are at the record where the function was called from */
            AmountToAdd := AmountInLine
            ELSE
                AmountToAdd := ProllEntryRec.Amount;

            "E/DFileRec".GET(ProllEntryRec."E/D Code");
            IF "E/DFileRec".Compute = ConstEDFileRec.Compute THEN
                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
              ComputedTotal := ComputedTotal - AmountToAdd
                ELSE
                    /* Add */
              ComputedTotal := ComputedTotal + AmountToAdd;
        END
        UNTIL (ProllEntryRec.NEXT(1) = 0);

        ProllEntryRec.INIT;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        "E/DFileRec".GET(ConstEDFileRec.Compute);

        /*Check for rounding, Maximum and minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        /*ProllEntryRec.Amount := ComputedTotal;
        ProllRecStore := ProllEntryRec;*/
        ProllEntryRec.LOCKTABLE(FALSE);
        IF ProllEntryRec.FIND('=') THEN BEGIN
            ProllEntryRec.Amount := ComputedTotal;
            ProllEntryRec.ChangeOthers := TRUE;
            ProllEntryRec.HasBeenChanged := TRUE;
            ProllEntryRec.MODIFY;
        END;
        COMMIT;

        ProllEntryRec.SETRANGE("Payroll Period");
        ProllEntryRec.SETRANGE("Employee No");

    end;


    procedure CalcFactor1(CurrentEntryLine: Record "Monthly Variables Lines.")
    begin

        /* Get first record in Entry Lines file for this Employee/Period */
        ProllEntryRec := CurrentEntryLine;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Employee No", ProllEntryRec."Employee No");
        ProllEntryRec.SETRANGE("Payroll Period", ProllEntryRec."Payroll Period");
        ProllEntryRec."E/D Code" := '';
        IF ProllEntryRec.FIND('>') THEN; // If Condition inserted by Adams to avoid error message

        /* Go through all the entry lines for this Period/Employee record and where
          the current entry line's value is a factor, calculate that amount. */
        REPEAT

            IF "E/DFileRec".GET(ProllEntryRec."E/D Code") THEN;

            IF "E/DFileRec"."Factor Of" = CurrentEntryLine."E/D Code" THEN BEGIN

                FactorRecAmount := ProllEntryRec.Amount;
                ProllEntryRec.Amount := "CalcFactor1.1"(CurrentEntryLine,
                                                           ProllEntryRec, "E/DFileRec");
                /*The new entry in this line should now be used to Compute another and
                also entries where it is a Factor, therefore set ChangeOthers to True*/
                IF FactorRecAmount <> ProllEntryRec.Amount THEN BEGIN
                    ProllEntryRec.ChangeOthers := TRUE;
                    ProllEntryRec.MODIFY;
                END
            END;

        UNTIL (ProllEntryRec.NEXT(1) = 0);
        COMMIT;

    end;


    procedure "CalcFactor1.1"(CurrLineRec: Record "Monthly Variables Lines."; LineToChangeRec: Record "Monthly Variables Lines."; EDFileRec: Record "Payroll-E/D Codes."): Decimal
    begin

        /* If NO is in the flag field return amount to 0 */
        IF (EDFileRec."Yes/No Req.") AND NOT (LineToChangeRec.Flag) THEN
            EXIT(0);

        /* Calculate the amount based on values in Table Look Up or Percentage fields
          of E/D file */
        IF EDFileRec."Table Look Up" = '' THEN
            ReturnAmount := (CurrLineRec.Amount * EDFileRec.Percentage) / 100
        ELSE /* Extract relevant amount from Table Look Up */

            IF NOT LookHeaderRec.GET(EDFileRec."Table Look Up") THEN BEGIN
                MESSAGE('Table Lookup Not Registered Yet');
                EXIT(LineToChangeRec.Amount)
            END
            ELSE BEGIN /* Table lookup exists*/

                /* Filter Lookupline records to those of current Table Id Only*/
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SETRANGE(TableId, EDFileRec."Table Look Up");

                CASE LookHeaderRec.Type OF
                    0, 2:
                        BEGIN
                            /* Lookup table is searched with numeric variables */
                            IF CurrLineRec.Amount > -1 THEN BEGIN
                                LookLinesRec."Lower Code" := '';
                                LookLinesRec."Lower Amount" := CurrLineRec.Amount *
                                                               LookHeaderRec."Input Factor";
                                LookLinesRec.SETRANGE("Lower Code", '');
                            END
                            ELSE
                                EXIT(LookHeaderRec."Min. Extract Amount")
                        END;
                    ELSE  /*Lookup table is searched with variables of type code*/
                      BEGIN
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := CurrLineRec."E/D Code";
                        LookLinesRec.SETRANGE("Upper Amount", 0);
                        LookLinesRec.SETRANGE("Lower Amount", 0);
                    END
                END; /* Case*/

                CASE LookHeaderRec.Type OF
                    0, 1:
                        BEGIN

                            IF LookLinesRec.FIND('=') THEN
                                ReturnAmount := LookLinesRec."Extract Amount"
                            ELSE
                                IF LookLinesRec.FIND('>') THEN BEGIN
                                    BackOneRec := LookLinesRec.NEXT(-1);
                                    ReturnAmount := LookLinesRec."Extract Amount";
                                END
                                ELSE
                                    IF LookHeaderRec.Type = 0 THEN BEGIN
                                        /*CurrLineRec.Amount is > than the table's greatest "Lower amount"*/
                                        IF LookLinesRec.FIND('+') THEN
                                            ReturnAmount := LookLinesRec."Extract Amount"
                                        ELSE
                                            EXIT(LineToChangeRec.Amount)
                                    END
                                    ELSE
                                        /*CurrLineRec.EDCode is > than the table's greatest "Lower code"*/
                  EXIT(LineToChangeRec.Amount);
                        END;

                    2: /*  Extract amount from tax table*/
                        ReturnAmount := (CalcTaxAmt(LookLinesRec, CurrLineRec.Amount *
                                                     LookHeaderRec."Input Factor")) *
                                        LookHeaderRec."Output Factor";
                END; /* Case */

                /* Adjust the amount as per the maximum/minimum in the LookupHeader*/
                IF (LookHeaderRec."Max. Extract Amount" <> 0) AND
                   (ReturnAmount > LookHeaderRec."Max. Extract Amount") THEN
                    ReturnAmount := LookHeaderRec."Max. Extract Amount"
                ELSE
                    IF (ReturnAmount < LookHeaderRec."Min. Extract Amount") THEN
                        ReturnAmount := LookHeaderRec."Min. Extract Amount";

                /* Check for rounding */
                IF LookHeaderRec."Rounding Precision" = 0 THEN
                    RoundPrec := 0.01
                ELSE
                    RoundPrec := LookHeaderRec."Rounding Precision";
                CASE LookHeaderRec."Rounding Direction" OF
                    1:
                        RoundDir := '>';
                    2:
                        RoundDir := '<';
                    ELSE
                        RoundDir := '=';
                END;
                ReturnAmount := ROUND(ReturnAmount, RoundPrec, RoundDir);

                LookLinesRec.RESET
            END;


        /* Adjust amount as per maximum/minimum set in the E/D file. This will overide
          any max/min. values set in the Table Lookup Header file*/
        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);

        EXIT(ReturnAmount);

    end;


    procedure ChangeAllOver(CurrentRec: Record "Monthly Variables Lines."; CurrWasDeleted: Boolean)
    begin
        ChangeOthersRec := CurrentRec;
        ChangeOthersRec.SETRANGE("Payroll Period", CurrentRec."Payroll Period");
        ChangeOthersRec.SETRANGE("Employee No", CurrentRec."Employee No");
        ChangeOthersRec.SETRANGE(ChangeOthers, TRUE);

        ChangeOthersRec."E/D Code" := '';
        IF NOT ChangeOthersRec.FIND('>') THEN
            EXIT;

        /*Set the maximum number of times the Amount can be changed for any one line.
         This will be used to ensure that this function does not execute 'forever',
         when the user has defined 'cyclic' E/Ds*/
        MaxChangeCount := 50;

        REPEAT

            /* Process the record to change others only if it isn't the deleted one */
            IF NOT (CurrWasDeleted AND (ChangeOthersRec."E/D Code" =
                                        CurrentRec."E/D Code"))
            THEN BEGIN
                ComputeAgain(ChangeOthersRec, CurrentRec, CurrWasDeleted);
                CalcFactorAgain(ChangeOthersRec, CurrentRec, CurrWasDeleted);
            END;
            ChangeOthersRec.ChangeOthers := FALSE;
            ChangeOthersRec.ChangeCounter := ChangeOthersRec.ChangeCounter + 1;
            ChangeOthersRec.MODIFY;
            ProllRecStore := ChangeOthersRec;
            ChangeOthersRec."E/D Code" := '';
        UNTIL ((ProllRecStore.ChangeCounter > MaxChangeCount) OR
               (ChangeOthersRec.NEXT(1) = 0));
        COMMIT;
        ChangeOthersRec.SETRANGE("Payroll Period");
        ChangeOthersRec.SETRANGE("Employee No");
        ChangeOthersRec.SETRANGE(ChangeOthers);

        IF (ProllRecStore.ChangeCounter > MaxChangeCount) THEN
            MESSAGE('The E/D Code %1, / seems to have been defined with CYCLIC' +
                     ' characteristics', ProllRecStore."E/D Code");

        EXIT;

    end;


    procedure ComputeAgain(ParamLine: Record "Monthly Variables Lines."; CurrentRec: Record "Monthly Variables Lines."; CurrWasDeleted: Boolean)
    begin
        ConstEDFileRec.GET(ParamLine."E/D Code");
        "E/DFileRec" := ConstEDFileRec;
        IF "E/DFileRec".Compute = '' THEN
            EXIT;

        ProllEntryRec.RESET;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", CurrentRec."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", CurrentRec."Employee No");

        /* If the entry line to be computed does not exist then EXIT */
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        IF NOT ProllEntryRec.FIND('=') THEN
            EXIT;

        /* If CurrentRec is to be deleted, then no need to re-compute it */
        IF (CurrWasDeleted AND (ProllEntryRec."E/D Code" = CurrentRec."E/D Code"))
        THEN
            EXIT;

        "E/DFileRec".GET(CurrentRec."E/D Code");
        IF CurrWasDeleted THEN
            ComputedTotal := 0
        ELSE
            IF "E/DFileRec".Compute = ConstEDFileRec.Compute THEN BEGIN
                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
            ComputedTotal := -CurrentRec.Amount
                ELSE
                    /* Add */
            ComputedTotal := CurrentRec.Amount;
            END
            ELSE
                ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Employee group*/
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.FIND('>');

        /* Go through all the entry lines for this Employee group and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        REPEAT

            IF ProllEntryRec."E/D Code" <> CurrentRec."E/D Code" THEN BEGIN

                "E/DFileRec".GET(ProllEntryRec."E/D Code");
                IF "E/DFileRec".Compute = ConstEDFileRec.Compute THEN
                    IF "E/DFileRec"."Add/Subtract" = 2 THEN
                        /* Subtract */
                ComputedTotal := ComputedTotal - ProllEntryRec.Amount
                    ELSE
                        /* Add */
                ComputedTotal := ComputedTotal + ProllEntryRec.Amount

            END
        UNTIL (ProllEntryRec.NEXT(1) = 0);

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        ProllEntryRec.INIT;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        "E/DFileRec".GET(ConstEDFileRec.Compute);
        /*dbTRANSFERFIELDS ("E/DFileRec", ProllEntryRec);*/

        /*Check for rounding, Maximum and minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        /*ProllEntryRec.Amount := ComputedTotal;
        ProllRecStore := ProllEntryRec;*/

        ProllEntryRec.LOCKTABLE(FALSE);
        IF ProllEntryRec.FIND('=') THEN BEGIN
            /*FactorRecAmount := ProllEntryRec.Amount;*/
            /*ProllEntryRec := ProllRecStore;*/

            /*The new entry in this line should now be used to Compute another and
             also entries where it is a Factor, therefore set ChangeOthers to True*/
            IF ProllEntryRec.Amount <> ComputedTotal THEN BEGIN
                ProllEntryRec.Amount := ComputedTotal;
                ProllEntryRec.ChangeOthers := TRUE;
                ProllEntryRec.MODIFY
            END
        END;
        COMMIT;

        ProllEntryRec.RESET;

    end;


    procedure CalcFactorAgain(ParamLine: Record "Monthly Variables Lines."; CurrentRec: Record "Monthly Variables Lines."; CurrWasDeleted: Boolean)
    begin

        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec.RESET;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", ParamLine."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", ParamLine."Employee No");
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := '';
        IF NOT ProllEntryRec.FIND('>') THEN
            EXIT;

        /* Go through all the entry lines for this Employee Group record and where
          the current entry line's value is a factor, calculate that amount. */
        REPEAT

            "E/DFileRec".GET(ProllEntryRec."E/D Code");

            IF "E/DFileRec"."Factor Of" = ParamLine."E/D Code" THEN BEGIN

                FactorRecAmount := ProllEntryRec.Amount;
                IF (CurrWasDeleted AND (ParamLine."E/D Code" = CurrentRec."E/D Code"))
                THEN
                    ProllEntryRec.Amount := 0
                ELSE
                    ProllEntryRec.Amount := "CalcFactor1.1"(ParamLine, ProllEntryRec,
                                                             "E/DFileRec");

                /*The new entry in this line should now be used to Compute another and
                 also entries where it is a Factor, therefore set ChangeOthers to True*/
                IF FactorRecAmount <> ProllEntryRec.Amount THEN BEGIN
                    ProllEntryRec.ChangeOthers := TRUE;
                    ProllEntryRec.MODIFY
                END
            END;

        UNTIL (ProllEntryRec.NEXT(1) = 0);
        COMMIT;

        ProllEntryRec.RESET;

    end;


    procedure ResetChangeFlags(CurrentRec: Record "Monthly Variables Lines.")
    begin
        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec := CurrentRec;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", CurrentRec."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", CurrentRec."Employee No");
        ProllEntryRec."E/D Code" := '';
        IF ProllEntryRec.FIND('>') THEN;   //If, Added by Adam to avoid error

        /* Reset ChangeOthers for this Employee Group */
        REPEAT

            ProllEntryRec.ChangeOthers := FALSE;
            ChangeOthersRec.ChangeCounter := 0;
            /*BDC - Do not modify the one to be deleted*/
            IF ProllEntryRec."E/D Code" <> CurrentRec."E/D Code" THEN
                IF ProllEntryRec.MODIFY THEN;     //If,Added by Adam to avoid error

        UNTIL (ProllEntryRec.NEXT(1) = 0);
        COMMIT;

        ProllEntryRec.RESET;

    end;


    procedure AmountIsComputed(var ReturnAmount: Decimal; EntryLineRec: Record "Monthly Variables Lines."; EDFileRec: Record "Payroll-E/D Codes."; NewAmount: Decimal; EDCode: Code[20]): Boolean
    begin

        ProllRecStore := EntryLineRec;

        /*Get first record in P.Roll Entry file for this Period/Employee combination*/
        ProllRecStore.SETRANGE("Payroll Period", EntryLineRec."Payroll Period");
        ProllRecStore.SETRANGE("Employee No", EntryLineRec."Employee No");
        ProllRecStore."E/D Code" := '';
        IF NOT ProllRecStore.FIND('>') THEN
            EXIT(FALSE);

        /* Initialise the variable to store the computed total. */
        ReturnAmount := 0;
        IsComputed := FALSE;

        /* Go through all the entry lines for this Period/Employee record and sum up
          all those that contribute to the E/D of the given payroll entry line */
        REPEAT
            "E/DFileRec".GET(ProllRecStore."E/D Code");
            IF "E/DFileRec".Compute = EntryLineRec."E/D Code" THEN BEGIN
                /*BDC
                    IF  ProllRecStore.MARK THEN
                  */
                IF ProllRecStore."E/D Code" = EDCode THEN
                    AmtToAdd := NewAmount
                ELSE
                    AmtToAdd := ProllRecStore.Amount;

                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
              ReturnAmount := ReturnAmount - AmtToAdd
                ELSE
                    /* Add */
              ReturnAmount := ReturnAmount + AmtToAdd;

                IsComputed := TRUE
            END
        UNTIL (ProllRecStore.NEXT(1) = 0);

        EXIT(IsComputed);

    end;

    procedure ChangeDueToDelete(DeletedRec: Record "Monthly Variables Lines.")
    begin

        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec := DeletedRec;
        ProllEntryRec.SETRANGE("Payroll Period", DeletedRec."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", DeletedRec."Employee No");

        /* If the deleted record was 'COMPUTING' another then make changes */
        "E/DFileRec".GET(DeletedRec."E/D Code");
        ProllEntryRec."E/D Code" := "E/DFileRec".Compute;
        IF ProllEntryRec.FIND('=') THEN
            ComputeAgain(DeletedRec, DeletedRec, TRUE);

        /* If another record is a 'FACTOR OF' the deleted one then make changes */
        CalcFactorAgain(DeletedRec, DeletedRec, TRUE);

        /* Due to these changes adjust AMOUNTS in all lines */
        ChangeAllOver(DeletedRec, TRUE);
        EXIT;

    end;

    procedure ChkRoundMaxMin(EDRecord: Record "Payroll-E/D Codes."; TheAmount: Decimal): Decimal
    begin

        /* Adjust amount as per maximum/minimum set in the E/D file. */
        IF (EDRecord."Max. Amount" <> 0) AND
           (TheAmount > EDRecord."Max. Amount") THEN
            TheAmount := EDRecord."Max. Amount"
        ELSE
            IF TheAmount < EDRecord."Min. Amount" THEN
                TheAmount := EDRecord."Min. Amount";

        /* Check for rounding */
        IF EDRecord."Rounding Precision" = 0 THEN
            RoundPrec := 0.01
        ELSE
            RoundPrec := EDRecord."Rounding Precision";
        CASE EDRecord."Rounding Direction" OF
            1:
                RoundDir := '>';
            2:
                RoundDir := '<';
            ELSE
                RoundDir := '=';
        END;
        TheAmount := ROUND(TheAmount, RoundPrec, RoundDir);

        EXIT(TheAmount);

    end;


    procedure GetParam()
    begin
        PaySetup.RESET;
        PaySetup.FIND('-');
        DaysInMonth := PaySetup."Monthly Working Days";
        HrsInDay := PaySetup."Monthly Working Hours";

        IF ("Employee No" <> '') THEN BasicPay := EmployeeRec.GetBasic("Employee No");
    end;


    procedure EmpGrpValue(ELAmount: Decimal): Decimal
    begin
        EmployeeRec.GET("Employee No");
        EmpGrpCode := EmployeeRec."Employee Group";

        IF EmpGrplines.GET(EmpGrpCode, "E/DFileRec"."Factor Of") THEN
            EXIT((EmpGrplines."Default Amount" * "E/DFileRec".Percentage) / 100)
        ELSE
            EXIT(ELAmount);
    end;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Monthly Variables Lines.", "Payroll Period", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

