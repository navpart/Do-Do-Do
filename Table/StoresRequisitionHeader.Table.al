table 50101 "Stores Requisition Header."
{

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        /* field(2; Type; Enum "Item Ledger Entry Type")
        {
            Editable = false;
            //OptionMembers = Issue,Return,"Posted Issue","Posted Return";
        } */
        field(2; Type; Option)
        {
            Editable = false;
            OptionMembers = Issue,Return,"Posted Issue","Posted Return";
        }
        field(3; Date; Date)
        {
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin

            end;
        }
        field(5; "Date Issued"; Date)
        {
            Editable = false;
        }
        field(6; "User ID"; Code[30])
        {
            Editable = false;

        }
        field(7; "Printed Copies"; Integer)
        {
        }
        field(8; Remark; Text[40])
        {
        }
        field(9; "External Doc. No."; Text[30])
        {
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                //MODIFY;
            end;
        }
        field(13; "Job No."; Code[20])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                //"Gen Business Group" := 'Production';
            end;
        }
        field(14; "Workshop Document"; Boolean)
        {
        }
        field(15; "Job Tasks Code"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(16; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD(Approved, FALSE);
                IF "Send for Approval" THEN BEGIN
                    "Send By" := USERID;
                    "Send Time" := TIME;
                    "Send Date" := TODAY;
                END
                ELSE BEGIN
                    "Send By" := '';
                    "Send Time" := 0T;
                    "Send Date" := 0D;
                END;
            end;
        }
        field(17; "Send By"; Code[20])
        {
            Editable = false;
        }
        field(18; "Send Time"; Time)
        {
            Editable = false;
        }
        field(19; "Send Date"; Date)
        {
            Editable = false;
        }
        field(20; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                //GPC.AccessGranted('21');
                IF Approved THEN BEGIN
                    TESTFIELD("Send for Approval");
                    "Approved by" := USERID;
                    "Approved Time" := TIME;
                    "Approved Date" := TODAY;
                END
                ELSE BEGIN
                    "Approved by" := '';
                    "Approved Time" := 0T;
                    "Approved Date" := 0D;
                END;
            end;
        }
        field(21; "Approved by"; Code[20])
        {
            Editable = false;
        }
        field(22; "Approved Time"; Time)
        {
            Editable = false;
        }
        field(23; "Approved Date"; Date)
        {
            Editable = false;
        }
        field(24; "Gen Business Group"; Code[10])
        {
            InitValue = 'PRODUCTION';
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(25; "Management Approve"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Management Approve" THEN BEGIN
                    //  TESTFIELD("Send for Approval");
                    "Management Approve Name" := USERID;
                    "Management Approve Time" := TIME;
                    "Management Approve Date" := TODAY;
                END
                ELSE BEGIN
                    "Management Approve Name" := '';
                    "Management Approve Time" := 0T;
                    "Management Approve Date" := 0D;
                END;
            end;
        }
        field(26; "Management Approve Name"; Code[20])
        {
        }
        field(27; "Management Approve Time"; Time)
        {
        }
        field(28; "Management Approve Date"; Date)
        {
        }
        field(29; Unapprove; Boolean)
        {
        }
        field(30; "Fixed Assets No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            var
                FARec: Record 5600;
                FADepBk: Record 5612;
                FAPostGrp: Record 5606;
            begin
                IF "Fixed Assets No." <> '' THEN BEGIN
                    FARec.GET("Fixed Assets No.");
                    FADepBk.SETRANGE(FADepBk."FA No.", "Fixed Assets No.");
                    IF NOT FADepBk.FIND('-') THEN
                        ERROR('There is no Depreciation Book for this Fixed Asset!');
                    IF NOT FAPostGrp.GET(FADepBk."FA Posting Group") THEN
                        ERROR('There is no Posting Group for this fixed asset!');
                    "FA Description" := FARec.Description;
                    "Registration No." := FARec."Serial No.";
                    FAclass := FARec."FA Class Code";
                    FALocation := FARec."FA Location Code";
                END ELSE BEGIN
                    "FA Description" := '';
                    "Registration No." := '';
                    FAclass := '';
                    FALocation := '';
                END;
            end;
        }
        field(31; "FA Description"; Text[50])
        {
            Editable = true;
        }
        field(32; "Registration No."; Code[30])
        {
        }
        field(33; "User/ Drivers Name"; Text[50])
        {
        }
        field(34; "Maintenance Code"; Code[10])
        {
            TableRelation = Maintenance.Code;
        }
        field(35; "Total Amount"; Decimal)
        {
            CalcFormula = Sum("Stores Req. Line.".Amount WHERE("Document Type" = FIELD(Type),
                                                                "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "COF No"; Code[10])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(37; "SIV No."; Code[20])
        {
        }
        field(38; Dealer; Code[20])
        {

            trigger OnValidate()
            begin
                IF CusRec.GET(Dealer) THEN
                    "Dealer Name" := CusRec.Name ELSE
                    "Dealer Name" := '';
            end;
        }
        field(39; "Dealer Name"; Text[30])
        {
        }
        field(40; "Invoice No."; Code[10])
        {

            trigger OnValidate()
            begin
                IF SalesShipHead.GET("Invoice No.") THEN BEGIN
                    "Waybill Date" := SalesShipHead."Order Date";
                    "Waybill No." := SalesShipHead."Order No.";
                    "Dealer Name" := SalesShipHead."Bill-to Name";
                END ELSE BEGIN
                    "Waybill Date" := 0D;
                    "Waybill No." := '';
                    "Dealer Name" := '';
                END;
            end;
        }
        field(41; "Waybill Date"; Date)
        {
        }
        field(42; Description; Text[100])
        {
        }
        field(43; Description2; Text[100])
        {
        }
        field(44; "Waybill No."; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "No.", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.DELETEALL;
    end;

    trigger OnInsert()
    begin
        Date := TODAY;
        "User ID" := USERID;
        //User.GET(USERID);
        //User.TESTFIELD("Global Dimension 1 Code");

        InvtSetup.GET;
        IF "No." = '' THEN BEGIN
            InvtSetup.TESTFIELD("Material Requisition Nos");
            "No." := NoSeriesMgt.GetNextNo(InvtSetup."Material Requisition Nos");

            /*  NoSeriesMgt.InitSeries(InvtSetup."Material Requisition Nos", InvtSetup."Material Requisition Nos", 0D, "No.",
             InvtSetup."Material Requisition Nos"); */

            "Workshop Document" := TRUE;
        END;

        DimMgt.UpdateDefaultDim(
          DATABASE::"Stores Requisition Header.", "No.",
          "Global Dimension 1 Code", "Global Dimension 2 Code");
        //  IF xRec.Type > 1 THEN ERROR('You Can Not Insert a New Requisition in Posted Transaction Mode');
    end;

    trigger OnModify()
    begin
        //IF Type > 1 THEN ERROR('You can Not modify Posted Transaction');
    end;

    trigger OnRename()
    begin
        ERROR('%1 %2 Record cannot be re-named!', Type, "No.");
    end;

    var
        InvtSetup: Record 313;
        User: Record 91;
        StoreReqLine: Record 50102;
        StoreReqLine2: Record 50102;
        StoreReqLine3: Record 50102;
        NoSeriesMgt: Codeunit "No. Series";
        Itemrec: Record 27;
        FADEPRBOOK: Record 5612;
        FABOOKGROUP: Record 5606;
        DimMgt: Codeunit 408;
        dimvalue: Record 349;
        serviceItemLine: Record 5901;
        SERVEHEAD: Record 5900;
        itempost: Codeunit 22;
        FAclass: Code[10];
        FALocation: Code[10];
        LineCount: Integer;
        LineCount2: Integer;
        CusRec: Record 18;
        SalesShipHead: Record 110;


    procedure CreateIssue()
    var
        ItemJnlTemplate: Record 82;
        ItemJnlBatch: Record 233;
        ItemJnlLine: Record 83;
        ItemJnlLine2: Record 83;
        JnlSelected: Boolean;
    begin
        InvtSetup.GET;
        //IF Type > Type:: THEN ERROR('Posted Transaction Cannot Notify store again');
        StoreReqLine.RESET;
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.SETFILTER(StoreReqLine.Quantity, '>%1', 0);
        StoreReqLine.SETRANGE(StoreReqLine."Fully Posted", FALSE);
        IF NOT StoreReqLine.FINDFIRST THEN
            ERROR('Empty requisition line!\No Stores issue created')
        ELSE
            ItemJnlTemplate.RESET;
        ItemJnlTemplate.SETRANGE(Recurring, FALSE);
        ItemJnlTemplate.SETRANGE(Type, ItemJnlTemplate.Type::Item);

        CASE ItemJnlTemplate.COUNT OF
            0:
                BEGIN
                    ItemJnlTemplate.INIT;
                    ItemJnlTemplate.Recurring := FALSE;
                    /* CASE StoreReqLine."Document Type" OF
                        "Item Ledger Entry Type"::Purchase:
                            ItemJnlTemplate.VALIDATE(Type, ItemJnlTemplate.Type::Item);
                        "Item Ledger Entry Type"::Sale:
                            ItemJnlTemplate.VALIDATE(Type, ItemJnlTemplate.Type::Item);
                    END; */
                    ItemJnlTemplate.Name := FORMAT(ItemJnlTemplate.Type, MAXSTRLEN(ItemJnlTemplate.Name));
                    ItemJnlTemplate.Description := STRSUBSTNO('%1 journal', ItemJnlTemplate.Type);
                    ItemJnlTemplate."Requisition No." := "No.";
                    IF ItemJnlTemplate.INSERT THEN;
                END;
            1:
                ItemJnlTemplate.FINDFIRST;
            ELSE
                IF NOT JnlSelected THEN
                    ERROR('Function terminated by user!');
        END;

        // Create Item batch
        ItemJnlBatch.INIT;
        ItemJnlBatch."Journal Template Name" := ItemJnlTemplate.Name;

        //assign issues no series
        InvtSetup.Get();
        InvtSetup.TESTFIELD("Issues Nos");
        ItemJnlBatch.Name := NoSeriesMgt.GetNextNo(InvtSetup."Issues Nos");
        //NoSeriesMgt.InitSeries(InvtSetup."Issues Nos", InvtSetup."Issues Nos", 0D, ItemJnlBatch.Name, InvtSetup."Issues Nos");
        "SIV No." := ItemJnlBatch.Name;

        //delete existing item jnl lines
        ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name", ItemJnlTemplate.Name);
        ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name", ItemJnlBatch.Name);
        IF ItemJnlLine.FINDFIRST THEN
            ItemJnlLine.DELETEALL;

        ItemJnlLine.RESET;
        ItemJnlBatch."Requisition No." := "No.";
        ItemJnlBatch.Description := 'Issue of SRV ' + "No.";
        ItemJnlBatch."Global Dimension 1 Code" := "Global Dimension 1 Code";
        IF ItemJnlBatch.INSERT THEN;
        REPEAT
            ItemJnlLine."Journal Template Name" := ItemJnlBatch."Journal Template Name";
            ItemJnlLine."Journal Batch Name" := ItemJnlBatch.Name;
            CASE StoreReqLine."Document Type" OF
                StoreReqLine."Document Type"::Issue:
                    ItemJnlLine.VALIDATE("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
                StoreReqLine."Document Type"::Return:
                    ItemJnlLine.VALIDATE("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
            END;
            ItemJnlLine.VALIDATE(ItemJnlLine."Item No.", StoreReqLine."Item No.");
            ItemJnlLine.VALIDATE("Posting Date", TODAY);
            ItemJnlLine."Document No." := ItemJnlBatch.Name;
            ItemJnlLine."Line No." := StoreReqLine."Line No.";
            ItemJnlLine."From Service Line No." := StoreReqLine."Line No.";
            ItemJnlLine.Description := StoreReqLine.Description;
            ItemJnlLine."External Document No." := StoreReqLine."Document No.";
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Global Dimension 1 Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", "Global Dimension 2 Code");
            ItemJnlLine."Requisition No." := StoreReqLine."Document No.";
            IF StoreReqLine."Location Code" <> '' THEN
                ItemJnlLine.VALIDATE(ItemJnlLine."Location Code", StoreReqLine."Location Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Variant Code", StoreReqLine."Variant Code");
            ItemJnlLine.VALIDATE(ItemJnlLine.Quantity, StoreReqLine.Quantity);
            ItemJnlLine.VALIDATE("Unit of Measure Code", 'PCS');
            ItemJnlLine.VALIDATE(ItemJnlLine."Unit Amount", StoreReqLine."Unit Cost");
            ItemJnlLine.VALIDATE(ItemJnlLine."Unit Cost", StoreReqLine."Unit Cost");
            ItemJnlLine.Quantity := 0;
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", StoreReqLine."Project Code");
            ItemJnlLine."Fixed Assets No." := StoreReqLine."Fixed Asset No.";
            ItemJnlLine."Maintenance Code" := StoreReqLine."Maintenance Code";
            ItemJnlLine2.SETRANGE("Journal Template Name", ItemJnlLine."Journal Template Name");
            ItemJnlLine2.SETRANGE("Journal Batch Name", ItemJnlLine."Journal Batch Name");

            IF ItemJnlLine2.FIND('+') THEN
                ItemJnlLine."Line No." := ItemJnlLine2."Line No." + 10000
            ELSE
                ItemJnlLine."Line No." := 10000;
            ItemJnlLine.INSERT(TRUE);
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code");
            ItemJnlLine.MODIFY;
        UNTIL StoreReqLine.NEXT = 0;
        //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJnlLine);


        StoreReqLine.RESET;
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.SETFILTER(StoreReqLine.Quantity, '>%1', 0);
        StoreReqLine.SETRANGE(StoreReqLine."Fully Posted", FALSE);
        IF StoreReqLine.FINDFIRST THEN
            REPEAT
                IF StoreReqLine."Quantity Posted" = 0 THEN
                    StoreReqLine.VALIDATE("Quantity Posted", StoreReqLine.Quantity);
                IF StoreReqLine."Quantity Posted" > 0 THEN
                    StoreReqLine.VALIDATE("Quantity Posted", (StoreReqLine.Quantity + StoreReqLine."Quantity Posted"));
                IF StoreReqLine."Quantity Requested" = StoreReqLine."Quantity Posted" THEN
                    StoreReqLine."Fully Posted" := TRUE;
                StoreReqLine.MODIFY;
            UNTIL StoreReqLine.NEXT = 0;


        StoreReqLine3.SETRANGE("Document Type", Type);
        StoreReqLine3.SETRANGE("Document No.", "No.");
        LineCount := StoreReqLine3.COUNT;

        StoreReqLine2.SETRANGE("Document Type", Type);
        StoreReqLine2.SETRANGE("Document No.", "No.");
        StoreReqLine2.SETRANGE("Fully Posted", TRUE);
        LineCount2 := StoreReqLine2.COUNT;
        IF LineCount = LineCount2 THEN
            PostMaintenancEntry;
    end;


    procedure CreateIssueAlloy()
    var
        ItemJnlTemplate: Record 82;
        ItemJnlBatch: Record 233;
        ItemJnlLine: Record 83;
        ItemJnlLine2: Record 83;
        JnlSelected: Boolean;
    begin
        InvtSetup.GET;
        //IF Type <> Type::"Positive Adjmt." THEN ERROR('Posted transaction cannot notify store again');
        StoreReqLine.RESET;
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.SETFILTER(StoreReqLine.Quantity, '>%1', 0);
        StoreReqLine.SETRANGE(StoreReqLine."Fully Posted", FALSE);
        IF NOT StoreReqLine.FINDFIRST THEN
            ERROR('Requisition line is empty!')
        ELSE
            ItemJnlTemplate.RESET;
        ItemJnlTemplate.SETRANGE(Recurring, FALSE);
        ItemJnlTemplate.SETRANGE(Type, ItemJnlTemplate.Type::Item);
        ItemJnlTemplate.INIT;
        ItemJnlTemplate.Recurring := FALSE;
        CASE StoreReqLine."Document Type" OF
            StoreReqLine."Document Type"::Issue:
                ItemJnlTemplate.VALIDATE(Type, ItemJnlTemplate.Type::Item);
            StoreReqLine."Document Type"::Return:
                ItemJnlTemplate.VALIDATE(Type, ItemJnlTemplate.Type::Item);
        END;
        ItemJnlTemplate.Name := 'ISSUE';
        ItemJnlTemplate.Description := STRSUBSTNO('%1 journal', ItemJnlTemplate.Type);
        ItemJnlTemplate."Requisition No." := "No.";
        IF ItemJnlTemplate.INSERT THEN;


        // Create Item batch
        ItemJnlBatch.INIT;
        ItemJnlBatch."Journal Template Name" := ItemJnlTemplate.Name;
        //assign issues no series
        InvtSetup.TESTFIELD(InvtSetup."Issues Nos");
        ItemJnlBatch.Name := NoSeriesMgt.GetNextNo(InvtSetup."Issue Nos Alloy");
        //NoSeriesMgt.InitSeries(InvtSetup."Issue Nos Alloy", InvtSetup."Issue Nos Alloy", 0D, ItemJnlBatch.Name, InvtSetup."Issue Nos Alloy");
        "SIV No." := ItemJnlBatch.Name;

        //delete existing item jnl lines
        ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name", ItemJnlTemplate.Name);
        ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name", ItemJnlBatch.Name);
        IF ItemJnlLine.FIND('-') THEN
            ItemJnlLine.DELETEALL;

        ItemJnlLine.RESET;
        ItemJnlBatch."Requisition No." := "No.";
        ItemJnlBatch.Description := 'Issue of SRV ' + "No.";
        ItemJnlBatch."Global Dimension 1 Code" := "Global Dimension 1 Code";
        IF ItemJnlBatch.INSERT THEN;
        REPEAT
            ItemJnlLine."Journal Template Name" := ItemJnlBatch."Journal Template Name";
            ItemJnlLine."Journal Batch Name" := ItemJnlBatch.Name;
            CASE StoreReqLine."Document Type" OF
                StoreReqLine."Document Type"::Issue:
                    ItemJnlLine.VALIDATE("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
                StoreReqLine."Document Type"::Return:
                    ItemJnlLine.VALIDATE("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
            END;
            ItemJnlLine.VALIDATE(ItemJnlLine."Item No.", StoreReqLine."Item No.");
            ItemJnlLine.VALIDATE("Posting Date", TODAY);
            ItemJnlLine."Document No." := ItemJnlBatch.Name;
            ItemJnlLine."Source Code" := 'ITEMJNL';
            ItemJnlLine."Line No." := StoreReqLine."Line No.";
            ItemJnlLine."From Service Line No." := StoreReqLine."Line No.";
            ItemJnlLine.Description := StoreReqLine.Description;
            ItemJnlLine."External Document No." := StoreReqLine."Document No.";
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Global Dimension 1 Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", "Global Dimension 2 Code");
            ItemJnlLine."Requisition No." := StoreReqLine."Document No.";
            IF StoreReqLine."Location Code" <> '' THEN
                ItemJnlLine.VALIDATE(ItemJnlLine."Location Code", StoreReqLine."Location Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Variant Code", StoreReqLine."Variant Code");
            ItemJnlLine.VALIDATE(ItemJnlLine.Quantity, StoreReqLine.Quantity);
            ItemJnlLine.VALIDATE(ItemJnlLine."Unit Amount", StoreReqLine."Unit Cost");
            ItemJnlLine.VALIDATE(ItemJnlLine."Unit Cost", StoreReqLine."Unit Cost");
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", StoreReqLine."Project Code");
            ItemJnlLine2.SETRANGE("Journal Template Name", ItemJnlLine."Journal Template Name");
            ItemJnlLine2.SETRANGE("Journal Batch Name", ItemJnlLine."Journal Batch Name");

            IF ItemJnlLine2.FINDLAST THEN
                ItemJnlLine."Line No." := ItemJnlLine2."Line No." + 10000
            ELSE
                ItemJnlLine."Line No." := 10000;
            ItemJnlLine.INSERT(TRUE);
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code");
            ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code");
            ItemJnlLine.MODIFY;
        UNTIL StoreReqLine.NEXT = 0;
        //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJnlLine);


        StoreReqLine.RESET;
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.SETFILTER(StoreReqLine.Quantity, '>%1', 0);
        StoreReqLine.SETRANGE(StoreReqLine."Fully Posted", FALSE);
        IF StoreReqLine.FINDFIRST THEN
            REPEAT
                IF StoreReqLine."Quantity Posted" = 0 THEN
                    StoreReqLine.VALIDATE("Quantity Posted", StoreReqLine.Quantity);
                IF StoreReqLine."Quantity Posted" > 0 THEN
                    StoreReqLine.VALIDATE("Quantity Posted", (StoreReqLine.Quantity + StoreReqLine."Quantity Posted"));
                IF StoreReqLine."Quantity Requested" = StoreReqLine."Quantity Posted" THEN
                    StoreReqLine."Fully Posted" := TRUE;
                StoreReqLine.MODIFY;
            UNTIL StoreReqLine.NEXT = 0;


        StoreReqLine3.SETRANGE("Document Type", Type);
        StoreReqLine3.SETRANGE("Document No.", "No.");
        LineCount := StoreReqLine3.COUNT;

        StoreReqLine2.SETRANGE("Document Type", Type);
        StoreReqLine2.SETRANGE("Document No.", "No.");
        StoreReqLine2.SETRANGE("Fully Posted", TRUE);
        LineCount2 := StoreReqLine2.COUNT;
        IF LineCount = LineCount2 THEN;
    end;

    procedure TestForValidity()
    begin
        StoreReqLine.RESET;
        StoreReqLine.SETRANGE(StoreReqLine."Document Type", Type);
        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
        StoreReqLine.SETRANGE(StoreReqLine.Quantity, 0);
        IF StoreReqLine.FINDFIRST THEN
            ERROR('Quantity must not be zero on SRV %1, Line %2', "No.", StoreReqLine."Line No.");
    end;

    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Stores Requisition Header.", "No.", FieldNo, ShortcutDimCode);
        MODIFY;
    end;

    procedure PostMaintenancEntry()
    var
        ItemLedgEntry: Record 32;
        ItemLedgEntry2: Record 32;
        MaintenanceLedgEntry: Record 5625;
        StoresRecHead: Record 50101;
        StoresRecLine: Record 50102;
        LineNo: Integer;
        GenPostSetup: Record 252;
        postMaint: Codeunit 5600;
    begin
        //To create Maintenance Ledger Entry
        ItemLedgEntry.SETCURRENTKEY("External Document No.", "From Service Line No.");
        ItemLedgEntry.SETRANGE(ItemLedgEntry."External Document No.", "No.");
        IF ItemLedgEntry.FINDFIRST THEN
            REPEAT
                MESSAGE('The Value is %1', ItemLedgEntry."External Document No.");
                StoreReqLine.SETRANGE("Document No.", ItemLedgEntry."External Document No.");
                StoreReqLine.SETRANGE("Line No.", ItemLedgEntry."From Service Line No.");
                StoreReqLine.FINDFIRST;
                IF StoreReqLine."Fully Posted" THEN BEGIN
                    ItemLedgEntry.CALCFIELDS(ItemLedgEntry."Cost Amount (Actual)");
                    MaintenanceLedgEntry.SETRANGE("Entry No.");
                    IF MaintenanceLedgEntry.FINDLAST THEN
                        LineNo := MaintenanceLedgEntry."Entry No.";
                    MaintenanceLedgEntry."Entry No." := LineNo + 1;
                    MaintenanceLedgEntry."Document No." := ItemLedgEntry."External Document No.";
                    MaintenanceLedgEntry."User ID" := USERID;
                    MaintenanceLedgEntry."Depreciation Book Code" := 'DEF_DEPR';
                    MaintenanceLedgEntry."FA No." := "Fixed Assets No.";
                    MaintenanceLedgEntry."FA Posting Date" := ItemLedgEntry."Posting Date";
                    MaintenanceLedgEntry."FA Class Code" := 'MOTOR_VEH';
                    MaintenanceLedgEntry."Maintenance Code" := "Maintenance Code";
                    MaintenanceLedgEntry."Posting Date" := ItemLedgEntry."Posting Date";
                    MaintenanceLedgEntry."Document Date" := ItemLedgEntry."Posting Date";
                    MaintenanceLedgEntry."Document No." := ItemLedgEntry."Document No.";
                    MaintenanceLedgEntry.Description := ItemLedgEntry.Description;
                    MaintenanceLedgEntry.Quantity := ABS(ItemLedgEntry.Quantity);
                    MaintenanceLedgEntry.VALIDATE("Global Dimension 1 Code", ItemLedgEntry."Global Dimension 1 Code");
                    MaintenanceLedgEntry.VALIDATE("Global Dimension 2 Code", ItemLedgEntry."Global Dimension 2 Code");
                    MaintenanceLedgEntry."Journal Batch Name" := 'MAINT.';
                    MaintenanceLedgEntry."Debit Amount" := ABS(ItemLedgEntry."Cost Amount (Actual)");
                    MaintenanceLedgEntry.Amount := ABS(ItemLedgEntry."Cost Amount (Actual)");
                    MaintenanceLedgEntry."Bal. Account No." := GenPostSetup."Inventory Adjmt. Account";
                    //MaintenanceLedgEntry."Gen. Posting Type" := 0;
                    MaintenanceLedgEntry."Gen. Bus. Posting Group" := '';
                    MaintenanceLedgEntry."Gen. Prod. Posting Group" := '';
                    MaintenanceLedgEntry."VAT Bus. Posting Group" := '';
                    //MaintenanceLedgEntry.INSERT;
                    //postMaint.InsertFromService(MaintenanceLedgEntry);
                END;
            UNTIL ItemLedgEntry.NEXT = 0;
    end;
}

