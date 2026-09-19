tableextension 50062 "FA Ledger Entry Ext" extends "FA Ledger Entry"
{
    fields
    {
        field(50001; "Reg. No."; Code[20])
        {
            CalcFormula = Lookup("Fixed Asset"."Registration No." WHERE("No." = FIELD("FA No.")));
            FieldClass = FlowField;
        }
        field(50002; "Procurement No."; Code[20])
        {
            /*   CalcFormula = Lookup("Payment/Receipt."."Procurement No." WHERE ("No."=FIELD("Document No.")));
              FieldClass = FlowField; */
        }
    }
}
