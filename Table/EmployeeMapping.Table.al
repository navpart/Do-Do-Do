table 50124 "Employee Mapping"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                IF EmployeeRec.GET("No.") THEN BEGIN
                    Name := '';
                    Designation := '';
                    Name := EmployeeRec."First Name" + ' ' + EmployeeRec."Middle Name" + ' ' + EmployeeRec."Last Name";
                    Designation := EmployeeRec."Designation(DOS)";
                    "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";
                END;
            end;
        }
        field(2; Name; Text[120])
        {
            Editable = false;
        }
        field(3; "TnA ID"; Integer)
        {
        }
        field(4; Designation; Code[30])
        {
        }
        field(5; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(6; "Mins Worked"; Decimal)
        {
            CalcFormula = Sum("Attendance Register 2"."Mins At Work" WHERE("Employee No." = FIELD("No."),
                                                                            "Date In" = FIELD("Date Filter"),
                                                                            "Attendance Status" = filter('On Duty')));
            FieldClass = FlowField;
        }
        field(7; "Mins Not Worked"; Decimal)
        {
            CalcFormula = Sum("Attendance Register 2"."Minutes Not Worked" WHERE("Employee No." = FIELD("No."),
                                                                                  "Date In" = FIELD("Date Filter"),
                                                                                  "Attendance Status" = filter('On Duty')));
            FieldClass = FlowField;
        }
        field(8; "Global Dimension 1 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Global Dimension 2 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EmployeeRec: Record Employee;
}

