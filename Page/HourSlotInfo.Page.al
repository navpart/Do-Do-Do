page 50353 "Hour Slot Info"
{
    PageType = Card;
    SourceTable = "Hour Slot Info";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("Hour Slot"; Rec."Hour Slot")
                {
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field("Walk-In"; Rec."Walk-In")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Daily Man Hour"; Rec."Daily Man Hour")
                {
                }
                field("Hours Consumed"; Rec."Hours Consumed")
                {
                }
                field("Hours Remaining"; Rec."Hours Remaining")
                {
                }
                field(Overbooked; Rec.Overbooked)
                {
                }
                field(Hours; Rec.Hours)
                {
                }
            }
            group("Booking Changes")
            {
                Caption = 'Booking Changes';
                field(COFNo2; COFNo2)
                {
                    Caption = 'Old COF No.';
                    TableRelation = "Customer Order Table." WHERE("Service Type" = FILTER('General Workshop'));

                    trigger OnValidate()
                    begin
                        IF COFRec.GET(COFNo2) THEN
                            Details2 := COFRec."Job Details"
                        ELSE
                            Details2 := '';
                    end;
                }
                field(Details2; Details2)
                {
                    Caption = 'Old Job Details';
                }
                field(StartDate2; StartDate2)
                {
                    Caption = 'Old Start Date';
                }
                field(StartTime2; StartTime2)
                {
                    Caption = 'Old Start Time';
                    TableRelation = "Hour Slot";
                }
                field(COFNo; COFNo)
                {
                    Caption = 'New COF No.';
                    TableRelation = "Customer Order Table." WHERE("Service Type" = FILTER('General Workshop'));

                    trigger OnValidate()
                    begin
                        IF COFRec.GET(COFNo) THEN
                            Details := COFRec."Job Details"
                        ELSE
                            Details := '';
                    end;
                }
                field(Details; Details)
                {
                    Caption = 'New Job Details';
                }
                field(StartDate; StartDate)
                {
                    Caption = 'New Start Date';
                }
                field(StartTime; StartTime)
                {
                    Caption = 'New Start Time';
                    TableRelation = "Hour Slot";
                }
                field(Tech2; Tech2)
                {
                    Caption = 'Old Technician';
                    TableRelation = Resource;

                    trigger OnValidate()
                    begin
                        IF ResRec.GET(Tech2) THEN
                            TechName2 := ResRec.Name
                        ELSE
                            TechName2 := '';
                    end;
                }
                field(TechName2; TechName2)
                {
                    Caption = 'Old Technician Name';
                }
                field(Tech; Tech)
                {
                    Caption = 'New Technician';
                    TableRelation = Resource;

                    trigger OnValidate()
                    begin
                        IF ResRec.GET(Tech) THEN
                            TechName := ResRec.Name
                        ELSE
                            TechName := '';
                    end;
                }
                field(TechName; TechName)
                {
                    Caption = 'New Technician Name';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Update)
            {
                Caption = 'Update';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    BreakCount: Integer;
                    HourSlotInfo2: Record 50049;
                begin
                    ServAppSch.SETRANGE(ServAppSch."Service Item", Rec."Veh Reg No.");
                    ServAppSch.SETRANGE(ServAppSch."Service Code", Rec."Service Code");
                    IF ServAppSch.FINDLAST THEN BEGIN
                        ServSlot := ServAppSch."Service Slot";
                        DailyHour := ServAppSch."Man Hour Per Day";
                        StartSlot := ServAppSch."Starting Hour";
                        EndSlot := ServAppSch."Ending Hour";
                        VehRegNo := ServAppSch."Service Item";
                        ServiceCode := ServAppSch."Service Code";
                        COFn := ServAppSch."Customer Order Form No.";
                        JobType := ServAppSch.Teams;
                    END;
                    //MESSAGE('They are %1,%2,%3,%4',ServSlot,DailyHour,StartSlot,EndSlot);


                    HourSlotInfo2.SETRANGE(HourSlotInfo2."COF No.", COFNo2);
                    HourSlotInfo2.SETRANGE(HourSlotInfo2.Technician, Tech2);
                    HourSlotInfo2.SETRANGE(HourSlotInfo2.Date, StartDate2);
                    HourSlotInfo2.SETRANGE(HourSlotInfo2."Hour Slot", StartSlot, EndSlot);
                    IF HourSlotInfo2.FINDSET THEN
                        HourSlotInfo2.DELETEALL
                    ELSE
                        ERROR('No Job with COF No. %1 Assigned to %2 on %3 at %4', COFNo2, TechName2, StartDate2, StartTime2);

                    IF HourSlot.GET(StartTime) THEN BEGIN
                        FOR J := 1 TO (ServSlot) DO BEGIN
                            IF HourSlot."Break" THEN BEGIN
                                HourSlot.NEXT(1);
                                Hrrec := HourSlot.Code;
                            END;
                            HourSlotInfo.INIT;
                            HourSlotInfo.VALIDATE(HourSlotInfo."Hour Slot", HourSlot.Code);
                            HourSlotInfo.VALIDATE(HourSlotInfo.Technician, Tech);
                            HourSlotInfo.VALIDATE(HourSlotInfo."COF No.", COFNo);
                            HourSlotInfo.VALIDATE(HourSlotInfo.Date, StartDate);
                            HourSlotInfo.VALIDATE(HourSlotInfo."Date Filter", StartDate);
                            ResCapEntry.SETRANGE(ResCapEntry."Resource No.", Tech);
                            ResCapEntry.SETRANGE(ResCapEntry.Date, StartDate);
                            IF ResCapEntry.FINDFIRST THEN
                                HourSlotInfo."Daily Man Hour" := ResCapEntry.Capacity;
                            HourSlotInfo."Walk-In" := Rec."Walk-In";
                            HourSlotInfo."Veh Reg No." := VehRegNo;
                            HourSlotInfo."Service Code" := ServiceCode;
                            HourSlotInfo.VALIDATE(HourSlotInfo."Daily Man Hour", DailyHour);
                            HourSlotInfo.INSERT;
                            IF J <> ServSlot THEN
                                HourSlot.NEXT;
                            Hrrec := HourSlot.Code;
                        END;
                        EndingTime := HourSlot.Code;
                    END;
                    ServAppSch."Technician Code" := Tech;
                    ServAppSch."Starting Hour" := StartTime;
                    ServAppSch."Ending Hour" := EndingTime;
                    ServAppSch.MODIFY;

                    AppScheduling2.SETRANGE(AppScheduling2."Technician Code", Tech);
                    AppScheduling2.SETRANGE(AppScheduling2."Schedule Date", StartDate);
                    IF AppScheduling2.FINDLAST THEN
                        EXIT
                    ELSE
                        //GenScheduleCard;
                        AppScheduling.INIT;
                    AppScheduling."Entry No" += 1;
                    AppScheduling.VALIDATE(AppScheduling."Technician Code", Tech);
                    AppScheduling."Technician Name" := TechName;
                    AppScheduling."Schedule Date" := StartDate;
                    AppScheduling."Daily Man Hour" := 8;
                    AppScheduling."Veh Reg No." := VehRegNo;
                    AppScheduling."COF No." := COFNo2;
                    AppScheduling."Job Type" := JobType;
                    AppScheduling.INSERT(TRUE);
                end;
            }
        }
    }

    var
        StartDate: Date;
        StartDate2: Date;
        StartTime: Code[10];
        StartTime2: Code[10];
        Tech: Code[20];
        Tech2: Code[20];
        TechName: Text[30];
        TechName2: Text[30];
        ResRec: Record "Resource";
        HourSlot: Record "Hour Slot";
        HourSlotInfo: Record 50049;
        HourSlotInfo2: Record 50049;
        COFNo: Code[20];
        Details: Text[250];
        COFNo2: Code[20];
        Details2: Text[250];
        COFRec: Record 50119;
        ServAppSch: Record 50114;
        ServSlot: Decimal;
        J: Decimal;
        "LineNo.": Integer;
        Hrrec: Code[10];
        AppScheduling: Record 50047;
        AppScheduling2: Record 50047;
        "AppSSC/SC": Record "Appointment SSC/SC";
        ResCapEntry: Record "Res. Capacity Entry";
        DailyHour: Decimal;
        EndingTime: Code[10];
        StartSlot: Code[10];
        EndSlot: Code[10];
        VehRegNo: Code[20];
        ServiceCode: Code[20];
        JobType: Option " ",QS,"PMS A","PMS B","Running Repair",Body,Diagnosis;
        COFn: Code[20];
}

