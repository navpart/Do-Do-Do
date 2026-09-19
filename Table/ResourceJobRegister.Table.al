table 50055 "Resource Job Register"
{
    DataCaptionFields = "COF No.";

    fields
    {
        field(1; "COF No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE(Delivered = filter(false));
        }
        field(2; "Job Date"; Date)
        {
        }
        field(3; Technician; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET(Technician) THEN BEGIN
                    "Technician Name" := ResRec.Name;
                    ResCapEntry.SETRANGE(ResCapEntry."Resource No.", Technician);
                    ResCapEntry.SETRANGE(ResCapEntry.Date, "Job Date");
                    IF ResCapEntry.FINDFIRST THEN
                        "Daily Man Hour" := ResCapEntry.Capacity;
                END;
            end;
        }
        field(4; "Technician Name"; Text[30])
        {
        }
        field(5; "Start Time"; Time)
        {
            NotBlank = true;
        }
        field(6; Duration; Decimal)
        {
        }
        field(7; "End Time"; Time)
        {
        }
        field(8; "Daily Man Hour"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(9; "Walk-In"; Boolean)
        {
        }
        field(10; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(11; "Technician Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Resource;
        }
        field(12; "Veh Reg No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "COF No.")
        {
        }
        key(Key2; Technician, "Job Date")
        {
            Clustered = true;
            SumIndexFields = Duration;
        }
        key(Key3; "Job Date")
        {
        }
        key(Key4; "Veh Reg No.", "Start Time")
        {
        }
        key(Key5; "Start Time", Duration)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        HourSlotInfo: Record 50049;
    begin
    end;

    var
        HourSlot: Record 50048;
        ResRec: Record 156;
        ResCapEntry: Record 160;
}

