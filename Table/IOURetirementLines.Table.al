table 50106 "IOU Retirement Lines"
{

    fields
    {
        field(1; "IOU No."; Code[20])
        {
            TableRelation = "IOU Register";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(4; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(5; "Account Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";

            trigger OnValidate()
            begin
                IF xRec."Account Type" <> "Account Type" THEN
                    "Account No." := '';
            end;
        }
        field(6; "Account No."; Code[20])
        {
            TableRelation = IF ("Account Type" = filter('G/L Account')) "G/L Account"
            ELSE
            IF ("Account Type" = filter('Customer')) Customer
            ELSE
            IF ("Account Type" = filter('Vendor')) Vendor
            ELSE
            IF ("Account Type" = filter('Bank Account')) "Bank Account"
            ELSE
            IF ("Account Type" = filter('Fixed Asset')) "Fixed Asset";

            trigger OnValidate()
            begin
                CASE "Account Type" OF
                    "Account Type"::Customer:
                        BEGIN
                            Customer.GET("Account No.");
                            Description := Customer.Name;
                            Customer.TESTFIELD(Customer.Blocked, 0);
                            Customer.TESTFIELD(Customer."Customer Posting Group");
                            Customer.TESTFIELD(Customer."Gen. Bus. Posting Group");
                            Customer.TESTFIELD(Customer."VAT Bus. Posting Group");
                        END;
                    "Account Type"::"G/L Account":
                        BEGIN
                            GLAcc.GET("Account No.");
                            GLAcc.TESTFIELD(GLAcc."Account Type", GLAcc."Account Type"::Posting);
                            GLAcc.TESTFIELD(GLAcc."Direct Posting");
                            Description := GLAcc.Name;
                        END;
                    "Account Type"::Vendor:
                        BEGIN
                            Vendor.GET("Account No.");
                            Vendor.TESTFIELD(Vendor.Blocked, 0);
                            Vendor.TESTFIELD(Vendor."Vendor Posting Group");
                            Vendor.TESTFIELD(Vendor."Gen. Bus. Posting Group");
                            Vendor.TESTFIELD(Vendor."VAT Bus. Posting Group");
                            Description := Vendor.Name;
                        END;
                    "Account Type"::"Bank Account":
                        BEGIN
                            BankAcc.GET("Account No.");
                            BankAcc.TESTFIELD(BankAcc."Bank Acc. Posting Group");
                            BankAcc.TESTFIELD(BankAcc.Blocked, FALSE);
                            Description := BankAcc.Name;
                        END;
                    "Account Type"::"Fixed Asset":
                        BEGIN
                            FARec.GET("Account No.");
                            FARec.TESTFIELD(FARec.Blocked, FALSE);
                            FARec.TESTFIELD(FARec.Inactive, FALSE);
                            FARec.TESTFIELD(FARec."Budgeted Asset", FALSE);
                            Description := FARec.Description;
                        END;
                END;

            end;
        }
        field(7; "Bal. Account Type"; Option)
        {
            InitValue = "Bank Account";
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";

            trigger OnValidate()
            begin
                IF xRec."Bal. Account Type" <> "Bal. Account Type" THEN
                    "Bal. Account No." := '';
            end;
        }
        field(8; "Bal. Account No."; Code[20])
        {
            TableRelation = IF ("Bal. Account Type" = filter('G/L Account')) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = filter('Customer')) Customer
            ELSE
            IF ("Bal. Account Type" = filter('Vendor')) Vendor
            ELSE
            IF ("Bal. Account Type" = filter('Bank Account')) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = filter('Fixed Asset')) "Fixed Asset";
        }
        field(9; Description; Text[50])
        {
        }
        field(10; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                //IF Amount <> 0  THEN BEGIN
                CALCFIELDS("IOU Amount", Sum);
                "Remaining Amount" := "IOU Amount" - Sum;
                MODIFY
                // END ELSE
                // "Remaining Amount" := "IOU Amount";
            end;
        }
        field(11; "Retirement No."; Code[20])
        {
            TableRelation = "IOU Retirement Header";
        }
        field(12; Posted; Boolean)
        {
            Editable = true;
        }
        field(13; "FA Posting Type"; Enum "Gen. Journal Line FA Posting Type")
        {
         
        }
        field(14; "Maintenance Code"; Code[10])
        {
            TableRelation = Maintenance;
        }
        field(15; "IOU Amount"; Decimal)
        {
            CalcFormula = Sum("IOU Retirement Header"."Original IOU Amount" WHERE("No." = FIELD("Retirement No.")));
            FieldClass = FlowField;
        }
        field(16; "Remaining Amount"; Decimal)
        {
        }
        field(17; "Sum"; Decimal)
        {
            CalcFormula = Sum("IOU Retirement Lines".Amount WHERE("Retirement No." = FIELD("Retirement No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Retirement No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Remaining Amount";
        }
        key(Key2; Posted)
        {
            SumIndexFields = Amount;
        }
        key(Key3; "IOU No.", "Retirement No.")
        {
            SumIndexFields = Amount, "Remaining Amount";
        }
        key(Key4; Posted, "IOU No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        VALIDATE(Amount);
    end;

    var
        GLAcc: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        BankAcc: Record "Bank Account";
        FARec: Record "Fixed Asset";
        IOURetire: Record "IOU Retirement Header";
}

