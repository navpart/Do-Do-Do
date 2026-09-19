table 50038 "Warranty Claim Header"
{

    fields
    {
        field(1; "Claim No."; Code[20])
        {

            trigger OnValidate()
            begin

                IF "Claim No." <> xRec."Claim No." THEN BEGIN
                    SaleSetup.GET;
                    NoSeriesMgt.TestManual(SaleSetup."Warranty Claim No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Dealer Code"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Dealer Code") THEN
                    "Dealer Name" := CustRec.Name;
            end;
        }
        field(3; "Dealer Name"; Text[50])
        {
        }
        field(4; "Process Date"; Date)
        {
        }
        field(5; "Vehicle Identification No."; Code[20])
        {
            TableRelation = "Warranty Coupon".VIN;

            trigger OnValidate()
            begin
                IF warranteeCoupon.GET("Vehicle Identification No.") THEN BEGIN
                    "Owners Name" := warranteeCoupon."Owner's Name";
                    VALIDATE("Delivery Date", warranteeCoupon."Delivery Date");
                    "Vehicle Model" := warranteeCoupon."Model No.";

                END;
            end;
        }
        field(6; "Vehicle Engine No."; Code[20])
        {
        }
        field(7; "Vehicle Model"; Code[20])
        {
            TableRelation = Model."Model No.";
        }
        field(8; "Model Year"; Code[20])
        {
        }
        field(9; "Delivery Date"; Date)
        {

            trigger OnValidate()
            begin
                "Warranty Expired Date" := CALCDATE('+3Y', "Delivery Date");
                IF "Warranty Expired Date" < TODAY THEN BEGIN
                    "Warranty Expired" := TRUE;
                    "Under Warranty" := FALSE;
                END ELSE BEGIN
                    "Warranty Expired" := FALSE;
                    "Under Warranty" := TRUE;
                END;
            end;
        }
        field(10; "Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                IF warranteeCoupon.GET("Vehicle Identification No.") THEN BEGIN
                    IF "Odometer Reading" > warranteeCoupon."Expected Warranty Expired KM" THEN BEGIN
                        "Warranty Expired" := TRUE;
                        "Under Warranty" := FALSE;
                    END
                    ELSE
                        IF warranteeCoupon."Expected Warranty Expired Date" < TODAY THEN BEGIN
                            "Warranty Expired" := TRUE;
                            "Under Warranty" := FALSE;
                        END
                        ELSE BEGIN
                            "Warranty Expired" := FALSE;
                            "Under Warranty" := TRUE;
                        END;
                END;
                IF "Warranty Expired" THEN
                    "Warranty Closed" := TRUE
                ELSE
                    "Warranty Closed" := FALSE;
            end;
        }
        field(11; "Owners Name"; Text[100])
        {
        }
        field(12; "Warranty Claim Exist"; Integer)
        {
            CalcFormula = Count("Warranty Claim Header" WHERE("Vehicle Identification No." = FIELD("Vehicle Identification No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Under Warranty"; Boolean)
        {
            Editable = false;
        }
        field(14; "Warranty Expired"; Boolean)
        {
        }
        field(15; "Warranty Expired Date"; Date)
        {
            Editable = false;
        }
        field(16; "Claim Approved by TNL"; Boolean)
        {

            trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Approve Warranty Claim" THEN ERROR('Sorry You Can Not Approve This Warranty Claim');
                TESTFIELD("Warranty Closed", FALSE);
                //TESTFIELD("Date Approved by TNL");
                TESTFIELD("TWC No.");
                //CALCFIELDS("Claim Charges Posted","Claim Materials Posted");
                TESTFIELD("Claim Charges Posted", FALSE);
                TESTFIELD("Claim Materials Posted", FALSE);
                //WarLine.SETRANGE(WarLine."Claim No.","Claim No.");
                //WarLine.MODIFYALL(WarLine."TNL Approved","Claim Approved by TNL");
                //WarLine.MODIFYALL(WarLine."TNL Approved Date","Date Approved by TNL");
                "Material Claim Approved" := "Claim Approved by TNL";
                "Labour Claim Approved" := "Claim Approved by TNL";
            end;
        }
        field(17; "Total Material Claim cost"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Claim No." = FIELD("Claim No."),
                                                                    "Claim Type" = filter(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Labour Claim"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Claim No." = FIELD("Claim No."),
                                                                    "Claim Type" = FILTER('<>Item')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Date Approved by TNL"; Date)
        {

            trigger OnValidate()
            begin
                WarLine.SETRANGE(WarLine."Claim No.", "Claim No.");
                WarLine.MODIFYALL(WarLine."TNL Approved Date", "Date Approved by TNL");
            end;
        }
        field(20; "TWC No."; Code[20])
        {
        }
        field(21; "Claim Refund by TMC"; Boolean)
        {

            trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Replace Warranty Labour Claim" THEN ERROR('Sorry You Can Not Process This Warranty Labour Claim Refund');

                IF "Claim Refund by TMC" THEN BEGIN
                    TESTFIELD("Warranty Closed", FALSE);
                    TESTFIELD("Replace Dealer Material Claim");
                    TESTFIELD("Refund Dealer Labour Claim");
                    TESTFIELD("Labor Amt Refunded by TMC(FCY)");
                    TESTFIELD("Mat Amt Refunded by TMC(FCY)");
                    "Generate Payment Refund";
                    "Warranty Closed" := TRUE;
                END ELSE
                    ERROR('Refunded Warranty Can not be Canceled');
            end;
        }
        field(22; "Labour Charge accepted by TMC"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Claim No." = FIELD("Claim No."),
                                                                    "Claim Type" = FILTER('<>Item'),
                                                                    "TNL Approved" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Replace Dealer Material Claim"; Boolean)
        {

            trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Replace War. Material Claim" THEN ERROR('Sorry You Can Not Approve This Warranty Material Claim');

                IF "Replace Dealer Material Claim" THEN BEGIN
                    CALCFIELDS("Total Material Claim cost");
                    IF "Total Material Claim cost" = 0 THEN
                        ERROR('Nothing to post!');
                    TESTFIELD("Material Claim Approved");
                    "Material Posting Date" := TODAY;
                    IssueMateria;
                END
                ELSE BEGIN
                    //CALCFIELDS("Claim Materials Posted");
                    TESTFIELD("Claim Materials Posted", FALSE);
                    ItemJour2.SETRANGE(ItemJour2."Journal Template Name", 'Item');
                    ItemJour2.SETRANGE(ItemJour2."Journal Batch Name", 'Warranty');
                    ItemJour2.SETRANGE(ItemJour2."Document No.", "Claim No.");
                    IF ItemJour2.FIND('+') THEN ERROR('Please remove warranty Material journal before you can uncheck this Claim.');
                    "Material Posting Date" := 0D;
                END;
            end;
        }
        field(24; "Refund Dealer Labour Claim"; Boolean)
        {

            trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Replace Warranty Labour Claim" THEN ERROR('Sorry You Can Not Approve This Warranty Labour Claim');

                IF "Refund Dealer Labour Claim" THEN BEGIN
                    CALCFIELDS("Total Labour Claim");
                    IF "Total Labour Claim" = 0 THEN
                        ERROR('Nothing to post!');
                    TESTFIELD("Labour Claim Approved");
                    "Labour Posting Date" := TODAY;
                    "Generate Payment";
                END
                ELSE BEGIN
                    //CALCFIELDS("Claim Charges Posted");
                    TESTFIELD("Claim Charges Posted", FALSE);
                    "G/LJour2".SETRANGE("G/LJour2"."Journal Template Name", 'Standard');
                    "G/LJour2".SETRANGE("G/LJour2"."Journal Batch Name", 'Warranty');
                    "G/LJour2".SETRANGE("G/LJour2"."Document No.", "Claim No.");
                    IF "G/LJour2".FIND('+') THEN ERROR('Please remove warranty Payment Journal before you can uncheck this Claim.');
                    "Labour Posting Date" := 0D;
                END;
            end;
        }
        field(25; "No. Series"; Code[10])
        {
        }
        field(26; "Material Claim Approved"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Replace Dealer Material Claim", FALSE);
            end;
        }
        field(27; "Labour Claim Approved"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Refund Dealer Labour Claim", FALSE);
            end;
        }
        field(28; "Warranty Closed"; Boolean)
        {
        }
        field(29; "Claim Charges Posted"; Boolean)
        {
            Editable = false;
        }
        field(30; "Claim Materials Posted"; Boolean)
        {
            Editable = false;
        }
        field(31; "Mat Amt Refunded by TMC(FCY)"; Decimal)
        {
        }
        field(32; "Warranty Refund Account"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(33; "Labor Amt Refunded by TMC(FCY)"; Decimal)
        {
        }
        field(34; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(35; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(36; "Settlement Report No."; Code[20])
        {
        }
        field(37; "SRN Date"; Date)
        {
        }
        field(38; "Batch No."; Code[20])
        {
        }
        field(39; "Invoice No."; Code[20])
        {
        }
        field(40; "Material Posting Date"; Date)
        {
        }
        field(41; "Labour Posting Date"; Date)
        {
        }
        field(42; "Line Item Count"; Integer)
        {
            CalcFormula = Count("Warranty Claim Detail" WHERE("Claim No." = FIELD("Claim No."),
                                                               "Claim Type" = filter('Item')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Claim Settled by TMC"; Boolean)
        {

            trigger OnValidate()
            begin
                UserRec.GET(USERID);
                IF NOT UserRec."Replace Warranty Labour Claim" THEN ERROR('Sorry You Can Not Process This Warranty Labour Claim Refund');

                IF "Claim Settled by TMC" THEN BEGIN
                    TESTFIELD("Warranty Closed", TRUE);
                    TESTFIELD("Replace Dealer Material Claim");
                    TESTFIELD("Refund Dealer Labour Claim");
                    TESTFIELD("Labor Amt Refunded by TMC(FCY)");
                    TESTFIELD("Mat Amt Refunded by TMC(FCY)");
                    "Generate Settlement";
                END ELSE
                    ERROR('Settled Warranty Can not be Canceled');
            end;
        }
        field(44; "CLaim Refunded By TMC Date"; Date)
        {
        }
        field(45; "Invoice No"; Code[10])
        {
        }
        field(46; "claim type"; Text[30])
        {
        }
        field(47; "Receipt Date"; Date)
        {
        }
        field(49; "Repair Date"; Date)
        {
        }
        field(50; "Warranty ID"; Code[10])
        {
        }
        field(51; "DTR Submission ID"; Code[10])
        {
        }
        field(52; "Issue date"; Date)
        {
            CalcFormula = Lookup("Warranty Claim Detail"."Issue to Dealer Date" WHERE("Claim No." = FIELD("Claim No."),
                                                                                       "Claim Type" = FILTER('Item')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "TNL status"; Text[30])
        {
        }
        field(54; "Mat Amt Refunded by TMC(LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Mat Amt Refunded by TMC(LCY)" := "Mat Amt Refunded by TMC(FCY)" * "Exchange Rate";
            end;
        }
        field(55; "LaborAmt  Refunded by TMC(LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                "LaborAmt  Refunded by TMC(LCY)" := "Labor Amt Refunded by TMC(FCY)" * "Exchange Rate";
            end;
        }
        field(56; "Claim Tracking No."; Code[10])
        {
        }
        field(57; "Vehicle Type"; Code[10])
        {
        }
        field(58; "Claim Settle by TNL"; Boolean)
        {
        }
        field(59; Post; Boolean)
        {
        }
        field(61; "Issued Option"; Option)
        {
            OptionCaption = 'Fully Issued,Partially Issued';
            OptionMembers = "Fully Issued","Partially Issued";
        }
        field(62; "Quantity Requested"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail".Quantity WHERE("Claim No." = FIELD("Claim No."),
                                                                      "Claim Type" = FILTER('Item')));
            FieldClass = FlowField;
        }
        field(63; "Quantity Issued"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail"."Quantity Issued" WHERE("Claim No." = FIELD("Claim No."),
                                                                               "Claim Type" = FILTER('Item')));
            FieldClass = FlowField;
        }
        field(64; "Owner Email"; Text[50])
        {
        }
        field(65; "Owner Phone No"; Code[20])
        {
        }
        field(66; "Total Material Claim cost(USD)"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail"."Amount dollar" WHERE("Claim No." = FIELD("Claim No."),
                                                                             "Claim Type" = filter('Item')));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Exchange Difference" := "Total Material Claim cost" - "Mat Amt Refunded by TMC(LCY)";
            end;
        }
        field(67; "Claim-(TNL-TMC)"; Decimal)
        {
            CalcFormula = Sum("Warranty Claim Detail"."Claim Total" WHERE("Claim No." = FIELD("Claim No."),
                                                                           "Claim Type" = filter('Item')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68; "Exchange Difference"; Decimal)
        {

            trigger OnValidate()
            begin
                "Exchange Difference" := "Total Material Claim cost" - "Mat Amt Refunded by TMC(LCY)";
            end;
        }
        field(69; "Exchange Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                "Mat Amt Refunded by TMC(LCY)" := "Mat Amt Refunded by TMC(FCY)" * "Exchange Rate";
            end;
        }
        field(70; "Equivalent Material Cost(USD)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Claim No.")
        {
        }
        key(Key2; "Vehicle Identification No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD("Claim Approved by TNL", FALSE);
        WarLine.SETRANGE(WarLine."Claim No.", "Claim No.");
        IF WarLine.FindFirst() THEN WarLine.DELETEALL;
    end;

    trigger OnInsert()
    begin
        SaleSetup.GET;
        IF "Claim No." = '' THEN BEGIN
            SaleSetup.TESTFIELD("Warranty Claim No.");
            "No. Series" := SaleSetup."Warranty Claim No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Claim No." := NoSeriesMgt.GetNextNo("No. Series");

            //NoSeriesMgt.InitSeries(SaleSetup."Warranty Claim No.", xRec."No. Series", 0D, "Claim No.", "No. Series");
        END;
    end;

    var
        SaleSetup: Record 311;
        NoSeriesMgt: Codeunit "No. Series";
        WarClaim: Record 50038;
        CustRec: Record 18;
        Model: Record 50014;
        warranteeCoupon: Record 50022;
        "G/LJour": Record 81;
        "G/LJour2": Record 81;
        ItemJour: Record 83;
        ItemJour2: Record 83;
        WarLine: Record 50039;
        Lineno: Integer;
        UserRec: Record 91;
        ItemJnlPostBatch: Codeunit 23;
        Text100: Label 'Do you want to %1 %2?';
        GenJnlPostBatch: Codeunit 13;


    procedure AssistEdit(OldWarHeader: Record 50038): Boolean
    begin
        /* WITH WarClaim DO BEGIN
            WarClaim := Rec;
            SaleSetup.GET;
            SaleSetup.TESTFIELD("Warranty Claim No.");
            IF NoSeriesMgt.SelectSeries(SaleSetup."Warranty Claim No.", OldWarHeader."No. Series", "No. Series") THEN BEGIN
                SaleSetup.GET;
                SaleSetup.TESTFIELD("Warranty Claim No.");
                NoSeriesMgt.SetSeries("Claim No.");
                Rec := WarClaim;
                EXIT(TRUE);
            END;
        END; */
    end;


    procedure IssueMateria()
    begin

        IF NOT CONFIRM(Text100, FALSE, 'Replace Dealer Material Claim') THEN
            ERROR('Action aborted!');

        ItemJour2.SETRANGE(ItemJour2."Journal Template Name", 'Item');
        ItemJour2.SETRANGE(ItemJour2."Journal Batch Name", 'Warranty');
        IF ItemJour2.FINDLAST THEN
            Lineno := ItemJour2."Line No." + 10000
        ELSE
            Lineno := 10000;
        WarLine.SETRANGE(WarLine."Claim No.", "Claim No.");
        WarLine.SETRANGE(WarLine."Claim Type", WarLine."Claim Type"::Item);
        WarLine.SETRANGE(WarLine."TNL Approved", TRUE);
        WarLine.SETRANGE(WarLine."Issue to Dealer", FALSE);
        IF WarLine.FINDSET THEN BEGIN
            REPEAT
                ItemJour.INIT;
                ItemJour."Journal Template Name" := 'ITEM';
                ItemJour."Journal Batch Name" := 'Warranty';
                ItemJour.VALIDATE(ItemJour."Posting Date", TODAY);
                ItemJour."Entry Type" := ItemJour."Entry Type"::"Negative Adjmt.";
                ItemJour."Document No." := "Claim No.";
                ItemJour."Line No." := Lineno;
                ItemJour.VALIDATE(ItemJour."Item No.", WarLine."No.");
                ItemJour.VALIDATE(ItemJour."Shortcut Dimension 1 Code", WarLine."Department Code");
                ItemJour.VALIDATE(ItemJour."Shortcut Dimension 2 Code", WarLine."Branch Code");
                ItemJour."Source Code" := 'warranty';
                ItemJour."Source No." := "Dealer Code";
                ItemJour."Location Code" := WarLine.Location;
                ItemJour."Variant Code" := WarLine."Variant Code";
                ItemJour.VALIDATE(ItemJour.Quantity, WarLine.Quantity);
                ItemJour."Gen. Bus. Posting Group" := 'Warranty';
                ItemJour.INSERT(TRUE);
                WarLine."Issue to Dealer" := TRUE;
                WarLine."Issue to Dealer Date" := TODAY;
                WarLine.MODIFY;
                Lineno := Lineno + 10000;
            UNTIL WarLine.NEXT = 0;
            //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJour);
            ItemJnlPostBatch.RUN(ItemJour);
            "Claim Materials Posted" := TRUE;
        END;
    end;


    procedure "Generate Payment"()
    begin
        IF NOT CONFIRM(Text100, FALSE, 'Refund Dealer Labour Claim') THEN
            ERROR('Action aborted!');

        SaleSetup.GET();
        "G/LJour2".SETRANGE("G/LJour2"."Journal Template Name", 'Standard');
        "G/LJour2".SETRANGE("G/LJour2"."Journal Batch Name", 'Warranty');
        IF "G/LJour2".FIND('+') THEN
            Lineno := "G/LJour2"."Line No." + 10000
        ELSE
            Lineno := 10000;
        WarLine.SETRANGE(WarLine."Claim No.", "Claim No.");
        WarLine.SETFILTER(WarLine."Claim Type", '<>%1', WarLine."Claim Type"::Item);
        WarLine.SETRANGE(WarLine."TNL Approved", TRUE);
        WarLine.SETRANGE(WarLine."Issue to Dealer", FALSE);

        IF WarLine.FIND('-') THEN BEGIN
            REPEAT
                "G/LJour"."Journal Template Name" := 'Standard';
                "G/LJour"."Journal Batch Name" := 'warranty';
                "G/LJour"."Line No." := Lineno;
                "G/LJour"."Posting Date" := TODAY;
                "G/LJour"."Document No." := WarLine."Claim No.";
                "G/LJour"."Account Type" := "G/LJour"."Account Type"::Customer;
                "G/LJour".VALIDATE("G/LJour"."Account No.", WarLine."Dealer Code");
                "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 1 Code", WarLine."Department Code");
                "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 2 Code", WarLine."Branch Code");
                "G/LJour".Description := 'Warranty Labour/Subcontract Claim';
                "G/LJour"."Source Code" := 'WarrantyCl';
                "G/LJour"."Document Type" := "G/LJour"."Document Type"::" ";
                "G/LJour".VALIDATE("G/LJour"."Credit Amount", WarLine.Amount);
                "G/LJour".INSERT(TRUE);
                Lineno := Lineno + 10000;
                WarLine."Issue to Dealer" := TRUE;
                WarLine."Issue to Dealer Date" := TODAY;
                WarLine.MODIFY;
            UNTIL WarLine.NEXT = 0;
            "G/LJour"."Line No." := Lineno;
            "G/LJour"."Account Type" := "G/LJour"."Account Type"::"G/L Account";
            "G/LJour"."Account No." := SaleSetup."Warranty Claim Defaulty Acct.";
            CALCFIELDS("Total Labour Claim");
            "G/LJour".VALIDATE("G/LJour"."Debit Amount", "Total Labour Claim");
            "G/LJour".INSERT(TRUE);
            //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post","G/LJour");
            GenJnlPostBatch.RUN("G/LJour");
            "Claim Charges Posted" := TRUE;
        END;
    end;


    procedure "Generate Payment Refund"()
    begin
        IF NOT CONFIRM(Text100, FALSE, 'Claim Refund by TMC') THEN
            ERROR('Action aborted!');

        SaleSetup.GET();
        "G/LJour2".SETRANGE("G/LJour2"."Journal Template Name", 'Standard');
        "G/LJour2".SETRANGE("G/LJour2"."Journal Batch Name", 'Warranty');
        IF "G/LJour2".FIND('+') THEN
            Lineno := "G/LJour2"."Line No." + 10000
        ELSE
            Lineno := 10000;

        "G/LJour"."Journal Template Name" := 'Standard';
        "G/LJour"."Journal Batch Name" := 'warranty';
        "G/LJour"."Line No." := Lineno;
        "G/LJour"."Posting Date" := "CLaim Refunded By TMC Date";
        "G/LJour"."Document No." := "Claim No.";
        "G/LJour"."Account Type" := "G/LJour"."Account Type"::Vendor;
        "G/LJour".VALIDATE("G/LJour"."Account No.", "Warranty Refund Account");
        "G/LJour"."Bal. Account Type" := "G/LJour"."Bal. Account Type"::"G/L Account";
        "G/LJour".VALIDATE("G/LJour"."Bal. Account No.", SaleSetup."Warranty Claim Defaulty Acct.");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 1 Code", "Department Code");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 2 Code", "Branch Code");
        "G/LJour".Description := 'Warranty Labour/Subcontract Claim Refund';
        "G/LJour"."Source Code" := 'WarrantyRf';
        "G/LJour"."Document Type" := "G/LJour"."Document Type"::" ";
        "G/LJour".VALIDATE("G/LJour".Amount, "Labor Amt Refunded by TMC(FCY)");
        "G/LJour".INSERT(TRUE);
        Lineno := Lineno + 10000;
        "G/LJour"."Line No." := Lineno;
        "G/LJour".VALIDATE("G/LJour"."Bal. Account No.", SaleSetup."Warranty Materia Refund Acct.");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 1 Code", "Department Code");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 2 Code", "Branch Code");
        "G/LJour".Description := 'Warranty Materia Claim Refund';
        "G/LJour"."Source Code" := 'WarrantyRf';
        "G/LJour"."Document Type" := "G/LJour"."Document Type"::" ";
        "G/LJour".VALIDATE("G/LJour".Amount, "Mat Amt Refunded by TMC(FCY)");
        "G/LJour".INSERT(TRUE);
        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post","G/LJour");
        GenJnlPostBatch.RUN("G/LJour");
    end;


    procedure "Generate Settlement"()
    begin
        IF NOT CONFIRM(Text100, FALSE, 'Claim Settled by TMC') THEN
            ERROR('Action aborted!');

        SaleSetup.GET();
        "G/LJour2".SETRANGE("G/LJour2"."Journal Template Name", 'Standard');
        "G/LJour2".SETRANGE("G/LJour2"."Journal Batch Name", 'Warranty');
        IF "G/LJour2".FIND('+') THEN
            Lineno := "G/LJour2"."Line No." + 10000
        ELSE
            Lineno := 10000;

        "G/LJour"."Journal Template Name" := 'Standard';
        "G/LJour"."Journal Batch Name" := 'warranty';
        "G/LJour"."Line No." := Lineno;
        "G/LJour"."Posting Date" := TODAY;
        "G/LJour"."Document No." := "Claim No.";
        "G/LJour"."Account Type" := "G/LJour"."Account Type"::"G/L Account";
        "G/LJour".VALIDATE("G/LJour"."Account No.", SaleSetup."Warranty Settlement Acct.");
        "G/LJour"."Bal. Account Type" := "G/LJour"."Bal. Account Type"::Vendor;
        "G/LJour".VALIDATE("G/LJour"."Bal. Account No.", "Warranty Refund Account");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 1 Code", "Department Code");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 2 Code", "Branch Code");
        "G/LJour".Description := 'Warranty Labour/Subcontract Claim Settlement';
        "G/LJour"."Source Code" := 'WarrantyRf';
        "G/LJour"."Document Type" := "G/LJour"."Document Type"::" ";
        "G/LJour".VALIDATE("G/LJour".Amount, "Labor Amt Refunded by TMC(FCY)");
        "G/LJour".INSERT(TRUE);
        Lineno := Lineno + 10000;
        "G/LJour"."Line No." := Lineno;
        "G/LJour"."Bal. Account Type" := "G/LJour"."Bal. Account Type"::Vendor;
        "G/LJour".VALIDATE("G/LJour"."Bal. Account No.", "Warranty Refund Account");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 1 Code", "Department Code");
        "G/LJour".VALIDATE("G/LJour"."Shortcut Dimension 2 Code", "Branch Code");
        "G/LJour".Description := 'Warranty Material Claim Settlemt';
        "G/LJour"."Source Code" := 'WarrantyRf';
        "G/LJour"."Document Type" := "G/LJour"."Document Type"::" ";
        "G/LJour".VALIDATE("G/LJour".Amount, "Mat Amt Refunded by TMC(FCY)");
        "G/LJour".INSERT(TRUE);
        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post","G/LJour");
        GenJnlPostBatch.RUN("G/LJour");
    end;
}

