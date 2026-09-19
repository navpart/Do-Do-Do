table 50134 "Cheque Receipt Mgt."
{
    DataCaptionFields = "Cheque No.", "Bank Name", "Cheque Value";
    /* DrillDownPageID = 50286;
    LookupPageID = 50286; */

    fields
    {
        field(1; "Code"; Code[10])
        {

            trigger OnValidate()
            begin
                IF Code <> xRec.Code THEN BEGIN
                    GLSetup.GET;
                    NoSeriesMgt.TestManual(GLSetup."Cheque Receipt mgt");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Cashier Code"; Code[20])
        {
        }
        field(4; "Transaction date"; Date)
        {
        }
        field(5; "Cheque No."; Code[20])
        {
        }
        field(6; "Banks Cheque code"; Code[5])
        {
        }
        field(7; "Bank Name"; Text[30])
        {
        }
        field(8; "Cheque Value"; Decimal)
        {
        }
        field(9; "Cheque Date"; Date)
        {

            trigger OnValidate()
            begin
                "Post Dated Cheque" := "Cheque Date" > WORKDATE;
            end;
        }
        field(10; "Post Dated Cheque"; Boolean)
        {
            Editable = false;
        }
        field(11; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF cusrec.GET("Customer No.") THEN
                    "Customer  Name" := cusrec.Name;
            end;
        }
        field(12; "Customer  Name"; Text[50])
        {
        }
        field(13; Reference; Code[20])
        {
        }
        field(14; Description; Text[50])
        {
        }
        field(15; "Deposited Bank Account"; Code[10])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(16; "Date Presented to Bank"; Date)
        {

            trigger OnValidate()
            begin
                wkd := DATE2DWY("Date Presented to Bank", 1);
                CASE wkd OF
                    6:
                        "Date Presented to Bank" := CALCDATE('2D', "Date Presented to Bank");
                    7:
                        "Date Presented to Bank" := CALCDATE('1D', "Date Presented to Bank");
                END;
                IF "Cheque Date" > "Date Presented to Bank" THEN
                    ERROR('Date Presented to bank cannot be, before Cheque Date');
            end;
        }
        field(17; "Expected Clearing Date"; Date)
        {

            trigger OnValidate()
            begin
                wkd := DATE2DWY("Expected Clearing Date", 1);
                CASE wkd OF
                    6:
                        "Expected Clearing Date" := CALCDATE('2D', "Expected Clearing Date");
                    7:
                        "Expected Clearing Date" := CALCDATE('1D', "Expected Clearing Date");
                END;
                IF "Expected Clearing Date" < "Date Presented to Bank" THEN
                    ERROR('Expected Clearing Date cannot be, before Date presented to Bank');
            end;
        }
        field(18; "Date Cleared"; Date)
        {

            trigger OnValidate()
            begin
                wkd := DATE2DWY("Date Cleared", 1);
                CASE wkd OF
                    6:
                        "Date Cleared" := CALCDATE('2D', "Date Cleared");
                    7:
                        "Date Cleared" := CALCDATE('1D', "Date Cleared");
                END;

                IF "Date Cleared" < "Date Presented to Bank" THEN
                    ERROR('Date Clear can not be before Date presented to Bank');
            end;
        }
        field(19; Cleared; Boolean)
        {

            trigger OnValidate()
            begin
                IF Cleared THEN BEGIN
                    IF CONFIRM('This action will update customer account automatically, are you sure this cheque is cleared ?', FALSE) THEN BEGIN
                        "G/lJour".INIT;
                        "G/lJour"."Journal Template Name" := 'STANDARD';
                        "G/lJour"."Journal Batch Name" := 'CHEQUERCPT';
                        "G/lJour"."Line No." := 10000;
                        "G/lJour"."Account Type" := "G/lJour"."Account Type"::Customer;
                        "G/lJour".VALIDATE("G/lJour"."Account No.", "Customer No.");
                        "G/lJour".VALIDATE("G/lJour"."Posting Date", "Date Cleared");
                        "G/lJour"."Document Type" := "G/lJour"."Document Type"::Payment;
                        "G/lJour".VALIDATE("G/lJour"."Document No.", Code);
                        "G/lJour".Description := Description;
                        "G/lJour".VALIDATE("G/lJour"."Credit Amount", "Cheque Value");
                        "G/lJour"."Bal. Account Type" := "G/lJour"."Bal. Account Type"::"Bank Account";
                        "G/lJour"."Bal. Account No." := "Deposited Bank Account";
                        "G/lJour"."External Document No." := "Cheque No.";
                        postrec.RUN("G/lJour");
                    END
                    ELSE
                        ERROR('Becareful, this action updates Customer account automatically');
                END
                ELSE
                    ERROR('This Cheque is already cleared and the customer account had been updated.');
            end;
        }
        field(20; "No. Series"; Code[20])
        {
        }
        field(21; "Total Bank Deposit"; Decimal)
        {
            CalcFormula = Sum("Cheque Receipt Mgt."."Cheque Value" WHERE("Deposited Bank Account" = FIELD("Deposited Bank Account"),
                                                                          "Date Presented to Bank" = FIELD("Date filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Customer Deposit"; Decimal)
        {
            CalcFormula = Sum("Cheque Receipt Mgt."."Cheque Value" WHERE("Customer No." = FIELD("Customer No."),
                                                                          "Transaction date" = FIELD("Date filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Date filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(24; Returned; Boolean)
        {
        }
        field(25; "Returned Date"; Date)
        {
        }
        field(26; "Receipt No."; Code[20])
        {
            Editable = false;
            TableRelation = "Payment/Receipt."."No." WHERE("Document Type" = CONST(Receipt),
                                                          "Cash/Cheque" = CONST(Cheque));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Transaction date", "Deposited Bank Account", "Date Presented to Bank")
        {
            SumIndexFields = "Cheque Value";
        }
        key(Key3; "Transaction date", "Date Presented to Bank", "Customer No.")
        {
            SumIndexFields = "Cheque Value";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD(Cleared, TRUE);
    end;

    trigger OnInsert()
    begin
        GLSetup.GET;
        IF Code = '' THEN BEGIN
            GLSetup.TESTFIELD("Cheque Receipt mgt");
            Rec."No. Series" := GLSetup."Cheque Receipt mgt";
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            Rec.Code := NoSeriesMgt.GetNextNo(Rec."No. Series");
        END;
        "Transaction date" := WORKDATE;
    end;

    trigger OnModify()
    begin
        // TESTFIELD(Cleared,TRUE);
    end;

    var
        cusrec: Record Customer;
        bankrec: Record "Bank Account";
        "G/lJour": Record "Gen. Journal Line";
        postrec: Codeunit "Gen. Jnl.-Post Line";
        GLSetup: Record "General Ledger Setup";
        ChequeRec: Record "Cheque Receipt Mgt.";
        NoSeriesMgt: Codeunit "No. Series";
        wkd: Integer;

    procedure AssistEdit(OldChq: Record "Cheque Receipt Mgt."): Boolean
    begin
        /* WITH ChequeRec DO BEGIN
            ChequeRec := Rec;
            GLSetup.GET;
            GLSetup.TESTFIELD("Cheque Receipt mgt");
            IF NoSeriesMgt.SelectSeries(GLSetup."Cheque Receipt mgt", OldChq."No. Series", "No. Series") THEN BEGIN
                GLSetup.GET;
                GLSetup.TESTFIELD("Cheque Receipt mgt");
                NoSeriesMgt.SetSeries(Code);
                Rec := ChequeRec;
                EXIT(TRUE);
            END;
        END; */
    end;
}

