tableextension 50065 "Stockkeeping Unit Ext" extends "Stockkeeping Unit"
{
    fields
    {
        field(50001; "Stockvalue."; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Item No." = FIELD("Item No."),
                                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                        "Location Code" = FIELD("Location Filter"),
                                                                        "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                        "Variant Code" = FIELD("Variant Code")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Engine Number"; Code[30])
        {
        }
        field(50003; "Chassis Number"; Code[30])
        {
        }
        field(50004; "Key Number"; Code[30])
        {
        }
        field(50005; Colour; Code[30])
        {
            //TableRelation = "Colour Codes"."Colour Code" WHERE (Product Group Code=FIELD(Product Group Code));
        }
        field(50006; "A/C"; Boolean)
        {
        }
        field(50007; "Colour Group"; Option)
        {
            OptionMembers = Colour,Black,Mettallic,Standard,Mica;
        }
        field(50008; Fuel; Option)
        {
            Editable = false;
            OptionMembers = " ",Petrol,Diesel;
        }
        field(50009; "Air Bag"; Boolean)
        {
        }
        field(50010; ABS; Boolean)
        {
        }
        field(50011; "Front Grill"; Boolean)
        {
        }
        field(50012; Seats; Integer)
        {
        }
        field(50013; "Seating Arrangement"; Option)
        {
            OptionMembers = Separate,Bench;
        }
        field(50014; Radio; Boolean)
        {
        }
        field(50015; "Product Group Code"; Code[10])
        {

        }
        field(50016; "Item Category Code"; Code[10])
        {
            TableRelation = "Item Category";
        }
        field(50017; "Order Period Staring Date"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
        }
        field(50018; "Gross Weight"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50019; "Net Weight"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50020; "Unit Volume"; Decimal)
        {
            MinValue = 0;
        }
        field(50021; "PO Number"; Code[20])
        {
        }
        field(50067; "Location Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50068; "Profit %"; Decimal)
        {
            /* CalcFormula = Lookup(Item."Profit %" WHERE (No.=FIELD(Item No.)));
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
            MaxValue = 99.99999; */
        }
        field(50100; CostFactor; Decimal)
        {
            DecimalPlaces = 3 : 3;
            MinValue = 0;
        }
        field(50101; "CostFactor Air"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            MinValue = 0;
        }
        field(50102; "Cost Value Naira"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Location Code" = FIELD("Location Code"),
                                                                        "Item No." = FIELD("Item No."),
                                                                        "Variant Code" = FIELD("Variant Code"),
                                                                        "Posting Date" = FIELD("Date Filter"),
                                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50103; "Indirect Cost %"; Decimal)
        {
        }
        field(50104; Dented; Boolean)
        {

            trigger OnValidate()
            begin

                IF ItemVar.GET("Item No.", "Variant Code") THEN BEGIN
                    ItemVar.Dented := Dented;
                    ItemVar.MODIFY;
                END;
            end;
        }
        field(50105; "Battery Condition"; Boolean)
        {
            InitValue = false;
        }
        field(50106; "Exhibition/Consignment"; Option)
        {
            OptionMembers = " ",Exhibition,Consignment;
        }
        field(50107; Reserved; Boolean)
        {

            trigger OnValidate()
            begin

                IF ItemVar.GET("Item No.", "Variant Code") THEN BEGIN
                    ItemVar.Reserved := Reserved;
                    ItemVar.MODIFY;
                END;
            end;
        }
        field(60000; "Ledger Entries Exit"; Boolean)
        {
            CalcFormula = Exist("Item Ledger Entry" WHERE("Item No." = FIELD("Item No."),
                                                           "Variant Code" = FIELD("Variant Code"),
                                                           "Location Code" = FIELD("Location Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60001; Purchaser; Option)
        {
            Editable = false;
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(60002; Customer; Code[20])
        {
            /*  Editable = false;
             TableRelation = IF (Purchaser = CONST(DLF_A)) "Customer.No." WHERE("Gen. Bus. Posting Group"=CONST(DLF_A))
                             ELSE IF (Purchaser=CONST(DLF_B)) "Customer.No." WHERE ("Gen. Bus. Posting Group"=CONST(TNL_B))
                             ELSE IF (Purchaser=CONST(OTHERS)) "Customer.No." WHERE ("Customer Posting Group"=FILTER(<>STAFF),
                                                                                   "Gen. Bus. Posting Group"=FILTER(<>TNL_A&<>TNL_B))
                                                                                   ELSE IF (Purchaser=CONST(TNL)) "Customer.No." WHERE ("No."=CONST(999999)); */
        }
        field(60003; "Net Inventory"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                  "Location Code" = FIELD("Location Code"),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Code"),
                                                                  "Posting Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(60004; "LC Number"; Code[20])
        {
            /*  CalcFormula = Lookup("Monthly Vehicle Order"."LC Number" WHERE (PO Number=FIELD(PO Number)));
             Editable = false;
             FieldClass = FlowField; */
        }
        field(60005; "Sales Inv No."; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Line"."Document No." WHERE(Type = CONST(Item),
                                                                            "No." = FIELD("Item No."),
                                                                            "Variant Code" = FIELD("Variant Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60006; "Duty Cert No."; Code[20])
        {
        }
        field(60007; "Sold To"; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Line"."Sell-to Customer No." WHERE(Type = CONST(Item),
                                                                                    "No." = FIELD("Item No."),
                                                                                    "Variant Code" = FIELD("Variant Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60008; "Sales Inv. Date"; Date)
        {
            CalcFormula = Lookup("Sales Invoice Line"."Shipment Date" WHERE(Type = CONST(Item),
                                                                             "No." = FIELD("Item No."),
                                                                             "Variant Code" = FIELD("Variant Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(60103; "Average Cost"; Decimal)
        {
        }
        field(60104; "SKU Unit Price"; Decimal)
        {
        }
        field(60105; "Inventory Posting Group"; Code[10])
        {
            TableRelation = "Inventory Posting Group";
        }
    }
    var
        Itemvar: Record "Item Variant";

}

