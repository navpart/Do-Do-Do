table 50023 "Parts By Model"
{
    DataCaptionFields = "Model Code", "Part No.";

    fields
    {
        field(1; "Model Code"; Code[20])
        {
            TableRelation = Model."Model No.";

            trigger OnValidate()
            begin
                ModelRec.SETRANGE(ModelRec."Model No.", "Model Code");
                IF ModelRec.FINDFIRST THEN
                    "Model Name" := ModelRec."Model Description";
            end;
        }
        field(2; "Part No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_PARTS'));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                IF ItemRec.GET("Part No.") THEN BEGIN
                    ItemRec.CALCFIELDS(ItemRec.Inventory, ItemRec."Qty. on Purch. Order", ItemRec."Qty. on Sales Order");
                    "Part Description" := ItemRec.Description;

                END;

            end;
        }
        field(3; "Model Name"; Text[50])
        {
        }
        field(4; "Part Description"; Text[50])
        {
        }
        field(5; "Model Units In Operations"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("No." = FIELD("Model Code")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }

        field(6; "Q'ty On Hand"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Posting Date" = FIELD(UPPERLIMIT("Base Date"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "X70 PHEV"; Boolean)
        {
            // CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Posting Date" = FIELD(UPPERLIMIT("Base Date"))));
            // CalcFormula = exist("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Posting Date" = FIELD(UPPERLIMIT("Base Date"))));
            // DecimalPlaces = 0 : 0;
            Editable = true;
            //FieldClass = FlowField;
        }
        field(17; "X70 LIBERTY"; Boolean)
        {

        }
        field(23; "X50"; Boolean)
        {

        }
        field(18; "X70 New Body"; Boolean)
        {

        }
        field(19; "X90 Plus Cruise"; Code[10])
        {

        }
        field(20; "X1 DASHING"; Code[10])
        {

        }
        field(24; "X70 Plus Elegance"; Code[10])
        {

        }
        field(21; "T2 TRAVELER"; Boolean)
        {

        }
        field(22; "T2 PHEV"; Boolean)
        {

        }
        field(7; "Q'ty On Purchase Order"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE(Type = CONST(Item), "No." = FIELD("Part No."),
            "Document Type" = FILTER('Order|Invoice'), "Order Date" = FIELD(UPPERLIMIT("Base Date"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Total Purchase"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Entry Type" = filter('Purchase'), "Posting Date" = FIELD(UPPERLIMIT("Base Date"))));

            //     CalcFormula = Sum(item l."Outstanding Quantity" WHERE(Type = CONST(Item), "No." = FIELD("Part No."),
            //     "Document Type" = FILTER('Order|Invoice'), "Order Date" = FIELD(UPPERLIMIT("Base Date"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Q'ty On Sales Order"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Outstanding Quantity" WHERE("Document Type" = FILTER('Order|Invoice'), Type = CONST(Item), "No." = FIELD("Part No."), "Shipment Date" = FIELD(UPPERLIMIT("Base Date"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Part Category"; Option)
        {
            OptionCaption = ' ,ENGINE/FUEL SYSTEM,POWER DRIVE/CHASIS,BODY PARTS,ELECTRICAL PARTS,AC,SUSPENSION,BRAKE,BRAKE/ELECTRICAL,DRIVE/SUSPENSION,TRANSMISSION,FLUID';
            OptionMembers = " ","ENGINE/FUEL SYSTEM","POWER DRIVE/CHASIS","BODY PARTS","ELECTRICAL PARTS","AC","SUSPENSION","BRAKE","BRAKE/ELECTRICAL","DRIVE/SUSPENSION","TRANSMISSION","FLUID";
        }
        field(13; "Base Date"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Lost Sales Q'ty"; Decimal)
        {
            CalcFormula = Sum("Parts Enquiry"."Lost Quantity" WHERE("Part No" = FIELD("Part No."),
                                                                     "Request Date" = FIELD("Base Date")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(26; Serial; Integer)
        {
            Caption = 'Serial';
        }
        field(27; "Q'ty Sold"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Entry Type" = CONST(Sale), "Posting Date" = FIELD(UPPERLIMIT("Base Date"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(31; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Sales Rate"; Decimal)
        {

            // CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Part No."), "Entry Type" = CONST(Sale)));
            DecimalPlaces = 0 : 0;
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(32; Margin; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }

    }

    keys
    {
        key(Key1; "Model Code", "Part No.")
        {
            Clustered = true;
        }
        key(Key2; "Part Category")
        {
        }
        key(Key3; Serial)
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemRec: Record Item;
        ModelRec: Record Model;
        Avs: Decimal;
        datefilter: Text[30];
        Qsales: Decimal;


    procedure Inv(): Decimal
    begin
        Avs := 0;
        datefilter := GETFILTER("Base Date");
        IF datefilter = '0d' THEN
            SETFILTER("Base Date", '%1', TODAY);
        IF ItemRec.GET("Part No.") THEN BEGIN
            ItemRec.SETFILTER(ItemRec."Date Filter", '%1..%2', CALCDATE('-12M', GETRANGEMAX("Base Date")), GETRANGEMAX("Base Date"));
            ItemRec.CALCFIELDS(ItemRec."Sales (Qty.)");
            IF ItemRec."Sales (Qty.)" <> 0 THEN;
            EXIT(ItemRec."Sales (Qty.)");

        END;
    end;


    procedure Avesale(): Decimal
    begin
        Avs := 0;
        datefilter := GETFILTER("Base Date");
        IF datefilter = '0d' THEN
            SETFILTER("Base Date", '%1', TODAY);

        IF ItemRec.GET("Part No.") THEN BEGIN
            ItemRec.SETFILTER(ItemRec."Date Filter", '%1..%2', CALCDATE('-12M', GETRANGEMAX("Base Date")), GETRANGEMAX("Base Date"));
            ItemRec.CALCFIELDS(ItemRec."Sales (Qty.)");
            IF ItemRec."Sales (Qty.)" <> 0 THEN Avs := ROUND((ItemRec."Sales (Qty.)" / 12), 1, '>');
            EXIT(Avs);

        END;
    end;


    procedure QtyPurch()
    begin
    end;


    procedure QtySales()
    begin
    end;


}

