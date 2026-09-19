table 50064 "Appraisal Entries"
{

    fields
    {
        field(1; "Appraisal no."; Code[10])
        {
            Editable = false;
        }
        field(2; "Employee No."; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                 IF EmpRec.GET("Employee No.") THEN BEGIN
                     "Old Employee Group" := EmpRec."Employee Group";
                     OldGrp := "Old Employee Group";
                     "Old Basic" := EmpGrpRec.GetBasic("Old Employee Group");
                 END; 
            end;
        }
        field(3; "Appraisal Date"; Date)
        {
        }
        field(4; "Appraisal Code"; Code[1])
        {
            NotBlank = true;
            TableRelation = "Appraisal Codes".Code WHERE(Blocked = CONST(false));

            /* trigger OnValidate()
            begin
                IF EmpRec.GET("Employee No.") AND AppCodeRec.GET("Appraisal Code") THEN BEGIN
                    EVALUATE(StepFormula, FORMAT(AppCodeRec."Next Step Formular"));
                    IF (StepFormula <> 'M') THEN BEGIN
                        IF (EmpRec.IsManager("Employee No.")) THEN
                            ERROR('%1 is a MANAGER!\You may give him/her Percentage Increment Only!!', EmpRec.FullName);

                        IF NOT CONFIRM('Are you sure you want to give %1 a(an) %2 Appraisal', TRUE, EmpRec.FullName, AppCodeRec.Description) THEN EXIT;
                        OldGrp := "Old Employee Group";
                        OldGrade := EmpGrpRec.GetGrade("Old Employee Group");
                        OldStep := EmpGrpRec.GetStep("Old Employee Group");

                        EmpGrpRec.SETCURRENTKEY(EmpGrpRec.Grade, EmpGrpRec.Step);
                        EmpGrpRec.SETRANGE(EmpGrpRec.Grade, OldGrade);
                        IF EmpGrpRec.FIND('+') THEN MaxLevelStep := EmpGrpRec.Step;
                        CASE StepFormula OF
                            'P':
                                Promote;
                            '0' .. '4':
                                StepUp(StepFormula);
                            'T':
                                BEGIN
                                    NewStep := MaxLevelStep;
                                    NewGrp := EmpGrpRec.GetGrpCode(OldGrade, NewStep);
                                    RegisterNewGrp;
                                END;
                        END;
                    END;
                    //  ELSE
                    //    IF NOT(EmpRec.IsManager("Employee No.")) THEN
                    //      ERROR('%1 is not a MANAGER!!\You cannot give him/her Percentage Increment\\Try other Appraisal Codes.',EmpRec.FullName);
                END;
            end; */
        }
        field(5; "Percentage Increase"; Decimal)
        {
            BlankZero = true;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin

                IF AppCodeRec.GET("Appraisal Code") THEN
                    IF (AppCodeRec."Next Step Formular" = AppCodeRec."Next Step Formular"::M) THEN BEGIN
                        IncPct := "Percentage Increase";
                        //      Increment(IncPct);
                    END
                    ELSE
                        "Percentage Increase" := 0;

                "New Employee Group" := "Old Employee Group";

                "New Basic" := "Old Basic" * ("Percentage Increase" + 100) / 100;
            end;
        }
        field(6; "Old Employee Group"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                //"Old Basic" := EmpGrpRec.GetBasic("Old Employee Group");
            end;
        }
        field(7; "New Employee Group"; Code[20])
        {
            TableRelation = "Payroll-Employee Group Header.";

            trigger OnValidate()
            begin
                //"New Basic" := EmpGrpRec.GetBasic("New Employee Group");
            end;
        }
        field(9; "Entered by"; Code[10])
        {
            Editable = false;
        }
        field(10; Comment; Text[250])
        {
        }
        field(11; Open; Boolean)
        {
            Editable = false;
            InitValue = true;
        }
        field(12; "Effective Start Date"; Date)
        {
        }
        field(13; "Old Basic"; Decimal)
        {
            Editable = false;
        }
        field(14; "New Basic"; Decimal)
        {
            Editable = false;
        }
        field(15; "Appraiser Comment"; Text[80])
        {
        }
        field(16; "Appraisee Reccomendation"; Text[80])
        {
        }
        field(17; "GM/HOD Remark"; Text[30])
        {
        }
        field(18; "Managements Decision"; Text[30])
        {
        }
        field(19; "Areas Neeeding Attention"; Text[80])
        {
        }
        field(20; "T/D Needs"; Text[80])
        {
        }
        field(21; "Rev Officer Recc."; Text[80])
        {
        }
        field(22; "Appraisal Type"; Option)
        {
            OptionMembers = "End Year","Mid Year";
        }
        field(31; r; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal no.", "Employee No.")
        {
            Clustered = true;
        }
        key(Key2; "Old Employee Group")
        {
        }
        key(Key3; "Employee No.")
        {
        }
        key(Key4; Open, "Effective Start Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('You are NOT ALLOWED to DELETE this record Please');
    end;

    trigger OnInsert()
    begin
        IF AppRec.FIND('+') THEN
            "Appraisal no." := INCSTR(AppRec."Appraisal no.")
        ELSE
            "Appraisal no." := '1';

        "Appraisal Date" := TODAY;
        "Entered by" := USERID;
    end;

    trigger OnModify()
    begin
        IF NOT (xRec.Open) THEN ERROR('You are NOT ALLOWED to MODIFY this record Please');
    end;

    trigger OnRename()
    begin
        IF NOT (xRec.Open) THEN ERROR('You are NOT ALLOWED to RENAME this record Please');
    end;

    var
        AppCodeRec: Record "Appraisal Codes";
        StepFormula: Code[1];
        AppRec: Record "Appraisal Entries";
        EmpRec: Record Employee;
        VarInteger: Integer;
        stepping: Integer;
        cnt: Integer;
        NewGrp: Code[10];
        NewGrp1: Code[10];
        OldGrp: Code[10];
        OldGrpLevel: Code[2];
        OldStep: Code[2];
        OldGrade: Code[2];
        NewStep: Code[2];
        NewGrade: Code[2];
        IncCode: Code[1];
        IncPct: Decimal;
        MaxLevelStep: Code[2];
        AppCode: Code[1];
        Nstp: Code[2];
        EmpPostGrpRec: Record "Payroll-Posting Group Header.";
        EmpGrpRec: Record "Payroll-Employee Group Header.";
        FStr: Text[30];
        OldGross: Decimal;
        NewGross: Decimal;
        Criteria: Option LT,GT,EQ,LE,GE,NE;
        StepUpNo: Integer;
        CounterNo: Integer;

    procedure StepUp(Stp: Code[1])
    begin
        EVALUATE(StepUpNo, Stp);
        CounterNo := 1;

        IF Stp = '0' THEN BEGIN
            "New Employee Group" := OldGrp;
            EXIT;
        END;

        IF (OldStep = MaxLevelStep) THEN
            ERROR('You cannot Move the employee further in this level\\' +
            'Try Incrementing or Promoting Instead');

        OldGrp := "Old Employee Group";
        OldGrade := EmpGrpRec.GetGrade(OldGrp);

        NewGrade := OldGrade;
        OldStep := EmpGrpRec.GetStep(OldGrp);

        WHILE (CounterNo <= StepUpNo) DO BEGIN
            NewStep := INCSTR(OldStep);
            NewGrp := EmpGrpRec.GetGrpCode(NewGrade, NewStep);

            IF (NewStep = MaxLevelStep) THEN
                ERROR('You cannot Move the employee So Much further in this level');

            OldStep := NewStep;
            CounterNo := CounterNo + 1;
        END;


        RegisterNewGrp;
    end;

    procedure Increment(Pct: Decimal)
    begin
        EmpRec.GET("Employee No.");
        TESTFIELD("Percentage Increase");

        IF NOT CONFIRM('Are you sure you want to give %1 a %2 %3 Appraisal', TRUE, EmpRec.FullName,
                        FORMAT(IncPct) + '%', AppCodeRec.Description) THEN
            EXIT;

        OldGrp := "Old Employee Group";
        OldGrade := EmpGrpRec.GetGrade(OldGrp);
        OldStep := EmpGrpRec.GetStep(OldGrp);

        EmpGrpRec.RESET;
        OldGross := EmpGrpRec.GetGross(OldGrp);
        NewGross := (OldGross * (100 + Pct)) / 100;

        NewGrp := EmpGrpRec.GetGroupFromGross(NewGross, Criteria::LE);
        NewGrade := EmpGrpRec.GetGrade(NewGrp);
        NewStep := EmpGrpRec.GetStep(NewGrp);

        RegisterNewGrp;
    end;

    procedure Promote()
    begin
        OldGrp := "Old Employee Group";
        OldGrade := EmpGrpRec.GetGrade(OldGrp);
        OldStep := EmpGrpRec.GetStep(OldGrp);

        EmpGrpRec.RESET;
        EmpGrpRec.SETCURRENTKEY(Grade);
        EmpGrpRec.ASCENDING(FALSE);

        REPEAT
            IF (EmpGrpRec.NEXT <> 0) THEN
                FStr := ''                         //Dummy statement
            ELSE
                ERROR('You cannot promote Staff beyond \\ GRADE %1 Current Group is %2', OldGrade, OldGrp);
        UNTIL (EmpGrpRec.Grade < OldGrade);
        NewGrade := EmpGrpRec.Grade;

        EmpGrpRec.RESET;
        EmpGrpRec.SETCURRENTKEY(Grade, Step);
        EmpGrpRec.SETRANGE(Grade, NewGrade);
        IF EmpGrpRec.FIND('-') THEN BEGIN
            NewGrade := EmpGrpRec.Grade;
            NewStep := OldStep;
            NewGrp := EmpGrpRec.GetGrpCode(NewGrade, NewStep);
        END;

        RegisterNewGrp;
    end;

    procedure RegisterNewGrp()
    begin
        ValidateNewGrp;
        "New Employee Group" := NewGrp;
       
        EmpRec.GET("Employee No.");
        EmpRec."Employee Group" := NewGrp;
        EmpRec.MODIFY;
        

    end;

    procedure ValidateNewGrp()
    begin
        IF EmpGrpRec.GET(NewGrp) THEN
            EXIT
        ELSE BEGIN
            NewGrp1 := NewGrp;
            NewGrp := OldGrp;
            NewGrade := OldGrade;
            NewStep := OldStep;
            ERROR('New Employee Group %1 Does Not Exist', NewGrp1);
        END;
    end;
}

