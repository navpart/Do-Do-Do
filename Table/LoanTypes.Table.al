table 50019 "Loan Types"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Loan Control Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(4; "Default Interest Percent"; Decimal)
        {
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5; "Default Journal Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = filter('GENERAL'));
            ValidateTableRelation = false;
        }
        field(6; "Loan ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code" WHERE("Loan (Y/N)" = filter(true));

            trigger OnValidate()
            var
                EDRec: Record "Payroll-E/D Codes.";
            begin
                EDRec.GET("Loan ED");
                IF NOT EDRec."Loan (Y/N)" THEN ERROR('The selected ED Code is not a loan Ed Code!');

                "Up-Front Payment" := EDRec."Up-Front Payment";
                //MODIFY(FALSE);
            end;
        }
        field(12; "Default Number of Payments"; Integer)
        {
            InitValue = 1;
            MinValue = 1;
        }
        field(13; "Up-Front Payment"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Loan ED")
        {
        }
        key(Key3; "Loan Control Account")
        {
        }
    }

    fieldgroups
    {
    }
}

