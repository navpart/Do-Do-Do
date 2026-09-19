table 50302 "Product Grp"
{
    DrillDownPageID = 50538;
    LookupPageID = 50538;

    fields
    {
        field(1; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(7300; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            DataClassification = ToBeClassified;
            TableRelation = "Warehouse Class";
        }
        field(50000; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50001; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50002; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50003; "Location Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50004; "Sales (Qty.)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50005; "Sales (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "COGS (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50007; "Bin Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Filter"));
        }
        field(50008; "Variant Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code WHERE("Item Category" = FILTER('CARS'));
        }
        field(50009; "Item No. Filter"; Code[250])
        {
            FieldClass = FlowFilter;
            TableRelation = Item WHERE("Inventory Posting Group" = FILTER('N_CARS'));
        }
        field(50010; "Product Group Filter"; Code[250])
        {

        }
        field(50100; "Item Count"; Integer)
        {
            CalcFormula = Count("Stockkeeping Unit" WHERE("Product Group Code" = FIELD(Code),
                                                           "Item No." = FIELD("Item No. Filter"),
                                                           "Variant Code" = FIELD("Variant Filter"),
                                                           "Location Code" = FIELD("Location Filter")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Item Category Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

