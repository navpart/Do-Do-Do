table 50047 "Appointment Scheduling"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Scheduling Code"; Code[10])
        {
        }
        field(3; "Schedule Date"; Date)
        {
            NotBlank = true;
        }
        field(4; "Technician Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*   IF ResRec.GET("Technician Code") THEN
                     BEGIN
                      "Technician Name" := ResRec.Name;
                      ResCapEntry.SETRANGE(ResCapEntry."Resource No.","Technician Code");
                      ResCapEntry.SETRANGE(ResCapEntry.Date,"Customer's Preferred Date");
                      IF ResCapEntry.FINDFIRST THEN
                      "Man Hour Per Day" := ResCapEntry.Capacity;
                     END;

                  VALIDATE("Date Filter"); */
            end;
        }
        field(5; "Technician Name"; Text[30])
        {
        }
        field(6; "Daily Man Hour"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(7; "Time Bucket"; Decimal)
        {
        }
        field(8; "Total Hours"; Decimal)
        {
            CalcFormula = Sum("Res. Capacity Entry".Capacity WHERE(Date = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(9; "Job Type"; Option)
        {
            OptionCaption = ' ,PMS A,PMS B';
            OptionMembers = " ","PMS A","PMS B";
        }
        field(10; "Hours Left"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(11; "No of Jobs"; Code[10])
        {
        }
        field(12; "Job Category"; Option)
        {
            OptionCaption = ' ,Diag,EE,PM,Any';
            OptionMembers = " ",Diag,EE,PM,Any;
        }
        field(13; "Carry Over"; Decimal)
        {
        }
        field(14; "Other Info"; Text[30])
        {
        }
        field(15; "Hours Consumed"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE(Date = FIELD("Date Filter"),
                                                            Technician = FIELD("Resource Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;

            trigger OnValidate()
            begin
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(17; "Resource Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(134; "Technician Code N"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*IF "Technician Code" <> xRec."Technician Code" THEN
                BEGIN
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,xRec."Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,xRec."Customer's Preferred Date");
                HourSlotInfo.SETRANGE(HourSlotInfo."Appointment No.",xRec."Customer Order Form No.");
                IF HourSlotInfo.FINDFIRST THEN
                    HourSlotInfo.DELETEALL;
                END;
                
                IF ResRec.GET("Technician Code") THEN
                   BEGIN
                    "Technician Name" := ResRec.Name;
                    "Man Hour Per Day" := ResRec."Man Hour Per Day";
                   END;
                
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FIND('-') THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                */
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";

            end;
        }
        field(135; "Technician Name N"; Text[30])
        {
        }
        field(136; "Customer's Preferred Date"; Date)
        {
        }
        field(137; "Customer's Preferred Time"; Time)
        {
        }
        field(138; "Man Hour Per Day"; Integer)
        {
            TableRelation = "Res. Capacity Entry".Capacity WHERE(Date = FIELD("Customer's Preferred Date"));

            trigger OnValidate()
            begin
                "Remaining Hours" := "Man Hour Per Day" - ("Appointment Allocated Hr") - ("Walk-In Allocated Hr");
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(142; "Remaining Hours"; Decimal)
        {
        }
        field(143; "Total Appointment Time"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(144; "Total Rem Appt Time"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(145; "Total Walk in Time"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(146; "Total Rem W/I Time"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(151; "Appointment Allocated Hr"; Decimal)
        {
            /* CalcFormula = Sum("Hour Slot Info".Hours WHERE("Walk-In" = CONST(false),
                                                            Date = FIELD("Date Filter"),
                                                            Technician = FIELD("Resource Filter")));
            FieldClass = FlowField; */

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(152; "Walk-In Allocated Hr"; Decimal)
        {
            /* CalcFormula = Sum("Hour Slot Info".Hours WHERE(Date = FIELD("Customer's Preferred Date"),
                                                            "Walk-In" = CONST(true),
                                                            Technician = FIELD("Technician Code")));
            FieldClass = FlowField; */

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(153; "Total Hour Available 4 day"; Decimal)
        {
            CalcFormula = Sum("Res. Capacity Entry".Capacity WHERE(Date = FIELD("Customer's Preferred Date")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                IF "Total Appointment Time" > 0 THEN
                    "Total Rem Appt Time" := "Total Appointment Time" - "Appointment Allocated Hr";
                IF "Total Walk in Time" > 0 THEN
                    "Total Rem W/I Time" := "Total Walk in Time" - "Walk-In Allocated Hr";
                IF ("Date Filter" <> 0D) OR ("Resource Filter" <> '') THEN
                    "Hours Left" := "Daily Man Hour" - "Hours Consumed";
            end;
        }
        field(154; "Walk-In"; Boolean)
        {
        }
        field(155; Remaining; Decimal)
        {
            //TableRelation = "Hour Slot Info"."Hours Remaining" WHERE(Technician = FIELD("Technician Code"));
        }
        field(156; "COF No."; Code[10])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";

            trigger OnValidate()
            begin
                /*   IF COFRec.GET("COF No.") THEN BEGIN
                      "Service Duration" := COFRec."Estimated Job Time";
                      "Customer's Preferred Date" := COFRec."Reception Date";
                      "Customer's Preferred Time" := COFRec."Reception Time";
                      "Veh Reg No." := COFRec."Vehicle Registration No.";
                  END; */
            end;
        }
        field(157; "Service Duration"; Decimal)
        {
        }
        field(158; "Starting Hour"; Code[10])
        {
            TableRelation = "Hour Slot".Code;

            trigger OnValidate()
            begin
                /* TESTFIELD("COF No.");
                IF xRec."Starting Hour" <> '' THEN BEGIN
                    HourSlotInfo1.SETRANGE(HourSlotInfo1.Technician, "Technician Code");
                    HourSlotInfo1.SETRANGE(HourSlotInfo1.Date, "Customer's Preferred Date");
                    IF HourSlotInfo1.FINDFIRST THEN
                        HourSlotInfo1.DELETEALL;
                    Hrrec := '';
                END;
 */
                /*   IF HourSlot.GET("Starting Hour") THEN BEGIN
                      Hrrec := "Starting Hour";
                      FOR J := 1 TO ("Service Duration" * 2) DO BEGIN
                          HourSlotInfo.INIT;
                          HourSlotInfo.VALIDATE(HourSlotInfo."Hour Slot", Hrrec);
                          HourSlotInfo.VALIDATE(HourSlotInfo.Technician, "Technician Code");
                          HourSlotInfo.VALIDATE(HourSlotInfo."COF No.", "COF No.");
                          HourSlotInfo."Walk-In" := "Walk-In";
                          HourSlotInfo.Date := "Customer's Preferred Date";
                          IF HourSlot."Duration Units" = HourSlot."Duration Units"::Hours THEN
                              HourSlotInfo.Hours := HourSlot."Slot Duration"
                          ELSE
                              HourSlotInfo.Hours := HourSlot."Slot Duration" / 60;
                          HourSlotInfo.INSERT;
                          HourSlot.NEXT;
                          Hrrec := HourSlot.Code;
                      END;
                      "Ending Hour" := Hrrec;
                  END; */
            end;
        }
        field(159; "Ending Hour"; Code[10])
        {
            TableRelation = "Hour Slot".Code;
        }
        field(160; "Veh Reg No."; Code[20])
        {
            TableRelation = "Service Item"."No.";
        }
        field(161; "Total No. of Resouces"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Technician Code", "Schedule Date")
        {
            SumIndexFields = "Daily Man Hour";
        }
        key(Key2; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /* IF "Entry No" = 0 THEN
            "Entry No" := "GetEntryNo."; */
    end;

    var
        ResRec: Record Resource;
        /*     HourSlotInfo1: Record "50049";
            HourSlotInfo: Record "50049";
            Hrrec: Code[10];
            HourSlot: Record "50048";
            J: Integer;
            COFRec: Record "50119"; */
        ResCapEntry: Record "Res. Capacity Entry";


  /*   procedure "GetEntryNo."(): Integer
    var
        AppointmentScheduling: Record "50047";
    begin
        AppointmentScheduling.SETCURRENTKEY("Entry No");
        IF AppointmentScheduling.FIND('+') THEN
            EXIT(AppointmentScheduling."Entry No" + 1)
        ELSE
            EXIT(1)
    end; */
}

