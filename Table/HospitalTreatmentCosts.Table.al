table 50093 "Hospital Treatment Costs"
{

    fields
    {
        field(1; "Hospital Code"; Code[10])
        {
            TableRelation = Vendor."No." WHERE(Hospital = filter(true));
        }
        field(2; "Treatment Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE("Hospital Code" = FIELD("Hospital Code"),
                                                             "Employee No" = FIELD("Employee Filter"),
                                                             "Business Unit" = FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                             "Transaction Type" = FIELD("Transaction Type Filter"),
                                                             "Transaction Date" = FIELD("Date Filter"),
                                                             Beneficiary = FIELD("Beneficiary Filter")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(4; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(5; "Employee Filter"; Code[30])
        {
            FieldClass = FlowFilter;
        }
        field(6; "Hospital Filter"; Code[30])
        {
            FieldClass = FlowFilter;
        }
        field(7; "Transaction Type Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",C,R,H;
        }
        field(8; "Beneficiary Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",Self,Dependant;
        }
        field(9; "Business Unit Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(10; "Global Dimension 1 Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(11; "Global Dimension 2 Filter"; Code[10])
        {

        }
        field(12; "Hospital Name"; Text[150])
        {
        }
        field(13; "Clinic Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE("Employee No" = FIELD("Employee Filter"),
                                                             "Business Unit" = FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                             "Transaction Type" = CONST(C),
                                                             "Transaction Date" = FIELD("Date Filter"),
                                                             Beneficiary = FIELD("Beneficiary Filter")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(14; "Reimbursed Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE("Employee No" = FIELD("Employee Filter"),
                                                             "Business Unit" = FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                             "Transaction Type" = CONST(R),
                                                             "Transaction Date" = FIELD("Date Filter"),
                                                             Beneficiary = FIELD("Beneficiary Filter")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(15; "Overall Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Medical Record".Amount WHERE("Employee No" = FIELD("Employee Filter"),
                                                             "Business Unit" = FIELD("Business Unit Filter"),
                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                             "Transaction Date" = FIELD("Date Filter"),
                                                             Beneficiary = FIELD("Beneficiary Filter")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(16; "Employee Count"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Medical Record" WHERE("Hospital Code" = FIELD("Hospital Code"),
                                                        "Employee No" = FIELD("Employee Filter"),
                                                        "Business Unit" = FIELD("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                        "Transaction Type" = FIELD("Transaction Type Filter"),
                                                        "Transaction Date" = FIELD("Date Filter"),
                                                        Beneficiary = FIELD("Beneficiary Filter")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Hospital Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MedRec: Record "Medical Record";
        HospRec: Record "Hospital Treatment Costs";
        VendRec: Record Vendor;


    procedure CostYTD(): Decimal
    begin
    end;


    procedure PutRec(): Decimal
    begin
        RESET;
        DELETEALL;
        VendRec.RESET;
        VendRec.SETRANGE(Hospital, TRUE);
        WHILE (VendRec.NEXT <> 0)
        DO BEGIN
            HospRec.INIT;
            HospRec."Hospital Code" := VendRec."No.";
            HospRec."Hospital Name" := VendRec.Name;
            HospRec.INSERT;
        END;
    end;
}

