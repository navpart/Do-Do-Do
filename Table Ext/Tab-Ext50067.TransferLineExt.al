tableextension 50067 "Transfer Line Ext" extends "Transfer Line"
{
    fields
    {
        field(50000;"Unit Cost";Decimal)
        {
            CalcFormula = Lookup(Item."Unit Cost" WHERE ("No."=FIELD("Item No.")));
            FieldClass = FlowField;
        }
    }
}
