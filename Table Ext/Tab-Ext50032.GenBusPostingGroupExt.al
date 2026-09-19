tableextension 50032 "Gen. Bus. Posting Group Ext" extends "Gen. Business Posting Group"
{
    fields
    {
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
            BlankZero = true;
            CalcFormula = - Sum("Item Ledger Entry"."Invoiced Quantity" WHERE("Entry Type" = CONST(Sale),
                                                                              "Gen. Bus. Posting Group" = FIELD(Code),
                                                                              "Posting Date" = FIELD("Date Filter")));
                                            
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Sales (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Editable = false;
        }
        field(50006; "COGS (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Editable = false;
            
        }
        field(50007; "Bin Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Bin.Code WHERE("Location Code"=FIELD("Location Filter"));
        }
        field(50008;"Variant Filter";Code[10])
        {
            
        }
        field(50009;"Item No. Filter";Code[250])
        {
           
        }
        field(50010;"Product Group Filter";Code[250])
        {
            
        }
        field(50011;"Item Category Filter";Code[250])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Category".Code;
            ValidateTableRelation = false;
        }
        field(50012;"Inventory Posting Grp Filter";Code[250])
        {
            FieldClass = FlowFilter;
            TableRelation = "Inventory Posting Group".Code;
            ValidateTableRelation = false;
        }
        field(50200;"Show on Sales Report";Boolean)
        {
        }
    }
    
}
