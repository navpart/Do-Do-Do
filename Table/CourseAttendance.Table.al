table 50083 "Course Attendance"
{

    fields
    {
        field(1; "Rec No."; Integer)
        {
        }
        field(2; "Training Course Code"; Code[10])
        {
            TableRelation = "Training Courses"."Course Code";

            trigger OnValidate()
            begin
                IF TCourseRec.GET("Training Course Code") THEN BEGIN
                    //"Training Group" := TCourseRec."Training Group";
                    "Course name" := TCourseRec."Course Name";
                    //"Start Date" := TCourseRec."Course Start Date";
                END;
            end;
        }
        field(3; "Course name"; Text[30])
        {
            Editable = false;
        }
        field(4; "Employee No"; Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                EmploRec.GET("Employee No");
                "Employee Name" := EmploRec.FullName;
                "Business Unit" := EmploRec."Business Unit";
                "Global Dimension 1 Code" := EmploRec."Global Dimension 1 Code";
                "Global Dimension 2 Code" := EmploRec."Global Dimension 2 Code";
            end;
        }
        field(5; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(6; "Business Unit"; Code[10])
        {
            Editable = false;
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(9; "Start Date"; Date)
        {
            Editable = false;
        }
        field(10; Cost; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(11; Comments; Text[100])
        {
        }
        field(12; "Course Line No."; Integer)
        {
            Editable = false;
        }
        field(13; "Training Group"; Option)
        {
            OptionMembers = " ",Mixed,Outdoor,"In-House";
        }
    }

    keys
    {
        key(Key1; "Training Course Code", "Employee No")
        {
            Clustered = true;
            SumIndexFields = Cost;
        }
        key(Key2; "Training Group", "Training Course Code", "Course Line No.")
        {
            SumIndexFields = Cost;
        }
        key(Key3; "Employee No", "Training Course Code")
        {
            SumIndexFields = Cost;
        }
        key(Key4; "Training Course Code", "Course Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CalcAvgCost(-1);
    end;

    trigger OnInsert()
    begin

        IF CAtRec.FIND('+') THEN
            "Rec No." := CAtRec."Rec No." + 1
        ELSE
            "Rec No." := 1;

        CAtRec.RESET;
        CAtRec.SETCURRENTKEY("Training Group", "Training Course Code", "Course Line No.");
        CAtRec.SETRANGE("Training Course Code", "Training Course Code");

        IF CAtRec.FIND('+') THEN
            "Course Line No." := CAtRec."Course Line No." + 10
        ELSE
            "Course Line No." := 10;

        CalcAvgCost(1);
    end;

    var
        CAtRec: Record "Course Attendance";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        TCourseRec: Record "Training Courses";
        EmploRec: Record Employee;
        TotalCost: Decimal;
        AvgCost: Decimal;
        RecCount: Integer;
        DimMgt: Codeunit DimensionManagement;

    procedure CalcAvgCost(Normalizer: Integer)
    begin
        TCourseRec.GET("Training Course Code");

        CAtRec.SETCURRENTKEY("Training Course Code");
        CAtRec.SETRANGE("Training Course Code", "Training Course Code");
        RecCount := CAtRec.COUNT + Normalizer;
        //TotalCost := TCourseRec."Total Cost";
        IF RecCount <> 0 THEN BEGIN
            AvgCost := TotalCost / RecCount;
            CAtRec.MODIFYALL(CAtRec.Cost, AvgCost);

            IF Normalizer = 1 THEN
                VALIDATE(Cost, AvgCost);
        END;
    end;

    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Course Attendance", FORMAT("Rec No."), FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

