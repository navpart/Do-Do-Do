table 50075 "Leave Plan Lines Rev 2"
{
    DrillDownPageID = 50097;
    LookupPageID = 50097;
    ;

    fields
    {
        field(1; "Employee No."; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                IF EmpRec.GET("Employee No.") THEN BEGIN
                    "Business Unit" := EmpRec."Business Unit";
                    "Global Dimension 1 Code" := EmpRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := EmpRec."Global Dimension 2 Code";
                    EmpGrpCode := EmpRec."Employee Group";
                END;


                IF ("Entry Type" = "Entry Type"::PLAN) AND (EmpGrpRec.GET(EmpGrpCode)) THEN BEGIN
                    "Amount Due" := 15 * (EmpRec."Basic Salary") / 100;
                END;
            end;
        }
        field(2; "Leave Period"; Integer)
        {

            trigger OnValidate()
            begin
                /*Get Leave Start Date*/

                EmpRec.GET("Employee No.");
                IF PGrp.GET(EmpRec."Posting Group") THEN BEGIN
                    EmpDate := EmpRec."Employment Date";
                    IF (EmpDate = 0D) THEN ERROR('Please specify the employment date for %1', EmpRec.FullName);
                    EmpDay := DATE2DMY(EmpDate, 1);
                    EmpMth := DATE2DMY(EmpDate, 2);
                    EmpYr := DATE2DMY(EmpDate, 3);

                    //    "Leave Period" := LeaveYear;

                    EmpLeaveYr := "Leave Period";

                    VALIDATE("Annual Duration", PGrp."Annual Leave Days");
                    VALIDATE("Start Date1", DMY2DATE(EmpDay, EmpMth, EmpLeaveYr));
                    VALIDATE("No. Days1", PGrp."Annual Leave Days");
                END;

            end;
        }
        field(3; "Annual Duration"; Integer)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(4; "Amount Due"; Decimal)
        {
        }
        field(5; "Amount Paid"; Decimal)
        {
            CalcFormula = Sum("Leave Payment Rev 2"."Amount Paid" WHERE("Leave Period" = FIELD("Leave Period"),
                                                                         "Employee No." = FIELD("Employee No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Business Unit"; Code[10])
        {
            Editable = false;
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(16; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(17; Registered; Boolean)
        {
        }
        field(21; "Entry Type Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Leave Roster Summary"."Unit of Measure";
        }
        field(22; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(23; "Total Leaves Due"; Integer)
        {
            BlankZero = true;
            CalcFormula = Sum("Leave Plan Lines Rev 2"."Annual Duration" WHERE("Employee No." = FIELD("Employee No."),
                                                                                "Leave Period" = FIELD("Leave Period"),
                                                                                "Entry Type" = filter('PLAN')));
            //DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Total Compassionate"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Leave Category" = filter('COMP'),
                                                      "Leave Period" = FIELD("Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Total Exam"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Leave Category" = filter('EXAM'),
                                                      "Leave Period" = FIELD("Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Total Others"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Leave Category" = filter('OTHERS'),
                                                      "Leave Period" = FIELD("Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Total Consuming"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      Consuming = filter(true),
                                                      "Leave Period" = FIELD("Leave Period")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Total Annual"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Leave Category" = filter('ANNUAL'),
                                                      "Leave Period" = FIELD("Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Total Commuted To Cash"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("Employee No."),
                                                      LeaveDate = FIELD("Date Filter"),
                                                      "Leave Category" = filter('CASH'),
                                                      "Leave Period" = FIELD("Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Start Date1"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Start Date1" = 0D THEN BEGIN
                    "No. Days1" := 0;
                    EXIT;
                END;

                IF ("End Date1" < "Start Date1") AND ("End Date1" <> 0D) THEN
                    ERROR(FIELDCAPTION("Start Date1") + 'Must be on or after ' + FIELDCAPTION("End Date1"));

                IF "End Date1" <> 0D THEN
                    "No. Days1" := GenPCode.GetNoOfDays("Start Date1", "End Date1")
                ELSE
                    IF "No. Days1" <> 0 THEN
                        "End Date1" := GenPCode.GetEndDate("Start Date1", "No. Days1");

                CheckTotalDuration(1);
            end;
        }
        field(33; "End Date1"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "End Date1" = 0D THEN BEGIN
                    "No. Days1" := 0;
                    EXIT;
                END;

                IF ("End Date1" < "Start Date1") AND ("Start Date1" <> 0D) THEN ERROR(FORMAT("Start Date1") + ' == ' + FORMAT("End Date1"));
                //   ERROR(FIELDCAPTION("End Date1")+'Must be on or before '+FIELDCAPTION("Start Date1"));

                IF "Start Date1" <> 0D THEN
                    "No. Days1" := GenPCode.GetNoOfDays("Start Date1", "End Date1")
                ELSE
                    IF "No. Days1" <> 0 THEN
                        "Start Date1" := GenPCode.GetStartDate("End Date1", "No. Days1");

                CheckTotalDuration(1);
            end;
        }
        field(34; "No. Days1"; Integer)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');


                IF "No. Days1" = 0 THEN EXIT;

                IF ("Start Date1" = 0D) AND ("End Date1" = 0D) THEN EXIT;

                IF "Start Date1" <> 0D THEN
                    "End Date1" := GenPCode.GetEndDate("Start Date1", "No. Days1")
                ELSE
                    "Start Date1" := GenPCode.GetStartDate("End Date1", "No. Days1");

                IF EmpRec.GET("Employee No.") THEN EmpGrpCode := EmpRec."Employee Group";

                CheckTotalDuration(1);

            end;
        }
        field(35; "Start Date2"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Start Date2" = 0D THEN BEGIN
                    "No. Days2" := 0;
                    EXIT;
                END;

                IF ("End Date2" < "Start Date2") AND ("End Date2" <> 0D) THEN
                    ERROR(FIELDCAPTION("Start Date2") + 'Must be on or after ' + FIELDCAPTION("End Date2"));

                IF "End Date2" <> 0D THEN
                    "No. Days2" := GenPCode.GetNoOfDays("Start Date2", "End Date2")
                ELSE
                    IF "No. Days2" <> 0 THEN
                        "End Date2" := GenPCode.GetEndDate("Start Date2", "No. Days2");

                CheckTotalDuration(1);
            end;
        }
        field(36; "End Date2"; Date)
        {

            trigger OnValidate()
            begin

                IF "End Date2" = 0D THEN BEGIN
                    "No. Days2" := 0;
                    EXIT;
                END;

                IF ("End Date2" < "Start Date2") AND ("Start Date2" <> 0D) THEN
                    ERROR(FIELDCAPTION("End Date2") + 'Must be on or before ' + FIELDCAPTION("Start Date2"));

                IF "Start Date2" <> 0D THEN
                    "No. Days2" := GenPCode.GetNoOfDays("Start Date2", "End Date2")
                ELSE
                    IF "No. Days2" <> 0 THEN
                        "Start Date2" := GenPCode.GetStartDate("End Date2", "No. Days2");


                CheckTotalDuration(1);
            end;
        }
        field(37; "No. Days2"; Integer)
        {

            trigger OnValidate()
            begin
                //error('There');

                IF "No. Days2" = 0 THEN EXIT;

                IF ("Start Date2" = 0D) AND ("End Date2" = 0D) THEN EXIT;

                IF "Start Date2" <> 0D THEN
                    "End Date2" := GenPCode.GetEndDate("Start Date2", "No. Days2")
                ELSE
                    "Start Date2" := GenPCode.GetStartDate("End Date2", "No. Days2");

                IF EmpRec.GET("Employee No.") THEN EmpGrpCode := EmpRec."Employee Group";

                CheckTotalDuration(1);

            end;
        }
        field(38; "Start Date3"; Date)
        {

            trigger OnValidate()
            begin

                IF "Start Date3" = 0D THEN BEGIN
                    "No. Days3" := 0;
                    EXIT;
                END;

                IF ("End Date3" < "Start Date3") AND ("End Date3" <> 0D) THEN
                    ERROR(FIELDCAPTION("Start Date3") + 'Must be on or after ' + FIELDCAPTION("End Date3"));

                IF "End Date3" <> 0D THEN
                    "No. Days3" := GenPCode.GetNoOfDays("Start Date3", "End Date3")
                ELSE
                    IF "No. Days3" <> 0 THEN
                        "End Date3" := GenPCode.GetEndDate("Start Date3", "No. Days3");

                CheckTotalDuration(1);
            end;
        }
        field(39; "End Date3"; Date)
        {

            trigger OnValidate()
            begin

                IF "End Date3" = 0D THEN BEGIN
                    "No. Days3" := 0;
                    EXIT;
                END;

                IF ("End Date3" < "Start Date3") AND ("Start Date3" <> 0D) THEN
                    ERROR(FIELDCAPTION("End Date3") + 'Must be on or before ' + FIELDCAPTION("Start Date3"));

                IF "Start Date3" <> 0D THEN
                    "No. Days3" := GenPCode.GetNoOfDays("Start Date3", "End Date3")
                ELSE
                    IF "No. Days3" <> 0 THEN
                        "Start Date3" := GenPCode.GetStartDate("End Date3", "No. Days3");

                CheckTotalDuration(1);
            end;
        }
        field(40; "No. Days3"; Integer)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                //GetAmountDue;

                IF "No. Days3" = 0 THEN EXIT;

                IF ("Start Date3" = 0D) AND ("End Date3" = 0D) THEN EXIT;

                IF "Start Date3" <> 0D THEN
                    "End Date3" := GenPCode.GetEndDate("Start Date3", "No. Days3")
                ELSE
                    "Start Date3" := GenPCode.GetStartDate("End Date3", "No. Days3");

                IF EmpRec.GET("Employee No.") THEN EmpGrpCode := EmpRec."Employee Group";

                CheckTotalDuration(1);

            end;
        }
        field(41; "Start Date4"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Start Date4" = 0D THEN BEGIN
                    "No. Days4" := 0;
                    EXIT;
                END;

                IF ("End Date4" < "Start Date4") AND ("End Date4" <> 0D) THEN
                    ERROR(FIELDCAPTION("Start Date4") + 'Must be on or after ' + FIELDCAPTION("End Date4"));

                IF "End Date4" <> 0D THEN
                    "No. Days4" := GenPCode.GetNoOfDays("Start Date4", "End Date4")
                ELSE
                    IF "No. Days4" <> 0 THEN
                        "End Date4" := GenPCode.GetEndDate("Start Date4", "No. Days4");

                CheckTotalDuration(1);
            end;
        }
        field(42; "End Date4"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "End Date4" = 0D THEN BEGIN
                    "No. Days4" := 0;
                    EXIT;
                END;

                IF ("End Date4" < "Start Date4") AND ("Start Date4" <> 0D) THEN
                    ERROR(FIELDCAPTION("End Date4") + 'Must be on or before ' + FIELDCAPTION("Start Date4"));

                IF "Start Date4" <> 0D THEN
                    "No. Days4" := GenPCode.GetNoOfDays("Start Date4", "End Date4")
                ELSE
                    IF "No. Days4" <> 0 THEN
                        "Start Date4" := GenPCode.GetStartDate("End Date4", "No. Days4");

                CheckTotalDuration(1);
            end;
        }
        field(43; "No. Days4"; Integer)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                //GetAmountDue;

                IF "No. Days4" = 0 THEN EXIT;

                IF ("Start Date4" = 0D) AND ("End Date4" = 0D) THEN EXIT;

                IF "Start Date4" <> 0D THEN
                    "End Date4" := GenPCode.GetEndDate("Start Date4", "No. Days4")
                ELSE
                    "Start Date4" := GenPCode.GetStartDate("End Date4", "No. Days4");

                IF EmpRec.GET("Employee No.") THEN EmpGrpCode := EmpRec."Employee Group";

                CheckTotalDuration(1);

            end;
        }
        field(44; Registered1; Boolean)
        {
        }
        field(45; Registered2; Boolean)
        {
        }
        field(46; Registered3; Boolean)
        {
        }
        field(47; Registered4; Boolean)
        {
        }
        field(48; "Entry Type"; Option)
        {
            OptionMembers = PLAN,ACTUAL;

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');
            end;
        }
        field(49; "Leave Category"; Code[30])
        {
            TableRelation = "Leave Categories".Code;

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');
                //LeavPRec.RESET;
                IF ("Entry Type" = "Entry Type"::ACTUAL) THEN BEGIN
                    LeavPRec.SETRANGE(LeavPRec."Employee No.", "Employee No.");
                    LeavPRec.SETRANGE(LeavPRec."Leave Period", "Leave Period");
                    LeavPRec.SETRANGE(LeavPRec."Entry Type", LeavPRec."Entry Type"::PLAN);
                    IF LeavPRec.FIND('-') THEN BEGIN
                        LCategory.GET("Leave Category");
                        IF LCategory."Payment Allowed" THEN BEGIN
                            "Amount Due" := 15 * (EmpRec."Basic Salary") / 100;
                            "Actual Start Date" := LeavPRec."Start Date1";
                            "Actual End Date" := LeavPRec."End Date1";
                            "Actual Duration" := LeavPRec."No. Days1";
                        END
                        ELSE
                            "Amount Due" := 0;
                    END

                    ELSE
                        "Amount Due" := 0;
                END;
            end;
        }
        field(50; LeaveDate; Date)
        {
        }
        field(51; "Actual Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Actual Start Date" = 0D THEN BEGIN
                    "Actual Duration" := 0;
                    EXIT;
                END;

                IF ("Actual End Date" < "Actual Start Date") AND ("Actual End Date" <> 0D) THEN
                    ERROR(FIELDCAPTION("Actual Start Date") + 'must be on or after ' + FIELDCAPTION("Actual End Date"));

                IF "Actual End Date" <> 0D THEN
                    "Actual Duration" := GenPCode.CalculateTotalLeaveDaysExcludingWeekends("Actual Start Date", "Actual End Date")
                ELSE
                    IF "Actual Duration" <> 0 THEN
                        "Actual End Date" := GenPCode.CalculateLeaveEndDateExcludingWeekendsAndHolidays("Actual Start Date", "Actual Duration");

                CheckTotalDuration(9);

            end;
        }
        field(52; "Actual End Date"; Date)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Actual End Date" = 0D THEN BEGIN
                    "Actual Duration" := 0;
                    EXIT;
                END;

                IF ("Actual End Date" < "Actual Start Date") AND ("Actual Start Date" <> 0D) THEN
                    ERROR(FIELDCAPTION("Actual End Date") + 'must be on or before ' + FIELDCAPTION("Actual Start Date"));

                IF "Actual Start Date" <> 0D THEN
                    "Actual Duration" := GenPCode.CalculateTotalLeaveDaysExcludingWeekends("Actual Start Date", "Actual End Date")
                ELSE
                    IF "Actual Duration" <> 0 THEN
                        "Actual Start Date" := GenPCode.CalculateLeaveStartDateExcludingWeekendsAndHolidays("Actual End Date", "Actual Duration");

                CheckTotalDuration(9);


            end;
        }
        field(53; "Actual Duration"; Integer)
        {

            trigger OnValidate()
            begin
                //IF xRec.Registered THEN ERROR('You cannot MODIFY a Registered Leave Record');

                IF "Actual Duration" = 0 THEN BEGIN
                    VALIDATE("Actual End Date", 0D);
                    EXIT;
                END;

                IF ("Actual Start Date" = 0D) AND ("Actual End Date" = 0D) THEN EXIT;

                IF "Actual Start Date" <> 0D THEN
                    "Actual End Date" := GenPCode.CalculateLeaveEndDateExcludingWeekendsAndHolidays("Actual Start Date", "Actual Duration")
                ELSE
                    "Actual Start Date" := GenPCode.CalculateLeaveStartDateExcludingWeekendsAndHolidays("Actual End Date", "Actual Duration");

                IF EmpRec.GET("Employee No.") THEN EmpGrpCode := EmpRec."Employee Group";

                CheckTotalDuration(9);


            end;
        }
        field(54; "Period Filter"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(55; "Serial No"; Code[10])
        {
            Editable = false;
        }
        field(56; "No Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(57; "Remaining Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(58; Leave_Request; Code[10])
        {
        }
        field(59; Treated; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Serial No", "Employee No.", "Entry Type")
        {
            Clustered = true;
            SumIndexFields = "Annual Duration", "Amount Due";
        }
        key(Key2; "Employee No.", "Leave Period", "Entry Type")
        {
            SumIndexFields = "Annual Duration", "Amount Due";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        PayRec.SETRANGE(PayRec."Leave Plan No.", "Serial No");
        PayRec.DELETEALL(TRUE);
        LRosteRec.SETRANGE(LRosteRec.LeavePlanNo, "Serial No");
        LRosteRec.DELETEALL(TRUE);
    end;

    trigger OnInsert()
    begin
        IF "Serial No" = '' THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Leave Plan No");
            "No Series" := HumanResSetup."Leave Plan No";
            if NoSeriesMgt.AreRelated("No Series", xRec."No Series") then
                "No Series" := xRec."No Series";
            "Serial No" := NoSeriesMgt.GetNextNo("No Series");
        END;
    end;

    var
        LeavPRec: Record "Leave Plan Lines Rev 2";
        LeavPRec2: Record "Leave Plan Lines Rev 2";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        PayRec: Record "Leave Payment Rev 2";
        GenPCode: Codeunit 50004;
        LRosteRec: Record 50077;
        ActualLeaves: Integer;
        ConSumingLeaves: Integer;
        EmpRec: Record 5200;
        DtFilter: Text[30];
        RemLeaves: Integer;
        LCategory: Record 50074;
        CatName: Text[30];
        EmpBasic: Decimal;
        EmpGrpRec: Record 50009;
        EmpLineRec: Record 50008;
        BasicAmount: Decimal;
        EmpGrpCode: Code[10];
        TakenTotal: Integer;
        RemDur: Integer;
        OldRemDur: Integer;
        OldTotal: Integer;
        PGrp: Record 50011;
        EmpDate: Date;
        EmpDay: Integer;
        EmpMth: Integer;
        EmpYr: Integer;
        EmpLeaveYr: Integer;
        DimMgt: Codeunit 408;
        LeaveRequest: Record 70009;


    procedure RegisterLeave(LeaveType: Option PLAN,ACTUAL)
    begin
        IF Registered THEN ERROR('This leave is already registered!');
        IF (LeaveType = LeaveType::ACTUAL) AND (EmpRec.GET("Employee No.")) THEN BEGIN
            CALCFIELDS("Total Leaves Due", "Total Consuming", "Total Annual");
            RemLeaves := "Total Leaves Due" - "Total Consuming";

            LCategory.GET("Leave Category");
            IF (RemLeaves < "Actual Duration") AND (IsConsuming("Leave Category") AND
               (LCategory."Category Type" <> LCategory."Category Type"::Maternity)) THEN
                ERROR('%1 has %2 Consuming Leaves Remaining', EmpRec.FullName, RemLeaves);
        END;

        IF LCategory.GET("Leave Category") THEN
            CatName := UPPERCASE(LCategory.Description)
        ELSE
            CatName := '';

        ExplodeRec();

        IF LeaveRequest.GET(Leave_Request) THEN BEGIN
            LeaveRequest.Treated := TRUE;
            LeaveRequest.MODIFY;
        END;
    end;


    procedure ExplodeRec()
    begin
        IF EmpRec.GET("Employee No.") THEN
            IF CONFIRM('Are you sure you want to Register \\' +
                           '%1 day(s) %2 Leave for %3 \\' +
                           'Between %4 and %5', TRUE, "Actual Duration",
                           CatName, EmpRec.FullName, "Actual Start Date", "Actual End Date")
                       THEN BEGIN
                GenPCode.ExplodeActualLeave(Rec);
                LeavPRec2.GET("Serial No", "Employee No.", "Entry Type");
                LeavPRec2.Registered := TRUE;
            END;
    end;


    procedure IsConsuming(LCat: Code[10]): Boolean
    begin
        IF LCategory.GET(LCat) THEN
            EXIT(LCategory.Consuming)
        ELSE
            EXIT(FALSE);
    end;


    procedure RemainingLeave(): Integer
    begin
        LeavPRec.SETRANGE("Leave Period", "Leave Period");

        CALCFIELDS("Total Consuming");

        EXIT("Total Leaves Due" - "Total Consuming");
    end;


    procedure GetAmountDue()
    begin

        IF EmpRec.GET("Employee No.") THEN BEGIN
            IF ("Entry Type" = "Entry Type"::PLAN) THEN BEGIN
                BasicAmount := EmpGrpRec.GetBasic(EmpRec."Employee Group");
                "Amount Due" := (BasicAmount * 12 * 0.1);
            END
            ELSE BEGIN
                IF LCategory.GET("Leave Category") THEN
                    IF LCategory."Payment Allowed" THEN BEGIN
                        BasicAmount := EmpGrpRec.GetBasic(EmpRec."Employee Group");
                        "Amount Due" := (BasicAmount * 12 * 0.1);
                    END
                    ELSE
                        "Amount Due" := 0;
            END;
        END;
    end;


    procedure CheckTotalDuration(Cnt: Integer)
    begin
        CALCFIELDS("Total Leaves Due", "Total Compassionate", "Total Exam", "Total Others", "Total Consuming", "Total Annual");

        CASE Cnt OF
            1:
                BEGIN
                    OldTotal := xRec."No. Days1" + xRec."No. Days2" + xRec."No. Days3" + xRec."No. Days4";
                    TakenTotal := "No. Days1" + "No. Days2" + "No. Days3" + "No. Days4";
                    RemDur := "Annual Duration" - TakenTotal;
                    OldRemDur := "Annual Duration" - OldTotal;
                    IF ((RemDur < 0) AND (LCategory."Category Type" <> LCategory."Category Type"::Maternity)) THEN
                        ERROR('%1 Have %2 Leave Days Left!!', "Employee No.", OldRemDur);

                END;
            9:
                BEGIN
                    OldTotal := "Total Consuming";
                    TakenTotal := OldTotal + "Actual Duration" - xRec."Actual Duration";

                    RemDur := "Total Leaves Due" - TakenTotal;
                    OldRemDur := "Total Leaves Due" - OldTotal;

                    LCategory.GET("Leave Category");
                    IF ((RemDur < 0) AND IsConsuming("Leave Category") AND
                        (LCategory."Category Type" <> LCategory."Category Type"::Maternity)) THEN
                        ERROR('%1 Have %2 Leave Days Left!!', "Employee No.", OldRemDur);
                END;
        END;
    end;


    procedure RegPlan()
    begin
        IF Registered THEN
            ERROR('This record is already registered!')
        ELSE BEGIN
            "Total Leaves Due" := "Annual Duration";
            Registered := TRUE;
            MODIFY;
        END;
    end;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Leave Plan Lines Rev 2", "Employee No.", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

