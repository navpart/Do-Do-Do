table 50049 "Hour Slot Info"
{
    DataCaptionFields = "COF No.";

    fields
    {
        field(1; "COF No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE(Delivered = filter(false));

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(3; "Hour Slot"; Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF HourSlot.GET("Hour Slot") THEN BEGIN
                    IF HourSlot."Duration Units" = HourSlot."Duration Units"::Hours THEN
                        Hours := HourSlot."Slot Duration"
                    ELSE
                        Hours := HourSlot."Slot Duration" / 60;
                    "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                END;
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(4; Hours; Decimal)
        {
        }
        field(5; Date; Date)
        {

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(6; Technician; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET(Technician) THEN
                    "Technician Name" := ResRec.Name;
            end;
        }
        field(7; "Technician Name"; Text[30])
        {
        }
        field(8; "Daily Man Hour"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            InitValue = 8;

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(9; "Hours Consumed"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE(Date = FIELD(Date),
                                                            Technician = FIELD(Technician),
                                                            "COF No." = FIELD("COF No.")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            MaxValue = 8;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(10; "Hours Remaining"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                "Hours Remaining" := "Daily Man Hour" - "Hours Consumed";
                IF "Hours Consumed" > "Daily Man Hour" THEN
                    Overbooked := TRUE
                ELSE
                    Overbooked := FALSE;
            end;
        }
        field(11; Overbooked; Boolean)
        {
        }
        field(12; "Walk-In"; Boolean)
        {
        }
        field(13; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(14; "Technician Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Resource;
        }
        field(15; "Veh Reg No."; Code[20])
        {
        }
        field(16; "Service Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Technician, Date, "Hour Slot")
        {
        }
        key(Key2; "COF No.", "Hour Slot", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Hours;
        }
        key(Key3; "Line No.")
        {
        }
        key(Key4; "Walk-In", Date)
        {
            SumIndexFields = Hours;
        }
        key(Key5; Date, Technician)
        {
            SumIndexFields = "Hours Remaining";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        HourSlotInfo: Record "Hour Slot Info";
    begin
        HourSlotInfo.SETCURRENTKEY("Line No.");
        IF HourSlotInfo.FIND('+') THEN
            "Line No." := HourSlotInfo."Line No." + 1
        ELSE
            "Line No." := 1;
    end;

    var
        HourSlot: Record "Hour Slot";
        ResRec: Record Resource;
}

