table 50135 "Stock Capitalisation"
{

    fields
    {
        field(1; "Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF Code <> xRec.Code THEN BEGIN
                    InventorySetup.GET;
                    NoseriesMgt.TestManual(InventorySetup."Stock Capitalisation No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Transaction Date"; Date)
        {
        }
        field(3; "Global Dimension 1"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            CaptionClass = '1,2,1';

        }
        field(4; "Global Dimension 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            CaptionClass = '1,2,2';
        }
        field(5; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                IF itemRec.GET("Item No.") THEN "Item Description" := itemRec.Description;
            end;
        }
        field(6; "Item Description"; Text[50])
        {
        }
        field(7; Location; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = filter(false));
        }
        field(8; "Variant Code"; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(9; "Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                IF FArec.GET("Asset No.") THEN "Asset Description" := FArec.Description;
            end;
        }
        field(10; "Asset Description"; Code[50])
        {
        }
        field(11; "Asset Aquisition Date"; Date)
        {
        }
        field(12; Processed; Boolean)
        {


            trigger OnValidate()

            begin

                TESTFIELD("Stock Capitalisation Approval");
                UserSetup.GET(USERID);
                IF NOT UserSetup."Process Stock Capitalisation" THEN
                    ERROR('You dont have Permission to Process Stock Capitalisation');
                "Process date" := TODAY;
                "Process Time" := TIME;
                "Process By" := USERID;

                ItemJNL2.SETRANGE(ItemJNL2."Journal Template Name", 'ITEM');
                ItemJNL2.SETRANGE(ItemJNL2."Journal Batch Name", 'STKCAPTAL');
                IF ItemJNL2.FINDFIRST THEN
                    ItemJNL2.DELETEALL;
                itemRec.GET("Item No.");
                ItemJNL.INIT;
                ItemJNL."Journal Template Name" := 'ITEM';
                ItemJNL."Journal Batch Name" := 'STKCAPTAL';
                ItemJNL."Line No." := 10000;
                ItemJNL."Posting Date" := "Transaction Date";
                ItemJNL."Entry Type" := ItemJNL."Entry Type"::"Negative Adjmt.";
                ItemJNL."Document No." := Code;
                ItemJNL.VALIDATE(ItemJNL."Item No.", "Item No.");
                ItemJNL.VALIDATE(ItemJNL."Location Code", Location);
                ItemJNL.VALIDATE(ItemJNL.Quantity, Quantity);
                ItemJNL."Gen. Bus. Posting Group" := 'STOCKCAP';
                ItemJNL.Description := ItemJNL.Description + '.';
                ItemJNL.VALIDATE(ItemJNL."Variant Code", "Variant Code");
                ItemJNL.VALIDATE(ItemJNL."Shortcut Dimension 1 Code", "Global Dimension 1");
                ItemJNL.VALIDATE(ItemJNL."Shortcut Dimension 2 Code", "Global Dimension 2");
                itemledg.SETCURRENTKEY("Entry No.");
                itemledg.SETRANGE(itemledg."Entry No.", "Entry No");
                IF itemledg.FINDFIRST THEN
                    itemledg.CALCFIELDS(itemledg."Cost Amount (Actual)");
                ItemJNL."Unit Amount" := itemledg."Cost Amount (Actual)";
                ItemJNL."Unit Cost" := itemledg."Cost Amount (Actual)";

                ItemJNL.INSERT(TRUE);
                reserventry2.FINDLAST;
                reserventry.INIT;
                reserventry."Item No." := "Item No.";
                reserventry."Location Code" := Location;
                reserventry."Entry No." := reserventry2."Entry No." + 1;
                reserventry."Quantity (Base)" := -1;
                reserventry."Qty. to Handle (Base)" := -1;
                reserventry."Qty. to Invoice (Base)" := -1;
                reserventry."Creation Date" := "Process date";
                reserventry."Source Type" := 83;
                reserventry."Source Subtype" := 3;
                reserventry."Source ID" := 'item';
                reserventry."Source Ref. No." := ItemJNL."Line No.";
                reserventry."Source Batch Name" := ItemJNL."Journal Batch Name";
                reserventry."Serial No." := "Chasis No.";
                reserventry."Exterior Colour Code" := Color;
                reserventry."Item Tracking" := reserventry."Item Tracking"::"Serial No.";
                reserventry."Reservation Status" := reserventry."Reservation Status"::Prospect;
                reserventry.Quantity := -1;
                reserventry."Engine No." := "Engine No.";
                reserventry."Key No." := "Key No.";
                reserventry.INSERT(TRUE);


                "G/lJrnl2".SETRANGE("G/lJrnl2"."Journal Template Name", 'GENERAL');
                "G/lJrnl2".SETRANGE("G/lJrnl2"."Journal Batch Name", 'STKCAPTAL');
                IF "G/lJrnl2".FINDFIRST THEN
                    "G/lJrnl2".DELETEALL;

                "G/lJrnl".INIT;
                "G/lJrnl"."Journal Template Name" := 'GENERAL';
                "G/lJrnl"."Journal Batch Name" := 'STKCAPTAL';
                "G/lJrnl"."Line No." := 10000;
                "G/lJrnl"."Account Type" := "G/lJrnl"."Account Type"::"Fixed Asset";
                "G/lJrnl".VALIDATE("G/lJrnl"."Account No.", "Asset No.");
                "G/lJrnl".VALIDATE("G/lJrnl"."Posting Date", "Asset Aquisition Date");
                //"G/lJrnl"."Document Type" := 0;
                "G/lJrnl"."Document No." := Code;
                "G/lJrnl"."FA Posting Type" := "G/lJrnl"."FA Posting Type"::"Acquisition Cost";
                "G/lJrnl"."FA Posting Date" := "Asset Aquisition Date";
                itemledg.SETCURRENTKEY("Entry No.");
                itemledg.SETRANGE(itemledg."Entry No.", "Entry No");
                IF itemledg.FINDFIRST THEN
                    itemledg.CALCFIELDS(itemledg."Cost Amount (Actual)");
                "G/lJrnl".VALIDATE("G/lJrnl".Amount, itemledg."Cost Amount (Actual)");
                "G/lJrnl"."Bal. Account Type" := "G/lJrnl"."Bal. Account Type"::"G/L Account";
                "G/lJrnl"."Bal. Account No." := "Stock Capitalisation Account";
                "G/lJrnl".VALIDATE("G/lJrnl"."Shortcut Dimension 1 Code", "Global Dimension 1");
                "G/lJrnl".VALIDATE("G/lJrnl"."Shortcut Dimension 2 Code", "Global Dimension 2");
                "G/lJrnl".INSERT(TRUE);
                ItemPost.RUN(ItemJNL);

                //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",Rec);
                //CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                //CurrPage.UPDATE(FALSE);

                PostFarec.RUN("G/lJrnl");
                //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);
                //CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                //CurrPage.UPDATE(FALSE);
            end;


        }
        field(13; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
            InitValue = 1;
        }
        field(14; "Process date"; Date)
        {
        }
        field(15; "Process Time"; Time)
        {
        }
        field(16; "Process By"; Code[20])
        {
        }
        field(17; "Stock Capitalisation Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(18; "No. Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(19; "Stock Capitalisation Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                IF UserSetup."Approve Stock Capitalisation" THEN BEGIN
                    "Capitalisation Approved By" := USERID;
                    "Capitalisation Approved Time" := TIME;
                    "Capitalisation Approved Date" := TODAY;
                END ELSE
                    ERROR('Sorry you dont have permission to approve Stock Capitalisation');
            end;
        }
        field(20; "Capitalisation Approved By"; Code[20])
        {
        }
        field(21; "Capitalisation Approved Time"; Time)
        {
        }
        field(22; "Capitalisation Approved Date"; Date)
        {
        }
        field(23; "Chasis No."; Code[20])
        {
            Editable = false;
        }
        field(24; Color; Code[20])
        {
            Editable = false;
        }
        field(25; "Engine No."; Code[20])
        {
            Editable = false;
        }
        field(26; "Key No."; Code[10])
        {
            Editable = false;
        }
        field(27; "Entry No"; Integer)
        {
            TableRelation = "Item Ledger Entry"."Entry No." WHERE("Item No." = FIELD("Item No."),
                                                                   "Remaining Quantity" = FILTER(> 0),
                                                                   "Location Code" = FIELD(Location));

            trigger OnValidate()
            begin
                IF itemledg.GET("Entry No") THEN BEGIN
                    "Chasis No." := itemledg."Serial No.";
                    Color := itemledg."Exterior Colour Name";
                    "Engine No." := itemledg."Engine No.";
                    "Key No." := itemledg."Key No.";
                    itemledg.CALCFIELDS("Cost Amount (Actual)");
                    "Item Cost (LCY)" := itemledg."Cost Amount (Actual)";
                END;
            end;
        }
        field(28; "Item Cost (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF Code = '' THEN BEGIN
            InventorySetup.GET;
            InventorySetup.TESTFIELD("Stock Capitalisation No.");

            "No. Series" := InventorySetup."Stock Capitalisation No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            Code := NoSeriesMgt.GetNextNo("No. Series");

        END;
    end;

    trigger OnModify()
    begin
        IF xRec.Processed THEN
            ERROR('You cannot change a processed stock capitalisation!');
    end;

    var
        itemRec: Record 27;
        FArec: Record 5600;
        ItemJNL: Record 83;
        ItemJNL2: Record 83;
        "G/lJrnl": Record 81;
        "G/lJrnl2": Record 81;
        ItemPost: Codeunit 22;
        PostFarec: Codeunit 12;
        NoseriesMgt: Codeunit "No. Series";
        Stockrec: Record 50135;
        InventorySetup: Record 313;
        itemledg: Record 32;
        reserventry: Record 337;
        reserventry2: Record 337;
        UserSetup: Record 91;


    procedure AssistEdit(OldStockCap: Record "Stock Capitalisation"): Boolean
    begin
        /* Stockrec := Rec;
        InventorySetup.GET;
        InventorySetup.TESTFIELD("Stock Capitalisation No.");
        IF NoseriesMgt.SelectSeries(InventorySetup."Stock Capitalisation No.", OldStockCap."No. Series", Stockrec."No. Series") THEN BEGIN
            InventorySetup.GET;
            InventorySetup.TESTFIELD("Stock Capitalisation No.");
            NoseriesMgt.SetSeries(Stockrec.Code);
            Rec := Stockrec;
            EXIT(TRUE);
        END; */
    end;
}

