namespace AL_TNL.AL_TNL;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Inventory.Ledger;

tableextension 50100 "Inventory Posting Group Ext" extends "Inventory Posting Group"
{
    fields
    {
        field(50000; "Inventory Value"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Inventory Posting Group" = FIELD(Code),
                                                                        "Posting Date" = FIELD("Date Filter"),
                                                                        "Location Code" = FIELD("Location Filter"),
                                                                        "Variant Code" = FIELD("Variant Filter"),
                                                                        "Item No." = FIELD("Item Filter"),
                                                                        "Item Ledger Entry Type" = FIELD("Item Ledg. Entry Type Filter"),
                                                                        "Expected Cost" = CONST(false)));
            Description = 'santus';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Date Filter"; Date)
        {
            Description = 'santus';
            FieldClass = FlowFilter;
        }
        field(50002; "Location Filter"; Code[10])
        {
            Description = 'santus';
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(50003; "Show In Inventory Summary"; Boolean)
        {
            Description = 'santus';
        }
        field(50004; Quantity; Decimal)
        {

            Description = 'santus';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Value Entry"."Invoiced Quantity" WHERE("Inventory Posting Group" = FIELD(Code),
                                                                       "Posting Date" = FIELD("Date Filter"),
                                                                       "Location Code" = FIELD("Location Filter"),
                                                                       "Variant Code" = FIELD("Variant Filter"),
                                                                       "Item No." = FIELD("Item Filter"),
                                                                       "Item Ledger Entry Type" = FIELD("Item Ledg. Entry Type Filter"),
                                                                       "Expected Cost" = CONST(false)));
        }
        field(50005; "Item Ledg. Entry Type Filter"; Enum "Item Ledger Entry Type")
        {
            Description = 'santus';
            FieldClass = FlowFilter;

        }
        field(50006; "Item Filter"; Code[20])
        {
            Description = 'santus';
            FieldClass = FlowFilter;
            TableRelation = Item."No.";
        }
        field(50007; "Variant Filter"; Code[10])
        {
            Description = 'santus';
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item Filter"));
        }
        field(50151; "Goods in transit"; Code[20])
        {
        }
        field(50152; Text; Text[50])
        {
        }
        field(50153; "xProd.Discount.Acc."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50154; "Phase out Transaction"; Integer)
        {
        }
        field(50155; "Phase in  Period"; DateFormula)
        {
        }
        field(50156; "Phase out  Period"; DateFormula)
        {
        }
        field(50157; "Slow Moving Period"; DateFormula)
        {
        }
        field(50159; "Ordering Paramenter"; Decimal)
        {
        }
        field(50160; "Maximum Stock Period"; Decimal)
        {
        }
        field(50161; "Lead Time"; Decimal)
        {
        }
        field(50162; "Period Unit"; Option)
        {
            OptionCaption = 'Days,Weeks,Months,Years';
            OptionMembers = D,W,M,Y;
        }
        field(50163; "Stock in Transaction"; Integer)
        {
        }
        field(50164; "Order Cycle"; Decimal)
        {
        }
        field(50165; "Safety Stock of Lead Time"; Decimal)
        {
        }
        field(50166; "Obsolete Period"; DateFormula)
        {
        }
    }
}
