table 50062 "Casual Employees"
{

    fields
    {
        field(1; "No."; Code[10])
        {

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    HumanResSetup.GET;
                    NoSeriesMgt.TestManual(HumanResSetup."Casual Employees No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Address; Text[250])
        {
        }
        field(3; Sex; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(4; "Date of Birth"; Date)
        {
        }
        field(5; "Job Code"; Code[10])
        {
            TableRelation = "Employment Contract".Code;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(7; "Date Employed"; Date)
        {
        }
        field(8; "Leaving Date"; Date)
        {
        }
        field(9; "Employee No Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Casual Employees"."No.";
        }
        field(11; "Job Code Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Warranty Coupon".VIN;
        }
        field(12; "Global Dimension 2 Filter"; Code[10])
        {

        }
        field(13; "Date Employed Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(14; "Leaving Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Employee Count"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Casual Employees" WHERE("No." = FIELD("Employee No Filter"),
                                                          "Job Code" = FIELD("Job Code Filter"),
                                                          "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                          "Date Employed" = FIELD("Date Employed Filter"),
                                                          "Leaving Date" = FIELD("Leaving Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Employee name"; Text[60])
        {
        }
        field(17; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(20; "Business Unit"; Code[10])
        {
            TableRelation = "Business Unit".Code;
        }
        field(21; Blocked; Boolean)
        {
        }
        field(31; Status; Option)
        {
            OptionMembers = Active,Inactive,Terminated;
        }
        field(32; "Inactive Date"; Date)
        {
        }
        field(33; "Cause of Inactivity Code"; Code[10])
        {
            TableRelation = "Cause of Inactivity";
        }
        field(34; "Disengagement Date"; Date)
        {
        }
        field(35; "Disengagement Grounds"; Code[10])
        {
            TableRelation = "Grounds for Termination";
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(41; Guarrantor; Text[60])
        {
        }
        field(42; "Guarrantor Address"; Text[100])
        {
        }
        field(43; Class; Code[10])
        {
            TableRelation = "Employment Contract".Code;
        }
        field(44; Qualification; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Global Dimension 2 Code", "Job Code", "Date of Birth", "Leaving Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Casual Employees No.");
            "No. Series" := HumanResSetup."Casual Employees No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := TODAY;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        CCRec: Record "Dimension Value";
        BCRec: Record "Dimension Value";
        Cemployee: Record "Casual Employees";
        DimMgt: Codeunit DimensionManagement;


    procedure AssistEdit(OldEmployee: Record "Casual Employees"): Boolean
    begin
        /*  WITH Cemployee DO BEGIN
             Cemployee := Rec;
             HumanResSetup.GET;
             HumanResSetup.TESTFIELD("Casual Employees No.");
             IF NoSeriesMgt.SelectSeries(HumanResSetup."Casual Employees No.", OldEmployee."No. Series", "No. Series") THEN BEGIN
                 HumanResSetup.GET;
                 HumanResSetup.TESTFIELD("Casual Employees No.");
                 NoSeriesMgt.SetSeries("No.");
                 Rec := Cemployee;
                 EXIT(TRUE);
             END;
         END; */
    end;

    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Casual Employees", "No.", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

