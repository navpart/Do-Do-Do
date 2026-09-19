table 50077 "Leave Roster"
{

    fields
    {
        field(1; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(2; "Entry Type"; Option)
        {
            OptionMembers = PLAN,ACTUAL;
        }
        field(3; "Leave Category"; Code[30])
        {
            TableRelation = "Leave Categories".Code;
        }
        field(4; "Entry no"; Integer)
        {
        }
        field(5; LeaveDate; Date)
        {
        }
        field(6; LeavePlanNo; Code[10])
        {
        }
        field(7; Duration; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(8; "Business Unit Code"; Code[10])
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(11; "Entry Type Filter"; Code[30])
        {
            Description = 'DELETE';
            FieldClass = FlowFilter;
        }
        field(12; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(13; "Total Leaves Due"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee Filter"),
                                                      "Entry Type" = filter('PLAN'),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Business Unit Code" = FIELD("Business Unit Filter"),
                                                      "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                      "Global Dimension 1 Code" = FIELD("Global Dimension 2 Filter")));
            FieldClass = FlowField;
        }
        field(16; "Total Leaves Taken"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee Filter"),
                                                      "Entry Type" = filter('ACTUAL'),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Business Unit Code" = FIELD("Business Unit Filter"),
                                                      "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                      "Global Dimension 1 Code" = FIELD("Global Dimension 2 Filter")));
            FieldClass = FlowField;
        }
        field(17; "Employee Filter"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(18; "Category Filter"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Leave Categories";
        }
        field(19; "Business Unit Filter"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(20; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(21; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; Consuming; Boolean)
        {
            Editable = false;
        }
        field(23; "Consuming Filter"; Boolean)
        {
            FieldClass = FlowFilter;
            TableRelation = "Leave Categories";
        }
        field(24; "Entry filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",PLAN,ACTUAL;
        }
        field(25; "Leave Period"; Integer)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry no", Duration)
        {
            Clustered = true;
        }
        key(Key2; "Employee No", "Entry Type", "Leave Category", LeaveDate)
        {
            SumIndexFields = Duration;
        }
        key(Key3; "Entry Type", "Employee No", "Leave Category", LeaveDate)
        {
            SumIndexFields = Duration;
        }
        key(Key4; "Entry Type", "Business Unit Code")
        {
            SumIndexFields = Duration;
        }
        key(Key5; "Employee No", "Entry Type", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            SumIndexFields = Duration;
        }
        key(Key6; "Entry Type", LeaveDate)
        {
            SumIndexFields = Duration;
        }
        key(Key7; LeaveDate)
        {
        }
        key(Key8; "Employee No", LeaveDate)
        {
            SumIndexFields = Duration;
        }
        key(Key9; "Employee No", "Entry Type", "Leave Category", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", LeaveDate, Consuming)
        {
            SumIndexFields = Duration;
        }
        key(Key10; "Employee No", Consuming, "Leave Category")
        {
            SumIndexFields = Duration;
        }
        key(Key11; "Leave Period", "Employee No", "Leave Category")
        {
            SumIndexFields = Duration;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        CurrFieldNo := 1;

        IF LeaveRosRec.FIND('+') THEN
            "Entry no" := LeaveRosRec."Entry no" + 1
        ELSE
            "Entry no" := 1;
    end;

    var
        LeaveRosRec: Record "Leave Roster";
        LCatRec: Record "Leave Categories";
        DateRec: Record Date;
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Leave Roster", "Employee No", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

