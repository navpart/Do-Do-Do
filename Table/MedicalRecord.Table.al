table 50092 "Medical Record"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            Editable = false;
        }
        field(2; "Employee No"; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                IF EmpRec.GET("Employee No") THEN BEGIN
                    "Business Unit" := EmpRec."Business Unit";
                    "Global Dimension 1 Code" := EmpRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := EmpRec."Global Dimension 2 Code"
                END;
            end;
        }
        field(3; "Transaction Date"; Date)
        {
        }
        field(4; "Transaction Type"; Option)
        {
            OptionMembers = " ",C,R,H;

            trigger OnValidate()
            begin
                IF "Transaction Type" = "Transaction Type"::C THEN
                    "Transaction Description" := 'Clinic Treatment or Drugs'
                ELSE
                    IF "Transaction Type" = "Transaction Type"::R THEN
                        "Transaction Description" := 'Reimbursed Drugs'
                    ELSE
                        IF "Transaction Type" = "Transaction Type"::H THEN
                            "Transaction Description" := 'Hospital Treatment'
                        ELSE
                            "Transaction Description" := '';
            end;
        }
        field(5; "Hospital Code"; Code[10])
        {
            TableRelation = IF ("Transaction Type" = filter('H')) Vendor."No." WHERE(Hospital = filter(true));
        }
        field(6; Beneficiary; Option)
        {
            OptionMembers = " ",Dependent,Self;
        }
        field(7; "Ref No."; Code[10])
        {
        }
        field(8; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Transaction Date");
            end;
        }
        field(9; "Business Unit"; Code[10])
        {
            Editable = false;
            TableRelation = "Business Unit".Code;
        }
        field(10; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(11; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(12; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Date."Period No." WHERE("Period Type" = CONST(Date));
        }
        field(13; "Treatment Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE("Business Unit" = FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                             "Employee No" = FIELD("Employee Filter"),
                                                             Beneficiary = FIELD("Beneficiary Filter"),
                                                             "Transaction Type" = FIELD("Transaction  Filter"),
                                                             "Transaction Date" = FIELD("Date Filter"),
                                                             "Hospital Code" = FIELD("Hospital Filter")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(14; "Employee Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(15; "Beneficiary Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",Dependent,Self;
        }
        field(16; "Transaction  Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",C,R,H;
        }
        field(17; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(18; "Business Unit Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit".Code;
        }
        field(19; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(20; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(21; "Clinic Cost"; Decimal)
        {
            /*  BlankZero = true;
             CalcFormula = Sum("Medical Record".Amount WHERE("Business Unit" = FIELD("Business Unit Filter"),
                                                              "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                              "Global Dimension 1 Code" = FIELD("Global Dimension 2 Filter"),
                                                              "Employee No" = FIELD("Employee Filter"),
                                                              Beneficiary = FIELD("Beneficiary Filter"),
                                                              Transaction Type=CONST(C),
                                                              "Transaction Date"=FIELD("Date Filter"),
                                                              "Hospital Code"=FIELD("Hospital Filter"))) ;
             DecimalPlaces = 2:2;
             FieldClass = FlowField; */
        }
        field(22; "Reimbursed Cost"; Decimal)
        {
            /* BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE ("Business Unit"=FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 1 Code"=FIELD("Global Dimension 2 Filter"),
                                                             "Employee No"=FIELD("Employee Filter"),
                                                             Beneficiary=FIELD("Beneficiary Filter"),
                                                             Transaction Type=CONST(R),
                                                             "Transaction Date"=FIELD("Date Filter"),
                                                             "Hospital Code"=FIELD("Hospital Filter")))
            DecimalPlaces = 2:2;
            FieldClass = FlowField; */
        }
        field(23; "Hospital Cost"; Decimal)
        {
            /* BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE ("Hospital Code"=FIELD("Hospital Filter"),
                                                             "Business Unit"=FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 1 Code"=FIELD("Global Dimension 2 Filter"),
                                                             "Employee No"=FIELD("Employee Filter"),
                                                             Beneficiary=FIELD("Beneficiary Filter"),
                                                             Transaction Type=CONST(H),
                                                             "Transaction Date"=FIELD("Date Filter"),
                                                             "Hospital Code"=FIELD("Hospital Filter")))
            DecimalPlaces = 2:2;
            FieldClass = FlowField; */
        }
        field(24; "Hospital Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = IF ("Transaction Type" = filter('H')) Vendor."No." WHERE(Hospital = filter(true));
        }
        field(25; "Transaction Description"; Text[30])
        {
        }
        field(26; "No Treated"; Integer)
        {
            CalcFormula = Count("Medical Record" WHERE("Business Unit" = FIELD("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 2 Filter"),
                                                        "Employee No" = FIELD("Employee Filter"),
                                                        Beneficiary = FIELD("Beneficiary Filter"),
                                                        "Transaction Type" = FIELD("Transaction  Filter"),
                                                        "Transaction Date" = FIELD("Date Filter"),
                                                        "Hospital Code" = FIELD("Hospital Filter")));
            FieldClass = FlowField;
        }
        field(100; "Yearly Medical Limit"; Decimal)
        {
            CalcFormula = Lookup(Employee."MEdical cost Limit" WHERE("No." = FIELD("Employee No")));
            FieldClass = FlowField;
        }
        field(101; "Medical Expense Total"; Decimal)
        {
            CalcFormula = Sum("Medical Record".Amount WHERE("Employee No" = FIELD("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(200; "HHR Approval"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee No", "Transaction Type", "Transaction Date")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Hospital Code", "Transaction Date")
        {
            SumIndexFields = Amount;
        }
        key(Key4; "Hospital Code", "Transaction Date", "Transaction Type", Beneficiary, "Business Unit", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            SumIndexFields = Amount;
        }
        key(Key5; "Employee No")
        {
            SumIndexFields = Amount;
        }
        key(Key6; "Employee No", "Transaction Type", "Transaction Date", Beneficiary)
        {
            SumIndexFields = Amount;
        }
        key(Key7; "Business Unit", "Global Dimension 1 Code", "Global Dimension 2 Code", "Employee No", Beneficiary, "Transaction Type", "Transaction Date")
        {
            SumIndexFields = Amount;
        }
        key(Key8; "Hospital Code", "Business Unit", "Global Dimension 1 Code", "Global Dimension 2 Code", "Employee No", Beneficiary, "Transaction Type", "Transaction Date")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF MedRec.FIND('+') THEN
            "Line No" := MedRec."Line No" + 1
        ELSE
            "Line No" := 1;
    end;

    var
        MedRec: Record "Medical Record";
        EmpRec: Record Employee;
        TText: Text[50];
        YTD: Text[30];
        DimMgt: Codeunit DimensionManagement;


    procedure "Per Hospital Cost"(HospNo: Code[10]; PerStr: Text[30]): Decimal
    begin
        MedRec.SETFILTER(MedRec."Transaction  Filter", FORMAT(MedRec."Transaction  Filter"::H));
        MedRec.SETFILTER(MedRec."Hospital Filter", HospNo);
        MedRec.SETFILTER(MedRec."Date Filter", PerStr);
        MedRec.CALCFIELDS(MedRec."Treatment Cost");
        EXIT(MedRec."Treatment Cost");
    end;


    procedure "Per No Treated"(HospNo: Code[10]; PerStr: Text[30]): Decimal
    begin
        MedRec.SETFILTER(MedRec."Transaction  Filter", FORMAT(MedRec."Transaction  Filter"::H));
        MedRec.SETFILTER(MedRec."Hospital Filter", HospNo);
        MedRec.SETFILTER(MedRec."Date Filter", PerStr);
        MedRec.CALCFIELDS(MedRec."No Treated");
        EXIT(MedRec."No Treated");
    end;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Medical Record", FORMAT("Line No"), FieldNo, ShortcutDimCode);
        MODIFY;
    end;


    procedure "Medical Cost (YTD)"(): Decimal
    var
        MediRec: Record "Medical Record";
    begin
        MediRec.RESET;
        MediRec.SETCURRENTKEY("Employee No", "Transaction Type", "Transaction Date");
        MediRec.SETRANGE(MediRec."Employee No", "Employee No");
        MediRec.SETRANGE(MediRec."Transaction Date", CALCDATE('-CY'), CALCDATE('CY'));
        MediRec.CALCSUMS(MediRec.Amount);
        EXIT(MediRec.Amount);
    end;
}

