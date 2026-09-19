table 50098 "Obsolete Stock"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                /*IF "No." <> xRec."No." THEN BEGIN
                  GetInvtSetup;
                  NoSeriesMgt.TestManual(InvtSetup."Item Nos.");
                  "No. Series" := '';
                END;
                IF "Sales Qty. Disc. Code" = '' THEN
                  "Sales Qty. Disc. Code" := "No.";    */

            end;
        }
        field(2; "No. 2"; Code[20])
        {
            Caption = 'No. 2';
        }
        field(3; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(4; "Search Description"; Code[30])
        {
            Caption = 'Search Description';
        }
        field(5; "Description 2"; Text[30])
        {
            Caption = 'Description 2';
        }
        field(6; "Bill of Materials"; Boolean)
        {
            Caption = 'Bill of Materials';
            Editable = false;
        }
        field(7; Class; Code[10])
        {
            Caption = 'Class';

        }
        field(8; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(9; "Price Unit Conversion"; Integer)
        {
            Caption = 'Price Unit Conversion';
        }
        field(11; "Inventory Posting Group"; Code[10])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(12; "Shelf/Bin No."; Code[10])
        {
            Caption = 'Shelf/Bin No.';
        }
        field(13; "Sales Qty. Disc. Code"; Code[20])
        {
            Caption = 'Sales Qty. Disc. Code';
            TableRelation = Item;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(14; "Item/Cust. Disc. Gr."; Code[10])
        {
            Caption = 'Item/Cust. Disc. Gr.';
            TableRelation = "Item Discount Group";
        }
        field(15; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            InitValue = true;
        }
        field(16; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(17; "Commission Group"; Integer)
        {
            Caption = 'Commission Group';
        }
        field(18; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;

            trigger OnValidate()
            begin
                //VALIDATE("Price/Profit Calculation");
            end;
        }
        field(19; "Price/Profit Calculation"; Option)
        {
            Caption = 'Price/Profit Calculation';
            OptionCaption = 'Profit=Price-Cost,Price=Cost+Profit,No Relationship';
            OptionMembers = "Profit=Price-Cost","Price=Cost+Profit","No Relationship";

            trigger OnValidate()
            begin
                /*IF "Price Includes VAT" AND
                   ("Price/Profit Calculation" < "Price/Profit Calculation"::"No Relationship")
                THEN BEGIN
                  VATPostingSetup.GET("VAT Bus. Posting Gr. (Price)","VAT Prod. Posting Group");
                  CASE VATPostingSetup."VAT Calculation Type" OF
                    VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT":
                      VATPostingSetup."VAT %" := 0;
                    VATPostingSetup."VAT Calculation Type"::"Sales Tax":
                      ERROR(
                        Text006,
                        VATPostingSetup.FIELDCAPTION("VAT Calculation Type"),
                        VATPostingSetup."VAT Calculation Type");
                  END;
                END ELSE
                  CLEAR(VATPostingSetup);
                
                CASE "Price/Profit Calculation" OF
                  "Price/Profit Calculation"::"Profit=Price-Cost":
                    IF "Unit Price" <> 0 THEN
                      "Profit %" :=
                        ROUND(
                          100 * (1 - "Unit Cost" / ("Unit Price" /
                          (1 + VATPostingSetup."VAT %" / 100))),0.00001)
                    ELSE
                      "Profit %" := 0;
                  "Price/Profit Calculation"::"Price=Cost+Profit":
                    IF "Profit %" < 100 THEN BEGIN
                      GetGLSetup;
                      "Unit Price" :=
                        ROUND(
                          ("Unit Cost" / (1 - "Profit %" / 100)) *
                          (1 + VATPostingSetup."VAT %" / 100),GLSetup."Unit-Amount Rounding Precision");
                    END;
                END;
                     */

            end;
        }
        field(20; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
            MaxValue = 99.99999;

            trigger OnValidate()
            begin
                //VALIDATE("Price/Profit Calculation");
            end;
        }
        field(21; "Costing Method"; Option)
        {
            Caption = 'Costing Method';
            OptionCaption = 'FIFO,LIFO,Specific,Average,Standard';
            OptionMembers = FIFO,LIFO,Specific,"Average",Standard;

            trigger OnValidate()
            begin
                /*IF "Costing Method" = xRec."Costing Method" THEN
                  EXIT;
                
                IF "Costing Method" = "Costing Method"::Specific THEN BEGIN
                  TESTFIELD("Item Tracking Code");
                
                  ItemTrackingCode.GET("Item Tracking Code");
                  IF NOT ItemTrackingCode."SN Specific Tracking" AND
                     NOT ItemTrackingCode."Lot Specific Tracking"
                  THEN
                    ERROR(
                      Text018,
                      ItemTrackingCode.FIELDCAPTION("SN Specific Tracking"),
                      ItemTrackingCode.FIELDCAPTION("Lot Specific Tracking"),
                      FORMAT(TRUE),ItemTrackingCode.TABLECAPTION,ItemTrackingCode.Code);
                END;
                
                TestNoEntriesExist(FIELDCAPTION("Costing Method"));
                
                ItemCostMgt.UpdateUnitCost(Rec,'','',0,0,FALSE,FALSE,TRUE);*/

            end;
        }
        field(22; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            MinValue = 0;

            trigger OnValidate()
            begin
                /*IF ("Costing Method" = "Costing Method"::Standard) THEN
                  VALIDATE("Standard Cost","Unit Cost")
                ELSE
                  TestNoEntriesExist(FIELDCAPTION("Unit Cost"));*/

            end;
        }
        field(24; "Standard Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Standard Cost';
            MinValue = 0;

            trigger OnValidate()
            begin
                /*IF ("Costing Method" = "Costing Method"::Standard) AND (CurrFieldNo <> 0) THEN
                  IF NOT
                     CONFIRM(
                       Text020 +
                       Text021 +
                       Text022,FALSE,
                       FIELDCAPTION("Standard Cost"))
                  THEN BEGIN
                    "Standard Cost" := xRec."Standard Cost";
                    EXIT;
                END;
                
                ItemCostMgt.UpdateUnitCost(Rec,'','',0,0,FALSE,FALSE,CurrFieldNo <> 0);  */

            end;
        }
        field(25; "Last Direct Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Last Direct Cost';
            MinValue = 0;
        }
        field(28; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                //ItemCostMgt.UpdateUnitCost(Rec,'','',0,0,FALSE,FALSE,TRUE);
            end;
        }
        field(31; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;

            trigger OnValidate()
            begin
                /*IF (xRec."Vendor No." <> "Vendor No.") AND
                   ("Vendor No." <> '')
                THEN
                  IF Vend.GET("Vendor No.") THEN
                    "Lead Time Calculation" := Vend."Lead Time Calculation";   */

            end;
        }
        field(32; "Vendor Item No."; Text[20])
        {
            Caption = 'Vendor Item No.';
        }
        field(33; "Lead Time Calculation"; DateFormula)
        {
            Caption = 'Lead Time Calculation';
        }
        field(34; "Reorder Point"; Decimal)
        {
            Caption = 'Reorder Point';
            DecimalPlaces = 0 : 5;
        }
        field(35; "Maximum Inventory"; Decimal)
        {
            Caption = 'Maximum Inventory';
            DecimalPlaces = 0 : 5;
        }
        field(36; "Reorder Quantity"; Decimal)
        {
            Caption = 'Reorder Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(37; "Alternative Item No."; Code[20])
        {
            Caption = 'Alternative Item No.';
            TableRelation = Item;
        }
        field(38; "Unit List Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit List Price';
            MinValue = 0;
        }
        field(39; "Duty Due %"; Decimal)
        {
            Caption = 'Duty Due %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(40; "Duty Code"; Code[10])
        {
            Caption = 'Duty Code';
        }
        field(41; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(42; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(43; "Units per Parcel"; Decimal)
        {
            Caption = 'Units per Parcel';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(44; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(45; Durability; Code[10])
        {
            Caption = 'Durability';
        }
        field(46; "Freight Type"; Code[10])
        {
            Caption = 'Freight Type';
        }
        field(47; "Tariff No."; Code[10])
        {
            Caption = 'Tariff No.';
            TableRelation = "Tariff Number";
        }
        field(48; "Duty Unit Conversion"; Decimal)
        {
            Caption = 'Duty Unit Conversion';
            DecimalPlaces = 0 : 5;
        }
        field(49; "Country Purchased Code"; Code[10])
        {
            Caption = 'Country Purchased Code';
            TableRelation = "Country/Region";
        }
        field(50; "Budget Quantity"; Decimal)
        {
            Caption = 'Budget Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(51; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(52; "Budget Profit"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budget Profit';
        }
        field(53; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
        }
        field(54; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(62; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(64; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
        }
        field(65; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(66; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(67; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            TableRelation = Location;
        }
        field(68; Inventory; Decimal)
        {
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(69; "Net Invoiced Qty."; Decimal)
        {
            Caption = 'Net Invoiced Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70; "Net Change"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Net Change';
            Editable = false;
        }
        field(71; "Purchases (Qty.)"; Decimal)
        {
            Caption = 'Purchases (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(72; "Sales (Qty.)"; Decimal)
        {
            Caption = 'Sales (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(73; "Positive Adjmt. (Qty.)"; Decimal)
        {
            Caption = 'Positive Adjmt. (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(74; "Negative Adjmt. (Qty.)"; Decimal)
        {
            Caption = 'Negative Adjmt. (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(77; "Purchases (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Purchases (LCY)';
            Editable = false;
        }
        field(78; "Sales (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales (LCY)';
            Editable = false;
        }
        field(79; "Positive Adjmt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Positive Adjmt. (LCY)';
            Editable = false;
        }
        field(80; "Negative Adjmt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Negative Adjmt. (LCY)';
            Editable = false;
        }
        field(83; "COGS (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'COGS (LCY)';
            Editable = false;
        }
        field(84; "Qty. on Purch. Order"; Decimal)
        {
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(85; "Qty. on Sales Order"; Decimal)
        {
            Caption = 'Qty. on Sales Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(87; "Price Includes VAT"; Boolean)
        {
            Caption = 'Price Includes VAT';
        }
        field(89; "Drop Shipment Filter"; Boolean)
        {
            Caption = 'Drop Shipment Filter';
        }
        field(90; "VAT Bus. Posting Gr. (Price)"; Code[10])
        {
            Caption = 'VAT Bus. Posting Gr. (Price)';
            TableRelation = "VAT Business Posting Group";
        }
        field(91; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(92; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(93; "Transferred (Qty.)"; Decimal)
        {
            Caption = 'Transferred (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(94; "Transferred (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Transferred (LCY)';
            Editable = false;
        }
        field(95; "Country of Origin Code"; Code[10])
        {
            Caption = 'Country of Origin Code';
            TableRelation = "Country/Region";
        }
        field(96; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
        }
        field(97; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(98; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(99; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(100; Reserve; Option)
        {
            Caption = 'Reserve';
            InitValue = Optional;
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(101; "Reserved Qty. on Inventory"; Decimal)
        {
            Caption = 'Reserved Qty. on Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(102; "Reserved Qty. on Purch. Orders"; Decimal)
        {
            Caption = 'Reserved Qty. on Purch. Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(103; "Reserved Qty. on Sales Orders"; Decimal)
        {
            Caption = 'Reserved Qty. on Sales Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(105; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(106; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(107; "Res. Qty. on Outbound Transfer"; Decimal)
        {
            Caption = 'Res. Qty. on Outbound Transfer';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(108; "Res. Qty. on Inbound Transfer"; Decimal)
        {
            Caption = 'Res. Qty. on Inbound Transfer';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5400; "Low-Level Code"; Integer)
        {
            Caption = 'Low-Level Code';
            Editable = false;
        }
        field(5401; "Lot Size"; Decimal)
        {
            Caption = 'Lot Size';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5402; "Serial Nos."; Code[10])
        {
            Caption = 'Serial Nos.';
            TableRelation = "No. Series";
        }
        field(5403; "Last Unit Cost Calc. Date"; Date)
        {
            Caption = 'Last Unit Cost Calc. Date';
            Editable = false;
        }
        field(5404; "Rolled-up Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Material Cost';
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(5405; "Rolled-up Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Capacity Cost';
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(5406; "Indirect Cost per Unit"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Indirect Cost per Unit';
            DecimalPlaces = 2 : 5;
        }
        field(5407; "Scrap %"; Decimal)
        {
            Caption = 'Scrap %';
            DecimalPlaces = 0 : 2;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5408; "Requisition Method Code"; Code[10])
        {
            Caption = 'Requisition Method Code';

        }
        field(5409; "Inventory Value Zero"; Boolean)
        {
            Caption = 'Inventory Value Zero';
        }
        field(5410; "Discrete Order Quantity"; Integer)
        {
            Caption = 'Discrete Order Quantity';
            MinValue = 0;
        }
        field(5411; "Minimum Order Quantity"; Decimal)
        {
            Caption = 'Minimum Order Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5412; "Maximum Order Quantity"; Decimal)
        {
            Caption = 'Maximum Order Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5413; "Safety Stock Quantity"; Decimal)
        {
            Caption = 'Safety Stock Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5414; "Order Multiple"; Decimal)
        {
            Caption = 'Order Multiple';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5415; "Safety Lead Time"; DateFormula)
        {
            Caption = 'Safety Lead Time';
        }
        field(5417; "Flushing Method"; Option)
        {
            Caption = 'Flushing Method';
            OptionCaption = 'Manual,Forward,Backward';
            OptionMembers = Manual,Forward,Backward;
        }
        field(5419; "Requisition System"; Option)
        {
            Caption = 'Requisition System';
            OptionCaption = 'Purchase,Prod. Order, ';
            OptionMembers = Purchase,"Prod. Order"," ";
        }
        field(5420; "Scheduled Receipt (Qty.)"; Decimal)
        {
            Caption = 'Scheduled Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5421; "Scheduled Need (Qty.)"; Decimal)
        {
            Caption = 'Scheduled Need (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5422; "Rounding Precision"; Decimal)
        {
            Caption = 'Rounding Precision';
            DecimalPlaces = 0 : 5;
            InitValue = 1;
        }
        field(5423; "Bin Filter"; Code[10])
        {
            Caption = 'Bin Filter';

        }
        field(5424; "Variant Filter"; Code[10])
        {
            Caption = 'Variant Filter';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("No."));
        }
        field(5425; "Sales Unit of Measure"; Code[10])
        {
            Caption = 'Sales Unit of Measure';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(5426; "Purch. Unit of Measure"; Code[10])
        {
            Caption = 'Purch. Unit of Measure';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(5428; "Reorder Cycle"; DateFormula)
        {
            Caption = 'Reorder Cycle';
        }
        field(5429; "Reserved Qty. on Prod. Order"; Decimal)
        {
            Caption = 'Reserved Qty. on Prod. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5430; "Res. Qty. on Prod. Order Comp."; Decimal)
        {
            Caption = 'Res. Qty. on Prod. Order Comp.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5431; "Res. Qty. on Req. Line"; Decimal)
        {
            Caption = 'Res. Qty. on Req. Line';
            DecimalPlaces = 0 : 5;
        }
        field(5700; "Stockkeeping Unit Exists"; Boolean)
        {
            Caption = 'Stockkeeping Unit Exists';
            Editable = false;
        }
        field(5701; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            TableRelation = Manufacturer;
        }
        field(5702; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(5703; "Created From Nonstock Item"; Boolean)
        {
            Caption = 'Created From Nonstock Item';
            Editable = false;
        }
        field(5704; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';

        }
        field(5706; "Substitutes Exist"; Boolean)
        {
            Caption = 'Substitutes Exist';
            Editable = false;
        }
        field(5707; "Qty. in Transit"; Decimal)
        {
            Caption = 'Qty. in Transit';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5708; "Trans. Ord. Receipt (Qty.)"; Decimal)
        {
            Caption = 'Trans. Ord. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5709; "Trans. Ord. Shipment (Qty.)"; Decimal)
        {
            Caption = 'Trans. Ord. Shipment (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5771; "Qty. Received not available"; Decimal)
        {
            Caption = 'Qty. Received not available';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5774; "Qty. Assigned"; Decimal)
        {
            Caption = 'Qty. Assigned';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5775; "Qty. Assigned to pick"; Decimal)
        {
            Caption = 'Qty. Assigned to pick';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5776; "Qty. Assigned to ship"; Decimal)
        {
            Caption = 'Qty. Assigned to ship';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5900; "Service Item Group"; Code[10])
        {
            Caption = 'Service Item Group';
            TableRelation = "Service Item Group".Code;
        }
        field(5901; "Qty. on Service Order"; Decimal)
        {
            Caption = 'Qty. on Service Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5902; "Res. Qty. on Service Orders"; Decimal)
        {
            Caption = 'Res. Qty. on Service Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(6202; "Picture No."; Code[20])
        {
            Caption = 'Picture No.';

        }
        field(6500; "Item Tracking Code"; Code[10])
        {
            Caption = 'Item Tracking Code';
            TableRelation = "Item Tracking Code";
        }
        field(6501; "Lot Nos."; Code[10])
        {
            Caption = 'Lot Nos.';
            TableRelation = "No. Series";
        }
        field(6502; "Expiration Calculation"; DateFormula)
        {
            Caption = 'Expiration Calculation';
        }
        field(6503; "Lot No. Filter"; Code[10])
        {
            Caption = 'Lot No. Filter';
            TableRelation = "Lot No. Information"."Lot No." WHERE("Item No." = FIELD("No."));
        }
        field(6504; "Serial No. Filter"; Code[20])
        {
            Caption = 'Serial No. Filter';
            TableRelation = "Serial No. Information"."Serial No." WHERE("Item No." = FIELD("No."));
        }
        field(6506; "Item Tracking Inventory"; Decimal)
        {
            Caption = 'Item Tracking Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(6509; "Item Tracking Expired Invt."; Decimal)
        {
            Caption = 'Item Tracking Expired Invt.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50000; Obsolete; Boolean)
        {
        }
        field(50001; "Stock Date"; Date)
        {
        }
        field(50002; "Item Count"; Integer)
        {
            Editable = false;
        }
        field(50003; "Inv Quantity Filter"; Decimal)
        {
        }
        field(50004; "Inventory (All Locations)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50008; Fuel; Option)
        {
            OptionMembers = " ",Petrol,Diesel;
        }
        field(50088; "Article Group"; Code[20])
        {

            trigger OnValidate()
            begin
                //TESTFIELD("Article Group");
            end;
        }
        field(50151; "Special Attn"; Option)
        {
            OptionMembers = " ",H;
        }
        field(50152; "Created On"; Date)
        {
        }
        field(50190; "Model No."; Code[50])
        {
            TableRelation = Model;

            trigger OnValidate()
            begin
                //GetModel("Model No.");
                //"Model Name":=Model."Model Name";
            end;
        }
        field(50200; "Model Name"; Text[50])
        {
        }
        field(50201; "ABC-Classification"; Option)
        {
            OptionMembers = " ",A1,A2,A3,A4,B1,B2,B3,B4,E1,E2,WW,NN,OB;
        }
        field(50202; "SIIC-Code"; Code[5])
        {
        }
        field(50203; "Customs-Tarif"; Code[5])
        {
        }
        field(50204; "Currency Code"; Code[4])
        {
            TableRelation = Currency;
        }
        field(50205; tempblocked; Boolean)
        {
        }
        field(50206; Costpercent; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50207; "Foreign cur. price"; Decimal)
        {

            trigger OnValidate()
            begin
                /*VALIDATE("Unit Cost");
                VALIDATE("Deduct TaxFree/Before calc");
                */

                /*
                IF CONFIRM('Do you want to change salesprice',TRUE) THEN
                VALIDATE("Unit Price",Salesfactor*"Foreign cur. price");
                
                IF CONFIRM('Do you want to change costprice',TRUE) THEN
                BEGIN
                {
                  Currec.GET("Currency Code");
                  Exchraterec.SETRANGE("Currency Code",Currec.Code);
                  IF Exchraterec.FIND('+') THEN;
                
                  "Unit Cost":=(("Foreign cur. price"*Exchraterec."Exchange Rate Amount")/100)*CostFactor;
                }
                  VALIDATE("Unit Cost",CostFactor*"Foreign cur. price");
                END;
                */

                /*
                 IF LogRec.FIND('+') THEN
                 LogRec."Consecutive No.":=LogRec."Consecutive No."+1000 ELSE LogRec."Consecutive No.":=1000;
                 LogRec."User ID":=USERID;
                 LogRec.Date:=TODAY;
                 LogRec.Time:=TIME;
                 LogRec.ID:="No.";
                 LogRec."Acc. Diagr. Cons. No":=0;
                 LogRec."Create/change/delete":=1;
                 LogRec.FieldName:='Foreign Currency Price';
                 LogRec."Old Value":=FORMAT(xRec."Foreign cur. price");
                 LogRec."New Value":=FORMAT("Foreign cur. price");
                 LogRec."Delete: Text":='';
                 LogRec."Delete: Summing up":='';
                 LogRec.Tabletype:=5;
                 LogRec.INSERT;
                */

            end;
        }
        field(50208; "Sales Price Pink"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50209; "Costprice Pink"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50210; "LRUC Price"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50211; "Estcost."; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50212; "Recost."; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50213; "Product ok"; Boolean)
        {
            InitValue = true;
        }
        field(50214; "Salesprice WANG"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50215; "Salesfactor (FCY)"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //IF CONFIRM('Do you want to change salesprice',TRUE) THEN
                //  BEGIN
                //    VALIDATE("Price/Profit Calculation","Price/Profit Calculation"::"Profit=Price-Cost");
                //    VALIDATE("Unit Price",Salesfactor*"Foreign cur. price");

                //UpdateSellingPrice(1);

                //  END;


                /*
                 IF LogRec.FIND('+') THEN
                 LogRec."Consecutive No.":=LogRec."Consecutive No."+1000 ELSE LogRec."Consecutive No.":=1000;
                 LogRec."User ID":=USERID;
                 LogRec.Date:=TODAY;
                 LogRec.Time:=TIME;
                 LogRec.ID:="No.";
                 LogRec."Acc. Diagr. Cons. No":=0;
                 LogRec."Create/change/delete":=1;
                 LogRec.FieldName:='Sales Factor';
                 LogRec."Old Value":=FORMAT(xRec.Salesfactor);
                 LogRec."New Value":=FORMAT(Salesfactor);
                 LogRec."Delete: Text":='';
                 LogRec."Delete: Summing up":='';
                 LogRec.Tabletype:=5;
                 LogRec.INSERT;
                */

            end;
        }
        field(50216; CurrencyRate; Decimal)
        {
            DecimalPlaces = 4 : 4;
        }
        field(50217; "Imported on"; Date)
        {
        }
        field(50218; "Serialno Y/N"; Boolean)
        {
        }
        field(50219; "Stockvalue."; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50220; Department; Code[10])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50221; "Modified By"; Code[10])
        {
            Editable = false;
        }
        field(50222; CostFactor; Decimal)
        {
            DecimalPlaces = 3 : 3;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF CONFIRM('Do you want to change costprice', TRUE) THEN BEGIN
                    /*
                      Currec.GET("Currency Code");
                      Exchraterec.SETRANGE("Currency Code",Currec.Code);
                      IF Exchraterec.FIND('+') THEN;

                      "Unit Cost":=(("Foreign cur. price"*Exchraterec."Exchange Rate Amount")/100)*CostFactor;
                    */
                    VALIDATE("Unit Cost", "Foreign cur. price" * CostFactor);
                END;

            end;
        }
        field(50223; "CostFactor Air"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            MinValue = 0;
        }
        field(50224; "Cost Value Naira"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50225; "Old Salesprice"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50226; "Old Salesfactor"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50230; ICC; Code[10])
        {
            Editable = false;
            TableRelation = "Parts By Model"."Model Code";
        }
        field(50231; SCC; Code[10])
        {
            Editable = false;
            TableRelation = "Online Dealer Order";
        }
        field(50232; "Loss Sales"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
            TableRelation = "Sales Line";
        }
        field(50233; MAD; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50234; "Back/On Order"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50235; StockValInv; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50236; CostValue4Sales; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50237; "Stock/Value differ"; Boolean)
        {
        }
        field(50238; "Inventory Posting Grp Filter"; Code[10])
        {
            TableRelation = "Inventory Posting Group";
        }
        field(50239; "MVO Count"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50240; "MVO Purchaser Filter"; Option)
        {
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(50241; "MVO Model Filter"; Code[20])
        {
            TableRelation = Item;
        }
        field(50242; "Customer Gen Post Grp Filter"; Code[10])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(50243; "Customer Filter"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50244; "Model Group Filter"; Code[10])
        {
        }
        field(50245; "Model Category Filter"; Code[10])
        {
        }
        field(50246; "PO Filter"; Code[20])
        {
            TableRelation = "Monthly Vehicle Order"."PO Number";
        }
        field(50247; "Colour Filter"; Code[10])
        {
        }
        field(50249; "Actual Qty Demanded"; Decimal)
        {
        }
        field(60219; "Stockvalue.QQQ"; Decimal)
        {
            Editable = false;
        }
        field(60220; "Bin Count"; Integer)
        {
            Editable = false;
        }
        field(70000; "TNL Profit %"; Decimal)
        {
            Description = 'SUSPENDED';

            trigger OnValidate()
            begin
                //UpdateSellingPrice(0);
                //VALIDATE("Unit Price",GetSellPriceAfterDiscount);
                //ProfitTNLtoStandard;

                //VALIDATE("Profit %",ProfitTNLtoStandard);
            end;
        }
        field(70001; "TNL Discount B/4 Profit"; Decimal)
        {
            Description = 'SUSPENDED';
            InitValue = 30;
            MinValue = 0;

            trigger OnValidate()
            begin
                //UpdateSellingPrice(3);
            end;
        }
        field(70002; "Item Price Group"; Code[10])
        {
            Description = 'ok';
            TableRelation = IF ("Inventory Posting Group" = filter('N_PARTS')) "Item Price Group"."Item Price Grp Code";

        }
        field(70003; "Naira Sales Factor"; Decimal)
        {
            Description = 'SUSPENDED';
            Enabled = false;

        }
        field(70004; "Created By"; Code[20])
        {
            Editable = false;
        }
        field(70005; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(70006; StockQty; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70007; StockQty2; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70008; StockValue2; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70009; StockQtyLdgEntry; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70011; StockValueLdgEntry; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(70012; "Last Purchase Date"; Date)
        {
            Editable = false;
        }
        field(70013; "Last Sales Date"; Date)
        {
            Editable = false;
        }
        field(70014; "Sales Entries"; Integer)
        {
            Editable = false;
        }
        field(70100; "Item No. Filter"; Code[250])
        {
            TableRelation = Item;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(70101; "Product Group Filter"; Code[250])
        {

        }
        field(70102; "Sales Qty"; Decimal)
        {
        }
        field(70103; "Sales Amount"; Decimal)
        {
        }
        field(99000750; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
        field(99000751; "Production BOM No."; Code[20])
        {
            Caption = 'Production BOM No.';
            TableRelation = "Production BOM Header";
        }
        field(99000752; "Single-Level Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Material Cost';
            Editable = false;
        }
        field(99000753; "Single-Level Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Capacity Cost';
            Editable = false;
        }
        field(99000754; "Single-Level Subcontrd. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Subcontrd. Cost';
            Editable = false;
        }
        field(99000755; "Single-Level Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Cap. Ovhd Cost';
            Editable = false;
        }
        field(99000756; "Single-Level Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Mfg. Ovhd Cost';
            Editable = false;
        }
        field(99000757; "Overhead Rate"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Overhead Rate';
        }
        field(99000758; "Rolled-up Subcontracted Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Subcontracted Cost';
            Editable = false;
        }
        field(99000759; "Rolled-up Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Mfg. Ovhd Cost';
            Editable = false;
        }
        field(99000760; "Rolled-up Cap. Overhead Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Cap. Overhead Cost';
            Editable = false;
        }
        field(99000761; "Planning Issues (Qty.)"; Decimal)
        {
            Caption = 'Planning Issues (Qty.)';
            DecimalPlaces = 0 : 5;
        }
        field(99000762; "Planning Receipt (Qty.)"; Decimal)
        {
            Caption = 'Planning Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
        }
        field(99000765; "Planned Order Receipt (Qty.)"; Decimal)
        {
            Caption = 'Planned Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000766; "FP Order Receipt (Qty.)"; Decimal)
        {
            Caption = 'FP Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000767; "Rel. Order Receipt (Qty.)"; Decimal)
        {
            Caption = 'Rel. Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000768; "Planning Release (Qty.)"; Decimal)
        {
            Caption = 'Planning Release (Qty.)';
            DecimalPlaces = 0 : 5;
        }
        field(99000769; "Planned Order Release (Qty.)"; Decimal)
        {
            Caption = 'Planned Order Release (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000770; "Purch. Req. Receipt (Qty.)"; Decimal)
        {
            Caption = 'Purch. Req. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
        }
        field(99000771; "Purch. Req. Release (Qty.)"; Decimal)
        {
            Caption = 'Purch. Req. Release (Qty.)';
            DecimalPlaces = 0 : 5;
        }
        field(99000773; "Order Tracking Policy"; Option)
        {
            Caption = 'Order Tracking Policy';
            OptionCaption = 'None,Tracking Only,Tracking & Action Msg.';
            OptionMembers = "None","Tracking Only","Tracking & Action Msg.";

        }
        field(99000774; "Prod. Forecast Quantity (Base)"; Decimal)
        {
            Caption = 'Prod. Forecast Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(99000775; "Production Forecast Name"; Code[10])
        {
            Caption = 'Production Forecast Name';
            TableRelation = "Production Forecast Name";
        }
        field(99000776; "Component Forecast"; Boolean)
        {
            Caption = 'Component Forecast';
        }
        field(99000777; "Qty. on Prod. Order"; Decimal)
        {
            Caption = 'Qty. on Prod. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000778; "Qty. on Component Lines"; Decimal)
        {
            Caption = 'Qty. on Component Lines';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(99000875; Critical; Boolean)
        {
            Caption = 'Critical';
        }
        field(99008500; "Common Item No."; Code[20])
        {
            Caption = 'Common Item No.';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLSetup: Record "General Ledger Setup";
        InvtSetup: Record "Inventory Setup";
        CommentLine: Record "Comment Line";
        ItemVend: Record "Item Amount";
        ItemPrice: Record "Item Amount";
        ItemTranslation: Record "Item Translation";
        BOMComp: Record "BOM Component";
        PurchOrderLine: Record "Purchase Line";
        SalesOrderLine: Record "Sales Line";
        VATPostingSetup: Record "Sales Line";
        ExtTextHeader: Record "Extended Text Header";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        ItemVariant: Record "Item Variant";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        PlanningAssignment: Record "Planning Assignment";
        SKU: Record "Stockkeeping Unit";
        ItemTrackingCode: Record "Item Tracking Code";
        ItemTrackingCode2: Record "Item Tracking Code";
        ServInvLine: Record "Service Line";
        ItemSub: Record "Item Substitution";
        ItemCategory: Record "Item Category";
        TransLine: Record "Transfer Line";
        Vend: Record Vendor;
        NonstockItem: Record "Nonstock Item";
        WebSite: Record "Web Source";
        NoSeriesMgt: Codeunit "No. Series";
        MoveEntries: Codeunit MoveEntries;
        DimMgt: Codeunit DimensionManagement;
        NonstockItemMgt: Codeunit "Catalog Item Management";
        ItemCostMgt: Codeunit ItemCostManagement;
        CurrencyIsFound: Boolean;
        HasInvtSetup: Boolean;
        TroubleshSetup: Record "Troubleshooting Setup";
        ResourceSkill: Record "Resource Skill";
        GLSetupRead: Boolean;
}

