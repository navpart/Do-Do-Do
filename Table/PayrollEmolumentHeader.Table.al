table 50000 "Payroll-Emolument Header"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF (1 < CursorPos) AND (CursorPos < MAXSTRLEN("Search Name")) THEN BEGIN
                    "Search Name" := DELCHR(COPYSTR("No.", CursorPos), '<>');
                    "Search Name" := PADSTR("Search Name" + ' ' + DELCHR(COPYSTR("No.", 1, CursorPos - 1), '<>'), MAXSTRLEN("Search Name"));
                END
                ELSE
                    "Search Name" := "No.";
                "Search Name" := DELCHR("Search Name", '<');
            end;
        }
        field(2; "Search Name"; Code[10])
        {
        }
        field(5; "Gross Pay"; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                      "Payslip Group ID" = const("GROSS PAY")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Tax Charged"; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                       "Payslip Group ID" = const("TAX CHARGED")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Tax Deducted"; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                      "Payslip Group ID" = const("TAX DEDUCTED")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Taxable Pay"; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                      "Payslip Group ID" = const("TAXABLE PAY")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Total Deductions"; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                      "Payslip Group ID" = const("TOTAL DEDUCTIONS")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Net Pay Due"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD("No."),
                                                                                      "Payslip Group ID" = const("NET PAY DUE")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Posting Group Code"; Code[10])
        {
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(12; Grade; Code[2])
        {
        }
        field(13; Step; Code[2])
        {
        }
        field(14; Management; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Posting Group Code")
        {
        }
        key(Key3; Grade, Step)
        {
        }
        key(Key4; Step)
        {
        }
        key(Key5; Management)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        /* Confirm */
        IF NOT CONFIRM('All entries for this employee group ' +
                        'will be deleted!' +
                        'Proceed with Deletion?    ')
        THEN
            ERROR('Nothing was deleted');

        /* Lock 'parent' and 'child' files*/
        // LOCKTABLE( FALSE);
        // GrpLinesRec.LOCKTABLE( FALSE);

        /* First delete the detail lines */
        GrpLinesRec.SETRANGE("Emolument Group", "No.");
        GrpLinesRec.DELETEALL;

        /* Delete the 'parent record'*/
        DELETE;

        /* Disable the locking effect */
        COMMIT;

    end;

    trigger OnModify()
    begin
        IF (GrpCodeRec."No." <> "No.") AND
             (GrpCodeRec."No." <> '') THEN BEGIN
            IF CONFIRM(STRSUBSTNO('Do you want to change %1?', FIELDNAME("No.")), FALSE) THEN BEGIN
                GrpCodeRec.SETRANGE("No.", GrpCodeRec."No.");
                "Search Name" := GrpCodeRec."Search Name";
            END;
        END;
    end;

    var
        GrpCodeRec: Record 50000;
        GrpLinesRec: Record 50005;
        CursorPos: Integer;
        Ok: Boolean;
        PostGrpRec: Record 50011;
        PGrpCode: Code[10];
        EDRec: Record 50001;
        GrossEDCode: Code[20];
        GenPCode: Codeunit 50004;
        EDType: Option " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer","NSITF Gross",NHF,"Net Pay","Other Emoluments";
        EmpContRec: Record 5211;
        EmpGrp: Code[10];
        gg: Decimal;
        GrossFilter: Text[30];
        EmpGrpStep: Code[10];
        BasicEDCode: Code[10];


    procedure GetGross(EmpGrpCode: Code[10]): Decimal
    begin
        //GrossEDCode := GenPCode.GetGrossED(EDType::"Gross Salary");

        IF NOT (EmpContRec.GET(EmpGrpCode)) THEN EXIT(0);

        EmpGrp := EmpContRec.Category;
        IF GrpCodeRec.GET(EmpGrp) THEN BEGIN
            GrpCodeRec.CALCFIELDS(GrpCodeRec."Gross Pay");
            EXIT(GrpCodeRec."Gross Pay");
        END
        ELSE
            EXIT(0);


        /*
        IF EmpContRec.GET(EmpGrpCode) THEN
          BEGIN
            EmpGrp := EmpContRec.Category;
        
            GrpLinesRec.SETRANGE(GrpLinesRec."Employee Group",EmpGrpCode);
            IF GrpLinesRec.FIND('-') THEN
              BEGIN
                GrpLinesRec.SETRANGE(GrpLinesRec."E/D Code",GrossEDCode);
                GrpLinesRec.FIND('-');
        //        GrpLinesRec.CALCFIELDS(GrpLinesRec."Default Amount");
                EXIT(GrpLinesRec."Default Amount");
              END
           END
        ELSE
          EXIT(0);
        */

    end;


    procedure GetGrade(GrpCode: Code[10]): Code[2]
    begin
        IF GrpCodeRec.GET(GrpCode) THEN EXIT(GrpCodeRec.Grade);
        EXIT('NA');
    end;


    procedure GetStep(GrpCode: Code[10]): Code[2]
    begin
        IF GrpCodeRec.GET(GrpCode) THEN EXIT(GrpCodeRec.Step);
        EXIT('NA');
    end;


    procedure GetGrpCode(Grd: Code[2]; Stp: Code[2]): Code[10]
    begin
        GrpCodeRec.SETRANGE(Grade, Grd);
        GrpCodeRec.SETRANGE(Step, Stp);
        IF GrpCodeRec.FIND('-') THEN EXIT(GrpCodeRec."No.");
    end;


    procedure GetGroupFromGross(GrossAmount: Decimal; Criteria: Option LT,GT,EQ,LE,GE,NE): Code[10]
    begin

        GrossEDCode := GenPCode.GetGrossED(EDType::"Gross Salary");

        CASE Criteria OF
            Criteria::LT:
                GrossFilter := '<' + FORMAT(GrossAmount);
            Criteria::GT:
                GrossFilter := '>' + FORMAT(GrossAmount);
            Criteria::EQ:
                GrossFilter := '=' + FORMAT(GrossAmount);
            Criteria::LE:
                GrossFilter := '<=' + FORMAT(GrossAmount);
            Criteria::GE:
                GrossFilter := '>=' + FORMAT(GrossAmount);
            Criteria::NE:
                GrossFilter := '<>' + FORMAT(GrossAmount);
        END;

        GrpLinesRec.RESET;
        GrpLinesRec.SETRANGE(GrpLinesRec."E/D Code", GrossEDCode);
        GrpLinesRec.SETCURRENTKEY(GrpLinesRec."Default Amount");
        GrpLinesRec.SETFILTER(GrpLinesRec."Default Amount", GrossFilter);

        IF GrpLinesRec.FIND('+') THEN
            EXIT(GrpLinesRec."Emolument Group")
        ELSE
            EXIT(GrossEDCode);

    end;


    procedure GetBasic(EmpGrpCode: Code[10]): Decimal
    begin

        EDRec.SETRANGE(EDRec."Control Type", EDRec."Control Type"::Basic);
        EDRec.FIND('-');
        BasicEDCode := EDRec."E/D Code";

        GrpLinesRec.SETRANGE(GrpLinesRec."Emolument Group", EmpGrpCode);
        GrpLinesRec.SETRANGE(GrpLinesRec."E/D Code", BasicEDCode);
        IF GrpLinesRec.FIND('-') THEN
            EXIT(GrpLinesRec."Default Amount")
        ELSE
            EXIT(0);
    end;


    procedure GetEmpName(EmpGrpCode: Code[10]): Text[100]
    var
        EmpREc: Record 5200;
    begin
        IF EmpREc.GET(EmpGrpCode) THEN
            EXIT(EmpREc.FullName)
        ELSE
            EXIT(EmpGrpCode);
    end;
}

