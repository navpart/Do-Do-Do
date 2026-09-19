table 50108 "Deposit Management"
{

    fields
    {
        field(1; "Deposit No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Deposit No." <> xRec."Deposit No." THEN BEGIN
                    GLSetup.GET;
                    NoSeriesMgt.TestManual(GLSetup."Deposit Nos.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = Customer,Vendor;
        }
        field(4; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Customer)) Customer
            ELSE
            IF (Type = CONST(Vendor)) Vendor;
        }
        field(5; "Original Amount"; Decimal)
        {
        }
        field(6; "Amount Deposited"; Decimal)
        {

            trigger OnValidate()
            var
                TempAmount: Decimal;
            begin
                TempAmount := 0;
                IF "Prev. Payments Exists" THEN BEGIN
                    DepositRec.SETRANGE(DepositRec."Original Amount", "Original Amount");
                    DepositRec.SETRANGE(DepositRec."Ref. Order No.", "Ref. Order No.");
                    DepositRec.SETRANGE(DepositRec.Type, Type);
                    DepositRec.SETRANGE(DepositRec."No.", "No.");
                    DepositRec.SETRANGE(DepositRec.Posted, TRUE);
                    IF DepositRec.FINDSET THEN
                        REPEAT
                            TempAmount := TempAmount + DepositRec."Amount Deposited";
                        UNTIL DepositRec.NEXT = 0;
                END;

                "Prev. Amount Deposited" := TempAmount;
                "Balance Amount" := "Original Amount" - ("Amount Deposited" + "Prev. Amount Deposited");
            end;
        }
        field(7; "Balance Amount"; Decimal)
        {
            Editable = false;
        }
        field(9; "Ref. Order No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Customer)) "Sales Header"."No." WHERE("Document Type" = CONST(Order),
                                                                                "Bill-to Customer No." = FIELD("No."))
            ELSE
            IF (Type = CONST(Vendor)) "Purchase Header"."No." WHERE("Document Type" = CONST(Order), "Pay-to Vendor No." = FIELD("No."));
        }
        field(10; "Bal. Account No."; Code[20])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                IF "Bal. Account No." <> '' THEN BEGIN
                    GLAcc.GET("Bal. Account No.");
                    GLAcc.TESTFIELD(GLAcc."Direct Posting", TRUE);
                END;
            end;
        }
        field(11; "Document Date"; Date)
        {
        }
        field(12; "Cheque No."; Code[20])
        {
        }
        field(13; "Cash Confirmation"; Boolean)
        {
        }
        field(14; Posted; Boolean)
        {
        }
        field(15; "Transaction Date"; Date)
        {
        }
        field(16; "Prev. Amount Deposited"; Decimal)
        {
            Editable = false;
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(19; Approved; Boolean)
        {
        }
        field(20; "Prev. Payments Exists"; Boolean)
        {
        }
        field(21; "No. Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(22; "Production Month"; Code[20])
        {
            TableRelation = "Production Period"."Period Code";
        }
    }

    keys
    {
        key(Key1; "Deposit No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        GLSetup.GET;
        IF "Deposit No." = '' THEN BEGIN
            GLSetup.TESTFIELD(GLSetup."Deposit Nos.");
            "No. Series" := GLSetup."Deposit Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Deposit No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        "Transaction Date" := WORKDATE;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLAcc: Record "G/L Account";
        DepositRec: Record "Deposit Management";
        NoSeriesMgt: Codeunit "No. Series";


    procedure AssistEdit(OldDep: Record "Deposit Management"): Boolean
    begin
        /* WITH DepositRec DO BEGIN
            DepositRec := Rec;
            GLSetup.GET;
            GLSetup.TESTFIELD("Deposit Nos.");
            IF NoSeriesMgt.SelectSeries(GLSetup."Deposit Nos.", OldDep."No. Series", "No. Series") THEN BEGIN
                GLSetup.GET;
                GLSetup.TESTFIELD("Deposit Nos.");
                NoSeriesMgt.SetSeries("Deposit No.");
                Rec := DepositRec;
                EXIT(TRUE);
            END;
        END; */
    end;
}

