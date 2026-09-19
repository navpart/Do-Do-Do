tableextension 50073 "Value Entry Ext" extends "Value Entry"
{
    fields
    {
       field(50000;"Serial No.";Code[20])
        {
        }
        field(50001;"Analysis S/N";Code[20])
        {
        }
        field(50002;Extract;Boolean)
        {
            CalcFormula = Lookup("Item Ledger Entry".Extract WHERE ("Entry No."=FIELD("Item Ledger Entry No.")));
            FieldClass = FlowField;
        }
        field(50004;"Receipt ID";Code[35])
        {
            CalcFormula = Lookup("Item Ledger Entry"."External Document No." WHERE ("Entry No."=FIELD("Item Ledger Entry No.")));
            FieldClass = FlowField;
        }
        field(50005;"ILE exist";Boolean)
        {
        }
        field(50006;"Model No";Code[50])
        {
            CalcFormula = Lookup(Item."Model No." WHERE ("No."=FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(50007;"Model Name";Text[50])
        {
            CalcFormula = Lookup(Item."Model Name" WHERE ("No."=FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(50008;"Customer No";Code[20])
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Customer No." WHERE ("Document No."=FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50010;Chassis;Code[50])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Serial No." WHERE ("Entry No."=FIELD("Item Ledger Entry No.")));
            FieldClass = FlowField;
        }
        field(50011;"Product Group Code";Code[10])
        {
           
        }
        field(50012;Pick;Boolean)
        {
        }
        field(50013;"Exchange Rate";Decimal)
        {
            CalcFormula = Lookup("Detailed Vendor Ledg. Entry".Rate WHERE ("Document No."=FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50014;"Product Grp Code";Code[20])
        {
            CalcFormula = Lookup(Item."Item No Category" WHERE ("No."=FIELD("Item No.")));
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(ExtKey1; "Posting Date")
        {
            
        }
        key(ExtKey2; "Serial No.")
        {
            
        }
    }
}
