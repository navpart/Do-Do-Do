tableextension 50069 "Transfer Shipment Line Ext" extends "Transfer Shipment Line"
{
    fields
    {
        field(50000; "Unit Cost"; Decimal)
        {
            CalcFormula = Lookup(Item."Unit Cost" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(50001; "Unit Price"; Decimal)
        {
            CalcFormula = Lookup(Item."Unit Price" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(NewKey; "Transfer-to Code", "Transfer-from Code")
        {

        }
    }
}
