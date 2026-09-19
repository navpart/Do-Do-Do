table 50102 "Stores Req. Line."
{

    fields
    {
        field(1; "Document Type"; Option)
        {
        OptionMembers = Issue,Return,"Posted Issue","Posted Return";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
            TableRelation = "Stores Requisition Header."."No." WHERE(Type = FIELD("Document Type"));
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Item No."; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate()
            begin
                IF "Item No." = '' THEN
                    EXIT;

                StoreReqHeader.GET("Document No.", "Document Type");
                Item.GET("Item No.");
                Item.TESTFIELD(Blocked, FALSE);
                Description := Item.Description;
                VALIDATE("Base Unit of Measure", Item."Base Unit of Measure");
                VALIDATE("Unit Cost", Item."Unit Cost");
                "Shelf/Bin No." := Item."Shelf No.";

                IF StoreReqHeader."Fixed Assets No." <> '' THEN BEGIN
                    FArec.GET(StoreReqHeader."Fixed Assets No.");
                    "Fixed Asset No." := StoreReqHeader."Fixed Assets No.";
                    "Maintenance Code" := StoreReqHeader."Maintenance Code";
                    "Shortcut Dimension 1 Code" := FArec."Global Dimension 1 Code";
                    IF FArec."Global Dimension 1 Code" = '' THEN
                        ERROR('Department Code must not be blank on Fixed Asset No. %1!', StoreReqHeader."Fixed Assets No.");
                END;
            end;
        }
        field(5; "Engr. Part No."; Code[20])
        {
        }
        field(6; "Shelf/Bin No."; Code[20])
        {
        }
        field(7; "Alternative Item No."; Code[20])
        {
            Editable = false;
            TableRelation = Item;
        }
        field(8; Description; Text[50])
        {
        }
        field(10; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                Amount := ROUND(Quantity * "Unit Cost");
            end;
        }
        field(11; "Unit Cost"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(12; Amount; Decimal)
        {
            Editable = false;
        }
        field(13; "Location Code"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            begin
                IF ItemRec.GET("Item No.") THEN BEGIN
                    ItemRec.SETRANGE(ItemRec."Date Filter");
                    ItemRec.SETFILTER(ItemRec."Location Filter", "Location Code");
                    ItemRec.CALCFIELDS(ItemRec.Inventory);
                    QtyInStock := ItemRec.Inventory;
                END;
            end;
        }
        field(14; "Project Code"; Code[10])
        {

        }
        field(15; "Fixed Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
        }
        field(16; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(18; Remark; Text[40])
        {
        }
        field(19; "Base Unit of Measure"; Code[10])
        {
        }
        field(20; "Man. Part No."; Text[40])
        {
        }
        field(23; "Job No."; Code[20])
        {
        }
        field(25; "Variant Code"; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));

            trigger OnValidate()
            begin
                CheckItemAvailable(FIELDNO("Variant Code"));
                GetUnitCost;

                IF "Variant Code" = '' THEN BEGIN
                    Item.GET("Item No.");
                    Description := Item.Description;
                    EXIT;
                END;

                ItemVariant.GET("Item No.", "Variant Code");
                Description := ItemVariant.Description;
                TESTFIELD("Location Code");
                SKU.SETRANGE(SKU."Location Code", "Location Code");
                SKU.SETRANGE(SKU."Item No.", "Item No.");
                SKU.SETRANGE(SKU."Variant Code", "Variant Code");
                IF SKU.FINDFIRST THEN BEGIN
                    "Shelf/Bin No." := SKU."Shelf No.";
                    VALIDATE("Unit Cost", SKU."Unit Cost");
                END;
            end;
        }
        field(26; "Bin Code"; Code[10])
        {
            //TableRelation = "Table 5400: Bin".Code WHERE ("Location Code"=FIELD("Location Code"));
        }
        field(27; "Cage/Location"; Text[30])
        {
        }
        field(28; "External Doc No."; Text[30])
        {
        }
        field(31; "Unit Price"; Decimal)
        {
        }
        field(32; "Job Tasks Code"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(33; "Maintenance Code"; Code[10])
        {
            Editable = false;
            TableRelation = Maintenance.Code;
        }
        field(34; "Quantity Requested"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(35; "Fully Posted"; Boolean)
        {
        }
        field(36; "Quantity Posted"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                Quantity := "Quantity Requested" - "Quantity Posted";
            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = "Unit Cost", "Unit Price", Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ERROR('You cannot delete the requisition');
    end;

    trigger OnInsert()
    begin
        StoreReqHeader.GET("Document No.", "Document Type");
        IF StoreReqHeader."Printed Copies" <> 0 THEN
            ERROR('Printed Requisition cannot be modified!');
    end;

    trigger OnModify()
    begin
        StoreReqHeader.GET("Document No.", "Document Type");
        //IF StoreReqHeader."Printed Copies" <> 0 THEN
        //ERROR('Printed Requisition cannot be modified!');
    end;

    var
        StoreReqHeader: Record 50101;
        Item: Record 27;
        FArec: Record 5600;
        Deprec: Record 5612;
        FAPostRec: Record 5606;
        DimMgt: Codeunit 408;
        serviceItemLine: Record 5901;
        ItemVariant: Record 5401;
        ItemCheckAvail: Codeunit 311;
        ItJnlrec: Record 83;
        SKU: Record 5700;
        ItemRec: Record 27;
        QtyInStock: Decimal;

    local procedure CheckItemAvailable(CalledByFieldNo: Integer)
    begin
        ItJnlrec.VALIDATE(ItJnlrec."Item No.", "Item No.");
        ItJnlrec.VALIDATE(ItJnlrec."Posting Date", TODAY);
        //ItJnlrec."Entry Type" := ItJnlrec."Entry Type"::
        ItJnlrec."Location Code" := Rec."Location Code";
        ItJnlrec."Variant Code" := "Variant Code";
        ItJnlrec.Quantity := Quantity;

        ItemCheckAvail.ItemJnlCheckLine(ItJnlrec);
    end;

    local procedure GetUnitCost()
    begin
        TESTFIELD("Item No.");
        GetItem;
        IF GetSKU THEN BEGIN
            VALIDATE("Unit Cost", SKU."Unit Cost");
        END ELSE BEGIN
            VALIDATE("Unit Cost", Item."Unit Cost");
        END;
    end;

    local procedure GetItem()
    begin
        TESTFIELD("Item No.");
        IF "Item No." <> Item."No." THEN
            Item.GET("Item No.");
    end;

    local procedure GetSKU(): Boolean
    begin
        IF (SKU."Location Code" = "Location Code") AND
           (SKU."Item No." = "Item No.") AND
           (SKU."Variant Code" = "Variant Code")
        THEN
            EXIT(TRUE);
        IF SKU.GET("Location Code", "Item No.", "Variant Code") THEN
            EXIT(TRUE)
        ELSE
            EXIT(FALSE);
    end;
}

