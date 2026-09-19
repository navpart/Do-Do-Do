tableextension 50074 "Item Charge Ass. (Purch) Ext" extends "Item Charge Assignment (Purch)"
{
    fields
    {
        field(50000; "Gross Weight"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Purchase Line"."Gross Weight" WHERE("Document Type" = FIELD("Applies-to Doc. Type"),
                                                                    "Document No." = FIELD("Applies-to Doc. No."),
                                                                    "Line No." = FIELD("Applies-to Doc. Line No.")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Net Weight"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Purchase Line"."Net Weight" WHERE("Document Type" = FIELD("Applies-to Doc. Type"),
                                                                  "Document No." = FIELD("Applies-to Doc. No."),
                                                                  "Line No." = FIELD("Applies-to Doc. Line No.")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50210; "Duty Code"; Code[10])
        {

            trigger OnValidate()
            begin
                VALIDATE("Item No.");
            end;
        }
        field(50211; "Serial No."; Code[50])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Serial No." WHERE("Document No." = FIELD("Applies-to Doc. No."),
                                                                         "Document Line No." = FIELD("Applies-to Doc. Line No."),
                                                                         "Item No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(ExtKey1; "Applies-to Doc. Type", "Applies-to Doc. No.")
        {
        }
    }
}
