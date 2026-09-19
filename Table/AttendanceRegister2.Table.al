table 50060 "Attendance Register 2"
{

    fields
    {
        field(1; Date; Date)
        {
        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.GET("Employee No.");
                Name := Employee.Name;
                "TnA ID" := Employee."TnA ID";
                //"Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                //"Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
            end;
        }
        field(3; Status; Option)
        {
            OptionMembers = "In Only","Out Only",Complete;
        }
        field(4; "Date In"; Date)
        {

            trigger OnValidate()
            begin
                CASE DATE2DWY("Date In", 1) OF
                    1:
                        Day := 'Monday';
                    2:
                        Day := 'Tuesday';
                    3:
                        Day := 'Wednesday';
                    4:
                        Day := 'Thursday';
                    5:
                        Day := 'Friday';
                    6:
                        Day := 'Saturday';
                    7:
                        Day := 'Sunday';
                END;

                Date := "Date In";
                PublicHoliday.SETCURRENTKEY(Date);
                PublicHoliday.SETFILTER(Date, '<=%1', Date);
                DateFound := FALSE;
                IF PublicHoliday.FIND('+') THEN
                    REPEAT
                        IF (Date >= PublicHoliday."Start Date") AND (Date <= PublicHoliday."End Date") THEN
                            DateFound := TRUE;
                    UNTIL (PublicHoliday.NEXT(-1) = 0) OR DateFound;
                IF DateFound THEN
                    "Day Type" := "Day Type"::"Public Holiday"
                ELSE BEGIN
                    IF DATE2DWY("Date In", 1) = 6 THEN
                        "Day Type" := "Day Type"::Saturday
                    ELSE
                        IF DATE2DWY("Date In", 1) = 7 THEN
                            "Day Type" := "Day Type"::Sunday
                        ELSE
                            "Day Type" := "Day Type"::"Week Day";
                END;
            end;
        }
        field(5; "Time In"; Time)
        {
        }
        field(6; "Date Out"; Date)
        {
        }
        field(7; "Time Out"; Time)
        {

            trigger OnValidate()
            begin
                TimeAttendanceSetup.GET;
                StartTime := TimeAttendanceSetup."Start Time";
                EndTime := TimeAttendanceSetup."End Time";

                //Retrieve Early In by Hours
                IF StartTime > "Time In" THEN
                    "Early In/Min" := FindTimeDiff("Date In", "Time In", "Date In", StartTime, PeriodOption::Minute);

                //Retrieve Late Clock In
                IF "Time In" > StartTime THEN
                    "Late In/Min" := FindTimeDiff("Date In", StartTime, "Date In", "Time In", PeriodOption::Minute);

                //Retrieve Early Clock Out
                IF "Time Out" > EndTime THEN
                    "Late Out/Min" := FindTimeDiff("Date Out", EndTime, "Date Out", "Time Out", PeriodOption::Minute);

                //Retrieve Late Out
                IF EndTime > "Time Out" THEN
                    "Early Out/Min" := FindTimeDiff("Date Out", "Time Out", "Date Out", EndTime, PeriodOption::Minute);

                //Retrieve Overtime Hours
                CASE "Day Type" OF
                    0:
                        "Overtime Mins" := FindTimeDiff("Date Out", EndTime, "Date Out", "Time Out", PeriodOption::Minute);

                /*
                 1: BEGIN
                      WorkDays.GET(ScheduleSetup."Working Day ID");
                      IF ((WorkDays."Saturday Overtime") OR (WorkDays."Sunday Overtime"))
                      AND ((WorkDays.Saturday) OR (WorkDays.Sunday)) THEN
                      "Overtime Mins" := FindTimeDiff("Date In","Time In","Date Out","Time Out",
                      PeriodOption::Hour) - ((ScheduleSetup."Break Time End" - ScheduleSetup."Break Time Start") / 3600000);

                      IF ((WorkDays."Saturday Overtime") OR (WorkDays."Sunday Overtime"))
                      AND ((WorkDays.Saturday<>TRUE) OR (WorkDays.Sunday<>TRUE)) THEN
                      "Overtime Mins" := FindTimeDiff("Date Out",EndTime,"Date Out","Time Out",
                      PeriodOption::Hour);
                    END;
                2: BEGIN
                     IF ScheduleSetup."PublicHoliday/OVTConsideration" = 1 THEN
                     "Overtime Mins" := FindTimeDiff("Date Out",EndTime,"Date Out","Time Out",
                     PeriodOption::Hour);

                     IF ScheduleSetup."PublicHoliday/OVTConsideration" = 2 THEN
                     "Overtime Mins" := FindTimeDiff("Date In","Time In","Date Out","Time Out",
                     PeriodOption::Hour) - ((ScheduleSetup."Break Time End" - ScheduleSetup."Break Time Start") / 3600000);
                   END;
                */
                END;

                //Retrieve Minutes Not Worked
                "Minutes Not Worked" := "Late In/Min" + "Early Out/Min";

                //Retrieve Hour at Work
                IF "Time Out" > TimeAttendanceSetup."Break Time Start" THEN
                    HoursAtWork := FindTimeDiff("Date In", "Time In", "Date Out", "Time Out",
                    PeriodOption::Minute) - ((TimeAttendanceSetup."Break Time End" - TimeAttendanceSetup."Break Time Start") / 60000)
                ELSE
                    HoursAtWork := FindTimeDiff("Date In", "Time In", "Date Out", "Time Out",
                    PeriodOption::Minute);

                IF HoursAtWork > 0 THEN
                    "Mins At Work" := HoursAtWork;

            end;
        }
        field(8; "In-Terminal ID"; Code[10])
        {
        }
        field(9; "Out-Terminal ID"; Code[10])
        {
        }
        field(10; "Early In/Min"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(11; "Late In/Min"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(12; "Early Out/Min"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(13; "Late Out/Min"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(14; "Break Time In"; Time)
        {
        }
        field(15; "Break Time Out"; Time)
        {
        }
        field(16; "Break Early By Hours"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(17; "Break Late By Hours"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(18; "Mins At Work"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(19; "Overtime Mins"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(20; "Minutes Not Worked"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(21; "Schedule Code"; Code[10])
        {
            TableRelation = "VRI Table";
        }
        field(22; "Awaiting Out"; Boolean)
        {
        }
        field(23; Close; Boolean)
        {
        }
        field(24; "TnA ID"; Integer)
        {
        }
        field(25; "Global Dimension 1 Code"; Code[10])
        {
            CaptionClass = '1,2,1';
            Editable = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(26; Cadre; Option)
        {
            Editable = false;
            OptionMembers = "Junior Staff","Senior Staff","Management Staff";
        }
        field(27; "Entry Type"; Option)
        {
            Editable = false;
            OptionMembers = Auto,Manual,"Auto-Modified";
        }
        field(28; Void; Boolean)
        {
        }
        field(29; "Day Type"; Option)
        {
            OptionCaption = 'Week Day,Saturday,Sunday,Public Holiday';
            OptionMembers = "Week Day",Saturday,Sunday,"Public Holiday";
        }
        field(30; "Payroll E/D Code"; Code[20])
        {
        }
        field(31; Shift; Integer)
        {
            Enabled = false;
        }
        field(32; "Global Dimension 2 Code"; Code[10])
        {
            CaptionClass = '1,2,2';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(33; Day; Text[30])
        {
        }
        field(34; "Attendance Status"; Option)
        {
            OptionMembers = "On Duty","Off Duty",Absent;
        }
        field(35; Processed; Boolean)
        {
            Editable = false;
        }
        field(36; Name; Text[100])
        {
        }
        field(37; "Clock Out Option"; Option)
        {
            BlankZero = true;
            OptionMembers = ,Auto,Terminal;
        }
    }

    keys
    {
        key(Key1; "Employee No.", Date)
        {
            Clustered = true;
        }
        key(Key2; Close, "Employee No.", "Day Type", "Date In", Status, "Attendance Status", Processed)
        {
            SumIndexFields = "Overtime Mins", "Mins At Work", "Minutes Not Worked";
        }
        key(Key3; "TnA ID")
        {
        }
        key(Key4; "Date In")
        {
        }
        key(Key5; "Global Dimension 1 Code")
        {
        }
        key(Key6; Date)
        {
        }
        key(Key7; "Global Dimension 1 Code", Date, "Employee No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF CurrFieldNo <> 0 THEN
            "Entry Type" := "Entry Type"::Manual;
    end;

    var
        EmployeeRec: Record "Employee Mapping";
        Employee: Record "Employee Mapping";
        PublicHoliday: Record "Holiday Calendar";
        DateRec: Record Date;
        TimeAttendanceSetup: Record "Time & Attendance  Setup";
        DateFound: Boolean;
        DayNo: Integer;
        PeriodOption: Option ,Second,Minute,Hour,Day;
        Date: Date;
        RefDate: Date;
        StartTime: Time;
        EndTime: Time;
        HoursAtWork: Decimal;
        DefaultTime: Time;

    procedure SetRecord(Rec: Record "Attendance Register 2")
    begin
        /*IF ScheduleRec.GET("Schedule Code") THEN
        ScheduleEntry.SETRANGE(ScheduleEntry."Schedule Code","Schedule Code");
        IF ScheduleEntry.FIND('-') THEN BEGIN
          CASE ScheduleRec."Periodic Shift Movement" OF
            1: RefDate := CALCDATE('+7D',ScheduleEntry."Schedule Date");
            2: RefDate := CALCDATE('+14D',ScheduleEntry."Schedule Date");
            3: RefDate := CALCDATE('+1M',ScheduleEntry."Schedule Date");
            4: RefDate := CALCDATE('+1Y',ScheduleEntry."Schedule Date");
          END;
        SETrange("Date In",ScheduleEntry."Schedule Date",RefDate);
        END;
         */

    end;

    procedure FindTimeDiff(Date1: Date; Time1: Time; Date2: Date; Time2: Time; PeriodOption: Option " ",Second,Minute,Hour,Day) TimeDiffinPeriod: Integer
    var
        NoOfDaysDiff: Integer;
    begin
        TimeDiffinPeriod := 0;
        IF (Date1 = 0D) OR (Date2 = 0D) OR (Date2 < Date1) THEN
            EXIT;
        IF (Date1 = Date2) AND (Time2 < Time1) THEN
            EXIT;

        NoOfDaysDiff := Date2 - Date1;
        CASE PeriodOption OF
            1:
                TimeDiffinPeriod := ROUND((Time2 - Time1) / 1000, 1, '=') + NoOfDaysDiff * 86400;
            2:
                TimeDiffinPeriod := ROUND((Time2 - Time1) / 60000, 1, '=') + NoOfDaysDiff * 1440;
            3:
                TimeDiffinPeriod := ROUND((Time2 - Time1) / 3600000, 1, '=') + NoOfDaysDiff * 24;
            4:
                TimeDiffinPeriod := ROUND((Time2 - Time1) / 86400000, 1, '=') + NoOfDaysDiff * 1;
        END;
    end;
}

