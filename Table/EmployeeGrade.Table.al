table 50021 "Employee Grade"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Periods.";
        }
        field(4; EDAmount; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                     Grade = FIELD(Code),
                                                                     "E/D Code" = FIELD("ED Filter"),
                                                                     "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                     "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                     "Posting Group" = FIELD("Posting Group Filter")));
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(5; "ED Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-E/D Codes.";
        }
        field(6; EmployeeCount; Integer)
        {
            CalcFormula = Count("Payroll-Payslip Header." WHERE(Grade = FIELD(Code),
                                                                 "Payroll Period" = FIELD("Period Filter"),
                                                                 "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                 "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                 "Posting Group" = FIELD("Posting Group Filter")));
            FieldClass = FlowField;
        }
        field(7; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(8; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(9; "Posting Group Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Posting Group Header.";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

