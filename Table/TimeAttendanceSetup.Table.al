table 50042 "Time & Attendance  Setup"
{
    /*  DrillDownPageID = 50459;
     LookupPageID = 50459; */

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Default Schedule Code"; Code[10])
        {
            TableRelation = "VRI Table";
        }
        field(3; "Max. Overtime Allowed Per Week"; Decimal)
        {
            BlankNumbers = BlankZero;
        }
        field(4; "Max.Overtime Allowed per Month"; Decimal)
        {
            BlankNumbers = BlankZero;
        }
        field(5; "Method of Overtime Calculation"; Option)
        {
            BlankNumbers = BlankZero;
            OptionMembers = ,Weekly,Monthly;
        }
        field(6; "Schedule Daily"; Boolean)
        {
        }
        field(7; "Create Exception Entry"; Boolean)
        {
        }
        field(8; "Frequency Of Payment"; Option)
        {
            OptionCaption = 'Monthly,Bi-Weekly,Weekly';
            OptionMembers = Monthly,"Bi-Weekly",Weekly;
        }
        field(9; "Base Starting Date"; Date)
        {
        }
        field(10; "Employee ID Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(11; "Temporary File Dir."; Text[250])
        {
        }
        field(12; "Month Begin"; Integer)
        {
        }
        field(13; "Month End"; Integer)
        {
        }
        field(14; "Default Terminal ID"; Code[20])
        {
            TableRelation = "Terminal Informations";
        }
        field(15; "Last Date Processed"; Date)
        {
            Description = 'This is to disallow Processing of any open entries or modify of attendance register on or before the specified date';
        }
        field(16; "Overtime Application"; Option)
        {
            OptionCaption = 'Payroll Variable,Payroll Payslip';
            OptionMembers = "Payroll Variable","Payroll Payslip";
        }
        field(17; "Long Shift Work Hour"; Integer)
        {
            BlankZero = true;
        }
        field(18; "Start Time"; Time)
        {
        }
        field(19; "End Time"; Time)
        {
        }
        field(20; "Break Time Start"; Time)
        {
        }
        field(21; "Break Time End"; Time)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Start Time");
                TESTFIELD("End Time");
                /*IF ("Break Time Start" = 0T) OR ("Break Time Start" > "Break Time End") THEN
                  ERROR('Please ensure Break Time Start is entered correctly \ before you enter Break Time End');
                "Break Hours" := (("Break Time End" - "Break Time Start") / 3600000);
                
                ScheduleSetup.GET("Schedule Code");
                IF "Spans New Day" THEN
                  BEGIN
                    Date1 := WORKDATE;
                    Date2 := Date1 +1;
                    "Daily Hours" := CalculateTime.FindTimeDiff(Date1,"Start Time",Date2,"End Time",PeriodOption::Hour);
                  END ELSE
                "Daily Hours" := (("End Time" - "Start Time") / 3600000) - "Break Hours";
                 */

            end;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
        key(Key2; "Employee ID Nos")
        {
        }
    }

    fieldgroups
    {
    }
}

