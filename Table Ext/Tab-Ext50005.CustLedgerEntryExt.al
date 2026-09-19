tableextension 50005 "Cust. Ledger Entry Ext." extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Loan ID"; Code[10])
        {
        }
        field(50002; "Loan Type"; Code[10])
        {
        }
        field(50003; "More Description"; Text[50])
        {
            //FieldClass = FlowField;
            //CalcFormula = Lookup("Fuel Vouchers.".Description WHERE ("Voucher No."=FIELD("Document No.")));

        }
        field(50004; "Application No"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Detailed Cust. Ledg. Entry"."Document No." WHERE("Cust. Ledger Entry No." = FIELD("Entry No."),
                                                                                    "Document Type" = CONST(" ")));

        }
        field(50005; "Bank No"; Code[20])
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Bank Account No." WHERE("Document No." = FIELD("Application No")));
            FieldClass = FlowField;
        }
        field(50006; "Bank Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Bank Account".Name WHERE("No." = FIELD("Bank No")));

        }
        field(50007; "Amount Paid"; Decimal)
        {
            CalcFormula = Sum("Bank Account Ledger Entry".Amount WHERE("Document No." = FIELD("Application No")));
            FieldClass = FlowField;
        }
        field(50008; "Posting Group"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Line"."Posting Group" WHERE("Document No." = FIELD("Document No.")));
        }
        field(60109; "Serial No"; Code[20])
        {
        }
        field(60110; "Applied Doc. No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Cust. Ledger Entry"."Document No." WHERE("Closed by Entry No." = FIELD("Entry No.")));

        }
        field(60111; "Payment Doc. No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Cust. Ledger Entry"."Document No." WHERE("Entry No." = FIELD("Closed by Entry No.")));

        }
        field(60112; "Payment Doc. Amt."; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Bank Account Ledger Entry".Amount WHERE("Document No." = FIELD("Payment Doc. No.")));

        }
    }
}
