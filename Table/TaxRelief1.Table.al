table 50096 "Tax Relief1"
{

    fields
    {
        field(1; "Relief Code"; Code[10])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Related E/D"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Excess of"; Decimal)
        {
        }
        field(7; Rate; Decimal)
        {
        }
        field(8; "Base Line"; Code[10])
        {
            TableRelation = "Tax Relief1"."Relief Code";
        }
        field(9; "+ value"; Decimal)
        {
        }
        field(10; Factor; Decimal)
        {

            trigger OnValidate()
            begin
                IF Factor <> 0 THEN
                    "Relief Amount" := (Factor * Amount) + "+ value";
            end;
        }
        field(11; "Relief Amount"; Decimal)
        {
        }
        field(12; "Base (Max/Actual)"; Option)
        {
            OptionMembers = " ","Maximum(Factor)","Staff Actual(Coy Rec)  ";
        }
        field(13; "Relief Base"; Option)
        {
            OptionMembers = " ",Children,Dependant;
        }
        field(14; Considered; Boolean)
        {
        }
        field(15; "Added to"; Code[10])
        {
            TableRelation = "Tax Relief1"."Relief Code";
        }
        field(16; "Cummulative Relief"; Decimal)
        {
            CalcFormula = Sum("Tax Relief1"."Relief Amount" WHERE(Considered = filter(true)));
            FieldClass = FlowField;
        }
        field(17; "Sum Total Relief"; Decimal)
        {
            CalcFormula = Sum("Tax Relief1"."Relief Amount" WHERE("Added to" = FIELD("Relief Code")));
            FieldClass = FlowField;
        }
        field(18; "Deduct TaxFree/Before calc"; Boolean)
        {
        }
        field(19; "Maximum Relief"; Decimal)
        {
        }
        field(20; Minimum; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Relief Code")
        {
            Clustered = true;
        }
        key(Key2; Considered)
        {
            SumIndexFields = "Relief Amount";
        }
        key(Key3; "Added to")
        {
            SumIndexFields = "Relief Amount";
        }
    }

    fieldgroups
    {
    }
}

