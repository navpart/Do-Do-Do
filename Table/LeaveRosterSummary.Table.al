table 50078 "Leave Roster Summary"
{

    fields
    {
        field(1; "Leave Code"; Option)
        {
            OptionMembers = PLAN,ACTUAL;

            trigger OnValidate()
            begin
                EVALUATE(Description, FORMAT("Leave Code"));
            end;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Unit of Measure"; Code[10])
        {
        }
        field(4; "Total Duration"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Entry Type" = FIELD("Leave Code"),
                                                      "Employee No" = FIELD("Employee No. Filter"),
                                                      "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                      "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                      LeaveDate = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(5; "Business Unit Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit".Code;
        }
        field(6; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(7; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(8; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(9; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Leave Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        LeaveRosRec: Record "Leave Roster";
}

