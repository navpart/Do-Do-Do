table 50112 "Expense Analysis Header"
{

    fields
    {
        field(1; "G/L Account No."; Code[10])
        {
            TableRelation = "G/L Account"."No." WHERE("Income/Balance" = FILTER('Income Statement'));

            trigger OnValidate()
            begin
                IF GLAccount.GET("G/L Account No.") THEN
                    "Account Name" := GLAccount.Name ELSE
                    "Account Name" := '';
            end;
        }
        field(2; "Start Date"; Date)
        {
        }
        field(3; "End Date"; Date)
        {
        }
        field(4; "Account Name"; Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "G/L Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ExpenseCurrYr.SETRANGE("G/L Account No.", "G/L Account No.");
        IF ExpenseCurrYr.FINDFIRST THEN
            ExpenseCurrYr.DELETEALL;

        ExpensePrevYr.SETRANGE("G/L Account No.", "G/L Account No.");
        IF ExpensePrevYr.FINDFIRST THEN
            ExpensePrevYr.DELETEALL;
    end;

    var
        GLEntry: Record "G/L Entry";
        GLEntry2: Record "G/L Entry";
        ExpenseCurrYr: Record "Expense Analysis Line Curr. Yr";
        ExpensePrevYr: Record "Expense Analysis Line Prev. Yr";
        GLAccount: Record "G/L Account";
        StartMonth: Integer;
        EndMonth: Integer;
        i: Integer;
        CurrYr: Integer;
        PrevYr: Integer;
        MonthName: Text[20];
        StartDate: Date;
        EndDate: Date;
        StartDateLYr: Date;
        EndDateLYr: Date;

    
    procedure ImportEntries()
    begin
        ExpenseCurrYr.SETRANGE("G/L Account No.", "G/L Account No.");
        IF ExpenseCurrYr.FINDFIRST THEN
            ExpenseCurrYr.DELETEALL;

        ExpensePrevYr.SETRANGE("G/L Account No.", "G/L Account No.");
        IF ExpensePrevYr.FINDFIRST THEN
            ExpensePrevYr.DELETEALL;

        CurrYr := DATE2DMY("Start Date", 3);
        StartMonth := DATE2DMY("Start Date", 2);
        EndMonth := DATE2DMY("End Date", 2);

        FOR i := StartMonth TO EndMonth DO BEGIN
            StartDate := DMY2DATE(1, i, CurrYr);
            EndDate := CALCDATE('CM', StartDate);

            GLEntry.SETRANGE("G/L Account No.", "G/L Account No.");
            GLEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
            IF GLEntry.FINDFIRST THEN BEGIN
                GLEntry.CALCSUMS(Amount);
                ExpenseCurrYr.INIT;
                ExpenseCurrYr."G/L Account No." := "G/L Account No.";
                ExpenseCurrYr."Line No." += 10000;
                ExpenseCurrYr."Start Date" := StartDate;
                ExpenseCurrYr."End Date" := EndDate;
                MonthName := FORMAT(StartDate, 0, '<Month Text>');
                ExpenseCurrYr.Month := MonthName;
                ExpenseCurrYr.Amount := GLEntry.Amount;
                ExpenseCurrYr.INSERT;
            END;
        END;


        PrevYr := CurrYr - 1;

        FOR i := StartMonth TO EndMonth DO BEGIN
            StartDateLYr := DMY2DATE(1, i, PrevYr);
            EndDateLYr := CALCDATE('CM', StartDateLYr);
            GLEntry.RESET;
            GLEntry.SETRANGE("G/L Account No.", "G/L Account No.");
            GLEntry.SETFILTER("Posting Date", '%1..%2', StartDateLYr, EndDateLYr);
            IF GLEntry.FINDFIRST THEN BEGIN
                GLEntry.CALCSUMS(Amount);
                ExpensePrevYr.INIT;
                ExpensePrevYr."G/L Account No." := "G/L Account No.";
                ExpensePrevYr."Line No." += 10000;
                ExpensePrevYr."Start Date" := StartDateLYr;
                ExpensePrevYr."End Date" := EndDateLYr;
                MonthName := FORMAT(StartDateLYr, 0, '<Month Text>');
                ExpensePrevYr.Month := MonthName;
                ExpensePrevYr.Amount := GLEntry.Amount;
                ExpensePrevYr.INSERT;
            END;
        END;
    end;
}

