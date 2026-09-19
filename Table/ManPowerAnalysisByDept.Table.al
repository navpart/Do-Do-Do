table 50084 "ManPower Analysis By Dept"
{

    fields
    {
        field(1; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                //MODIFY;
            end;
        }
        field(2; "Total Employees"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count(Employee WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Code")));
            FieldClass = FlowField;
        }
        field(3; "Total Budget"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("MP Budget Entry"."Employee Count" WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                        "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                        Date = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(4; "Business Unit Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit".Code;
        }
        field(5; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(6; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(7; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Global Dimension 1 Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        LeaveRosRec: Record "Leave Roster";
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Dept Leave Roster Summary", "Global Dimension 1 Code", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

