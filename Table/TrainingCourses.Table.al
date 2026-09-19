table 50082 "Training Courses"
{

    fields
    {
        field(1; "Course Code"; Code[10])
        {
        }
        field(2; "Course Type"; Code[10])
        {
            TableRelation = "Course Types"."Course Type Code";

            trigger OnValidate()
            begin
                IF CTypeRec.GET("Course Type") THEN
                    "Course Name" := CTypeRec.Description
                ELSE
                    "Course Name" := '';
            end;
        }
        field(3; "Course Name"; Text[100])
        {
            Editable = false;
        }
        field(4; "Vendor Code"; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                IF VendRec.GET("Vendor Code") THEN
                    "Vendor name" := VendRec.Name
                ELSE
                    "Vendor name" := '';
            end;
        }
        field(5; "Vendor name"; Text[30])
        {
            Editable = false;
        }
        field(6; Time; Time)
        {
        }
        field(7; "Course Start Date"; Date)
        {
        }
        field(8; "Course Duration"; Code[10])
        {
            DateFormula = true;
        }
        field(9; "Total Cost"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CattRec.SETRANGE(CattRec."Training Course Code", "Course Code");
                CCount := CattRec.COUNT;
                IF (CCount <> 0) THEN CattRec.MODIFYALL(CattRec.Cost, "Total Cost" / CCount);
            end;
        }
        field(10; "Unit Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Average("Course Attendance".Cost WHERE("Training Course Code" = FIELD("Course Code")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                VALIDATE("Total Vendor Cost", "Unit Cost");
            end;
        }
        field(11; Comment; Text[250])
        {
        }
        field(12; "No Series"; Code[10])
        {
        }
        field(13; "Business Unit"; Code[10])
        {
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(16; "Total Vendor Cost"; Decimal)
        {
            FieldClass = Normal;
        }
        field(17; "Class Size"; Integer)
        {
            CalcFormula = Count("Course Attendance" WHERE("Training Course Code" = FIELD("Course Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Course Description"; Text[100])
        {
        }
        field(19; "Training Group"; Option)
        {
            OptionMembers = " ",Mixed,Outdoor,"In-House";
        }
    }

    keys
    {
        key(Key1; "Course Code")
        {
            Clustered = true;
            SumIndexFields = "Total Vendor Cost", "Total Cost";
        }
        key(Key2; "Vendor Code")
        {
            SumIndexFields = "Total Cost";
        }
        key(Key3; "Training Group", "Course Code")
        {
            SumIndexFields = "Total Vendor Cost", "Total Cost";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        LOCKTABLE;
        CattRec.SETRANGE("Training Course Code", "Course Code");
        CattRec.DELETEALL;
    end;

    trigger OnInsert()
    begin

        IF "Course Code" = '' THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Course Attendance No");

            "No Series" := HumanResSetup."Course Attendance No";
            if NoSeriesMgt.AreRelated("No Series", xRec."No Series") then
                "No Series" := xRec."No Series";
            "Course Code" := NoSeriesMgt.GetNextNo("No Series");

        END;

        //"Course Start Date" := TODAY;
    end;

    var
        TCourseRec: Record 50082;
        HumanResSetup: Record 5218;
        NoSeriesMgt: Codeunit "No. Series";
        VendRec: Record 23;
        CattRec: Record 50083;
        CTypeRec: Record 50081;
        CCount: Integer;
        DimMgt: Codeunit 408;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Training Courses", "Course Code", FieldNo, ShortcutDimCode);
        MODIFY;
    end;


    procedure AssistEdit(OldTrain: Record 50082): Boolean
    begin
        TCourseRec := Rec;
        HumanResSetup.GET;
        HumanResSetup.TESTFIELD("Course Attendance No");
        "No Series" := HumanResSetup."Course Attendance No";
        if NoSeriesMgt.AreRelated("No Series", xRec."No Series") then
            "No Series" := xRec."No Series";
        "Course Code" := NoSeriesMgt.GetNextNo("No Series");
        EXIT(TRUE);

    end;
}

