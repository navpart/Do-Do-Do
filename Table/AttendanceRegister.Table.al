table 50148 "Attendance Register"
{
    DataCaptionFields = "Employee No.", Date;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No." WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin
                employeerec.GET("Employee No.");
                "Employee Name" := employeerec.FullName;
                "Cost Centre Code" := employeerec."Global Dimension 1 Code";
                "Department Code" := employeerec."Global Dimension 2 Code";
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Time In"; Time)
        {
        }
        field(4; Status; Option)
        {
            OptionCaption = 'Present,Late,Absent,Annual Leave,Casual Leave,Maternity Leave,Outstation,On Course';
            OptionMembers = Present,Late,Absent,"Annual Leave","Casual Leave","Maternity Leave",Outstation,"On Course";
        }
        field(5; Penalised; Boolean)
        {
        }
        field(6; "Attendance Period"; Code[20])
        {
        }
        field(7; "Penalised Period"; Code[20])
        {
        }
        field(8; "Employee Name"; Text[50])
        {
        }
        field(9; Remark; Text[100])
        {
        }
        field(10; "Reason for Absence"; Code[20])
        {
            TableRelation = "Cause of Absence".Code;
        }
        field(11; "Attendance Filter"; Code[20])
        {
        }
        field(12; "Attendance in Period"; Integer)
        {
            CalcFormula = Count("Attendance Register" WHERE("Employee No." = FIELD("Employee No."),
                                                             "Attendance Period" = FIELD("Attendance Period"),
                                                             Penalised = CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; Barcode; Code[20])
        {
        }
        field(14; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Absent in Period"; Integer)
        {
            CalcFormula = Count("Attendance Register" WHERE("Employee No." = FIELD("Employee No."),
                                                             "Attendance Period" = FIELD("Attendance Period"),
                                                             Status = CONST(Absent)));
            FieldClass = FlowField;
        }
        field(16; "Cost Centre Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(17; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(18; "Time Out"; Time)
        {
        }
    }

    keys
    {
        key(Key1; Date, "Employee No.", "Attendance Period")
        {
            Clustered = true;
        }
        key(Key2; "Attendance Period", Date)
        {
        }
    }

    fieldgroups
    {
    }

    var
        employeerec: Record Employee;
        Genset: Record "General Ledger Setup";
        RepRec: Record "G/L Entry";
}

