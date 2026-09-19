tableextension 50046 "Detailed Cust. Ledg. Entry Ext" extends "Detailed Cust. Ledg. Entry"
{
    fields
    {
        field(50002; "Loan ID"; Code[10])
        {
        }
        field(50003; "Loan Type"; Code[20])
        {
        }
        field(50004; "Interest Element"; Boolean)
        {
        }
        field(50005; Posting; Date)
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Cust. Ledger Entry No.")));
            FieldClass = FlowField;
        }
    }
    
}
