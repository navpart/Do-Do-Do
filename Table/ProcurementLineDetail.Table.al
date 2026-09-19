table 70007 "Procurement Line Detail"
{
    DrillDownPageID = "Procurement Details";
    LookupPageID = "Procurement Details";

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Capex,Opex,Sundry Asset,Opex Payment,LPO';
            OptionMembers = Capex,Opex,"Sundry Asset","Opex Payment",LPO;
        }
        field(2; "Document No."; Code[10])
        {
        }
        field(3; "Capex Line No."; Integer)
        {
        }
        field(4; "Line No."; Integer)
        {
        }
        field(5; "S/N"; Integer)
        {
        }
        field(6; Description; Text[70])
        {
        }
        field(7; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(8; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(9; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Unit Cost" := Amount / Quantity;
            end;
        }
        
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Capex Line No.", "Line No.", "S/N")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

