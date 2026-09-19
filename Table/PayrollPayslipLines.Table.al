table 50006 "Payroll-Payslip Lines."
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
                IF "Employee No" = '' THEN EXIT;

                EmployeRec.GET("Employee No");
                "Global Dimension 1 Code" := EmployeRec."Global Dimension 1 Code";
                "Global Dimension 2 Code" := EmployeRec."Global Dimension 2 Code";
                "Posting Group" := EmployeRec."Posting Group";
                Grade := EmployeRec.Grade;
            end;
        }
        field(3; "E/D Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            var
                SetupPay: Record 50018;
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                IF NOT "E/DFileRec".GET("E/D Code") THEN
                    ERROR('The Payroll-ED was deleted in the EDs setup');
                "Payslip Text" := "E/DFileRec"."Payslip Text";

                /* Transfer Units, Rate, Payslip Group ID. and Pos in Payslip Group */
                BEGIN
                    "Payslip Group ID" := "E/DFileRec"."Payslip Group ID";
                    "Pos. In Payslip Grp." := "E/DFileRec"."Pos. In Payslip Grp.";
                    "Payslip appearance" := "E/DFileRec"."Payslip appearance";
                    "S. Report appearance" := "E/DFileRec"."S. Report appearance";
                    "Payslip Print Column" := "E/DFileRec"."Payslip Print Column";
                    "Payslip Text" := "E/DFileRec"."Payslip Text";
                    //Units := "E/DFileRec".Units;
                    //Rate := "E/DFileRec".Rate;
                    "Overline Column" := "E/DFileRec"."Overline Column";
                    "Underline Amount" := "E/DFileRec"."Underline Amount";
                    "Variable Unit" := "E/DFileRec"."Variable Unit";
                    "Monthly Variable" := "E/DFileRec"."Monthly Variable";
                END;

                /* Calculate the amount if neither quantities nor yes flag are required*/
                IF (Units = '') AND NOT ("E/DFileRec"."Yes/No Req.") THEN BEGIN

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
        }
        field(5; Rate; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                IF (Units = '') THEN
                    /* User cannot edit the rate if the E/D code has no units*/
                  Rec.Rate := xRec.Rate
                ELSE BEGIN
                    Amount := Quantity * Rate;

                    /*Check for rounding, Maximum and minimum */
                    IF NOT "E/DFileRec".GET("E/D Code") THEN
                        ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
                    Amount := ChkRoundMaxMin("E/DFileRec", Amount);

                END

            end;
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                IF CheckClosed THEN
                    ERROR('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");


                IF NOT "E/DFileRec".GET("E/D Code") THEN
                    ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
                //iF (Units = '') AND ("E/DFileRec"."Variable Unit" = 0)THEN
                IF (Units = '') THEN
                    /* User cannot enter quantity if the E/D code has no units*/
                  Rec.Quantity := xRec.Quantity
                ELSE BEGIN
                    Amount := Quantity * Rate;

                    /*Check for rounding, Maximum and minimum */
                    IF NOT "E/DFileRec".GET("E/D Code") THEN
                        ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
                    //  Amount := ChkRoundMaxMin ("E/DFileRec", Amount);
                    /////////////
                    GetParam();

                    "E/DFileRec".SETRANGE("E/DFileRec"."Control Type", "E/DFileRec"."Control Type"::Basic);
                    "E/DFileRec".FIND('-');
                    BasicED := "E/DFileRec"."E/D Code";
                    NewPayLine.SETRANGE(NewPayLine."E/D Code", BasicED);
                    IF NewPayLine.FIND('-') THEN BasicPay := NewPayLine.Amount;


                    IF NOT "E/DFileRec".GET("E/D Code") THEN
                        ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
                    IF ("E/DFileRec"."Variable Unit" = "E/DFileRec"."Variable Unit"::Hours) THEN
                        Amount := ROUND((Rate * Quantity) / (HrsInDay * DaysInMonth));
                    //Amount := ROUND((BasicPay * Rate  * Quantity)/(HrsInDay*DaysInMonth));

                    IF ("E/DFileRec"."Variable Unit" = "E/DFileRec"."Variable Unit"::Days) THEN
                        Amount := ROUND((Rate * Quantity) / DaysInMonth);
                    //Amount := ROUND((BasicPay * Rate  * Quantity)/DaysInMonth);

                    /////////////

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

                IF NOT "E/DFileRec".GET("E/D Code") THEN
                    ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
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

                IF NOT "E/DFileRec".GET("E/D Code") THEN
                    ERROR('The ED does not exist ED=(''' + "E/D Code" + ''')');
                IF NOT ("E/DFileRec"."Edit Amount") THEN
                    Rec.Amount := xRec.Amount
                ELSE
                    /*Check for rounding, Maximum and minimum */
                  Amount := ChkRoundMaxMin("E/DFileRec", Amount);

            end;
        }
        field(9; "Debit Account"; Code[20])
        {
            /* TableRelation = IF ("Debit Acc. Type"=CONST(Finance)) "G/L Account"
                            ELSE IF ("Debit Acc. Type"=CONST(Customer)) Customer
                            ELSE IF (Debit Acc. Type=CONST(Supplier)) Vendor;

            trigger OnValidate()
            begin
                IF "Debit Account" <> '' THEN
                    CASE "Debit Acc. Type" OF
                        0:
                            FinanceAccRec.GET("Debit Account");
                        1:
                            CustomerAccRec.GET("Debit Account");
                        2:
                            SupplierAccRec.GET("Debit Account");
                    END;
            end; */
        }
        field(10; "Credit Account"; Code[20])
        {
            /* TableRelation = IF (Credit Acc.Type=CONST(Finance)) "G/L Account"
                            ELSE IF (Credit Acc. Type=CONST(Customer)) Customer
                            ELSE IF (Credit Acc. Type=CONST(Supplier)) Vendor;

            trigger OnValidate()
            begin
                IF "Credit Account" <> '' THEN
                    CASE "Credit Acc. Type" OF
                        0:
                            FinanceAccRec.GET("Credit Account");
                        1:
                            CustomerAccRec.GET("Credit Account");
                        2:
                            SupplierAccRec.GET("Credit Account");
                    END;
            end; */
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
            OptionMembers = " ","GROSS PAY","TAXABLE PAY","TAX CHARGED","TAX DEDUCTED","TOTAL DEDUCTIONS","NET PAY DUE","TAX FREE PAY";
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
            Description = 'Added by Adams for User Access';
            TableRelation = "Payroll-Posting Group Header.";
        }
        field(35; "ED Type"; Option)
        {
            Editable = false;
            OptionMembers = " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer","NSITF Gross",NHF,"Net Pay","Other Emoluments","Gross Emolument","Emolument Net","Deduction Emolument";
        }
        field(36; "Control Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Basic,Absence,"Ordinary Overtime","Special Overtime";
        }
        field(45; "Sequence No"; Integer)
        {
            Description = 'Added for Payslip Report';
        }
        field(50007; Hide; Boolean)
        {
            CalcFormula = Lookup("Payroll-E/D Codes.".Hide WHERE("E/D Code" = FIELD("E/D Code")));
            FieldClass = FlowField;
        }
        field(50121; Grade; Code[10])
        {
            TableRelation = "Employee Grade";
        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee No", "E/D Code")
        {
            Clustered = true;
            SumIndexFields = Amount, Quantity;
        }
        key(Key2; "Posting Group", "Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code", "Debit Acc. Type", "Debit Account", "Credit Acc. Type", "Credit Account", "Loan ID")
        {
        }
        key(Key3; "Payroll Period", "Employee No", "Payslip Group ID", "Pos. In Payslip Grp.")
        {
            SumIndexFields = Amount, Quantity;
        }
        key(Key4; "E/D Code", "Employee No", "Payroll Period")
        {
        }
        key(Key5; "Employee No", "Payroll Period")
        {
        }
        key(Key6; "Payroll Period", "Employee No", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            SumIndexFields = Amount, Quantity;
        }
        key(Key7; "Global Dimension 2 Code", "Global Dimension 1 Code")
        {
        }
        key(Key8; "Posting Group", "Payslip Print Column", "E/D Code")
        {
        }
        key(Key9; "Posting Group")
        {
        }
        key(Key10; "Payroll Period", "Employee No", "Sequence No")
        {
        }
        key(Key11; "Loan ID")
        {
            SumIndexFields = Amount;
        }
        key(Key12; "Posting Group", "E/D Code", "Global Dimension 1 Code", "Global Dimension 2 Code", Grade)
        {
            SumIndexFields = Amount;
        }
        key(Key13; "Payslip Print Column", "E/D Code")
        {
            SumIndexFields = Amount;
        }
        key(Key14; "ED Type")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        IF NOT ProllHeader.GET("Payroll Period", "Employee No") THEN
            EXIT;
        IF ProllHeader.Closed THEN
            ERROR('Entries for Employee %1/ in Period %2/ are closed. ' +
                   'Nothing can be deleted', "Employee No", "Payroll Period");

        // Go through all the lines and make any appropriate Changes
        ChangeOthers := FALSE;
        ChangeDueToDelete(Rec);

        // Set the 'Change' flags to false in all the lines
        ResetChangeFlags(Rec);

    end;

    trigger OnModify()
    begin


        IF (Rec.Amount <> xRec.Amount) OR ("Loan ID" <> '') THEN BEGIN
            MARK(TRUE);
            // If this new entry contributes in computing another, then compute that value
            //for that computed entry and insert it appropriately
            CalcCompute(Rec, Rec.Amount, FALSE, "E/D Code");


            /* If this new entry is a contributory factor for the value of another line,
              then compute that other line's value and insert it appropriately */
            CalcFactor1(Rec);

            /* The two functions above have used this line to change others */
            ChangeOthers := FALSE;

            /* Go through all the lines and change where necessary */
            ChangeAllOver(Rec, FALSE);

            /* Reset the ChangeOthers flag in all lines */
            /*    ResetChangeFlags (Rec);*/

            /*BDC
               MARK( FALSE);*/

        END;

    end;

    var
        "E/DFileRec": Record "Payroll-E/D Codes.";
        ConstEDFileRec: Record "Payroll-E/D Codes.";
        EDRec2: Record "Payroll-E/D Codes.";
        ProllHeader: Record "Payroll-Payslip Header.";
        ProllRecStore: Record "Payroll-Payslip Lines.";
        ProllFactorRec: Record "Payroll-Payslip Lines.";
        ProllEntryRec: Record "Payroll-Payslip Lines.";
        ChangeOthersRec: Record "Payroll-Payslip Lines.";
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
        xxxxxCurYear: Integer;
        PeriodRec: Record "Payroll-Periods.";
        PerStart: Date;
        Per1: Code[10];
        YearStart: Date;
        T1: Decimal;
        T2: Decimal;
        PaySetup: Record "Payroll Setup.";
        HrsInDay: Integer;
        DaysInMonth: Integer;
        BasicPay: Decimal;
        TaxableED: Code[10];
        TaxfreeED: Code[10];
        TaxFreeYTD: Decimal;
        TaxableYTD: Decimal;
        TaxYTD: Decimal;
        AmountToTax: Decimal;
        TaxED: Code[10];
        NewTax: Decimal;
        MonthlyDays: Integer;
        VarRec: Record 50016;
        //GenPCode: Codeunit 50001;
        CurrTaxable: Decimal;
        NewEmpRec: Record 5200;
        LookupRec: Record 50002;
        BasicED: Code[10];
        NewPayLine: Record 50006;
        EmployeRec: Record 5200;
        IsRefund: Integer;
        locplines: Record 50006;
        DimMgt: Codeunit 408;
        Skipped: Integer;
        i: Integer;
        iMx: Integer;
        TaxTable: array[100, 5] of Decimal;
        LkRec: Record 50003;
        TaxLine: Integer;
        CurrentMonth: Integer;
        PeriodRecs: Record 50004;


    procedure SpecialRelation("FieldNo.": Integer)
    begin

        // Force NO-EDIT of field already has a value or if Employee payroll details
        //for the period are already closed

        IF "E/D Code" <> '' THEN
            EXIT;

        // If Period+Employee has already been closed then stop edit
        IF CheckClosed THEN
            ERROR('Entries for Employee %1 for period %2 ' +
                   'have already been closed.', "Employee No", "Payroll Period");

    end;


    procedure CalcAmount(EDFileRec: Record 50001; EntryLineRec: Record 50006; EntryLineAmount: Decimal; EDCode: Code[20]): Decimal
    var
        TaxBasis: Decimal;
    begin

        // If NO is in the flag field return amount to 0
        IF (EDFileRec."Yes/No Req.") AND NOT (EntryLineRec.Flag) THEN
            EXIT(0);

        //If Factor Of is Nil then do not change then check if amount is computed by
        //others

        IF EDFileRec."Factor Of" = '' THEN
            IF NOT AmountIsComputed(ReturnAmount, EntryLineRec, EDFileRec,
                                     EntryLineAmount, EDCode) THEN
                EXIT(EntryLineRec.Amount)
            ELSE BEGIN

                //Check for rounding, Maximum and minimum
                ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);
                EXIT(ReturnAmount);
            END;
        // Get the record from the current file based on Factor Of
        IF NOT ProllFactorRec.GET(EntryLineRec."Payroll Period",
                         EntryLineRec."Employee No", EDFileRec."Factor Of") THEN
            EXIT(EntryLineRec.Amount)
        ELSE
            // If this 'Factor of' entry record is marked then this trigger was called
            //from this 'Fator of' record, therefore ensure the amount to be used is
            //the updated amount

            IF ProllFactorRec.MARK THEN
                IF ProllFactorRec."E/D Code" = EDCode THEN
                    ProllFactorRec.Amount := EntryLineAmount;

        // Calculate the amount based on values in Table Look Up or Percentage fields
        //of E/D file

        IF EDFileRec."Table Look Up" = '' THEN
            ReturnAmount := (ProllFactorRec.Amount * EDFileRec.Percentage) / 100
        ELSE

            IF NOT LookHeaderRec.GET(EDFileRec."Table Look Up") THEN BEGIN
                MESSAGE('Table Lookup Not Registered Yet');
                EXIT(EntryLineRec.Amount)
            END
            ELSE BEGIN

                // Filter Lookupline records to those of current Table Id Only
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SETRANGE(TableId, EDFileRec."Table Look Up");

                // Depending on whether input parameter is code or numeric, set dbSETRANGE
                //appropraitely and initialise the record to use as a parameter to
                //dbFINDREC

                CASE LookHeaderRec.Type OF
                    0:
                        BEGIN
                            /* Lookup table is searched with numeric variables */
                            IF ProllFactorRec.Amount > -1 THEN BEGIN
                                LookLinesRec."Lower Code" := '';
                                InputAmount := ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                                LookLinesRec."Lower Amount" := InputAmount;
                                LookLinesRec.SETRANGE("Lower Code", '');
                            END
                            ELSE
                                EXIT(LookHeaderRec."Min. Extract Amount")
                        END;
                    2:
                        BEGIN
                            /* Lookup table is searched with numeric variables */
                            TaxBasis := PreTaxCalc2;
                            IF TaxBasis < 0 THEN EXIT(0);  /*Added July 13 2004*/

                            IF TaxBasis < 0 THEN
                                IsRefund := -1
                            ELSE
                                IsRefund := 1;
                            TaxBasis := ABS(TaxBasis);

                            IF TaxBasis > -1 THEN //ProllFactorRec.Amount > -1 THEN
                              BEGIN
                                LookLinesRec."Lower Code" := '';
                                InputAmount := TaxBasis * LookHeaderRec."Input Factor";//ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                                LookLinesRec."Lower Amount" := InputAmount; //PreTaxCalc;     //Pre calculate Tax YTD Values
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
                        BEGIN

                            ReturnAmount := (CalcTaxAmt(LookLinesRec, InputAmount)) * LookHeaderRec."Output Factor";

                            ReturnAmount := ReturnAmount - TaxYTD;

                            ReturnAmount := ReturnAmount * IsRefund;

                            IF ReturnAmount + TaxYTD < 0 THEN
                                ReturnAmount := ReturnAmount + TaxYTD;
                        END;
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
        EXIT(ProllHeader.Closed);

    end;


    procedure CalcTaxAmt(var LDetailsRec: Record 50003; TaxTableInput: Decimal): Decimal
    begin

        PrevLookRec := LDetailsRec;

        IF LDetailsRec.FIND('=') THEN
            IF PrevLookRec.NEXT(-1) = 0 THEN
                ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
            ELSE
                ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
        ELSE
            IF LDetailsRec.FIND('>') THEN
                IF LDetailsRec.NEXT(-1) = 0 THEN
                    ReturnAmount := 0
                ELSE
                    ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
            ELSE

                IF LDetailsRec.NEXT(-1) = 0 THEN
                    ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
                ELSE
                    ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput);

        EXIT(ReturnAmount);

    end;


    procedure CalcGraduated(var WantedLookRec: Record 50003; InputToTable: Decimal): Decimal
    begin

        PrevLookRec := WantedLookRec;

        COPYFILTERS(WantedLookRec);

        IF PrevLookRec.NEXT(-1) = 0 THEN BEGIN
            ReturnAmount := (InputToTable * WantedLookRec."Tax Rate %") / 100;
            //MESSAGE('there: ' + FORMAT(ReturnAmount)+' '+FORMAT(WantedLookRec."Lower Amount"));
        END
        ELSE BEGIN

            //MESSAGE('here '+FORMAT(WantedLookRec."Lower Amount"));
            ReturnAmount := (InputToTable - PrevLookRec."Upper Amount");
            ReturnAmount := (ReturnAmount * WantedLookRec."Tax Rate %") / 100;
            ReturnAmount := ReturnAmount + PrevLookRec."Cum. Tax Payable";
        END;
        //MESSAGE('Output from Graduated Final: ' + FORMAT(ReturnAmount)+'Tax input '+FORMAT(InputToTable));
        EXIT(ReturnAmount);

    end;


    procedure CalcCompute(EntryRecParam: Record 50006; AmountInLine: Decimal; "CalledFromEdCode?": Boolean; EDCode: Code[20])
    begin

        ConstEDFileRec.GET(EntryRecParam."E/D Code");
        "E/DFileRec" := ConstEDFileRec;
        IF "E/DFileRec".Compute = '' THEN
            EXIT;

        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", EntryRecParam."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", EntryRecParam."Employee No");

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

        /* Go through all the entry lines for this Period/Employee record and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        REPEAT
        BEGIN
            /*BDC
              IF  ProllEntryRec.MARK THEN
              */
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

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        ProllEntryRec.INIT;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        "E/DFileRec".GET(ConstEDFileRec.Compute);
        /*FTN No Need
        dbTRANSFERFIELDS ("E/DFileRec", ProllEntryRec);
        */

        /*Check for rounding, Maximum and minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        /*ProllEntryRec.Amount := ComputedTotal;
        ProllRecStore := ProllEntryRec;*/

        IF ProllEntryRec.FIND('=') THEN BEGIN
            /*ProllRecStore.ChangeOthers := TRUE;
            ProllRecStore.HasBeenChanged := TRUE;
            dbMODIFYREC (ProllRecStore);*/
            ProllEntryRec.Amount := ComputedTotal;
            ProllEntryRec.ChangeOthers := TRUE;
            ProllEntryRec.HasBeenChanged := TRUE;
            ProllEntryRec.MODIFY;
        END;
        COMMIT;

        ProllEntryRec.SETRANGE("Payroll Period");
        ProllEntryRec.SETRANGE("Employee No");

    end;


    procedure CalcFactor1(CurrentEntryLine: Record 50006)
    begin

        /* Get first record in Entry Lines file for this Employee/Period */
        ProllEntryRec := CurrentEntryLine;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Employee No", ProllEntryRec."Employee No");
        ProllEntryRec.SETRANGE("Payroll Period", ProllEntryRec."Payroll Period");
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.FIND('>');
        REPEAT

            "E/DFileRec".GET(ProllEntryRec."E/D Code");

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


    procedure "CalcFactor1.1"(CurrLineRec: Record 50006; LineToChangeRec: Record 50006; EDFileRec: Record 50001): Decimal
    var
        TaxBasis: Decimal;
    begin
        /*Š
        „ Calculate the amount based on Factor Of and Percentage fields of the file  „
        „ E/D file,
        „  Parameters:                                                               „
        „    CurrLineRec    : The current entry line record                          „
        „    LineToChangeRec: The entry line to be changed.
        „    EDFileRec      : EDFile Record for the E/D Code of LineToChangeRec      „
        ‹*/

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

                /* Depending on whether input parameter is code or numeric, set dbSETRANGE
                  appropraitely and initialise the record to use as a parameter to
                  dbFINDREC */
                CASE LookHeaderRec.Type OF
                    0:
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
                    2:
                        BEGIN
                            TaxBasis := PreTaxCalc2;
                            IF TaxBasis < 0 THEN
                                IsRefund := -1
                            ELSE
                                IsRefund := 1;
                            TaxBasis := ABS(TaxBasis);
                            LookLinesRec."Lower Code" := '';
                            InputAmount := TaxBasis * LookHeaderRec."Input Factor";//ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                            LookLinesRec."Lower Amount" := InputAmount; //PreTaxCalc;     //Pre calculate Tax YTD Values
                            LookLinesRec.SETRANGE("Lower Code", '');
                        END;

                    ELSE  /*Lookup table is searched with variables of type code*/
                      BEGIN
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := CurrLineRec."E/D Code";
                        LookLinesRec.SETRANGE("Upper Amount", 0);
                        LookLinesRec.SETRANGE("Lower Amount", 0);
                    END

                END; /* Case*/
                     //////////////////////////
                     /*
                                 LookLinesRec."Lower Code" := '';
                                 InputAmount := TaxBasis * LookHeaderRec."Input Factor"  ;//ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                                 LookLinesRec."Lower Amount" := InputAmount; //PreTaxCalc;     //Pre calculate Tax YTD Values
                                 LookLinesRec.SETRANGE("Lower Code",'');
                     */
                     /////////////////////////////
                CASE LookHeaderRec.Type OF
                    0, 1:
                        BEGIN
                            /* Extract amount as follows; First find line where Lower Amount or
                              Lower Code is just greater than the CurrLineRec then move one line
                              back.*/

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
                        BEGIN
                            ReturnAmount := PreTaxCalc2;
                            //MESSAGE('Faulty');
                            ReturnAmount := (CalcTaxAmt(LookLinesRec, ReturnAmount *
                                                         LookHeaderRec."Input Factor")) *
                                                         LookHeaderRec."Output Factor";

                            ReturnAmount := ReturnAmount - TaxYTD;
                            ReturnAmount := ReturnAmount * IsRefund;  // Update if Refund
                            IF ReturnAmount + TaxYTD < 0 THEN
                                ReturnAmount := ReturnAmount + TaxYTD;


                            //          ReturnAmount := (CalcTaxAmt (LookLinesRec, CurrLineRec.Amount *
                            //                                       LookHeaderRec."Input Factor")) *
                            //                                       LookHeaderRec."Output Factor";

                        END; /*Option 2*/
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


    procedure ChangeAllOver(CurrentRec: Record 50006; CurrWasDeleted: Boolean)
    begin
        /*Š
        „ Go through all the lines and where a line is supposed to Change others    „
        „ then change those others.                                                 „
        „ Parameters :                                                              „
        „   CurrentRec      : Current Entry line                                    „
        „   CurrWasDeleted  : True if the current record was deleted                „
        ‹*/

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


    procedure ComputeAgain(ParamLine: Record 50006; CurrentRec: Record 50006; CurrWasDeleted: Boolean)
    begin
        /*Š
        „ Compute values for the E/D specified in the Compute field for the         „
        „  Entry Line record passed as a parameter                                  „
        „ Parameters :                                                              „
        „   ParamLine       : Entry line passed as a parameter                      „
        „   CurrentRec      : Current Entry line                                    „
        „   CurrWasDeleted  : True if the current record was deleted                „
        ‹*/

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

        /*
          Initialise the variable to store the computed total. If a record was
          deleted then initialise to 0. Otherwise if the current line (i.e that
          entered by the user) also contributes to the computed line then we
          initialise the computed total to that amount
        */
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


    procedure CalcFactorAgain(ParamLine: Record 50006; CurrentRec: Record 50006; CurrWasDeleted: Boolean)
    begin
        /*Š
        „ If a change in a line due to the entry or change to another entry is a     „
        „ contributory factor for the value of another line, then  compute that      „
        „other line's value and insert it appropriately                              „
        „ Parameters :                                                               „
        „   ParamLine         : Line whose value should change others                „
        „   CurrentRec        : Current Entry line                                   „
        „   CurrWasDeleted    : True if CurrentRec is to be deleted                  „
        ‹*/

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


    procedure ResetChangeFlags(CurrentRec: Record 50006)
    begin
        /*Š
        „ Reset ChangeOthers to false for all lines in this Period/Employee          „
        „ Parameters :                                                               „
        „   CurrentRec  : Current entry line                                         „
        ‹*/
        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec := CurrentRec;
        ProllEntryRec.INIT;
        ProllEntryRec.SETRANGE("Payroll Period", CurrentRec."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", CurrentRec."Employee No");
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.FIND('>');

        /* Reset ChangeOthers for this Employee Group */
        REPEAT

            ProllEntryRec.ChangeOthers := FALSE;
            ChangeOthersRec.ChangeCounter := 0;
            /*BDC - Do not modify the one to be deleted*/
            IF ProllEntryRec."E/D Code" <> CurrentRec."E/D Code" THEN
                ProllEntryRec.MODIFY;

        UNTIL (ProllEntryRec.NEXT(1) = 0);
        COMMIT;

        ProllEntryRec.RESET;

    end;


    procedure AmountIsComputed(var ReturnAmount: Decimal; EntryLineRec: Record 50006; EDFileRec: Record 50001; NewAmount: Decimal; EDCode: Code[20]): Boolean
    begin
        /*Š
        „ Check for values that should COMPUTE the amount for the P.Roll Entry      „
        „ Line record.                                                              „
        „ Return:                                                                   „
        „   If there are entries for the employee/period that compute the value     „
        „   then return TRUE else return FALSE                                      „
        „ Parameters :                                                              „
        „   ReturnAmount:  The computed amount, by refference                       „
        „   EntryLineRec:  The P.Roll Entry record whose value is to be computed    „
        „   EDFileRec   :  The E/D file record of the E/D of the P.Roll Entry Record„
        „   NewAmount   :  The new calculated or entered amount in the current rec. „
        ‹*/

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


    procedure ChangeDueToDelete(DeletedRec: Record 50006)
    begin
        /*Š
        „ Due to the deleted record, ensure all the other lines are correct.        „
        „ Parameters :                                                              „
        „   DeletedRec : The current record (= the record to be deleted)            „
        „                                                                           „
        ‹*/
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


    procedure ChkRoundMaxMin(EDRecord: Record 50001; TheAmount: Decimal): Decimal
    begin
        /*Š
        „ Round an amount and check for Max and Min. Return the amended amount.     „
        „ Parameters :                                                              „
        „   EDRecord : The ED file record to use to check Round, Max. and Min       „
        „   TheAmount: The amounht to Round, and check for Max. and Min             „
        ‹*/

        /* Adjust amount as per maximum/minimum set in the E/D file. */
        IF (EDRecord."Max. Amount" <> 0) AND
           (TheAmount > EDRecord."Max. Amount") THEN
            TheAmount := EDRecord."Max. Amount"
        ELSE
            IF (TheAmount < EDRecord."Min. Amount") THEN //AND (EDRecord."Payslip Group ID"<>"Payslip Group ID"::"TAX DEDUCTED") THEN
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


    procedure EDAmountToDate(EmpNo: Code[10]; CurPeriod: Code[10]; EDCode: Code[10]): Decimal
    var
        Finished: Boolean;
        p: Integer;
        PaySlips: Record 50006;
    begin

        IF PeriodRec.GET(CurPeriod) THEN;

        //  PerStart := PeriodRec."Start Date";
        //CurYear := DATE2DMY(PerStart,3);
        p := DATE2DMY(PeriodRec."End Date", 2);
        Finished := FALSE;
        REPEAT
            IF (p < DATE2DMY(PeriodRec."End Date", 2)) OR (DATE2DMY(PeriodRec."End Date", 2) = 1) THEN BEGIN
                //YearStart := PeriodRec."Start Date";
                Per1 := PeriodRec."Period Code";
                Finished := TRUE;
            END;
            p := DATE2DMY(PeriodRec."End Date", 2);
        UNTIL ((PeriodRec.NEXT(-1) = 0) OR Finished);

        IF NOT Finished THEN BEGIN
            PeriodRec.NEXT;
            //YearStart := PeriodRec."Start Date";
            Per1 := PeriodRec."Period Code";
        END;

        //CALCDATE('-CY',PerStart);

        //PeriodRec.SETRANGE("Start Date",YearStart,PerStart);      //Adams
        //PeriodRec.FIND('-') ;  // Adams
        //  Per1 := PeriodRec."Period Code";

        EmployeeRec.RESET;
        EmployeeRec.GET(EmpNo);

        EmployeeRec.SETRANGE("Period Filter", Per1, CurPeriod);
        EmployeeRec.SETRANGE("ED Filter", EDCode);

        EmployeeRec.CALCFIELDS(EDAmount);

        //IF PaySlips.GET(CurPeriod,EmpNo,EDCode) THEN
        //EXIT(EmployeeRec.EDAmount-PaySlips.Amount)
        //ELSE
        EXIT(EmployeeRec.EDAmount);
    end;


    procedure GetParam()
    begin
        PaySetup.RESET;
        PaySetup.FIND('-');
        DaysInMonth := PaySetup."Monthly Working Days";
        HrsInDay := PaySetup."Monthly Working Hours";

        IF ("Employee No" <> '') THEN BasicPay := EmployeeRec.GetBasic("Employee No");
    end;


    procedure PayrollMonthofDate(InputDate: Date): Integer
    var
        locPeriodRec: Record 50004;
    begin
        locPeriodRec.SETRANGE(locPeriodRec."Start Date", 0D, InputDate);
        locPeriodRec.FIND('+');
        EXIT(DATE2DMY(locPeriodRec."End Date", 2));
    end;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        /*  DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
         DimMgt.SaveDefaultDim(DATABASE::Table65006, "Payroll Period", FieldNo, ShortcutDimCode);
         MODIFY; */
    end;


    procedure PreTaxCalc(): Decimal
    var
        Ret1: Decimal;
        EmployeeRec: Record 5200;
        CumTax: Decimal;
        TaxAmount: Decimal;
        PayLines2: Record 50006;
        j: Integer;
    begin
        PeriodRecs.GET("Payroll Period");
        NewEmpRec.GET("Employee No");

        GetTaxTable;
        UpdateTaxTable(0);
        CurrTaxable := 0;
        IF PayLines2.GET("Payroll Period", "Employee No", TaxableED) THEN
            CurrTaxable := PayLines2.Amount
        ELSE
            ERROR('Please Indicate the Taxable ED in The ED Table\\' +
                  'Using the payslip Group ID Field');


        TaxableYTD := EDAmountToDate("Employee No", "Payroll Period", TaxableED) +
                      NewEmpRec."Gross Taxable YTD B/F" + CurrTaxable;

        TaxYTD := EDAmountToDate("Employee No", "Payroll Period", TaxED) + NewEmpRec."Tax Paid YTD B/F";
        TaxFreeYTD := (NewEmpRec."Annual Tax Freepay" * (DATE2DMY(PeriodRecs."End Date", 2) - Skipped)) / 12;


        AmountToTax := TaxableYTD - TaxFreeYTD;
        IF AmountToTax < 0 THEN AmountToTax := 0;

        UpdateTaxTable(Skipped);

        i := 0;
        CumTax := 0;

        FOR j := 1 TO iMx DO BEGIN
            IF (TaxTable[j, 1] <= AmountToTax) AND (AmountToTax <= TaxTable[j, 2]) THEN BEGIN
                CumTax := CumTax + (AmountToTax - TaxTable[j, 1]) * TaxTable[j, 3] / 100;
                //      error(format(Amounttotax)  + '=>' +format(TaxTable[j,2]));
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

        CurrentMonth := DATE2DMY(PeriodRecs."End Date", 2);
        FOR i := 1 TO iMx DO BEGIN
            TaxTable[i, 1] := TaxTable[i, 4] * (CurrentMonth - Skipped) / (12);
            TaxTable[i, 2] := TaxTable[i, 5] * (CurrentMonth - Skipped) / (12);
        END;

        //error(format(taxtable[4,1]));
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


    procedure PreTaxCalc2(): Decimal
    var
        Ret1: Decimal;
        PeriodRecs: Record 50004;
        Skipped: Integer;
        EmployeeRec: Record 5200;
    begin

        EDRec2.RESET;
        EDRec2.SETRANGE(EDRec2."Payslip Group ID", EDRec2."Payslip Group ID"::"TAXABLE PAY");
        EDRec2.FIND('-');
        TaxableED := EDRec2."E/D Code";
        IF locplines.GET("Payroll Period", "Employee No", TaxableED) THEN
            locplines.VALIDATE(locplines."E/D Code");

        EDRec2.RESET;
        EDRec2.SETRANGE(EDRec2."Payslip Group ID", EDRec2."Payslip Group ID"::"TAX DEDUCTED");
        EDRec2.FIND('-');
        TaxED := EDRec2."E/D Code";

        //PaySetup.RESET;
        //PaySetup.FIND('-');
        //TaxfreeED :=  PaySetup."Taxfree Pay ED";

        CurrTaxable := 0;
        //ERROR(FORMAT(PayLines2.COUNT));
        IF PayLines2.GET("Payroll Period", "Employee No", TaxableED) THEN
            CurrTaxable := PayLines2.Amount
        ELSE
            ERROR('Please Indicate the Taxable ED in The ED Table\\' +
                  'Using the payslip Group ID Field');
        PeriodRecs.GET("Payroll Period");
        NewEmpRec.GET("Employee No");

        Skipped := 0;

        IF NewEmpRec."Employment Date" <> 0D THEN BEGIN
            IF (DATE2DMY(NewEmpRec."Employment Date", 3) = DATE2DMY(PeriodRecs."End Date", 3)) THEN BEGIN
                IF (PayrollMonthofDate(NewEmpRec."Employment Date") > 1) THEN BEGIN

                    Skipped := PayrollMonthofDate(NewEmpRec."Employment Date") - 1;
                    //DATE2DMY(NewEmpRec."Employment Date",2)-1;
                END;
            END;
        END;

        locplines.GET("Payroll Period", "Employee No", TaxableED);
        //MESSAGE('cur. taxable '+FORMAT(CurrTaxable));
        //locplines.Amount+


        TaxableYTD := EDAmountToDate("Employee No", "Payroll Period", TaxableED) +
                      NewEmpRec."Gross Taxable YTD B/F";// + CurrTaxable;

        TaxYTD := EDAmountToDate("Employee No", "Payroll Period", TaxED) + NewEmpRec."Tax Paid YTD B/F";
        TaxFreeYTD := (NewEmpRec."Annual Tax Freepay" * (DATE2DMY(PeriodRecs."End Date", 2) - Skipped)) / 12;  //-Skipped

        AmountToTax := TaxableYTD - TaxFreeYTD;

        //MESSAGE('taxable YTD'+FORMAT(TaxableYTD)+'taxytd=  '+FORMAT(TaxYTD)+' tax free  '
        //+FORMAT(TaxFreeYTD)+' totax '+FORMAT(AmountToTax));

        //if AmountToTax<0 then AmountToTax := 0;

        EXIT(AmountToTax);


    end;
}

