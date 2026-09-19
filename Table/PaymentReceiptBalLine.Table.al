table 50104 "Payment/Receipt Bal. Line."
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Receipt,Requisition,Journal,e-Pay,e-Receipt';
            OptionMembers = Receipt,Requisition,Journal,"e-Pay","e-Receipt";
        }
        field(3; "Cash/Cheque"; Option)
        {
            OptionMembers = Cash,Cheque;
        }
        field(4; "Account Type"; Enum "Gen. Journal Account Type")
        {

        }
        field(5; "Account No."; Code[20])
        {
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account"."No." WHERE(Blocked = FILTER(false), "Account Type" = CONST(Posting))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer."No." WHERE(Blocked = FILTER(<> All))
            ELSE
            IF ("Account Type" = CONST("Staff Loan")) Customer."No." WHERE(Blocked = FILTER(<> All), "Customer Posting Group" = filter('STAFF'))
            ELSE
            IF ("Cash/Cheque" = CONST(Cheque), "Account Type" = CONST("Bank Account")) "Bank Account"."No." WHERE(Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor."No." WHERE(Blocked = FILTER(<> All), "Vendor Posting Group" = FILTER(<> 'LC'))
            ELSE
            IF ("Account Type" = CONST(LC)) Vendor."No." WHERE(Blocked = FILTER(<> All), "Vendor Posting Group" = FILTER(<> 'LC'))
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"."No." WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin
                //"g/lacc".GET("Account No.");
                //"Account Description" := "g/lacc".Name;
                CASE "Account Type" OF
                    "Account Type"::"G/L Account":
                        BEGIN
                            "g/lacc".GET("Account No.");
                            "Account Description" := "g/lacc".Name;
                        END;
                    "Account Type"::Customer, "Account Type"::"Staff Loan":
                        BEGIN
                            custrec.GET("Account No.");
                            "Account Description" := custrec.Name;
                        END;
                    "Account Type"::Vendor, "Account Type"::LC:
                        BEGIN
                            vendrec.GET("Account No.");
                            "Account Description" := vendrec.Name;
                        END;

                    "Account Type"::"Bank Account":
                        BEGIN
                            bankrec.GET("Account No.");
                            "Account Description" := bankrec.Name;
                        END;
                    "Account Type"::"Fixed Asset":
                        BEGIN
                            fixedrec.GET("Account No.");
                            "Account Description" := fixedrec.Description;
                        END;
                END;
            end;
        }
        field(6; "Account Description"; Text[50])
        {

            trigger OnValidate()
            begin
                "Transaction Description" := "Account Description";
            end;
        }
        field(7; "Transaction Description"; Text[250])
        {
        }
        field(8; "Balance Account Type"; Option)
        {
            OptionMembers = "G/L Account",Customer,Supplier,Bank,"Fixed Asset";
        }
        field(9; "Balance Account No."; Code[20])
        {
            TableRelation = IF ("Balance Account Type" = CONST("G/L Account")) "G/L Account"."No." WHERE(Blocked = CONST(false), "Account Type" = CONST(Posting))
            ELSE
            IF ("Cash/Cheque" = CONST(Cheque), "Balance Account Type" = CONST(Bank)) "Bank Account"."No." WHERE(Blocked = CONST(false))
            ELSE
            IF ("Balance Account Type" = CONST(Customer)) Customer."No." WHERE(Blocked = FILTER(<> All))
            ELSE
            IF ("Balance Account Type" = CONST(Supplier)) Vendor."No." WHERE(Blocked = FILTER(<> All))
            ELSE
            IF ("Balance Account Type" = CONST("Fixed Asset")) "Fixed Asset"."No." WHERE(Blocked = CONST(false));

        }
        field(10; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(11; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(12; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                //headerrec.GET(Type,"Cash/Cheque","No.");
                IF "Currency Code" = '' THEN
                    "Amount (LCY)" := Amount
                ELSE BEGIN
                    VALIDATE("Amount (LCY)", (
                    ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                     "Posting Date", "Currency Code", Amount, "Currency Factor"))));
                END;
            end;
        }
        field(13; "Received by"; Text[50])
        {
        }
        field(14; "Cheque No."; Code[20])
        {
        }
        field(15; "Multiple Balance Account"; Boolean)
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Line No."; Integer)
        {
        }
        field(18; "Posting Date"; Date)
        {
        }
        field(28; "Credit Amount"; Decimal)
        {

            trigger OnValidate()
            begin

                IF "Credit Amount" <> 0 THEN
                    "Debit Amount" := 0;
                VALIDATE(Amount, -"Credit Amount");

                //valiAmount();
            end;
        }
        field(29; "Debit Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Debit Amount" <> 0 THEN
                    "Credit Amount" := 0;
                //Amount := "Debit Amount";
                VALIDATE(Amount, "Debit Amount");
                //valiAmount();
            end;
        }
        field(30; "Cumm Balance"; Decimal)
        {
            CalcFormula = Sum("Payment/Receipt Bal. Line.".Amount WHERE("No." = FIELD("No."), Type = FIELD(Type), "Cash/Cheque" = FIELD("Cash/Cheque")));
            FieldClass = FlowField;
        }
        field(37; "Currency Code"; Code[10])
        {
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                IF "Account Type" = "Account Type"::Vendor THEN BEGIN
                    vendrec.GET("Account No.");
                    vendrec.SETCURRENTKEY("No.");
                    vendrec.SETRANGE("No.", "No.");
                    "Currency Code" := vendrec."Currency Code";
                END;

                IF "Currency Code" <> '' THEN BEGIN
                    //GetCurrency;
                    IF ("Currency Code" <> xRec."Currency Code") OR
                       ("Posting Date" <> xRec."Posting Date") OR
                       (CurrFieldNo = FIELDNO("Currency Code")) OR
                       ("Currency Factor" = 0)
                    THEN
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate("Posting Date", "Currency Code");
                END ELSE
                    "Currency Factor" := 0;
            end;
        }
        field(39; "Amount (LCY)"; Decimal)
        {
        }
        field(40; "Currency Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF ("Currency Code" = '') AND ("Currency Factor" <> 0) THEN
                    FIELDERROR("Currency Factor", STRSUBSTNO(TEXT002, FIELDCAPTION("Currency Code")));
                VALIDATE(Amount);
            end;
        }
        field(41; "Exchange Rate"; Decimal)
        {
            DecimalPlaces = 2 : 9;

            trigger OnValidate()
            begin
                IF "Currency Code" = '' THEN
                    "Amount (LCY)" := Amount
                ELSE BEGIN
                    IF "Exchange Rate" <> 0 THEN
                        "Currency Factor" := 100 / "Exchange Rate";
                    "Amount (LCY)" := ROUND(
                      CurrExchRate.ExchangeAmtFCYToLCY(
                        "Posting Date", "Currency Code",
                        Amount, "Currency Factor"));
                END;
            end;
        }
        field(42; "FA Posting Type"; Option)
        {
            OptionCaption = ' ,Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Disposal,Maintenance';
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance;

            trigger OnValidate()
            begin
                IF NOT (("Account Type" = "Account Type"::"Fixed Asset") OR
                    ("Balance Account Type" = "Balance Account Type"::"Fixed Asset")) AND
                    ("FA Posting Type" = "FA Posting Type"::" ")
                THEN
                    ERROR('Transaction require a Fixed asset Code');
            end;
        }
        field(43; "Maintenance Code"; Code[20])
        {
            TableRelation = Maintenance.Code;
        }
        field(44; "Job Code"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(45; "Job Task code"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job Code"));
        }
        field(46; "Loan ID"; Code[20])
        {
            TableRelation = "Loan."."Loan ID";
        }
        field(47; "Loan Type"; Code[20])
        {
        }
        field(48; "Form M No."; Code[20])
        {
        }
        field(49; "Job Quantity"; Decimal)
        {
        }
        field(50; "Job Line Type"; Option)
        {
            OptionMembers = " ",Scheduled,Contract,"Scheduled & Contract";
        }
        field(51; "Applies-to Doc. Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Applies-to Doc. Type';

            trigger OnValidate()
            begin
                if "Applies-to Doc. Type" <> xRec."Applies-to Doc. Type" then
                    Validate("Applies-to Doc. No.", '');
            end;

        }
        field(52; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            Editable = false;

            trigger OnLookup()
            var
                GenJnlPostLine: Codeunit 12;
                PaymentToleranceMgt: Codeunit 426;
            begin
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record 21;
                VendLedgEntry: Record 25;
                TempGenJnlLine: Record 81 temporary;
            begin
            end;
        }
        field(53; "Apply Entry"; Integer)
        {
            TableRelation = IF ("Account Type" = filter('Customer'),
                                 "Credit Amount" = FILTER(<> 0)) "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("Account No."), Open = filter(true), Positive = filter(true))
            ELSE
            IF ("Account Type" = const(Customer), "Debit Amount" = FILTER(<> 0)) "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("Account No."), Open = filter(true), Positive = filter(false))
            ELSE
            IF ("Account Type" = const(Vendor), "Debit Amount" = FILTER(<> 0)) "Vendor Ledger Entry"."Entry No." WHERE("Vendor No." = FIELD("Account No."), Open = filter(true), Positive = filter(false))
            ELSE
            IF ("Account Type" = const(Vendor), "Credit Amount" = FILTER(<> 0)) "Vendor Ledger Entry"."Entry No." WHERE("Vendor No." = FIELD("Account No."), Open = filter(true), Positive = filter(true))
            ELSE
            IF ("Account Type" = const("Staff Loan"), "Credit Amount" = FILTER(<> 0)) "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("Account No."), Positive = filter(true), Open = filter(true))
            ELSE
            IF ("Account Type" = const("Staff Loan"), "Debit Amount" = FILTER(<> 0)) "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("Account No."), Positive = filter(false), Open = filter(true));

            trigger OnValidate()
            begin
                CASE "Account Type" OF
                    "Account Type"::Customer, "Account Type"::"Staff Loan":
                        BEGIN
                            CustLedgEntry.GET("Apply Entry");
                            "Applies-to Doc. Type" := CustLedgEntry."Document Type";
                            "Applies-to Doc. No." := CustLedgEntry."Document No.";
                        END;
                    "Account Type"::Vendor, "Account Type"::LC:
                        BEGIN
                            VendLedgEntry.GET("Apply Entry");
                            "Applies-to Doc. Type" := VendLedgEntry."Document Type";
                            "Applies-to Doc. No." := VendLedgEntry."Document No.";
                        END;
                END;
            end;
        }

        field(480; "Dimension Set ID"; Integer)
        {
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Department Code", "Branch Code");
            end;
        }
    }

    keys
    {
        key(Key1; Type, "Cash/Cheque", "No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount (LCY)";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //NewLine;
    end;

    var
        "g/lacc": Record 15;
        custrec: Record 18;
        vendrec: Record 23;
        fixedrec: Record 5600;
        bankrec: Record 270;
        ReqReptLine: Record 50104;
        headerrec: Record 50103;
        curbal: Decimal;
        CurrExchRate: Record 330;
        TEXT002: Label 'cannot be specified without %1';
        CustLedgEntry: Record 21;
        VendLedgEntry: Record 25;
        DimMgt: Codeunit DimensionManagement;


    procedure NewLine()
    begin

        headerrec.GET(Type, "Cash/Cheque", "No.");
        ReqReptLine.SETRANGE(ReqReptLine.Type, Type);
        ReqReptLine.SETRANGE(ReqReptLine."Cash/Cheque", "Cash/Cheque");
        ReqReptLine.SETRANGE(ReqReptLine."No.", "No.");
        IF ReqReptLine.FIND('+') THEN
            "Line No." := ReqReptLine."Line No." + 10000
        ELSE
            "Line No." := 20000;
        IF headerrec."Multiple Account" THEN BEGIN
            "Account Type" := headerrec."Account Type";
            "Account No." := headerrec."Account No.";
        END
        ELSE BEGIN
            "Account Type" := headerrec."Balance Account Type";
            "Account No." := headerrec."Balance Account No.";
        END;
        "Transaction Description" := headerrec."Transaction Description";
        "Department Code" := headerrec."Global Dimension 1 Code";
        "Branch Code" := headerrec."Global Dimension 2 Code";
        "Received by" := headerrec."Received by";
        "Cheque No." := headerrec."Cheque No.";
        "Currency Code" := headerrec."Currency Code";
        "Currency Factor" := headerrec."Currency Factor";
        "Exchange Rate" := headerrec."Exchange rate";

    end;


    procedure valiAmount()
    begin
        headerrec.GET(Type, "Cash/Cheque", "No.");
        //IF ("Credit Amount" <> 0)  AND (headerrec."Credit Amount" <>0) THEN
        //ERROR('Line can Not be a Credit Entry');
        //IF ("Debit Amount"<>0) AND  (headerrec."Debit Amount" <>0) THEN
        //ERROR('Line can Not be a Debit Entry');
        CALCFIELDS("Cumm Balance");
        curbal := ("Cumm Balance" - xRec.Amount + Amount);
        IF ABS(curbal) > ABS(headerrec.Amount) THEN
            ERROR('Cummulative Balance will be greater Than the Amount above');
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "No." <> '' THEN
            MODIFY;

    end;
}

