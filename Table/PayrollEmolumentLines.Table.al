table 50005 "Payroll-Emolument Lines"
{

    fields
    {
        field(1; "Emolument Group"; Code[20])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "Payroll-Emolument Header";
        }
        field(2; "E/D Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin


                "E/DFileRec".GET("E/D Code");

                // Transfer Units and Rate
                BEGIN
                    Rate := "E/DFileRec".Rate;
                    Units := "E/DFileRec".Units;
                    "Payslip Group ID" := "E/DFileRec"."Payslip Group ID";
                    "Control Type" := "E/DFileRec"."Control Type";
                    "ED Category" := "E/DFileRec"."ED Type";
                END;

                //Calculate the amount if neither quantities nor yes flag are required
                IF (Units = '') AND NOT ("E/DFileRec"."Yes/No Req.") THEN BEGIN
                    "Default Amount" := CalcAmount("E/DFileRec",
                                                     Rec, "Default Amount");
                    IF Rec."Default Amount" <>
                       xRec."Default Amount" THEN BEGIN
                        // Change the entries that are computed using this new amount 
                        CalcCompute(Rec, "Default Amount", TRUE);

                        //If this new entry is a contributory factor for the value of another
                        //line, then compute that other line's value and insert it appropriately
                        CalcFactor1(Rec);

                        // Go through all the lines and make any appropriate Changes 
                        ChangeAllOver(Rec, FALSE);

                        // Set the 'Change' flags to false in all the lines 
                        ResetChangeFlags(Rec);

                    END;
                END;

                "E/DFileRec".GET("E/D Code");

                IF ("E/DFileRec"."ED Type" = "E/DFileRec"."ED Type"::"Gross Salary") THEN
                    "ED Category" := "ED Category"::"Pension Employer";

                IF ("E/DFileRec"."Payslip Print Column" = "E/DFileRec"."Payslip Print Column"::"Net Earning") THEN
                    "ED Category" := "ED Category"::"NSITF Gross";

            end;
        }
        field(3; Units; Text[10])
        {
        }
        field(4; Rate; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                IF (Units = '') THEN
                    // User cannot edit the rate if the E/D code has no units
                    Rec.Rate := xRec.Rate
                ELSE BEGIN
                    "Default Amount" := Quantity * Rate;

                    // Check for rounding and Maximum/Minimum 
                    "E/DFileRec".GET("E/D Code");
                    "Default Amount" := ChkRoundMaxMin("E/DFileRec", "Default Amount");

                END

            end;
        }
        field(5; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                IF (Units = '') THEN
                    // User cannot enter quantity if the E/D code has no units
                    Rec.Quantity := xRec.Quantity
                ELSE BEGIN
                    "Default Amount" := Quantity * Rate;

                    // Check for rounding and Maximum/Minimum 
                    "E/DFileRec".GET("E/D Code");
                    "Default Amount" := ChkRoundMaxMin("E/DFileRec", "Default Amount");

                END

            end;
        }
        field(6; Flag; Boolean)
        {

            trigger OnValidate()
            begin
                "E/DFileRec".GET("E/D Code");
                IF NOT ("E/DFileRec"."Yes/No Req.") THEN
                    Flag := FALSE
                ELSE BEGIN
                    "Default Amount" := CalcAmount("E/DFileRec", Rec,
                                                     "Default Amount");
                END
            end;
        }
        field(7; "Default Amount"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            InitValue = 0;
            NotBlank = true;

            trigger OnValidate()
            begin

                "E/DFileRec".GET("E/D Code");
                IF NOT ("E/DFileRec"."Edit Grp. Amount") THEN
                    Rec."Default Amount" :=
                    xRec."Default Amount"
                ELSE
                    // Check for rounding and Maximum/Minimum 
                    "Default Amount" := ChkRoundMaxMin("E/DFileRec", "Default Amount");

                "E/DFileRec".GET("E/D Code");
                IF "E/DFileRec"."ED Type2" = 1 THEN BEGIN
                    "E/DFileRec".SETRANGE("E/DFileRec"."ED Type2", 2);
                    IF "E/DFileRec".FIND('+') THEN BEGIN
                        GroupLineRec.SETRANGE(GroupLineRec."Emolument Group", "Emolument Group");
                        GroupLineRec.SETRANGE(GroupLineRec."E/D Code", "E/DFileRec"."E/D Code");
                        IF GroupLineRec.FIND('+') THEN BEGIN
                            GroupLineRec.Rate := ("Default Amount" / 176) * 1.5;
                            GroupLineRec.MODIFY;
                        END;
                    END;
                    "E/DFileRec".SETRANGE("E/DFileRec"."ED Type2", 3);
                    IF "E/DFileRec".FIND('+') THEN BEGIN
                        GroupLineRec.SETRANGE(GroupLineRec."Emolument Group", "Emolument Group");
                        GroupLineRec.SETRANGE(GroupLineRec."E/D Code", "E/DFileRec"."E/D Code");
                        IF GroupLineRec.FIND('+') THEN BEGIN
                            GroupLineRec.Rate := ("Default Amount" / 176) * 2;
                            GroupLineRec.MODIFY;
                        END;
                    END;
                    "E/DFileRec".SETRANGE("E/DFileRec"."ED Type2", 4);
                    IF "E/DFileRec".FIND('+') THEN BEGIN
                        GroupLineRec.SETRANGE(GroupLineRec."Emolument Group", "Emolument Group");
                        GroupLineRec.SETRANGE(GroupLineRec."E/D Code", "E/DFileRec"."E/D Code");
                        IF GroupLineRec.FIND('+') THEN BEGIN
                            GroupLineRec."Yearly Allowance" := "Default Amount" * 0.1 * 12;
                            GroupLineRec.MODIFY;
                        END;
                    END;

                END;

            end;
        }
        field(8; ChangeOthers; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(9; HasBeenChanged; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(10; ChangeCounter; Integer)
        {
            Editable = false;
            InitValue = 0;
        }
        field(11; "Employee Name"; Text[30])
        {
        }
        field(14; "ED Category"; Option)
        {
            Description = 'Added by for NSITF Report';
            Editable = false;
            OptionMembers = " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer","NSITF Gross",NHF,"Net Pay","Other Emoluments","Gross Emolument","Emolument Net","Deduction Emolument";
        }
        field(15; "Old Default Amount"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Description = 'For Increments';
        }
        field(16; "Date Changed"; Date)
        {
            Description = 'For Increments';
        }
        field(17; "Payslip Group ID"; Option)
        {
            Editable = false;
            OptionMembers = " ","GROSS PAY","TAXABLE PAY","TAX CHARGED","TAX DEDUCTED","TOTAL DEDUCTIONS","NET PAY DUE","TAX FREE PAY";
        }
        field(18; "Payslip Text"; Text[35])
        {
            CalcFormula = Lookup("Payroll-E/D Codes."."Payslip Text" WHERE("E/D Code" = FIELD("E/D Code")));
            Description = 'Added for getting the payslip text';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Last Modified by"; Code[20])
        {
            Description = 'user id';
        }
        field(20; "Date Last Modified"; Date)
        {
            Description = 'date he/she modified this record';
        }
        field(36; "Control Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Basic,Absence,"Ordinary Overtime","Special Overtime";
        }
        field(50000; Description; Text[30])
        {
        }
        field(50001; PFlag; Code[1])
        {
        }
        field(50002; Percentage; Decimal)
        {
        }
        field(50003; Lsum; Code[10])
        {
        }
        field(50004; Text; Text[30])
        {
        }
        field(50005; "Yearly Allowance"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Default Amount", "Yearly Allowance" / 12);
            end;
        }
    }

    keys
    {
        key(Key1; "Emolument Group", "E/D Code")
        {
            Clustered = true;
            SumIndexFields = "Default Amount";
        }
        key(Key2; "Default Amount")
        {
            SumIndexFields = "Default Amount";
        }
        key(Key3; "Emolument Group", "ED Category")
        {
            SumIndexFields = "Default Amount";
        }
        key(Key4; "ED Category")
        {
            SumIndexFields = "Default Amount";
        }
        key(Key5; "Emolument Group", "Payslip Group ID")
        {
            SumIndexFields = "Default Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        ChangeOthers := FALSE;
        // Go through all the lines and make any appropriate Changes
        ChangeDueToDelete(Rec);

        // Set the 'Change' flags to false in all the lines
        ResetChangeFlags(Rec);

    end;

    trigger OnInsert()
    begin
        EMPGRPHEADER.GET("Emolument Group");
        "Employee Name" := EMPGRPHEADER."Search Name";
    end;

    trigger OnModify()
    begin

        IF Rec."Default Amount" <>
           xRec."Default Amount" THEN BEGIN
            MARK(TRUE);
            // If this new entry contributes in computing another, then compute that
            //value for that computed entry and insert it appropriately
            CalcCompute(Rec, "Default Amount", FALSE);

            //If this new entry is a contributory factor for the value of another line,
            //then compute that other line's value and insert it appropriately
            CalcFactor1(Rec);

            //The new entry in this line has already been used to Compute another and
            //also entries where it is a Factor, therefore set ChangeOthers to false
            ChangeOthers := FALSE;

            // Go through all the lines and make any appropriate Changes
            ChangeAllOver(Rec, FALSE);

            // Set the 'Change' flags to false in all the lines 


            MARK(FALSE)
        END;

    end;

    var
        "E/DFileRec": Record 50001;
        ConstEdFileRec: Record 50001;
        LineFactorRec: Record 50005;
        LookHeaderRec: Record 50002;
        LookLinesRec: Record 50003;
        PrevLookRec: Record 50003;
        BackOneRec: Integer;
        ComputedTotal: Decimal;
        AmountToAdd: Decimal;
        AmtToAdd: Decimal;
        ReturnAmount: Decimal;
        InputAmount: Decimal;
        FactorRecAmount: Decimal;
        EmpLinesRecStore: Record 50005;
        EmpGrpLinesRec: Record 50005;
        ChangeOthersRec: Record 50005;
        RoundPrec: Decimal;
        RoundDir: Text[1];
        IsComputed: Boolean;
        MaxChangeCount: Integer;
        EMPGRPHEADER: Record 50000;
        GroupLineRec: Record 50005;


    procedure SpecialRelation("FieldNo.": Integer)
    begin


        /* Force NO-EDIT of field already has a value*/
        IF "E/D Code" <> '' THEN
            EXIT;

    end;


    procedure CalcAmount(EDFileRec: Record 50001; EntryLineRec: Record 50005; EntryLineAmount: Decimal): Decimal
    begin
        /*Š
        „ Calculate the amount based on Factor Of and Percentage fields in the file  „
        „ E/D file, alternatively calculate if the group line is computed by others  „
        „  Parameters:                                                               „
        „    EDFileRec    : EDFile Record for the E/D Code of the current entry line „
        „    EntryLineRec : The current entry line record                            „
        „    EntryLineAmount: The amount in the current entry line. Not this         „
        „    parameter is important if this trigger is called from the SAVE trigger  „
        ‹*/

        /* If NO is in the flag field return amount to 0 */
        IF (EDFileRec."Yes/No Req.") AND NOT (EntryLineRec.Flag) THEN
            EXIT(0);

        /* If Factor Of is Nil then check if amount is computed by others */
        IF EDFileRec."Factor Of" = '' THEN
            IF NOT AmountIsComputed(ReturnAmount, EntryLineRec, EntryLineAmount) THEN
                EXIT(EntryLineRec."Default Amount")
            ELSE BEGIN
                /* Check for rounding and Maximum/Minimum */
                ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);
                EXIT(ReturnAmount)
            END;

        /* Get the record from the current file based on Factor Of */
        IF NOT LineFactorRec.GET(EntryLineRec."Emolument Group",
                         EDFileRec."Factor Of") THEN
            EXIT(EntryLineRec."Default Amount")
        ELSE
            /* If this 'Factor of' entry record is marked then this trigger was called
              from the 'Factor of' entry line, therefore ensure the amount to be used
              is the updated amount*/
            IF LineFactorRec.MARK THEN
                FactorRecAmount := EntryLineAmount
            ELSE
                FactorRecAmount := LineFactorRec."Default Amount";

        /* Calculate the amount based on values in Table Look Up or Percentage fields
          of E/D file */
        IF EDFileRec."Table Look Up" = '' THEN
            ReturnAmount := (FactorRecAmount * EDFileRec.Percentage) / 100
        ELSE /* Extract relevant amount from Table Look Up */

            IF NOT LookHeaderRec.GET(EDFileRec."Table Look Up") THEN BEGIN
                MESSAGE('Table Lookup Not Registered Yet');
                EXIT(EntryLineRec."Default Amount")
            END
            ELSE BEGIN /* Table lookup exists*/

                /* Filter Lookupline records to those of current Table Id Only*/
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SETRANGE(TableId, EDFileRec."Table Look Up");

                /* Depending on whether input parameter is code or numeric, set dbSETRANGE
                  appropraitely and initialise the record to use as a parameter to
                  dbFINDREC */
                /*IF LookHeaderRec.Type = 0 THEN BEGIN*/
                CASE LookHeaderRec.Type OF
                    0, 2:
                        BEGIN
                            /* Lookup table is searched with numeric variables */
                            IF FactorRecAmount > -1 THEN BEGIN
                                LookLinesRec."Lower Code" := '';
                                InputAmount := FactorRecAmount * LookHeaderRec."Input Factor";
                                LookLinesRec."Lower Amount" := InputAmount;
                                LookLinesRec.SETRANGE("Lower Code", '');
                            END
                            ELSE
                                EXIT(LookHeaderRec."Min. Extract Amount")
                        END;
                    ELSE  /*Lookup table is searched with variables of type code*/
                      BEGIN
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := EDFileRec."Factor Of";
                        LookLinesRec.SETRANGE("Upper Amount", 0);
                        LookLinesRec.SETRANGE("Lower Amount", 0);
                    END
                END; /* Case*/

                CASE LookHeaderRec.Type OF
                    0, 1:
                        BEGIN
                            /* Extract amount as follows; First find line where Lower Amount or
                              lower code is just greater than the Factor Amount then move one
                              line back.*/

                            IF LookLinesRec.FIND('=') THEN
                                ReturnAmount := LookLinesRec."Extract Amount"
                            ELSE
                                IF LookLinesRec.FIND('>') THEN BEGIN
                                    BackOneRec := LookLinesRec.NEXT(-1);
                                    ReturnAmount := LookLinesRec."Extract Amount";
                                END
                                ELSE
                                    IF LookHeaderRec.Type = 0 THEN BEGIN
                                        /*'Factor' Amount is > than the table's greatest "Lower amount"*/
                                        IF LookLinesRec.FIND('+') THEN
                                            ReturnAmount := LookLinesRec."Extract Amount";
                                    END
                                    ELSE
                                        EXIT(EntryLineRec."Default Amount");
                        END;

                    2: /*  Extract amount from tax table*/
                        ReturnAmount := (CalcTaxAmt(LookLinesRec, InputAmount)) *
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

        /* Check for rounding and Maximum/Minimum */
        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);

        EXIT(ReturnAmount);

    end;


    procedure CalcCompute(EntryRecParam: Record 50005; AmountInLine: Decimal; "CalledFromEdCode?": Boolean)
    begin
        /*Š
        „ Compute values for the E/D specified in the Compute field for the current „
        „  Entry Line record                                                        „
        „ Parameters :                                                              „
        „   EntryRecParam           : Current entry line                            „
        „   AmountInLine            : The figure in the amount field in this line   „
        „   "CalledFromEdCode?"     : True if the trigger code was called from the  „
        „                            "E/D Code" field                               „
        ‹*/

        ConstEdFileRec.GET(EntryRecParam."E/D Code");
        "E/DFileRec" := ConstEdFileRec;
        IF "E/DFileRec".Compute = '' THEN
            EXIT;

        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", EntryRecParam."Emolument Group");

        /* If the entry line to be computed does not exist then EXIT */
        EmpGrpLinesRec := EntryRecParam;
        EmpGrpLinesRec."E/D Code" := ConstEdFileRec.Compute;
        IF NOT EmpGrpLinesRec.FIND('=') THEN
            EXIT;

        /* If the line to be computed needs a flag and yet the flag is false, EXIT */
        "E/DFileRec".GET(EmpGrpLinesRec."E/D Code");
        IF ("E/DFileRec"."Yes/No Req.") AND NOT (EmpGrpLinesRec.Flag) THEN
            EXIT;

        /* Initialise the variable to store the computed total. Note if the trigger
          code was called from the "E/D Code" field then that record is a new one.
          This implies that a search of the records in the file will not find this
          new record. Therefore for it's amount to be used in the computation
          we initialise the computed total to that amount*/
        IF "CalledFromEdCode?" THEN BEGIN
            IF ConstEdFileRec."Add/Subtract" = 2 THEN
                /* Subtract */
            ComputedTotal := -AmountInLine
            ELSE
                /* Add */
            ComputedTotal := AmountInLine;
        END
        ELSE
            ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Employee group*/
        EmpGrpLinesRec := EntryRecParam;
        EmpGrpLinesRec."E/D Code" := '';
        EmpGrpLinesRec.FIND('>');

        /* Go through all the entry lines for this Employee group and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        REPEAT
        BEGIN
            IF EmpGrpLinesRec."E/D Code" = EntryRecParam."E/D Code" THEN
                /* We are at the record where the function was called from */
            AmountToAdd := AmountInLine
            ELSE
                AmountToAdd := EmpGrpLinesRec."Default Amount";

            "E/DFileRec".GET(EmpGrpLinesRec."E/D Code");
            IF "E/DFileRec".Compute = ConstEdFileRec.Compute THEN
                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
              ComputedTotal := ComputedTotal - AmountToAdd
                ELSE
                    /* Add */
              ComputedTotal := ComputedTotal + AmountToAdd;

        END
        UNTIL (EmpGrpLinesRec.NEXT(1) = 0);

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec."E/D Code" := ConstEdFileRec.Compute;
        "E/DFileRec".GET(ConstEdFileRec.Compute);

        /* Check for rounding and Maximum/Minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        BEGIN
            EmpGrpLinesRec.Rate := "E/DFileRec".Rate;
            EmpGrpLinesRec.Units := "E/DFileRec".Units;
        END;
        EmpGrpLinesRec."Default Amount" := ComputedTotal;
        EmpLinesRecStore := EmpGrpLinesRec;
        /*dbSETRANGE (EmpLinesRecStore."Employee Group", EmpGrpLinesRec."Employee Group");*/

        //EmpGrpLinesRec.LOCKTABLE( FALSE);

        IF EmpGrpLinesRec.FIND('=') THEN BEGIN
            FactorRecAmount := EmpGrpLinesRec."Default Amount";
            EmpGrpLinesRec."Default Amount" := EmpLinesRecStore."Default Amount";
            /*The new entry in this line should now be used to Compute another and
             also entries where it is a Factor, therefore set ChangeOthers to True*/
            IF FactorRecAmount <> EmpGrpLinesRec."Default Amount" THEN BEGIN
                EmpGrpLinesRec.ChangeOthers := TRUE;
                EmpGrpLinesRec.MODIFY
            END
        END;
        COMMIT;

        EmpGrpLinesRec.SETRANGE("Emolument Group");
        EmpLinesRecStore.SETRANGE("Emolument Group");

    end;


    procedure CalcFactor1(CurrentEntryLine: Record 50005)
    begin
        /*Š
        „ If an entry is a contributory factor for the value of another line, then   „
        „ compute that other line's value and insert it appropriately                „
        „ Parameters :                                                               „
        „   CurrentEntryLine        : Current entry line                             „
        ‹*/

        /*Get first record in Employee Group Lines file for this Employee group*/
        EmpGrpLinesRec := CurrentEntryLine;
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", EmpGrpLinesRec."Emolument Group");
        EmpGrpLinesRec."E/D Code" := '';
        EmpGrpLinesRec.FIND('>');

        /* Go through all the entry lines for this Employee Group record and where
          the current entry line's value is a factor, calculate that amount. */
        REPEAT

            "E/DFileRec".GET(EmpGrpLinesRec."E/D Code");

            IF "E/DFileRec"."Factor Of" = CurrentEntryLine."E/D Code" THEN BEGIN

                FactorRecAmount := EmpGrpLinesRec."Default Amount";
                EmpGrpLinesRec."Default Amount" := "CalcFactor1.1"(CurrentEntryLine,
                                                                    EmpGrpLinesRec,
                                                                    "E/DFileRec");
                /*The new entry in this line should now be used to Compute another and
                 also entries where it is a Factor, therefore set ChangeOthers to True*/
                IF FactorRecAmount <> EmpGrpLinesRec."Default Amount" THEN BEGIN
                    EmpGrpLinesRec.ChangeOthers := TRUE;
                    EmpGrpLinesRec.MODIFY;
                END;
            END;

        UNTIL (EmpGrpLinesRec.NEXT(1) = 0);
        COMMIT;

    end;


    procedure "CalcFactor1.1"(CurrLineRec: Record 50005; LineToChangeRec: Record 50005; EDFileRec: Record 50001): Decimal
    begin
        /*Š
        „ Calculate the amount based on Factor Of and Percentage fields of the       „
        „ E/D file record linked to the Line to be Changed.                          „
        „  Parameters:                                                               „
        „    CurrLineRec    : The current entry line record                          „
        „    LineToChangeRec: The entry line to be changed.                          „
        „    EDFileRec      : EDFile Record for the E/D Code of LineToChangeRec      „
        ‹*/

        /* If NO is in the flag field return amount to 0 */
        IF (EDFileRec."Yes/No Req.") AND NOT (LineToChangeRec.Flag) THEN
            EXIT(0);

        /* Calculate the amount based on values in Table Look Up or Percentage fields
          of E/D file */
        IF EDFileRec."Table Look Up" = '' THEN
            ReturnAmount := (CurrLineRec."Default Amount" * EDFileRec.Percentage) / 100
        ELSE /* Extract relevant amount from Table Look Up */

            IF NOT LookHeaderRec.GET(EDFileRec."Table Look Up") THEN BEGIN
                MESSAGE('Table Lookup Not Registered Yet');
                EXIT(LineToChangeRec."Default Amount")
            END
            ELSE BEGIN /* Table lookup exists*/

                /* Filter Lookupline records to those of current Table Id Only*/
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SETRANGE(TableId, EDFileRec."Table Look Up");

                /* Depending on whether input parameter is code or numeric, set dbSETRANGE
                  appropraitely and initialise the record to use as a parameter to
                  dbFINDREC */
                CASE LookHeaderRec.Type OF
                    0, 2:
                        BEGIN
                            /* Lookup table is searched with numeric variables */
                            IF CurrLineRec."Default Amount" > -1 THEN BEGIN
                                LookLinesRec."Lower Code" := '';
                                LookLinesRec."Lower Amount" := CurrLineRec."Default Amount" *
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
                                            EXIT(LineToChangeRec."Default Amount")
                                    END
                                    ELSE
                                        /*CurrLineRec.EDCode is > than the table's greatest "Lower code"*/
                  EXIT(LineToChangeRec."Default Amount");
                        END;

                    2: /*  Extract amount from tax table*/
                        ReturnAmount := (CalcTaxAmt(LookLinesRec,
                                                     CurrLineRec."Default Amount" *
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

        /* Check for rounding and Maximum/Minimum */
        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);

        EXIT(ReturnAmount);

    end;


    procedure ChangeAllOver(CurrentRec: Record 50005; CurrWasDeleted: Boolean)
    begin
        /*Š
        „ If there is any entry line that should change other lines then do so       „
        „  Parameters:                                                               „
        „    CurrentRec      : The current entry line record                         „
        „    CurrWasDeleted  : True if the current record was deleted                „
        ‹*/

        ChangeOthersRec := CurrentRec;
        ChangeOthersRec.SETRANGE("Emolument Group", CurrentRec."Emolument Group");
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
            ChangeOthersRec.ChangeCounter := ChangeOthersRec.ChangeCounter + 1;
            ChangeOthersRec.ChangeOthers := FALSE;
            ChangeOthersRec.MODIFY;
            EmpLinesRecStore := ChangeOthersRec;
            ChangeOthersRec."E/D Code" := '';
        UNTIL ((EmpLinesRecStore.ChangeCounter > MaxChangeCount) OR
               (ChangeOthersRec.NEXT(1) = 0));
        COMMIT;
        ChangeOthersRec.SETRANGE("Emolument Group");
        ChangeOthersRec.SETRANGE(ChangeOthers);
        IF (EmpLinesRecStore.ChangeCounter > MaxChangeCount) THEN
            MESSAGE('The E/D Code %1, / seems to have been defined with CYCLIC' +
                     ' characteristics', EmpLinesRecStore."E/D Code");

        EXIT;

    end;


    procedure ComputeAgain(ParamLine: Record 50005; CurrentRec: Record 50005; CurrWasDeleted: Boolean)
    begin
        /*Š
        „ Compute values for the E/D specified in the Compute field for the         „
        „  Entry Line record passed as a parameter                                  „
        „ Parameters :                                                              „
        „   ParamLine         : Entry line passed as a parameter                    „
        „   CurrentRec        : Current Entry line                                  „
        „   CurrWasDeleted    : True if CurrentRec is to be deleted                 „
        ‹*/

        ConstEdFileRec.GET(ParamLine."E/D Code");
        "E/DFileRec" := ConstEdFileRec;
        IF "E/DFileRec".Compute = '' THEN
            EXIT;

        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", ParamLine."Emolument Group");

        /* If the entry line to be computed does not exist then EXIT */
        EmpGrpLinesRec := ParamLine;
        EmpGrpLinesRec."E/D Code" := ConstEdFileRec.Compute;
        IF NOT EmpGrpLinesRec.FIND('=') THEN
            EXIT;

        /* If CurrentRec is to be deleted, then no need to re-compute it */
        IF (CurrWasDeleted AND (EmpGrpLinesRec."E/D Code" = CurrentRec."E/D Code"))
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
            IF "E/DFileRec".Compute = ConstEdFileRec.Compute THEN BEGIN
                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
            ComputedTotal := -CurrentRec."Default Amount"
                ELSE
                    /* Add */
            ComputedTotal := CurrentRec."Default Amount";
            END
            ELSE
                ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Employee group*/
        EmpGrpLinesRec := ParamLine;
        EmpGrpLinesRec."E/D Code" := '';
        EmpGrpLinesRec.FIND('>');

        /* Go through all the entry lines for this Employee group and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        REPEAT

            IF EmpGrpLinesRec."E/D Code" <> CurrentRec."E/D Code" THEN BEGIN

                "E/DFileRec".GET(EmpGrpLinesRec."E/D Code");
                IF "E/DFileRec".Compute = ConstEdFileRec.Compute THEN
                    IF "E/DFileRec"."Add/Subtract" = 2 THEN
                        /* Subtract */
                ComputedTotal := ComputedTotal - EmpGrpLinesRec."Default Amount"
                    ELSE
                        /* Add */
                ComputedTotal := ComputedTotal + EmpGrpLinesRec."Default Amount"

            END
        UNTIL (EmpGrpLinesRec.NEXT(1) = 0);

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec."E/D Code" := ConstEdFileRec.Compute;
        "E/DFileRec".GET(ConstEdFileRec.Compute);
        BEGIN
            EmpGrpLinesRec.Rate := "E/DFileRec".Rate;
            EmpGrpLinesRec.Units := "E/DFileRec".Units;
        END;

        /* Check for rounding and Maximum/Minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        EmpGrpLinesRec."Default Amount" := ComputedTotal;
        EmpLinesRecStore := EmpGrpLinesRec;

        // EmpGrpLinesRec.LOCKTABLE( FALSE);

        IF EmpGrpLinesRec.FIND('=') THEN BEGIN
            FactorRecAmount := EmpGrpLinesRec."Default Amount";
            EmpGrpLinesRec := EmpLinesRecStore;
            /*The new entry in this line should now be used to Compute another and
             also entries where it is a Factor, therefore set ChangeOthers to True*/
            IF FactorRecAmount <> EmpGrpLinesRec."Default Amount" THEN BEGIN
                EmpGrpLinesRec.ChangeOthers := TRUE;
                EmpGrpLinesRec.MODIFY
            END
        END;
        COMMIT;

        EmpGrpLinesRec.SETRANGE("Emolument Group");
        EmpLinesRecStore.SETRANGE("Emolument Group");

    end;


    procedure CalcFactorAgain(ParamLine: Record 50005; CurrentRec: Record 50005; CurrWasDeleted: Boolean)
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
        EmpGrpLinesRec := ParamLine;
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", ParamLine."Emolument Group");
        EmpGrpLinesRec."E/D Code" := '';
        IF NOT EmpGrpLinesRec.FIND('>') THEN
            EXIT;

        /* Go through all the entry lines for this Employee Group record and where
          the current entry line's value is a factor, calculate that amount. */
        REPEAT

            "E/DFileRec".GET(EmpGrpLinesRec."E/D Code");

            IF "E/DFileRec"."Factor Of" = ParamLine."E/D Code" THEN BEGIN

                FactorRecAmount := EmpGrpLinesRec."Default Amount";
                IF (CurrWasDeleted AND (ParamLine."E/D Code" =
                                        CurrentRec."E/D Code"))
                THEN
                    EmpGrpLinesRec."Default Amount" := 0
                ELSE BEGIN
                    EmpGrpLinesRec."Default Amount" := "CalcFactor1.1"(ParamLine,
                                                                        EmpGrpLinesRec,
                                                                        "E/DFileRec");
                    /*The new entry in this line should now be used to Compute another and
                     also entries where it is a Factor, therefore set ChangeOthers to True*/
                    IF FactorRecAmount <> EmpGrpLinesRec."Default Amount" THEN BEGIN
                        EmpGrpLinesRec.ChangeOthers := TRUE;
                        EmpGrpLinesRec.MODIFY
                    END
                END
            END;
        UNTIL (EmpGrpLinesRec.NEXT(1) = 0);
        COMMIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group");

    end;


    procedure ResetChangeFlags(CurrentRec: Record 50005)
    begin
        /*Š
        „ Reset the field ChangeOthers to false for all lines in this Employee Group „
        „ Parameters :                                                               „
        „   CurrentRec  : Current entry line                                         „
        ‹*/
        /*Get first record in Employee Group Lines file for this Employee group*/
        EmpGrpLinesRec := CurrentRec;
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", EmpGrpLinesRec."Emolument Group");
        EmpGrpLinesRec."E/D Code" := '';
        EmpGrpLinesRec.FIND('>');

        /* Reset ChangeOthers for this Employee Group */
        REPEAT

            EmpGrpLinesRec.ChangeOthers := FALSE;
            EmpGrpLinesRec.ChangeCounter := 0;
            /*BDC - Do not modify the one to be deleted*/
            /*  IF EmpGrpLinesRec."Employee Group" <> CurrentRec."Employee Group" THEN*/
            IF EmpGrpLinesRec."E/D Code" <> CurrentRec."E/D Code" THEN
                EmpGrpLinesRec.MODIFY;

        UNTIL (EmpGrpLinesRec.NEXT(1) = 0);
        COMMIT;

    end;


    procedure CalcTaxAmt(var LDetailsRec: Record 50003; TaxTableInput: Decimal): Decimal
    begin
        /*Š
        „ Returns the tax figure from a table lookup of type Tax                     „
        „ Parameters:                                                                „
        „  by Referrence : The current Lookup detail table record = LDetailsRec.     „
        „                  NB: By referrence so that all delimitations, sortings etc „
        „                      are still in effect.                                  „
        „  by value      : The amount to be taxed = TaxTableInput                    „
        ‹*/

        /* Copy all current filters of LookUpRec */
        PrevLookRec := LDetailsRec;
        /*BDC
         COPYFILTERS(LDetailsRec );
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


    procedure CalcGraduated(var WantedLookRec: Record 50003; InputToTable: Decimal): Decimal
    begin
        /*Š
        „ Returns the tax amount from the graduated tax table.                      „
        „ Parameters                                                                „
        „ by reference : The Table Lookup record within which the Taxable amount    „
        „                falls = WantedLookRec                                      „
        „                NB: By referrence so that all delimitations, sortings etc  „
        „                    are still in effect.                                   „
        „ by value     : The amount to be taxed = InputToTable                      „
        ‹*/

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


    procedure AmountIsComputed(var ReturnAmount: Decimal; EntryRecParam: Record 50005; NewAmount: Decimal): Boolean
    begin
        /*Š
        „ Check for values that should COMPUTE the amount for the P.Roll Entry      „
        „ Line record.                                                              „
        „ Return:                                                                   „
        „   If there are entries for the employee group that compute the value      „
        „   then return TRUE else return FALSE                                      „
        „ Parameters :                                                              „
        „   ReturnAmount : The computed amount, passed by reference                 „
        „   EntryRecParam: The P.Roll Entry record whose value is to be computed    „
        „   NewAmount    : The New Amount in the current entry line                 „
        ‹*/

        EmpLinesRecStore := EntryRecParam;

        /*Get first record in P.Roll Entry file for this Employee group*/
        EmpLinesRecStore.SETRANGE("Emolument Group", EntryRecParam."Emolument Group");
        EmpLinesRecStore."E/D Code" := '';
        IF NOT EmpLinesRecStore.FIND('>') THEN
            EXIT(FALSE);

        /* Initialise the variable to store the computed total. */
        ReturnAmount := 0;
        IsComputed := FALSE;

        /* Go through all the entry lines for this Employee group and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        REPEAT
            "E/DFileRec".GET(EmpLinesRecStore."E/D Code");
            IF "E/DFileRec".Compute = EntryRecParam."E/D Code" THEN BEGIN

                IF EmpLinesRecStore.MARK THEN
                    AmtToAdd := NewAmount
                ELSE
                    AmtToAdd := EmpLinesRecStore."Default Amount";

                IF "E/DFileRec"."Add/Subtract" = 2 THEN
                    /* Subtract */
              ReturnAmount := ReturnAmount - AmtToAdd
                ELSE
                    /* Add */
              ReturnAmount := ReturnAmount + AmtToAdd;

                IsComputed := TRUE
            END
        UNTIL (EmpLinesRecStore.NEXT(1) = 0);
        EmpLinesRecStore.SETRANGE("Emolument Group");

        EXIT(IsComputed);

    end;


    procedure ChangeDueToDelete(DeletedRec: Record 50005)
    begin
        /*Š
        „ Due to the deleted record, ensure all the other lines are correct.        „
        „ Parameters :                                                              „
        „   DeletedRec : The current record (= the record to be deleted             „
        „                                                                           „
        ‹*/
        /*Get first record in Employee Group Lines file for this Employee group*/
        EmpGrpLinesRec := DeletedRec;
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec.SETRANGE("Emolument Group", DeletedRec."Emolument Group");

        /* If the deleted record was 'COMPUTING" another then make changes */
        "E/DFileRec".GET(DeletedRec."E/D Code");
        EmpGrpLinesRec."E/D Code" := "E/DFileRec".Compute;
        IF EmpGrpLinesRec.FIND('=') THEN
            ComputeAgain(DeletedRec, DeletedRec, TRUE);

        CalcFactorAgain(DeletedRec, DeletedRec, TRUE);
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
}

