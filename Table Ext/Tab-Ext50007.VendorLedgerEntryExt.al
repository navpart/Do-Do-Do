tableextension 50007 "Vendor Ledger Entry Ext" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50001; "Loan ID"; Code[10])
        {
            TableRelation = "Vendor Ledger Entry";
        }
        field(50002; "Loan Type"; Code[10])
        {
        }
        field(50003; "Exchange Rate"; Decimal)
        {
            //CalcFormula = Lookup("Detailed Vendor Ledg. Entry".Rate WHERE("Document No."=FIELD("Document No.")));
            //FieldClass = FlowField;
        }
    }
}
