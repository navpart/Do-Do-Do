table 50013 "Loan."
{
    DataCaptionFields = "Staff Name", "Loan ID", Description, "Remaining Amount";

    fields
    {
        field(1; "Loan ID"; Code[10])
        {
        }
        field(2; "Staff No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnValidate()
            begin
                StaffRec.GET("Staff No.");
                "Staff Name" := StaffRec.FullName;
                "Posting Group" := StaffRec."Posting Group";

                "Acct. Type" := "Acct. Type"::Customer;
                //"Acct. Type" := "Acct. Type"::Supplier;

                "Acct. No." := "Staff No.";
            end;
        }
        field(3; "Staff Name"; Text[40])
        {
            NotBlank = true;
        }
        field(4; "Loan Type"; Code[10])
        {
            TableRelation = "Loan Types";

            trigger OnValidate()
            begin
                LoanTypes.GET("Loan Type");
                Description := LoanTypes.Description;
                "Counter Acct. Type" := "Counter Acct. Type"::"G/L Account";
                "Counter Acct. No." := LoanTypes."Loan Control Account";
                VALIDATE("Interest Percent", LoanTypes."Default Interest Percent");
                VALIDATE("Loan ED Regular", LoanTypes."Loan ED");
                VALIDATE("Journal Batch", LoanTypes."Default Journal Batch");
                //IF "Number of Payments"=1 THEN
                VALIDATE("Number of Payments", LoanTypes."Default Number of Payments");
            end;
        }
        field(5; Description; Text[30])
        {
            NotBlank = true;
        }
        field(6; "Acct. Type"; enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Customer,Supplier;
        }
        field(7; "Acct. No."; Code[20])
        {
            TableRelation = IF ("Acct. Type" = filter("G/L Account")) "G/L Account"."No."
            ELSE
            IF ("Acct. Type" = filter(Customer)) Customer."No."
            ELSE
            IF ("Acct. Type" = filter(Vendor)) Vendor."No.";
        }
        field(8; "Counter Acct. Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Staff,Supplier,Bank;
        }
        field(9; "Counter Acct. No."; Code[20])
        {
            TableRelation = IF ("Counter Acct. Type" = filter("G/L Account")) "G/L Account"."No."
            ELSE
            IF ("Counter Acct. Type" = CONST(Customer)) Customer."No."
            ELSE
            IF ("Counter Acct. Type" = CONST(Vendor)) Vendor."No."
            ELSE
            IF ("Counter Acct. Type" = CONST("Bank Account")) "Bank Account"."No.";
        }
        field(10; "Loan Amount"; Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin

                IF ("Number of Payments" <> 0) THEN
                    "Monthly Repayment" := ROUND(LPlusInt / "Number of Payments", 0.01, '>')
                ELSE
                    "Monthly Repayment" := 0;
            end;
        }
        field(11; "Start Period"; Code[10])
        {
            TableRelation = "Payroll-Periods."."Period Code";
        }
        field(12; "Number of Payments"; Integer)
        {
            InitValue = 1;
            MinValue = 1;

            trigger OnValidate()
            begin
                // Comments by Adam
                IF ("Number of Payments" <> 0) THEN
                    "Monthly Repayment" := ROUND(LPlusInt / "Number of Payments", 0.01, '>')
                //ELSE
                //  "Monthly Repayment" := 0;
            end;
        }
        field(13; "Monthly Repayment"; Decimal)
        {

            trigger OnValidate()
            begin
                IF ("Monthly Repayment" <> 0) THEN
                    "Number of Payments" := ROUND(LPlusInt / "Monthly Repayment", 1, '>')
                ELSE
                    "Number of Payments" := 1;  // 1 not 0 "Adam
            end;
        }
        field(14; "Open(Y/N)"; Boolean)
        {

            trigger OnValidate()
            begin
                "Suspended(Y/N)" := NOT "Open(Y/N)";
            end;
        }
        field(15; "Suspended(Y/N)"; Boolean)
        {

            trigger OnValidate()
            begin
                "Open(Y/N)" := NOT "Suspended(Y/N)";
            end;
        }
        field(16; "Loan ED Regular"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code" WHERE("Loan (Y/N)" = filter(true));

            trigger OnValidate()
            begin
                /*
                EDRec.GET("Loan ED");
                IF NOT EDRec."Loan (Y/N)" THEN ERROR('The selected ED Code is not a loan Ed Code!');
                */

            end;
        }
        field(17; "Remaining Amount"; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("Staff No."),
                                                                                 "Loan ID" = FIELD("Loan ID"),
                                                                                 "Entry Type" = CONST("Initial Entry")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Loan Posting Date"; Date)
        {
        }
        field(19; "Voucher No. for Loan"; Code[10])
        {
        }
        field(20; "Journal Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name;
            ValidateTableRelation = false;
        }
        field(21; "Loan Created"; Boolean)
        {
            Editable = false;

            trigger OnValidate()
            begin
                GenJournal.RESET;
                GenJournal.SETCURRENTKEY("Loan ID");
                GenJournal.SETRANGE(GenJournal."Loan ID", Rec."Loan ID");
                IF GenJournal.FIND('-') THEN
                    ERROR('You have to delete the previous Gen Journal Entry in order to recreate a new one!');
            end;
        }
        field(22; "Actual Ledger Bal."; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(23; "Interest Percent"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                // Comments by Adam
                IF ("Number of Payments" <> 0) THEN
                    "Monthly Repayment" := ROUND(LPlusInt / "Number of Payments", 0.01, '>')
                //ELSE
                //  "Monthly Repayment" := 0;
            end;
        }
        field(24; "Posting Group"; Code[20])
        {
            TableRelation = "Payroll-Posting Group Header.";
        }
        field(25; "Cust Ldg Entry No"; Integer)
        {
            BlankZero = true;
            CalcFormula = Lookup("Detailed Cust. Ledg. Entry"."Entry No." WHERE("Loan ID" = FIELD("Loan ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Cust Ldg Entry No2"; Integer)
        {
            Editable = true;
        }
        field(27; "Loan Type(DOS)"; Option)
        {
            OptionMembers = Advance,IOU,Loan,Car,Housing,Incidental,Personal,Rent;
        }
        field(28; "Loan Paid Up"; Decimal)
        {
            Editable = false;
        }
        field(29; "Loan ED Reinbus"; Code[20])
        {
        }
        field(30; "Reinbus Repayment"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Monthly Repayment");
            end;
        }
        field(31; "Mid Month Deductable"; Boolean)
        {
        }
        field(32; "Regular Deductable"; Boolean)
        {
        }
        field(33; "Mid Month Counter Acct. Type"; Option)
        {
            OptionMembers = Finance,Staff,Supplier;
        }
        field(34; "Mid Month Counter Acct. No."; Code[20])
        {
            TableRelation = IF ("Mid Month Counter Acct. Type" = filter('Finance')) "G/L Account"."No."
            ELSE
            IF ("Mid Month Counter Acct. Type" = filter('Staff')) Customer."No."
            ELSE
            IF ("Mid Month Counter Acct. Type" = filter('Supplier')) Vendor."No.";
        }
        field(35; "Non Detailed"; Boolean)
        {
            Description = 'For Staff with no Customer Account';

            trigger OnValidate()
            begin
                IF "Non Detailed" THEN BEGIN
                    CALCFIELDS("Remaining Amount");
                    IF "Remaining Amount" > 0 THEN
                        ERROR('You can''t mark this field')
                    ELSE
                        "Remaining Balance" := "Loan Amount";
                END
                ELSE
                    IF "Remaining Balance" > 0 THEN
                        IF "Remaining Balance" = "Loan Amount" THEN
                            "Remaining Balance" := 0 ELSE
                            ERROR('You can not change this Button');
            end;
        }
        field(36; "Remaining Balance"; Decimal)
        {
            Description = 'For non Detailed Loan';
            Editable = false;

            trigger OnValidate()
            begin
                CALCFIELDS("Cummulative deduction");
                "Remaining Balance" := "Loan Amount" - "Cummulative deduction";
                MODIFY;
            end;
        }
        field(37; "Cummulative deduction"; Decimal)
        {
        }
        field(38; "Cost Centre Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(39; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(40; "Interest Charge"; Decimal)
        {
            Editable = false;
        }
        field(41; "Amount Due Next"; Decimal)
        {
            Editable = false;
        }
        field(42; "Interest ED Code"; Code[20])
        {

        }
        field(43; "Interest Calc. Method"; Option)
        {
            OptionCaption = ' ,Straight Line,Reducing';
            OptionMembers = " ","Straight Line",Reducing;

            trigger OnValidate()
            begin
                //"Amount Due Next" := 0;
                //"Interest Charge" := 0;
                VALIDATE("Number of Payments");
                //VALIDATE("Interest Percent");
            end;
        }
        field(44; "Interest Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = filter(true),
                                                     Blocked = filter(false),
                                                     "Account Type" = CONST(Posting));
        }
        field(45; "Interest Paid To Date"; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Credit Amount" WHERE("Entry Type" = CONST("Initial Entry"),
                                                                                  "Customer No." = FIELD("Staff No."),
                                                                                  "Loan ID" = FIELD("Loan ID"),
                                                                                  "Interest Element" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Interest Charges To Date"; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Debit Amount" WHERE("Entry Type" = filter("Initial Entry"),
                                                                                 "Customer No." = FIELD("Staff No."),
                                                                                 "Loan ID" = FIELD("Loan ID"),
                                                                                 "Interest Element" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; "Last Interest Posting Date"; Date)
        {
            Editable = false;
        }
        field(48; "Repayment Interval"; Option)
        {
            OptionCaption = 'Monthly,Quaterly,Bi Annually,Yearly';
            OptionMembers = Monthly,Quaterly,"Bi Annually",Yearly;
        }
        field(49; "Next Repayment Period"; Code[20])
        {
        }
        field(50001; "Payment Type"; Option)
        {
            OptionCaption = 'Cash,Bank';
            OptionMembers = Cash,Bank;
        }
        field(50002; "Created from IOU"; Boolean)
        {
            Editable = false;
        }
        field(50003; "IOU No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Loan ID")
        {
            Clustered = true;
        }
        key(Key2; "Staff No.", "Start Period", "Open(Y/N)", "Suspended(Y/N)")
        {
        }
        key(Key3; "Staff No.", "Loan ED Regular")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        CALCFIELDS("Remaining Amount");
        IF "Remaining Amount" <> 0 THEN ERROR('Loan has not been fully repaid, cannot be deleted!');
    end;

    trigger OnInsert()
    begin

        IF "Loan ID" = '' THEN BEGIN
            PaySetup.RESET;
            PaySetup.FIND('-');
            PaySetup.TESTFIELD(PaySetup."Loan Nos.");
            "Loan ID" := NoSeriesMgt.GetNextNo(PaySetup."Loan Nos.");

            "Counter Acct. Type" := "Counter Acct. Type"::"G/L Account";
            "Counter Acct. No." := PaySetup."Staff Loans Control Account";
        END;
    end;

    trigger OnModify()
    begin

        TESTFIELD("Loan ID");
        TESTFIELD("Staff No.");
        TESTFIELD(Description);
        TESTFIELD("Acct. No.");
        TESTFIELD("Loan Amount");
        TESTFIELD("Start Period");
        TESTFIELD("Number of Payments");
        TESTFIELD("Monthly Repayment");
        TESTFIELD("Loan ED Regular");

        /*IF "Loan Created" THEN
          BEGIN
            IF ("Loan Amount" <> xRec."Loan Amount") OR
               ("Start Period" <> xRec."Start Period") OR
               ("Interest Percent" <> xRec."Interest Percent") THEN
                  ERROR('You Cannot MODIFY a Created Loan!');
          END;
        */

    end;

    var
        StaffRec: Record Employee;
        EDRec: Record "Payroll-E/D Codes.";
        GlRec: Record "Gen. Journal Line";
        GlRec1: Record "Gen. Journal Line";
        ACSETREC: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LoanRec: Record "Loan.";
        Genbatch: Record "Gen. Journal Batch";
        PaySetup: Record "Payroll Setup.";
        GenJournal: Record "Gen. Journal Line";
        LoanTypes: Record "Loan Types";


    procedure InserGlLine(ShowReport: Boolean)
    var
        employeeRec: Record Employee;
        VendorRec: Record Vendor;
        NextLine: Integer;
        CustomerRec: Record Customer;
        BankRec: Record "Bank Account";
    begin
        TESTFIELD("Loan ID");
        TESTFIELD("Staff No.");
        TESTFIELD("Acct. No.");
        TESTFIELD("Loan Amount");
        TESTFIELD("Loan ED Regular");
        TESTFIELD("Loan Posting Date");
        TESTFIELD("Voucher No. for Loan");

        CALCFIELDS("Remaining Amount");
        IF "Remaining Amount" > 0 THEN
            ERROR('The loan cannot be posted -\' +
                  'Has been posted previously!');
        IF "Loan Created" THEN ERROR('Loan has been created before');

        StaffRec.GET("Staff No.");
        /*
        IF "Acct. Type"="Acct. Type"::Supplier THEN BEGIN
         IF NOT VendorRec.GET("Staff No.") THEN BEGIN
          IF NOT CONFIRM('You must create a Staff Vendor Account in order to continue.\Do you want to create a Staff Vendor Account for '+
                         "Staff Name"+ ' now?',TRUE) THEN
            EXIT;
          employeeRec.SETRANGE("No.","Staff No.");
          REPORT.RUN(REPORT::"Create Customer Acct. forStaff",FALSE,FALSE,employeeRec);
        END;
        END
        ELSE
        */

        BEGIN
            IF NOT CustomerRec.GET("Staff No.") THEN BEGIN
                IF NOT CONFIRM('You must create a Staff Customer Account in order to continue.' +
                               '\Do you want to create a Staff Customer Account for ' +
                               "Staff Name" + ' now?', TRUE) THEN
                    EXIT;
                employeeRec.SETRANGE("No.", "Staff No.");
                //REPORT.RUN(REPORT::Report50127, FALSE, FALSE, employeeRec);
            END;
        END;

        TESTFIELD("Journal Batch");
        IF NOT Genbatch.GET('STANDARD', "Journal Batch") THEN BEGIN
            Genbatch.INIT;
            Genbatch."Journal Template Name" := 'STANDARD';
            Genbatch.Name := "Journal Batch";
            //    Genbatch."Global Dimension 1 Code" := StaffRec."Global Dimension 1 Code";
            //    Genbatch."Business Unit" := StaffRec."Business Unit";
            Genbatch.INSERT;
        END;

        GlRec.VALIDATE("Journal Template Name", 'STANDARD');
        GlRec.VALIDATE("Journal Batch Name", "Journal Batch");
        GlRec1.SETRANGE(GlRec1."Journal Template Name", GlRec."Journal Template Name");
        GlRec1.SETRANGE(GlRec1."Journal Batch Name", GlRec."Journal Batch Name");
        IF GlRec1.FIND('+') THEN
            GlRec."Line No." := GlRec1."Line No." + 10000
        ELSE
            GlRec."Line No." := 10000;
        NextLine := GlRec."Line No." + 10000;

        GlRec.VALIDATE("Account Type", "Acct. Type");
        GlRec.VALIDATE("Account No.", "Acct. No.");
        GlRec.VALIDATE("Posting Date", "Loan Posting Date");
        GlRec.VALIDATE("Shortcut Dimension 1 Code", StaffRec."Global Dimension 1 Code");
        GlRec.VALIDATE("Document No.", "Voucher No. for Loan");
        GlRec.Description := 'Loan ' + "Loan ID";
        GlRec.VALIDATE(Amount, "Loan Amount");

        // Comments removed by Adam
        GlRec.VALIDATE("Bal. Account Type", "Counter Acct. Type");
        GlRec.VALIDATE("Bal. Account No.", "Counter Acct. No.");

        GlRec."Shortcut Dimension 2 Code" := StaffRec."Global Dimension 2 Code";

        GlRec."Loan Type" := "Loan Type"; //Added by Adam
        GlRec."Loan ID" := "Loan ID";

        GlRec.INSERT;

        IF "Interest Percent" <> 0 THEN BEGIN
            GlRec.VALIDATE("Journal Template Name", 'STANDARD');
            GlRec.VALIDATE("Journal Batch Name", "Journal Batch");
            // Modified by Adam
            //GlRec1.SETRANGE(GlRec1."Journal Template Name",GlRec."Journal Template Name");
            //GlRec1.SETRANGE(GlRec1."Journal Batch Name",GlRec."Journal Batch Name");
            //GlRec1.FIND('+');

            GlRec."Line No." := NextLine;

            //ELSE
            //  GlRec."Line No." := 20;


            GlRec.VALIDATE("Account Type", "Acct. Type");
            GlRec.VALIDATE("Account No.", "Acct. No.");
            GlRec.VALIDATE("Posting Date", "Loan Posting Date");
            GlRec.VALIDATE("Shortcut Dimension 1 Code", StaffRec."Global Dimension 1 Code");
            GlRec.VALIDATE("Document No.", "Voucher No. for Loan");
            GlRec.Description := 'Interest for Loan ' + "Loan ID";
            GlRec.VALIDATE(Amount, LPlusInt - "Loan Amount");

            // Comments removed by Adam
            GlRec.VALIDATE("Bal. Account Type", "Counter Acct. Type");
            GlRec.VALIDATE("Bal. Account No.", "Counter Acct. No.");

            GlRec."Shortcut Dimension 2 Code" := StaffRec."Global Dimension 2 Code";

            GlRec."Loan Type" := "Loan Type"; //Added by Adam
            GlRec."Loan ID" := "Loan ID";
            GlRec.INSERT;
        END;

        "Loan Created" := TRUE;
        VALIDATE("Open(Y/N)", TRUE);
        MODIFY;

        IF ShowReport THEN MESSAGE('The Loan was succesfully created in the General Journals!');

    end;


    procedure AssistEdit(LRec: Record "Loan."): Boolean
    begin
        /*  WITH LoanRec DO BEGIN
             LoanRec := Rec;
             ACSETREC.GET;

             ACSETREC.TESTFIELD(ACSETREC."Loan Number Series");

             IF NoSeriesMgt.SelectSeries(ACSETREC."Loan Number Series", ACSETREC."Loan Number Series", ACSETREC."Loan Number Series")
             THEN BEGIN
                 ACSETREC.GET;
                 ACSETREC.TESTFIELD(ACSETREC."Loan Number Series");
                 NoSeriesMgt.SetSeries("Loan ID");
                 Rec := LoanRec;
                 EXIT(TRUE);
             END;
         END; */
    end;


    procedure LPlusInt(): Decimal
    begin
        EXIT("Loan Amount" * ("Interest Percent" + 100) / 100);
    end;
}

