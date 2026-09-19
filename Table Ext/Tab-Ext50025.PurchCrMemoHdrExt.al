tableextension 50025 "Purch. Cr. Memo Hdr. Ext" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50042; "xVAT Liable?"; Boolean)
        {
            BlankZero = true;
        }
        field(50157; "Address 3"; Text[30])
        {
        }
        field(50158; "P.O.Box"; Text[30])
        {
        }
        field(50159; "Del.Add. 3"; Text[30])
        {
        }
        field(50160; "Del.P.O.Box"; Text[30])
        {
        }
        field(50200; "Total Cost(LCY)"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = Normal;
        }
        field(50201; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(50202; "Total Item Qty"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Purch. Cr. Memo Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                     Type = CONST(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
