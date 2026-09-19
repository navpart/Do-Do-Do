table 50069 "MP Budget Entry"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Budget Name"; Code[10])
        {
            TableRelation = "MP Budget Name";
        }
        field(3; "Employee Grp"; Code[20])
        {
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(4; Date; Date)
        {
            ClosingDates = true;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                //MODIFY;
            end;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                //MODIFY;
            end;
        }
        field(7; "Employee Count"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            DecimalPlaces = 0 : 0;
        }
        field(9; Description; Text[50])
        {
        }
        field(10; "Business Unit Code"; Code[10])
        {
            TableRelation = "Business Unit";
        }
        field(11; "User ID"; Code[20])
        {
            Editable = false;

        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Budget Name", "Employee Grp", Date)
        {
            SumIndexFields = "Employee Count";
        }
        key(Key3; "Budget Name", "Employee Grp", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", Date)
        {
            SumIndexFields = "Employee Count";
        }
        key(Key4; "Employee Grp", Date)
        {
            SumIndexFields = "Employee Count";
        }
        key(Key5; "Employee Grp", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", Date)
        {
            SumIndexFields = "Employee Count";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        TESTFIELD(Date);
        TESTFIELD("Budget Name");
        "User ID" := USERID;
    end;

    var
        DimMgt: Codeunit DimensionManagement;

    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"MP Budget Entry", FORMAT("Entry No."), FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

