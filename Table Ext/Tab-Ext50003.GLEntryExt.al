tableextension 50003 "G/L Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50202; Department; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50203; "FA No"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Maintenance Ledger Entry"."FA No." WHERE("Document No." = FIELD("Document No.")));

        }
        field(50204; "Responsible Employee"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Fixed Asset"."Responsible Employee" WHERE("No." = FIELD("FA No")));

        }
        field(50205; "Posting Description"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Item Ledger Entry".Description WHERE("Document No." = FIELD("Document No.")));

        }
        field(50206; "Item ledger entry"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Value Entry"."Item Ledger Entry No." WHERE("Document No." = FIELD("Document No.")));

        }
        field(50207; "Procument No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50208; Test; Code[10])
        {
            //FieldClass = FlowField;
            //CalcFormula = Lookup("Payment/Receipt."."Procurement No." WHERE ("No."=FIELD("Document No.")));
        }
    }
    keys
    {
        key(ExtKey1; "Procument No.")
        {

        }
    }
}
