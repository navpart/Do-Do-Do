table 50542 "Fixed Assets Cue"
{
    Caption = 'Fixed Assets Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "FA Depreciation Book"; Integer)
        {
            CalcFormula = Count("FA Depreciation Book" WHERE("Depreciation Method" = FILTER('Straight-Line' | 'Declining-Balance 1' |
            'Declining-Balance 2' | 'DB1/SL' | 'DB2/SL' | 'User-Defined' | 'Manual')));
            FieldClass = FlowField;
        }
        field(3; "Insured  -Fixed Assets"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE(Insured = filter(true)));
            FieldClass = FlowField;
        }
        field(4; "Uninsured  -Fixed Assets"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE(Insured = filter(true)));
            FieldClass = FlowField;
        }
        field(5; "Upcoming Maintenance"; Integer)
        {
            /* CalcFormula = Count("Fixed Asset" WHERE("Under Maintenance" = filter(true),
                                                     "Next Service Date" = FIELD("Date Filter")));
            FieldClass = FlowField; */
        }
        field(6; "Inactive Fixed Assets"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE(Inactive = filter(true)));
            FieldClass = FlowField;
        }
        field(7; "Budgeted Assets"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE("Budgeted Asset" = FILTER(true)));
            FieldClass = FlowField;
        }
        field(8; "Under Maintenance"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE("Under Maintenance" = filter(true)));
            FieldClass = FlowField;
        }
        field(9; "Disposed -Fixed Assets"; Integer)
        {
            FieldClass = Normal;
        }
        field(10; "Active Fixed Assets"; Integer)
        {
            CalcFormula = Count("Fixed Asset" WHERE(Inactive = filter(false),
                                                     Blocked = filter(false)));
            FieldClass = FlowField;
        }
        field(11; "Fixed Assets -Due for Disposal"; Integer)
        {
            CalcFormula = Count("FA Depreciation Book" WHERE("Last Salvage Value Date" = FIELD("Date Filter"),
                                                              "Disposal Date" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(12; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

