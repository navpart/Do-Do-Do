table 50028 "Purchase Requisition"
{
    DataCaptionFields = "Item No.", Description;

    fields
    {
        field(1; "Line No"; Integer)
        {
            NotBlank = true;
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                IF itemrec.GET("Item No.") THEN
                    Description := itemrec.Description;
                Supplier := itemrec."Vendor No.";
                itemrec.CALCFIELDS(itemrec.Inventory);
                Inventory := itemrec.Inventory;
                "MIP(Sales)" := itemrec."Maximum Inventory";
                "Other Specification" := itemrec."Non Specification";
                "Model No." := itemrec."Model No.";
                "Model Description" := itemrec."Model Name";
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Reorder Quantity"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                IF "Reorder Quantity" > 0 THEN "Ordered Qty" := ROUND("Reorder Quantity", 1);
            end;
        }
        field(5; "Ordered Qty"; Decimal)
        {
            BlankNumbers = BlankNegAndZero;
            DecimalPlaces = 0 : 0;
        }
        field(6; Supplier; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(7; "Ordered Date"; Date)
        {
        }
        field(8; "Transaction Date"; Date)
        {
        }
        field(9; Ordered; Boolean)
        {
        }
        field(10; Inventory; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(11; "MIP(Sales)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(12; "Order No."; Code[20])
        {
        }
        field(13; "Department code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(14; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(15; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(16; "Other Specification"; Boolean)
        {
        }
        field(17; "Model No."; Code[50])
        {
        }
        field(18; "Model Description"; Text[50])
        {
        }
        field(19; "Lost Q'ty"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(20; "Ceilling Code"; Code[10])
        {
            TableRelation = "Part Order Celling"."Celling Code";

            trigger OnValidate()
            begin
                IF ceillingRec.GET("Ceilling Code") THEN
                    IF ceillingRec."Higher Band" <> 0 THEN
                        "Abnormal Q'ty" := ceillingRec."Maximum Qty"
                    ELSE
                        "Abnormal Q'ty" := "Average Sales";
            end;
        }
        field(21; "Abnormal Q'ty"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(22; "Average Sales"; Decimal)
        {
            DecimalPlaces = 1 : 1;
            Description = 'Monthly Average sales of Six Month';

            trigger OnValidate()
            begin
                ceillingRec.SETFILTER(ceillingRec."Lower Band", '<=%1', "Average Sales");
                IF ceillingRec.FIND('+') THEN
                    VALIDATE("Ceilling Code", ceillingRec."Celling Code");
            end;
        }
        field(23; "Order BackGround"; Option)
        {
            OptionCaption = ' ,Lost Sales,Special Demand';
            OptionMembers = " ","Lost Sales","Special Demand";
        }
        field(24; "Created Demand Q'ty"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(25; "N - 1"; Decimal)
        {
            Description = 'Month -1 (sales in the last month)';
        }
        field(26; "N - 2"; Decimal)
        {
            Description = 'Month -2 (sales in the last 2 month)';
        }
        field(27; "N - 3"; Decimal)
        {
            Description = 'Month -3 (sales in the last 3 month)';
        }
        field(28; "N - 4"; Decimal)
        {
            Description = 'Month -4 (sales in the last 4 month)';
        }
        field(29; "N - 5"; Decimal)
        {
            Description = 'Month -5 (sales in the last 5 month)';
        }
        field(30; "N - 6"; Decimal)
        {
            Description = 'Month -6 (sales in the last 6 month)';
        }
        field(31; "SSD Period"; Decimal)
        {
            Description = 'Safety Stock Of Demand Period';
        }
        field(32; "Fr - 1"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -1 (Freq. Demand in the last 1 month)';
        }
        field(33; "Fr - 2"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -2 (Freq. Demand in the last 2 month)';
        }
        field(34; "Fr - 3"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -3 (Freq. Demand in the last 3 month)';
        }
        field(35; "Fr - 4"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -4 (Freq. Demand in the last 4 month)';
        }
        field(36; "Fr - 5"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -5 (Freq. Demand in the last 5 month)';
        }
        field(37; "Fr - 6"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -6 (Freq. Demand in the last 6 month)';
        }
        field(38; "MIP(Demand)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Maximum Inventory Position based on Monthly Average Demand';
        }
        field(39; "QD - 1"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -1 (Demand in the last 1 month)';
        }
        field(40; "QD - 2"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -2 (Demand in the last 2 month)';
        }
        field(41; "QD - 3"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -3 (Demand in the last 3 month)';
        }
        field(42; "QD - 4"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -4 (Demand in the last 4 month)';
        }
        field(43; "QD - 5"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -5 (Demand in the last 5 month)';
        }
        field(44; "QD - 6"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -6 (Demand in the last 6 month)';
        }
        field(45; "LQ - 1"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -1 (Lost sales in the last 1 month)';
        }
        field(46; "LQ - 2"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -2 (Lost sales in the last 2 month)';
        }
        field(47; "LQ - 3"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -3 (Lost sales in the last 3 month)';
        }
        field(48; "LQ - 4"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -4 (Lost sales in the last 4 month)';
        }
        field(49; "LQ - 5"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -5 (Lost sales in the last 5 month)';
        }
        field(50; "LQ - 6"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -6 (Lost sales in the last 6 month)';
        }
        field(51; "Average Demand"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Monthly Average demand of 6 mth Demand';
        }
        field(52; "Average Lost Sales"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Monthly Average Lost sales of 6 Mth';
        }
        field(53; "SOQ (Demand)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'suggested order base on Demand';
        }
        field(54; "SOQ (Sales)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'suggested order base on sales';
        }
        field(55; "SOQ (Lost Sales)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'SOQ (Demand) - SOQ (sales)';
        }
        field(56; "Stock On Hand"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(57; "Qty On Sales Order"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(58; "Qty On Order"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(59; "QS - 1"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -1 (Supplied in the last 1 month)';
        }
        field(60; "QS - 2"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -2 (Supplied in the last 2 month)';
        }
        field(61; "QS - 3"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -3 (Supplied in the last 3 month)';
        }
        field(62; "QS - 4"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -4 (Supplied in the last 4 month)';
        }
        field(63; "QS - 5"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -5 (Supplied in the last 5 month)';
        }
        field(64; "QS - 6"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Month -6 (Supplied in the last 6 month)';
        }
        field(65; "SOQ (Supplied)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'suggested order base on Supplied';
        }
        field(66; "Average Supplied"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(67; "MIP(Supplied)"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(68; "SSS Period"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Description = 'Safety Stock Of Actual Sales Period';
        }
        field(69; "Total Sales Last 12M"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(70; "N - 7"; Decimal)
        {
            Description = 'Month -7 (sales in the last 7 month)';
        }
        field(71; "N - 8"; Decimal)
        {
            Description = 'Month -8 (sales in the last 8 month)';
        }
        field(72; "N - 9"; Decimal)
        {
            Description = 'Month -9 (sales in the last 9 month)';
        }
        field(73; "N - 10"; Decimal)
        {
            Description = 'Month -10 (sales in the last 10 month)';
        }
        field(74; "N - 11"; Decimal)
        {
            Description = 'Month -11 (sales in the last 11 month)';
        }
        field(75; "N - 12"; Decimal)
        {
            Description = 'Month -12 (sales in the last 12 month)';
        }
        field(76; "Fr - 7"; Decimal)
        {
            Description = 'Month -7 (Freq. Demand in the last 7 month)';
        }
        field(77; "Fr - 8"; Decimal)
        {
            Description = 'Month -8 (Freq. Demand in the last 8 month)';
        }
        field(78; "Fr - 9"; Decimal)
        {
            Description = 'Month -9 (Freq. Demand in the last 9 month)';
        }
        field(79; "Fr - 10"; Decimal)
        {
            Description = 'Month -10 (Freq. Demand in the last 10 month)';
        }
        field(80; "Fr - 11"; Decimal)
        {
            Description = 'Month -11 (Freq. Demand in the last 11 month)';
        }
        field(81; "Fr - 12"; Decimal)
        {
            Description = 'Month -12 (Freq. Demand in the last 12 month)';
        }
        field(82; "QD - 7"; Decimal)
        {
            Description = 'Month -7 (Demand in the last 7 month)';
        }
        field(83; "QD - 8"; Decimal)
        {
            Description = 'Month -8 (Demand in the last 8 month)';
        }
        field(84; "QD - 9"; Decimal)
        {
            Description = 'Month -9 (Demand in the last 9 month)';
        }
        field(85; "QD - 10"; Decimal)
        {
            Description = 'Month -10 (Demand in the last 10 month)';
        }
        field(86; "QD - 11"; Decimal)
        {
            Description = 'Month -11 (Demand in the last 11 month)';
        }
        field(87; "QD - 12"; Decimal)
        {
            Description = 'Month -12 (Demand in the last 12 month)';
        }
        field(88; "LQ - 7"; Decimal)
        {
            Description = 'Month -7 (Lost sales in the last 7 month)';
        }
        field(89; "LQ - 8"; Decimal)
        {
            Description = 'Month -8 (Lost sales in the last 8 month)';
        }
        field(90; "LQ - 9"; Decimal)
        {
            Description = 'Month -9 (Lost sales in the last 9 month)';
        }
        field(91; "LQ - 10"; Decimal)
        {
            Description = 'Month -10 (Lost sales in the last 10 month)';
        }
        field(92; "LQ - 11"; Decimal)
        {
            Description = 'Month -11 (Lost sales in the last 11 month)';
        }
        field(93; "LQ - 12"; Decimal)
        {
            Description = 'Month -12 (Lost sales in the last 12 month)';
        }
        field(94; "QS - 7"; Decimal)
        {
            Description = 'Month -7 (Supplied in the last 7 month)';
        }
        field(95; "QS - 8"; Decimal)
        {
            Description = 'Month -8 (Supplied in the last 8 month)';
        }
        field(96; "QS - 9"; Decimal)
        {
            Description = 'Month -9 (Supplied in the last 9 month)';
        }
        field(97; "QS - 10"; Decimal)
        {
            Description = 'Month -10 (Supplied in the last 10 month)';
        }
        field(98; "QS - 11"; Decimal)
        {
            Description = 'Month -11 (Supplied in the last 11 month)';
        }
        field(99; "QS - 12"; Decimal)
        {
            Description = 'Month -12 (Supplied in the last 12 month)';
        }
        field(100; "QD - Total"; Decimal)
        {
            Description = 'Total Quantity Demanded';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Location Code")
        {
            Clustered = true;
        }
        key(Key2; "Line No")
        {
        }
        key(Key3; "Transaction Date")
        {
        }
        key(Key4; Supplier)
        {
        }
    }

    fieldgroups
    {
    }

    var
        itemrec: Record 27;
        PurchReq: Record 50028;
        "PurchReq 2": Record 50028;
        LineNo: Integer;
        UserSetup: Record 91;
        DeleteOnOrder: Integer;
        text001: Label 'Delete on Order,Keep On Order';
        ModelName: Record 27;
        ceillingRec: Record 50029;
        AdqRange: Boolean;
        text002: Label 'Order on Demand,Order On Supplied,Order On Actual Sales,Order on Lost Sale';
        OrderON: Integer;


    procedure CreateOrder()
    var
        PurchHead: Record 38;
        PurchLine: Record 39;
    begin
        UserSetup.GET(USERID);
        IF NOT CONFIRM('This Will Create a Purchase order for each supplier specified.\ Are your sure you want to create purchase order'
          , FALSE) THEN
            EXIT;
        DeleteOnOrder := STRMENU(text001);
        PurchReq.SETCURRENTKEY(Supplier);
        PurchReq.SETFILTER(PurchReq.Supplier, '<>%1', '');
        PurchReq.SETFILTER(PurchReq."Order No.", '%1', '');
        PurchReq.SETFILTER(PurchReq."Ordered Qty", '>%1', 0);
        IF PurchReq.FIND('-') THEN
            REPEAT
                PurchHead.INIT;
                PurchHead."Document Type" := PurchHead."Document Type"::Order;
                PurchHead."No." := '';
                PurchHead.VALIDATE(PurchHead."Order Date", TODAY);
                PurchHead.VALIDATE(PurchHead."Posting Date", TODAY);
                PurchHead.VALIDATE(PurchHead."Buy-from Vendor No.", PurchReq.Supplier);
                PurchHead.VALIDATE(PurchHead."Pay-to Vendor No.", PurchReq.Supplier);
                PurchHead."Location Code" := UserSetup."Location Code";
                PurchHead."Shortcut Dimension 1 Code" := UserSetup.Department;
                PurchHead.INSERT(TRUE);
                "PurchReq 2".COPYFILTERS(PurchReq);
                "PurchReq 2".SETRANGE("PurchReq 2".Supplier, PurchReq.Supplier);
                IF "PurchReq 2".FIND('-') THEN
                    REPEAT
                        PurchLine.INIT;
                        PurchLine."Document Type" := PurchLine."Document Type"::Order;
                        PurchLine."Document No." := PurchHead."No.";
                        PurchLine."Buy-from Vendor No." := "PurchReq 2".Supplier;
                        PurchLine.VALIDATE(PurchLine.Type, PurchLine.Type::Item);
                        PurchLine.VALIDATE(PurchLine."No.", "PurchReq 2"."Item No.");
                        PurchLine."Line No." := LineNo;
                        PurchLine.VALIDATE(PurchLine.Quantity, ROUND("PurchReq 2"."Ordered Qty", 1));
                        PurchLine.INSERT(TRUE);
                        LineNo := LineNo + 10000;
                        "PurchReq 2"."Order No." := PurchHead."No.";
                        "PurchReq 2"."Ordered Date" := TODAY;
                        "PurchReq 2".Ordered := TRUE;
                        IF DeleteOnOrder = 1 THEN
                            "PurchReq 2".DELETE
                        ELSE
                            "PurchReq 2".MODIFY;
                    UNTIL "PurchReq 2".NEXT = 0;
            UNTIL PurchReq.NEXT = 0;
    end;


    procedure SwitchOrder()
    begin
        OrderON := STRMENU(text002);
        IF "PurchReq 2".FIND('-') THEN
            REPEAT
                "PurchReq 2"."Ordered Qty" := 0;
                CASE OrderON OF
                    1:
                        "PurchReq 2".VALIDATE("PurchReq 2"."Reorder Quantity", "PurchReq 2"."SOQ (Demand)");
                    2:
                        "PurchReq 2".VALIDATE("PurchReq 2"."Reorder Quantity", "PurchReq 2"."SOQ (Supplied)");
                    3:
                        "PurchReq 2".VALIDATE("PurchReq 2"."Reorder Quantity", "PurchReq 2"."SOQ (Sales)");
                    4:
                        "PurchReq 2".VALIDATE("PurchReq 2"."Reorder Quantity", "PurchReq 2"."SOQ (Lost Sales)");
                END;
                "PurchReq 2"."Order No." := '';
                "PurchReq 2".MODIFY;
            UNTIL "PurchReq 2".NEXT = 0;
    end;
}

