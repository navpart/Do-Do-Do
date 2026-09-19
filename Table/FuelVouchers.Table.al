table 50053 "Fuel Vouchers."
{
    Permissions = TableData 5625 = rim;

    fields
    {
        field(1; "Voucher No."; Code[10])
        {

            trigger OnValidate()
            begin
                IF "Voucher No." <> xRec."Voucher No." THEN BEGIN
                    HRSetup.GET;
                    "No. Series" := HRSetup."Fuel Voucher No.";
                    if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                        "No. Series" := xRec."No. Series";
                    "Voucher No." := NoSeriesMgt.GetNextNo("No. Series");
                END;

                Requisition := TRUE;
            end;
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('FUEL'));

            trigger OnValidate()
            begin
                IF Item.GET("Item No.") THEN
                    Description := Item.Description;
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Fuel Code"; Code[20])
        {
            TableRelation = Maintenance;
        }
        field(5; "Asset Code"; Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                IF FA.GET("Asset Code") THEN BEGIN
                    "Asset Name" := FA.Description;
                    "Shortcut Dimension 1 Code" := FA."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := FA."Global Dimension 2 Code";
                    "Registration No." := FA."Registration No.";
                END ELSE BEGIN
                    "Staff Name" := '';
                    "Shortcut Dimension 1 Code" := '';
                    "Shortcut Dimension 2 Code" := '';
                END;
            end;
        }
        field(6; "Transaction Date"; Date)
        {
        }
        field(7; "Qty Requested"; Decimal)
        {
        }
        field(8; "Qty Approved"; Decimal)
        {
        }
        field(9; "Qty Issued"; Decimal)
        {
        }
        field(10; "Issued By"; Code[20])
        {
            TableRelation = Employee;
        }
        field(11; "Received By"; Code[20])
        {
            TableRelation = Employee;
        }
        field(12; "Receipt Date"; Date)
        {
        }
        field(13; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(16; Location; Code[10])
        {
            TableRelation = Location;
        }
        field(17; Posted; Boolean)
        {
        }
        field(18; Issue; Boolean)
        {

        }
        field(19; "Staff Name"; Text[50])
        {
        }
        field(20; "Account No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF "Asset Code" <> '' THEN
                    ERROR('Please Remove Assets Code to Put Staff Account');
                TESTFIELD("New Vehicle", FALSE);
                IF Custrec.GET("Account No.") THEN BEGIN
                    "Staff Name" := Custrec.Name;
                    "Shortcut Dimension 1 Code" := Custrec."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := Custrec."Global Dimension 2 Code";
                END ELSE BEGIN
                    "Staff Name" := '';
                    "Shortcut Dimension 1 Code" := '';
                    "Shortcut Dimension 2 Code" := '';
                END;
            end;
        }
        field(21; "Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(22; "New Vehicle"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "New Vehicle" THEN BEGIN
                    TESTFIELD("Asset Code", '');
                    TESTFIELD("Account No.", '');
                END;
            end;
        }
        field(23; "Cost Amount in G/L"; Decimal)
        {
        }
        field(24; "Account Type"; Option)
        {
            OptionMembers = " ",Customer,Vendor;
        }
        field(25; "Fixed Asset"; Boolean)
        {
        }
        field(26; Staff; Boolean)
        {
        }
        field(27; "Asset Name"; Text[50])
        {
        }
        field(28; "Registration No."; Code[10])
        {
        }
        field(29; "Responsible Employee No."; Code[10])
        {
        }
        field(30; "Responsible Employee Name"; Text[70])
        {
        }
        field(31; "Fuel Type"; Option)
        {
            OptionCaption = 'Petrol,Diesel';
            OptionMembers = Petrol,Diesel;
        }
        field(32; "Select HOD"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(33; Send; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                "Sent By" := UserSetup.Name;
                "Send By UserID" := UserSetup."User ID";

                IF UserSetup2.GET("Select HOD") THEN BEGIN
                    ToName := UserSetup2."E-Mail";

                    EmailMessage.Create(ToName, Subject, Body, true);
                    EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCName);
                    Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);

                END;
            end;
        }
        field(34; "Sent By"; Text[30])
        {
        }
        field(35; "Send By UserID"; Code[20])
        {
        }
        field(36; Approve; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                "Approved By" := UserSetup.Name;
                "Approved By UserID" := UserSetup."User ID";

                IF UserSetup2.GET("Send By UserID") THEN BEGIN
                    ToName := 'akintoye@toyotanigeria.com';
                    CCName := UserSetup2."E-Mail";

                    EmailMessage.Create(ToName, Subject, Body, true);
                    EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCName);
                    Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);

                END;
            end;
        }
        field(37; "Approved By"; Text[30])
        {
        }
        field(38; "Approved By UserID"; Code[20])
        {
        }
        field(39; "Approve (Admin)"; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                "Approved By (Admin)" := UserSetup.Name;
                "Aproved By UserID (Admin)" := UserSetup."User ID";

                IF UserSetup2.GET("Send By UserID") THEN BEGIN
                    ToName := UserSetup2."E-Mail";
                    CCName := '';

                    EmailMessage.Create(ToName, Subject, Body, true);
                    EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCName);
                    Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);

                END;
            end;
        }
        field(40; "Approved By (Admin)"; Text[30])
        {
            Description = '70';
        }
        field(41; "Aproved By UserID (Admin)"; Code[20])
        {
        }
        field(42; "Fuel Dispensed"; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                "Fuel Dispensed By" := UserSetup.Name;

                IF UserSetup2.GET("Send By UserID") THEN BEGIN
                    ToName := UserSetup2."E-Mail";
                    CCName := 'akintoye@toyotanigeria.com';

                    EmailMessage.Create(ToName, Subject, Body, true);
                    EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCName);
                    Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);


                END;
            end;
        }
        field(43; "Fuel Dispensed By"; Text[30])
        {
        }
        field(44; Requisition; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Voucher No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.GET;
        IF "Voucher No." = '' THEN BEGIN
            HRSetup.TESTFIELD("Fuel Voucher No.");
            "No. Series" := HRSetup."Fuel Voucher No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Voucher No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        FuelVouch: Record "Fuel Vouchers.";
        Item: Record Item;
        FA: Record "Fixed Asset";
        FADeprBk: Record "FA Depreciation Book";
        ItemJnlLine: Record "Item Journal Line";
        GenJnlLine: Record "Gen. Journal Line";
        GenPostSetup: Record "General Posting Setup";
        ItemJnlPost: Codeunit "Item Jnl.-Post Line";
        GenJnlPost: Codeunit "Gen. Jnl.-Post Line";
        Text100: Label 'Are you sure you want to Issue the Fuel?';
        Custrec: Record Customer;
        Vendor: Record Vendor;
        ValueEntry: Record "Value Entry";
        CostToGL: Decimal;
        MaintLedgEntry: Record "Maintenance Ledger Entry";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        mailsent: Boolean;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[1000];
        Attachement: Text[260];
        Opendialog: Boolean;
        UserSetup2: Record "User Setup";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    procedure AssistEdit(OldFuelVou: Record "Fuel Vouchers."): Boolean
    begin
        /* WITH FuelVouch DO BEGIN
            FuelVouch := Rec;
            HRSetup.GET;
            HRSetup.TESTFIELD("Fuel Voucher No.");
            IF NoSeriesMgt.SelectSeries(HRSetup."Fuel Voucher No.", OldFuelVou."No. Series", "No. Series") THEN BEGIN
                HRSetup.GET;
                HRSetup.TESTFIELD("Fuel Voucher No.");
                NoSeriesMgt.SetSeries("Voucher No.");
                Rec := FuelVouch;
                EXIT(TRUE);
            END;
        END; */
    end;

    procedure Navigate()
    begin
        //NavigateForm.SetDoc("Transaction Date","Voucher No.");
        //NavigateForm.RUN;
    end;

    procedure PostNewVehicle()
    begin
        ItemJnlLine.INIT;
        ItemJnlLine."Journal Template Name" := 'ITEM';
        ItemJnlLine."Journal Batch Name" := 'FUEL';
        ItemJnlLine."Line No." := 10000;
        ItemJnlLine."Posting Date" := "Transaction Date";
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        ItemJnlLine."Document No." := "Voucher No.";
        ItemJnlLine.VALIDATE("Item No.", "Item No.");
        ItemJnlLine.Description := 'Fuel for New Vehicle';
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        ItemJnlLine."Gen. Bus. Posting Group" := 'PREDELVRY';
        ItemJnlLine."Location Code" := Location;
        ItemJnlLine.VALIDATE(Quantity, "Qty Issued");
        IF NOT ItemJnlLine.INSERT(TRUE) THEN ItemJnlLine.MODIFY(TRUE);
        ItemJnlPost.RUN(ItemJnlLine);

        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := 'GENERAL';
        GenJnlLine."Journal Batch Name" := 'FUEL';
        GenJnlLine."Line No." := 10000;
        GenJnlLine.VALIDATE(GenJnlLine."Posting Date", "Transaction Date");
        GenJnlLine."Document No." := "Voucher No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Vendor;
        GenJnlLine.VALIDATE("Account No.", 'TVN2013');
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine.VALIDATE("Bal. Account No.", '262400');
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        GenJnlLine.Description := 'Fuel for New Vehicle';

        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", "Voucher No.");
        IF ValueEntry.FINDFIRST THEN BEGIN
            ValueEntry.CALCSUMS("Cost Posted to G/L");
            CostToGL := ValueEntry."Cost Posted to G/L";
        END;

        GenJnlLine.Amount := CostToGL * -1;
        GenJnlLine."FA Posting Type" := Enum::"Gen. Journal Line FA Posting Type"::" ";
        GenJnlLine."Depreciation Book Code" := '';
        GenJnlLine."Maintenance Code" := '';
        GenJnlLine."Gen. Posting Type" := Enum::"General Posting Type"::" ";
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine."Gen. Prod. Posting Group" := '';
        IF NOT GenJnlLine.INSERT(TRUE) THEN GenJnlLine.MODIFY(TRUE);
        GenJnlPost.RUN(GenJnlLine);

        Issue := TRUE;
        MODIFY;
    end;

    procedure PostFixedAsset()
    begin
        FA.GET("Asset Code");
        ItemJnlLine.INIT;
        ItemJnlLine."Journal Template Name" := 'ITEM';
        ItemJnlLine."Journal Batch Name" := 'FUEL';
        ItemJnlLine."Line No." := 10000;
        ItemJnlLine."Posting Date" := "Transaction Date";
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        ItemJnlLine."Document No." := "Voucher No.";
        ItemJnlLine.VALIDATE("Item No.", "Item No.");
        ItemJnlLine.VALIDATE("Registration No.", "Registration No.");
        ItemJnlLine.Description := STRSUBSTNO('Fuel for %1', "Asset Code");
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        IF (FA."FA Subclass Code" = 'CAR') OR (FA."FA Subclass Code" = 'M-BIKE') THEN
            ItemJnlLine."Gen. Bus. Posting Group" := 'MAINTCE';
        IF FA."FA Subclass Code" = 'GEN SET' THEN
            ItemJnlLine."Gen. Bus. Posting Group" := 'FUELGEN';
        ItemJnlLine."Location Code" := Location;
        ItemJnlLine.VALIDATE(Quantity, "Qty Issued");
        IF NOT ItemJnlLine.INSERT(TRUE) THEN ItemJnlLine.MODIFY(TRUE);
        ItemJnlPost.RUN(ItemJnlLine);

        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", "Voucher No.");
        IF ValueEntry.FINDFIRST THEN BEGIN
            ValueEntry.CALCSUMS("Cost Posted to G/L");
            CostToGL := ValueEntry."Cost Posted to G/L";
        END;

        FA.GET("Asset Code");
        UserSetup.GET(USERID);
        MaintLedgEntry.SETRANGE("Entry No.");
        IF MaintLedgEntry.FINDLAST THEN
            LineNo := MaintLedgEntry."Entry No.";
        MaintLedgEntry."Entry No." := LineNo + 1;
        MaintLedgEntry."Document No." := "Voucher No.";
        MaintLedgEntry."User ID" := UserSetup."User ID";
        MaintLedgEntry."Depreciation Book Code" := 'DEF_DEPR';
        MaintLedgEntry."FA No." := "Asset Code";
        MaintLedgEntry."FA Posting Date" := "Transaction Date";
        MaintLedgEntry."FA Class Code" := FA."FA Class Code";
        MaintLedgEntry."FA Subclass Code" := FA."FA Subclass Code";
        MaintLedgEntry."FA Location Code" := FA."Location Code";
        MaintLedgEntry."FA Posting Group" := FA."FA Posting Group";
        MaintLedgEntry."Maintenance Code" := 'FUEL';
        MaintLedgEntry."Posting Date" := "Transaction Date";
        MaintLedgEntry."Document Date" := "Transaction Date";
        MaintLedgEntry.Description := STRSUBSTNO('Fuel for %1', "Asset Code");
        MaintLedgEntry.Quantity := ABS("Qty Issued");
        MaintLedgEntry.VALIDATE("Global Dimension 1 Code", "Shortcut Dimension 1 Code");
        MaintLedgEntry.VALIDATE("Global Dimension 2 Code", "Shortcut Dimension 2 Code");
        MaintLedgEntry."Journal Batch Name" := 'MAINT.';
        MaintLedgEntry."Debit Amount" := ABS(CostToGL);
        MaintLedgEntry.Amount := ABS(CostToGL);
        MaintLedgEntry."Gen. Posting Type" := Enum::"General Posting Type"::" ";
        MaintLedgEntry."Gen. Bus. Posting Group" := '';
        MaintLedgEntry."Gen. Prod. Posting Group" := '';
        MaintLedgEntry."VAT Bus. Posting Group" := '';
        MaintLedgEntry.INSERT;

        Issue := TRUE;
        MODIFY;
    end;

    procedure PostCustomer()
    begin
        ItemJnlLine.INIT;
        ItemJnlLine."Journal Template Name" := 'ITEM';
        ItemJnlLine."Journal Batch Name" := 'FUEL';
        ItemJnlLine."Line No." := 10000;
        ItemJnlLine."Posting Date" := "Transaction Date";
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        ItemJnlLine."Document No." := "Voucher No.";
        ItemJnlLine.VALIDATE("Item No.", "Item No.");
        IF "Account No." = '955000' THEN
            ItemJnlLine.Description := Description ELSE
            ItemJnlLine.Description := STRSUBSTNO('Fuel for %1', "Account No.");
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        ItemJnlLine."Gen. Bus. Posting Group" := 'PREDELVRY';
        ItemJnlLine."Location Code" := Location;
        ItemJnlLine.VALIDATE(Quantity, "Qty Issued");
        IF NOT ItemJnlLine.INSERT(TRUE) THEN ItemJnlLine.MODIFY(TRUE);
        ItemJnlPost.RUN(ItemJnlLine);

        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := 'GENERAL';
        GenJnlLine."Journal Batch Name" := 'FUEL';
        GenJnlLine."Line No." := 10000;
        GenJnlLine.VALIDATE(GenJnlLine."Posting Date", "Transaction Date");
        GenJnlLine."Document No." := "Voucher No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine.VALIDATE("Account No.", "Account No.");
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine.VALIDATE("Bal. Account No.", '262400');
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        IF "Account No." = '955000' THEN
            GenJnlLine.Description := Description ELSE
            GenJnlLine.Description := STRSUBSTNO('Fuel for %1', "Account No.");

        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", "Voucher No.");
        IF ValueEntry.FINDFIRST THEN BEGIN
            ValueEntry.CALCSUMS("Cost Posted to G/L");
            CostToGL := ValueEntry."Cost Posted to G/L";
        END;

        GenJnlLine.Amount := CostToGL * -1;
        GenJnlLine."FA Posting Type" := Enum::"Gen. Journal Line FA Posting Type"::" ";
        GenJnlLine."Depreciation Book Code" := '';
        GenJnlLine."Maintenance Code" := '';
        GenJnlLine."Gen. Posting Type" := Enum::"General Posting Type"::" ";
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine."Gen. Prod. Posting Group" := '';
        IF NOT GenJnlLine.INSERT(TRUE) THEN GenJnlLine.MODIFY(TRUE);
        GenJnlPost.RUN(GenJnlLine);

        Issue := TRUE;
        MODIFY;
    end;
}

