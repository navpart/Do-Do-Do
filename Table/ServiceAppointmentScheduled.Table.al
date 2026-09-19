table 50114 "Service Appointment Scheduled"
{

    fields
    {
        field(1; "Service Item"; Code[20])
        {
            Description = 'Could be Registeration No. of the Vehicle';
            TableRelation = "Service Item"."No.";

            trigger OnValidate()
            begin
                ServRec.GET("Service Item");
                "Engine No." := ServRec."Engine No.";
                "Chasis No." := ServRec."Chasis No.";
                "Model Code" := ServRec."Model No.";
                "Model Year" := ServRec."Model Year";
                VALIDATE("Customer No.", ServRec."Customer No.");
                "Contact Person" := ServRec."User Person";
                "Phone No 1." := ServRec.Business;
                "Phone No. 2." := ServRec.Mobile;
                "E-Mail" := ServRec."User Email";
                "First Call Date" := TODAY;
                "First Call No." := ServRec.Business;
                "First Call Contact" := ServRec."User Person";
                FARec.SETFILTER(FARec."No.", '<>%1', '');
                FARec.SETRANGE(FARec."Registration No.", "Service Item");
                IF FARec.FINDFIRST THEN
                    VALIDATE("Fixed Asset No.", FARec."No.");

                ServHeader.SETCURRENTKEY("Vehicle Registration No.", "Reception Date");
                ServHeader.SETRANGE(ServHeader."Vehicle Registration No.", "Service Item");
                ServHeader.SETFILTER(ServHeader.Posted, '%1', TRUE);
                IF ServHeader.FINDLAST THEN BEGIN
                    i := ServHeader.COUNT;
                    "Job No.1" := ServHeader."No.";
                    Odometer1 := ServHeader."Odometer Reading Reception";
                    Date1 := ServHeader."Reception Date";
                    "Job Description1" := COPYSTR(ServHeader."Job Details", 1, MAXSTRLEN("Job Description1"));
                END
                ELSE BEGIN
                    "Job No.1" := '';
                    Odometer1 := 0;
                    Date1 := 0D;
                    "Job Description1" := '';
                END;

                IF i > 1 THEN BEGIN
                    ServHeader.NEXT := -1;
                    "Job No.2" := ServHeader."No.";
                    Odometer2 := ServHeader."Odometer Reading Reception";
                    Date2 := ServHeader."Reception Date";
                    "Job Description2" := COPYSTR(ServHeader."Job Details", 1, MAXSTRLEN("Job Description2"));
                END
                ELSE BEGIN
                    "Job No.2" := '';
                    Odometer2 := 0;
                    Date2 := 0D;
                    "Job Description2" := '';
                END;

                IF i > 2 THEN BEGIN
                    ServHeader.NEXT := -1;
                    "Job No.3" := ServHeader."No.";
                    Odometer3 := ServHeader."Odometer Reading Reception";
                    Date3 := ServHeader."Reception Date";
                    "Job Description3" := COPYSTR(ServHeader."Job Details", 1, MAXSTRLEN("Job Description3"));
                END
                ELSE BEGIN
                    "Job No.3" := '';
                    Odometer3 := 0;
                    Date3 := 0D;
                    "Job Description3" := '';
                END;


                IF "Chasis No." <> '' THEN BEGIN
                    VDS := COPYSTR("Chasis No.", 1, 8);
                    VMI := COPYSTR("Chasis No.", 9, 3);
                    VIS := COPYSTR("Chasis No.", 12, 6);
                END;
            end;
        }
        field(2; "Service Code"; Code[20])
        {
            Description = 'Main Service required e.g 10000km service,20000KM';
            TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model Code"));

            trigger OnValidate()
            begin
                ServRec.SETCURRENTKEY("No.");
                ServRec.GET("Service Item");
                FaultRec.SETCURRENTKEY("Operation Code", "Model No.");
                FaultRec.GET("Service Code", ServRec."Model No.");
                Description := FaultRec.Description;
                "Service Expected Duration" := FaultRec."Duration In Hours";
                "Service Slot" := FaultRec."Duration In Hours" * 2;
                "Service Due Kilometer" := FaultRec."Service KM";
                //VALIDATE("Chasis No.",ServRec."Chasis No.");
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Service Due Projected Date"; Date)
        {

            trigger OnValidate()
            begin
                /*"Next Call Date." := CALCDATE('-10D',"Service Due Projected Date");
                RetDay := DATE2DWY("Next Call Date.",1);
                CASE RetDay OF
                    6:  "Next Call Date." := CALCDATE('2D',"Next Call Date.");
                    7:  "Next Call Date." := CALCDATE('1D',"Next Call Date.");
                END;
                */

            end;
        }
        field(5; "Service Date"; Date)
        {
        }
        field(6; "Service Due Kilometer"; Integer)
        {
        }
        field(7; "Serviced Kilometer"; Integer)
        {
        }
        field(8; Serviced; Boolean)
        {
        }
        field(9; Remark; Text[50])
        {
        }
        field(10; "Service Expected Duration"; Decimal)
        {

            trigger OnValidate()
            begin
                "Service Slot" := "Service Expected Duration" * 2;
            end;
        }
        field(11; "Contact Person"; Text[50])
        {
        }
        field(12; "Phone No 1."; Code[20])
        {
        }
        field(13; "Phone No. 2."; Code[20])
        {
        }
        field(14; "Phone No. 3 (GSM)."; Code[20])
        {
        }
        field(15; "E-Mail"; Text[100])
        {
        }
        field(16; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF Custrec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := COPYSTR(Custrec.Name, 1, MAXSTRLEN("Customer Name"));
                    Address := COPYSTR(Custrec.Address, 1, MAXSTRLEN(Address));
                END
                ELSE BEGIN
                    "Customer Name" := '';
                    Address := '';
                END;
            end;
        }
        field(17; "Appointment Status"; Option)
        {
            OptionCaption = ' ,Approved,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Approved,"Call Back","Call Again","We are not Ready";
        }
        field(18; "First Call Date"; Date)
        {
        }
        field(19; "First Call No."; Code[20])
        {
        }
        field(20; "First Call Contact"; Text[50])
        {
        }
        field(21; "First Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                /*IF "First Call Response" = "First Call Response"::Confirmed THEN
                VALIDATE("Next Call Date.",(CALCDATE('-3D',"Reception Date")));
                */

            end;
        }
        field(22; "Repeat Call Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "First Call Date" <> "Repeat Call Date" THEN BEGIN
                    IF ("Repeat Call Date" <> 0D) AND ("Repeat Call Date" <> "Next Call Date.") THEN
                        "Last Call Date" := "Next Call Date.";
                END;
            end;
        }
        field(23; "Repeat Call No."; Code[20])
        {
        }
        field(24; "Repeat Call Contact"; Text[50])
        {
        }
        field(25; "Repeat Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                /*IF "Repeat Call Response" = "Repeat Call Response"::Confirmed THEN
                VALIDATE("Next Call Date.",(CALCDATE('-3D',"Reception Date")));
                */

            end;
        }
        field(26; "Last Call Date"; Date)
        {
        }
        field(27; "Last Call No."; Code[20])
        {
        }
        field(28; "Last Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                /*IF "Last Call Response" = "Last Call Response"::Confirmed THEN
                VALIDATE("Next Call Date.",(CALCDATE('-3D',"Reception Date")));
                */

            end;
        }
        field(29; "Last Call Contact"; Text[50])
        {
        }
        field(30; "Expected Reception Date"; Date)
        {

            trigger OnValidate()
            begin
                /*IF "First Call Response" = 0 THEN BEGIN
                "Next Call Date." := CALCDATE('-10D',"Reception Date");
                RetDay := DATE2DWY("Next Call Date.",1);
                CASE RetDay OF
                    6:  "Next Call Date." := CALCDATE('2D',"Next Call Date.");
                    7:  "Next Call Date." := CALCDATE('1D',"Next Call Date.");
                END;
                END;
                */

            end;
        }
        field(31; "Engine No."; Code[20])
        {
        }
        field(32; "Chasis No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Chasis No." <> '' THEN BEGIN
                    VDS := COPYSTR("Chasis No.", 1, 8);
                    VMI := COPYSTR("Chasis No.", 9, 3);
                    VIS := COPYSTR("Chasis No.", 12, 6);
                END;
                "SSC/SC".SETRANGE("SSC/SC".VDS, VDS);
                "SSC/SC".SETRANGE("SSC/SC".VMI, VMI);
                "SSC/SC".SETFILTER("SSC/SC"."Range From", '<=%1', VIS);
                "SSC/SC".SETFILTER("SSC/SC"."Range To", '>=%1', VIS);
                "SSC/SC".SETFILTER("SSC/SC"."SSC/SC Date From", '<=%1', TODAY);
                "SSC/SC".SETFILTER("SSC/SC"."SSC/SC Date To", '>=%1', TODAY);
                "SSC/SC".SETRANGE("SSC/SC"."SCSC Status", "SSC/SC"."SCSC Status"::Active);
                "SSC/SC".SETRANGE("SSC/SC".Applied, FALSE);
                IF "SSC/SC".FINDFIRST THEN
                    REPEAT
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."SSC/SC Code", "SSC/SC"."SSC/SC Code");
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Line No.", "SSC/SC"."Line No.");
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Service Item Code", "Service Item");
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Fault Code", "Service Code");
                        IF "AppSSC/SC2".FINDLAST THEN
                            EXIT
                        ELSE
                            "AppSSC/SC".INIT;
                        "AppSSC/SC"."SSC/SC Code" := "SSC/SC"."SSC/SC Code";
                        "AppSSC/SC"."Line No." := "SSC/SC"."Line No.";
                        "AppSSC/SC"."Service Item Code" := "Service Item";
                        "AppSSC/SC"."Fault Code" := "Service Code";
                        "AppSSC/SC"."SSC/SC Date From" := "SSC/SC"."SSC/SC Date From";
                        "AppSSC/SC"."SSC/SC Date To" := "SSC/SC"."SSC/SC Date To";
                        "AppSSC/SC"."Issue Date" := "SSC/SC"."Issue Date";
                        "AppSSC/SC"."SCSC Status" := "SSC/SC"."SCSC Status";
                        "AppSSC/SC"."SSC/SC Description" := "SSC/SC"."SSC/SC Description";
                        "AppSSC/SC".Applied := "SSC/SC".Applied;
                        "AppSSC/SC"."Model No." := "SSC/SC"."Model No.";
                        "AppSSC/SC"."C/I No" := "SSC/SC"."C/I No";
                        "AppSSC/SC".VDS := "SSC/SC".VDS;
                        "AppSSC/SC".VIS := VIS;
                        "AppSSC/SC".VMI := "SSC/SC".VMI;
                        "AppSSC/SC"."Range From" := "SSC/SC"."Range From";
                        "AppSSC/SC"."Range To" := "SSC/SC"."Range To";
                        "AppSSC/SC".INSERT;
                    UNTIL "SSC/SC".NEXT = 0;
            end;
        }
        field(33; "Model Code"; Code[20])
        {
        }
        field(34; "Contact E-Mail"; Text[50])
        {
        }
        field(35; "Response Action"; Option)
        {
            OptionCaption = ' ,Appointment Confirmed,Appointment Rescheduled,Appointment Cancled';
            OptionMembers = " ","Appointment Confirmed","Appointment Rescheduled","Appointment Cancled";
        }
        field(36; "Call Type"; Option)
        {
            OptionCaption = ' ,Confirm of Appt.,Maintenance Reminder,Appt. Booking';
            OptionMembers = " ","Confirm of Appt.","Maintenance Reminder","Appt. Booking";
        }
        field(37; "Schedule Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(38; "Next Call Date."; Date)
        {

            trigger OnValidate()
            begin
                RetDay := DATE2DWY("Next Call Date.", 1);
                CASE RetDay OF
                    //6:  "Next Call Date." := CALCDATE('2D',"Next Call Date.");
                    7:
                        "Next Call Date." := CALCDATE('1D', "Next Call Date.");
                END;

                IF ("Next Call Date." <> "First Call Date") AND ("Repeat Call Date" <> "Next Call Date.") THEN
                    "Last Call Date" := "Next Call Date.";
            end;
        }
        field(39; "Appointment No."; Code[20])
        {
        }
        field(40; "Additional Jobs"; Text[250])
        {
        }
        field(41; "Send Appointment Message"; Boolean)
        {

            /*  trigger OnValidate()
             begin
                 Mailsent := mailgenerator.NewMessage("E-Mail", "Contact E-Mail", Subject, STRSUBSTNO(Text0001, "Service Item", "Service Code",
                 "Expected Reception Date"), Attachment, '', FALSE);
             end; */
        }
        field(42; "Send Appointment Reminder"; Boolean)
        {

            /*  trigger OnValidate()
             begin
                 Mailsent := mailgenerator.NewMessage("E-Mail", "Contact E-Mail", Subject, STRSUBSTNO(Text0002, "Service Item", "Service Code",
                 "Expected Reception Date"), Attachment, '', FALSE);
             end; */
        }
        field(43; "Customer Order Form No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(44; "Customer Order Form Date"; Date)
        {
        }
        field(45; "Customer Name"; Text[30])
        {
        }
        field(46; Address; Text[30])
        {
        }
        field(47; "Model Year"; Integer)
        {
        }
        field(48; "Key Assigned No."; Code[20])
        {
        }
        field(58; "Appointment Offering 1 Date"; Date)
        {
        }
        field(59; "Appointment Offering 1 Time"; Time)
        {
        }
        field(60; "Appointment Offering 2 Date"; Date)
        {
        }
        field(61; "Appointment Offering 2 Time"; Time)
        {
        }
        field(115; "Job No.1"; Code[20])
        {
        }
        field(116; "Job No.2"; Code[20])
        {
        }
        field(117; "Job No.3"; Code[20])
        {
        }
        field(118; Odometer1; Decimal)
        {
        }
        field(119; Odometer2; Decimal)
        {
        }
        field(120; Odometer3; Decimal)
        {
        }
        field(121; Date1; Date)
        {
        }
        field(122; Date2; Date)
        {
        }
        field(123; Date3; Date)
        {
        }
        field(131; "Job Description1"; Text[250])
        {
        }
        field(132; "Job Description2"; Text[250])
        {
        }
        field(133; "Job Description3"; Text[250])
        {
        }
        field(134; "Technician Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*IF "Technician Code" <> xRec."Technician Code" THEN
                BEGIN
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,xRec."Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,xRec."Customer's Preferred Date");
                HourSlotInfo.SETRANGE(HourSlotInfo."COF No.",xRec."Customer Order Form No.");
                IF HourSlotInfo.FINDFIRST THEN
                    HourSlotInfo.DELETEALL;
                END;
                
                IF ResRec.GET("Technician Code") THEN
                   BEGIN
                    "Technician Name" := ResRec.Name;
                    ResCapEntry.SETRANGE(ResCapEntry."Resource No.","Technician Code");
                    ResCapEntry.SETRANGE(ResCapEntry.Date,"Customer's Preferred Date");
                    IF ResCapEntry.FINDFIRST THEN
                    "Man Hour Per Day" := ResCapEntry.Capacity;
                   END;
                
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FINDFIRST THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                 */

            end;
        }
        field(135; "Technician Name"; Text[30])
        {
        }
        field(136; "Customer's Preferred Date"; Date)
        {
        }
        field(137; "Customer's Preferred Time"; Time)
        {
        }
        field(138; "Man Hour Per Day"; Decimal)
        {
        }
        field(139; "Service Slot"; Decimal)
        {

            trigger OnValidate()
            begin
                "Service Expected Duration" := "Service Slot" / 2;
                IF "Service Slot" < "Man Hour Per Day" THEN
                    "Remaining Hours" := "Man Hour Per Day" - "Service Slot";
            end;
        }
        field(140; "Serving Store"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = filter(false));
        }
        field(141; "Service Type"; Option)
        {
            OptionCaption = ' ,Periodic Maintenance,General Repairs';
            OptionMembers = " ","Periodic Maintenance","General Repairs";
        }
        field(142; "Remaining Hours"; Decimal)
        {
        }
        field(143; "Total Appointment Time"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE("Walk-In" = filter(false)));
            FieldClass = FlowField;
        }
        field(144; "Total Rem Appt Time"; Decimal)
        {
        }
        field(145; "Total Walk in Time"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE("Walk-In" = filter(true)));
            FieldClass = FlowField;
        }
        field(146; "Total Rem W/I Time"; Decimal)
        {
        }
        field(147; "Vehicle Driven by"; Text[30])
        {
        }
        field(148; "For Appt Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "For Appt Confirmation" THEN
                    COFRec."For Appt Confirmation" := TRUE;
            end;
        }
        field(149; "Starting Hour"; Code[10])
        {

            trigger OnValidate()
            var
                BreakCount: Integer;
                HourSlotInfo2: Record 50049;
            begin
                /*//GET("Service Item","Service Code");
                IF (("Appointment Allocated Hr" + "Walk-In Allocated Hr") >= "Man Hour Per Day")  AND
                   ("Starting Hour" <> '')THEN
                  ERROR('This Technician hours fully allocated')
                  ELSE BEGIN
                
                TESTFIELD("Customer Order Form No.");
                IF HourSlot.GET("Starting Hour") THEN
                 BEGIN
                   //Hrrec := "Starting Hour";
                  FOR J := 1 TO ("Service Slot") DO
                   BEGIN
                     IF HourSlot.Break THEN BEGIN
                       HourSlot.NEXT(1);
                       Hrrec := HourSlot.Code;
                     END;
                       HourSlotInfo.INIT;
                       HourSlotInfo.VALIDATE(HourSlotInfo."Hour Slot",HourSlot.Code);
                       HourSlotInfo.VALIDATE(HourSlotInfo.Technician,"Technician Code");
                       HourSlotInfo.VALIDATE(HourSlotInfo."COF No.","Customer Order Form No.");
                       HourSlotInfo.VALIDATE(HourSlotInfo.Date,"Customer's Preferred Date");
                       HourSlotInfo.VALIDATE(HourSlotInfo."Date Filter","Customer's Preferred Date");
                       ResCapEntry.SETRANGE(ResCapEntry."Resource No.","Technician Code");
                       ResCapEntry.SETRANGE(ResCapEntry.Date,"Customer's Preferred Date");
                       IF ResCapEntry.FINDFIRST THEN
                         HourSlotInfo."Daily Man Hour" := ResCapEntry.Capacity;
                       HourSlotInfo."Walk-In" := "Walk-In";
                       HourSlotInfo."Service Code" := "Service Code";
                       HourSlotInfo."Veh Reg No." := "Service Item";
                       HourSlotInfo.VALIDATE(HourSlotInfo."Daily Man Hour","Man Hour Per Day");
                       HourSlotInfo.INSERT;
                       IF J <> "Service Slot" THEN
                         HourSlot.NEXT;
                       Hrrec := HourSlot.Code;
                   END;
                   "Ending Hour" := HourSlot.Code;//Hrrec;
                END;
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FINDFIRST THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                END;
                
                GenScheduleCard;
                
                //New Function by Segunio to update the Workshop Calender
                  //UpdateWrkShpCalendar;
                */

            end;
        }
        field(150; "Ending Hour"; Code[10])
        {
        }
        field(151; "Appointment Allocated Hr"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE(Date = FIELD("Customer's Preferred Date"),
                                                            "Walk-In" = filter(false),
                                                            Technician = FIELD("Technician Code")));
            FieldClass = FlowField;
        }
        field(152; "Walk-In Allocated Hr"; Decimal)
        {
            CalcFormula = Sum("Hour Slot Info".Hours WHERE(Date = FIELD("Customer's Preferred Date"),
                                                            "Walk-In" = filter(true),
                                                            Technician = FIELD("Technician Code")));
            FieldClass = FlowField;
        }
        field(153; "Total Hour Available 4 day"; Decimal)
        {
            CalcFormula = Sum("Res. Capacity Entry".Capacity WHERE(Date = FIELD("Customer's Preferred Date")));
            FieldClass = FlowField;
        }
        field(154; "Walk-In"; Boolean)
        {
        }
        field(155; Remaining; Decimal)
        {
            TableRelation = "Hour Slot Info"."Hours Remaining" WHERE(Technician = FIELD("Technician Code"));
        }
        field(156; "Technician Code2"; Code[20])
        {

            trigger OnValidate()
            begin
                /*IF "Technician Code2" <> xRec."Technician Code2" THEN
                BEGIN
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,xRec."Technician Code2");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,xRec."Customer's Preferred Date");
                HourSlotInfo.SETRANGE(HourSlotInfo."COF No.",xRec."Customer Order Form No.");
                IF HourSlotInfo.FINDFIRST THEN
                    HourSlotInfo.DELETEALL;
                END;
                
                IF ResRec.GET("Technician Code2") THEN
                   BEGIN
                    "Technician Name2" := ResRec.Name;
                    "Man Hour Per Day" := ResRec."Man Hour Per Day";
                   END;
                
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code2");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FIND('-') THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                */

            end;
        }
        field(157; "Technician Name2"; Text[30])
        {
        }
        field(158; VDS; Code[10])
        {
        }
        field(159; VIS; Code[10])
        {
        }
        field(160; "SSC Range From"; Code[10])
        {
        }
        field(161; "SSC Range To"; Code[10])
        {
        }
        field(162; "SSC Available"; Boolean)
        {
        }
        field(163; "Customer's Requests"; Option)
        {
            OptionCaption = 'Appointment,Walk-In,Others';
            OptionMembers = Appointment,"Walk-In",Others;
        }
        field(164; Internal; Boolean)
        {
        }
        field(165; "Customer Waiting"; Boolean)
        {
        }
        field(166; "General Repair"; Boolean)
        {
        }
        field(167; "Repeat Repair"; Boolean)
        {
        }
        field(168; Warranty; Boolean)
        {
        }
        field(169; "Customer Complaint"; Boolean)
        {
        }
        field(170; "Diag/Est"; Boolean)
        {
            Description = 'Diagnosis';
        }
        field(171; "B & P"; Boolean)
        {
            Description = 'Estimating';
        }
        field(172; Maintenance2; Boolean)
        {
        }
        field(173; Maintenance3; Text[30])
        {
        }
        field(174; "Maintenance Reminder"; Boolean)
        {
        }
        field(175; "Job Details"; Text[250])
        {
        }
        field(176; "Expected Reception Time"; Time)
        {
        }
        field(178; Estimate; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Total Price" WHERE("Operation code" = FIELD("Service Code"),
                                                                      "Service Item Model" = FIELD("Model Code")));
            FieldClass = FlowField;
        }
        field(179; VAT; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."VAT Amount" WHERE("Operation code" = FIELD("Service Code"),
                                                                     "Service Item Model" = FIELD("Model Code")));
            FieldClass = FlowField;
        }
        field(180; "Estimate Incl. VAT"; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Price Incl VAT" WHERE("Operation code" = FIELD("Service Code"),
                                                                         "Service Item Model" = FIELD("Model Code")));
            FieldClass = FlowField;
        }
        field(181; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(182; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(183; "User ID"; Code[25])
        {
        }
        field(184; "Odometer Reading At Appointmen"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(185; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(186; "Service Advisor"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("Service Advisor") THEN
                    "Service Advisor's Name" := ResRec.Name
                ELSE
                    "Service Advisor's Name" := '';
            end;
        }
        field(187; "Service Advisor's Name"; Text[30])
        {
        }
        field(188; "Stall No."; Option)
        {
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30";
        }
        field(189; "Appointment Booking Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "Appointment Booking Date" <> 0D THEN BEGIN
                    "Appointment Booking Time" := TIME;
                    "Appointment Booking Staff Name" := USERID;
                END;
            end;
        }
        field(190; "Appointment Booking Time"; Time)
        {
        }
        field(191; "Appointment Booking Staff Name"; Text[30])
        {
        }
        field(192; "Expected Delivery Date"; Date)
        {
        }
        field(193; "Expected Delivery Time"; Time)
        {
        }
        field(194; "Fixed Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                IF FARec.GET("Fixed Asset No.") THEN
                    "Fixed Asset Description" := FARec.Description
                ELSE
                    "Fixed Asset Description" := '';
            end;
        }
        field(195; "Fixed Asset Description"; Text[50])
        {
        }
        field(196; VMI; Code[10])
        {
        }
        field(197; "Check SSC"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Check SSC" = TRUE THEN
                    VALIDATE("Chasis No.");
            end;
        }
        field(50000; "Delivery Date"; Date)
        {
        }
        field(50001; "Delivery Time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Service Item", "Service Code")
        {
            Clustered = true;
        }
        key(Key2; "Service Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Next Call Date." := TODAY; //do not release. See form: OnInsertRecord// dada.
        "User ID" := USERID;
        USERSETUP.GET(USERID);
        "Global Dimension 1 Code" := USERSETUP."Global Dimension 1 Filter";
        "Global Dimension 2 Code" := USERSETUP."Global Dimension 2 Filter";
        "Serving Store" := USERSETUP."Location Code";
    end;

    var
        FaultRec: Record 50109;
        ServRec: Record 5940;
        SerappSch: Record 50114;
        SerappSch2: Record 50114;
        Custrec: Record 18;
        RetDay: Integer;
        Text0001: Label 'Kindly be informed that Your Vehicle with Registration No. %1 will be due for  %2 service on %3. Kindly confirm the Appointment.';
        Mailsent: Boolean;
        Text0002: Label 'This is to remind you of your Vehicle with Registration No. %1 that has been scheduled for  %2 service appointment on %3. Kindly reconfirm the Appointment.';
        mailgenerator: Codeunit 397;
        Subject: Label 'Service Appointment Confirmation';
        Attachment: Text[100];
        COFRec: Record 50119;
        NewCode: Code[20];
        OperationCodeCount: Integer;
        servsetup: Record 5911;
        PoServLineRec: Record 5992;
        i: Integer;
        PoServHeadRec: Record 5992;
        "SSC/SC": Record 50046;
        ResRec: Record 156;
        HourSlot: Record 50048;
        HourUnit: Decimal;
        HourSlotInfo: Record 50049;
        HourSlotInfo1: Record 50049;
        J: Decimal;
        "LineNo.": Integer;
        Hrrec: Code[10];
        AppScheduling: Record 50047;
        AppScheduling2: Record 50047;
        "AppSSC/SC": Record 50054;
        "AppSSC/SC2": Record 50054;
        CompCard: Record 50052;
        USERSETUP: Record 91;
        ServiceRec: Record 5940;
        ResCapEntry: Record 160;
        ResouceRegister: Record 50055;
        "COF No.": Code[20];
        FARec: Record 5600;
        ServHeader: Record 5900;


    procedure GenAppoint()
    begin
        /*TESTFIELD("Appointment No.",'');
        IF ServRec.GET("Service Item") THEN BEGIN
          ServApp.INIT;
          ServApp."Appointment Date" := "Expected Reception Date";
          ServApp."Customer No." := ServRec."Customer No.";
          ServApp."Service Item No." := "Service Item";
          ServApp."Appointment Code" := "Service Code";
          ServApp."Source of Appointment" :=ServApp."Source of Appointment"::"3";
          ServApp."Appointment Registration Date" :=  TODAY;
          IF ServApp.INSERT(TRUE) THEN BEGIN
             ServADet.INIT;
             ServADet."Appointment No." := ServApp."Appointment No.";
             ServADet.VALIDATE(ServADet."Faulty Code","Service Code");
             ServADet."Appointment Date" := "Service Due Projected Date";
             ServADet."Source of Appointment":= ServADet."Source of Appointment"::"3";
             ServADet.INSERT(TRUE);
          END;
          "Appointment No." := ServApp."Appointment No.";
          MODIFY;
         END;
         */

    end;


    procedure GenCOF()
    begin
        TESTFIELD("Customer Order Form No.", '');
        IF ServRec.GET("Service Item") THEN BEGIN
            COFRec.INIT;
            COFRec."Service Type" := COFRec."Service Type"::"General Workshop";
            COFRec."Customer Order Form Date" := "Customer Order Form Date";
            COFRec."Customer No." := ServRec."Customer No.";
            COFRec.VALIDATE(COFRec."Vehicle Registration No.", "Service Item");
            COFRec."Service Location" := "Serving Store";
            COFRec."Reception Date" := "Expected Reception Date";
            COFRec."Reception Time" := "Expected Reception Time";
            COFRec.VALIDATE(COFRec."Appointment Date", "Next Call Date.");
            COFRec."Technician Name" := "Technician Name";
            COFRec."Estimated Job Time" := "Service Expected Duration";
            COFRec."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
            COFRec."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
            //COFRec."Customer's Requests" := COFRec."Customer's Requests"::Appointment;
            COFRec."Customer's Requests" := "Customer's Requests";
            IF "Customer's Requests" = "Customer's Requests"::"Walk-In" THEN
                COFRec.VALIDATE(COFRec."For Part Arrival", TRUE)
            ELSE
                COFRec.VALIDATE(COFRec."For Part Arrival", FALSE);
            COFRec."Odometer Reading At Appointmen" := "Odometer Reading At Appointmen";
            COFRec.VALIDATE(COFRec.Maintenance1, TRUE);
            COFRec."FA No." := "Fixed Asset No.";
            COFRec."SSC Available" := "SSC Available";
            COFRec.Maintenance2 := Maintenance2;
            COFRec."Appointment Date" := "Appointment Booking Date";
            COFRec."Appointment Time" := "Appointment Booking Time";
            COFRec."Appointment Staff Name" := "Appointment Booking Staff Name";
            COFRec.Teams := Teams;
            COFRec."Stall No." := "Stall No.";
            COFRec."Key Assigned No." := "Key Assigned No.";
            COFRec."Service Advisor" := "Service Advisor";
            COFRec."Service Advisor's Name" := "Service Advisor's Name";
            COFRec.Internal := Internal;
            COFRec.Warranty := Warranty;
            COFRec."Customer Waiting" := "Customer Waiting";
            COFRec."B & P" := "B & P";
            COFRec."Diag/Est" := "Diag/Est";
            COFRec."Job Type" := "Service Code";
            COFRec."Job Type Description" := Description;
            COFRec."General Repair" := "General Repair";
            COFRec.Maintenance := Maintenance3;
            COFRec."Job Details" := "Job Details";
            COFRec."Expected Delivery Date" := "Expected Delivery Date";
            COFRec."Expected Delivery Time" := "Expected Delivery Time";
            COFRec.VDS := VDS;
            COFRec.VMI := VMI;
            COFRec.VIS := VIS;
            IF "Call Type" = "Call Type"::"Appt. Booking" THEN
                COFRec."Job Opened" := COFRec."Job Opened"::"Appointment Call in";
            IF "Call Type" = "Call Type"::"Maintenance Reminder" THEN
                COFRec."Job Opened" := COFRec."Job Opened"::"Appointment Call out";
            IF "Call Type" = "Call Type"::" " THEN
                COFRec."Job Opened" := COFRec."Job Opened"::Reception;
            COFRec."For Appt Confirmation" := TRUE;
            COFRec.INSERT(TRUE);
            COFRec.VALIDATE(COFRec.Estimation);
            "Customer Order Form No." := COFRec."Customer Order Form No.";
            MODIFY;
            COFRec.VALIDATE(COFRec."Job Type", "Service Code");
            COFRec.VALIDATE(COFRec."Repeat Repair", "Repeat Repair");
            COFRec."Repeat Repair" := "Repeat Repair";
            COFRec.VALIDATE(COFRec."Customer Complaint", "Customer Complaint");
            COFRec.VALIDATE(COFRec."FA No.", "Fixed Asset No.");
            COFRec."Customer Complaint" := "Customer Complaint";
            "COF No." := COFRec."Customer Order Form No.";
            MESSAGE('COF successfully created with %1 %2', 'COF No.', "COF No.");

            "AppSSC/SC".SETRANGE("AppSSC/SC"."Service Item Code", "Service Item");
            "AppSSC/SC".SETRANGE("AppSSC/SC"."Fault Code", "Service Code");
            "AppSSC/SC".SETFILTER("AppSSC/SC"."COF No.", '');
            IF "AppSSC/SC".FINDFIRST THEN
                "AppSSC/SC".MODIFYALL("AppSSC/SC"."COF No.", "Customer Order Form No.");
        END;
    end;


    procedure Genschedu()
    begin
        ServRec.GET("Service Item");
        Custrec.GET(ServRec."Customer No.");
        servsetup.GET();
        IF "Service Due Projected Date" = 0D THEN
            "Service Due Projected Date" := TODAY;
        FaultRec.SETRANGE(FaultRec."Model No.", ServRec."Model No.");
        SerappSch2.SETRANGE(SerappSch2."Service Item", "Service Item");
        IF SerappSch2.FIND('+') THEN BEGIN
            FaultRec.GET(SerappSch2."Service Code", "Model Code");
            FaultRec.NEXT(1);
        END ELSE
            IF FaultRec.FIND('-') THEN
                SerappSch.INIT;
        SerappSch."Service Item" := "Service Item";
        SerappSch."Service Code" := FaultRec."Operation Code";
        SerappSch.Description := FaultRec.Description;
        SerappSch."Service Due Projected Date" := CALCDATE('3M', "Service Due Projected Date");
        SerappSch."Service Due Projected Date" := CALCDATE(servsetup."First Service Default Interval", "Service Due Projected Date");
        SerappSch."Expected Reception Date" := SerappSch."Service Due Projected Date";
        SerappSch.VALIDATE(SerappSch."Customer No.", ServRec."Customer No.");
        SerappSch."Contact Person" := ServRec.Contact;
        SerappSch."Phone No 1." := ServRec.Business;
        SerappSch."Phone No. 2." := ServRec.Mobile;
        SerappSch."First Call No." := ServRec.Business;
        SerappSch."First Call Contact" := ServRec."User Person";
        SerappSch."Repeat Call No." := ServRec.Mobile;
        SerappSch."Repeat Call Contact" := ServRec."User Person";
        SerappSch."Last Call No." := ServRec.Mobile;
        SerappSch."Last Call Contact" := ServRec."User Person";
        SerappSch."E-Mail" := ServRec."Customer Email";
        SerappSch."Contact E-Mail" := ServRec."User Email";
        SerappSch."Phone No 1." := ServRec."Phone No.";
        SerappSch."Engine No." := ServRec."Engine No.";
        SerappSch.VALIDATE(SerappSch."Chasis No.", ServRec."Chasis No.");
        SerappSch."Model Code" := ServRec."Model No.";
        SerappSch."Model Year" := ServRec."Model Year";
        SerappSch."Walk-In" := FALSE;
        SerappSch."Next Call Date." := CALCDATE('-10D', SerappSch."Service Due Projected Date");
        SerappSch.VALIDATE(SerappSch."First Call Date", SerappSch."Next Call Date.");
        RetDay := DATE2DMY(SerappSch."Next Call Date.", 1);
        CASE RetDay OF
            //6:  SerappSch."Next Call Date." := CALCDATE('2D',SerappSch."Next Call Date.");
            7:
                SerappSch."Next Call Date." := CALCDATE('1D', SerappSch."Next Call Date.");
        END;
        SerappSch.INSERT;
        SerappSch.VALIDATE(SerappSch."Service Code", FaultRec."Operation Code");
        Rec := SerappSch;
        /*
          i := 0;
        PoServLineRec.SETFILTER(PoServLineRec."Vehicle Registration No.",ServRec."No.");
        IF PoServLineRec.FINDLAST THEN
           BEGIN
            i := PoServLineRec.COUNT;
            IF i > 0  THEN BEGIN
            "Job No.1" := PoServLineRec."Order No.";
            Odometer1  := PoServLineRec."Odometer Reading @ Reception";
            Date1      := PoServLineRec."Posting Date";
            "Job Description1" := PoServLineRec."Workshop Store Rq. No";
           END ELSE
           BEGIN
            "Job No.1" := '';
            Odometer1  := 0;
            Date1      := 0D;
            "Job Description1" := '';
           END;
        IF i > 1 THEN
          BEGIN
            PoServLineRec.NEXT := -1;
            "Job No.2" := PoServLineRec."Order No.";
            Odometer2  := PoServLineRec."Odometer Reading @ Reception";
            Date2      := PoServLineRec."Posting Date";
            "Job Description2" := PoServLineRec."Workshop Store Rq. No";;
          END ELSE
          BEGIN
            "Job No.2" := '';
            Odometer2  := 0;
            Date2      := 0D;
             "Job Description2" := '';
            END;
        IF i > 2 THEN
          BEGIN
            PoServLineRec.NEXT := -1;
            "Job No.3" := PoServLineRec."Order No.";
            Odometer3  := PoServLineRec."Odometer Reading @ Reception";
            Date3      := PoServLineRec."Posting Date";
            "Job Description3" := PoServLineRec."Workshop Store Rq. No";
          END ELSE
          BEGIN
            "Job No.3" := '';
            Odometer3  := 0;
            Date3      := 0D;
            "Job Description3" := '';
          END;
          END ELSE
        BEGIN
          "Job No.1" := '';
          Odometer1  := 0;
          Date1      := 0D;
          "Job Description1" := '';
          "Job No.2" := '';
          Odometer2  := 0;
          Date2      := 0D;
          "Job Description2" := '';
          "Job No.3" := '';
          Odometer3  := 0;
          Date3      := 0D;
          "Job Description3" := '';
        END;*/
        MODIFY;

    end;


    procedure GenerateNextSchedu()
    begin
        ServRec.GET("Service Item");
        Custrec.GET(ServRec."Customer No.");
        IF "Service Due Projected Date" = 0D THEN
            "Service Due Projected Date" := TODAY;
        FaultRec.SETRANGE(FaultRec."Model No.", ServRec."Model No.");
        //IF FaultRec.FIND(FaultRec."Operation Code") THEN
        IF FaultRec.FIND('-') THEN
            OperationCodeCount := FaultRec.COUNT;
        IF OperationCodeCount > 1 THEN BEGIN
            FaultRec.NEXT := +1;
            SerappSch.INIT;
            SerappSch."Service Item" := "Service Item";
            SerappSch."Service Code" := FaultRec."Operation Code";
            SerappSch.Description := FaultRec.Description;
            SerappSch."Service Due Projected Date" := CALCDATE('3M', "Service Due Projected Date");
            SerappSch."Expected Reception Date" := SerappSch."Service Due Projected Date";
            SerappSch."Customer No." := ServRec."Customer No.";
            SerappSch."Contact Person" := ServRec.Contact;
            SerappSch."Phone No 1." := ServRec."Phone No.";
            SerappSch."Engine No." := ServRec."Engine No.";
            SerappSch."Chasis No." := ServRec."Chasis No.";
            SerappSch."Model Code" := ServRec."Model No.";
            SerappSch."Next Call Date." := CALCDATE('-10D', SerappSch."Service Due Projected Date");
            RetDay := DATE2DMY(SerappSch."Next Call Date.", 1);
            CASE RetDay OF
                //6:  SerappSch."Next Call Date." := CALCDATE('2D',SerappSch."Next Call Date.");
                7:
                    SerappSch."Next Call Date." := CALCDATE('1D', SerappSch."Next Call Date.");
            END;
            SerappSch."Contact E-Mail" := Custrec."E-Mail";
            SerappSch.INSERT;
            Rec := SerappSch;
        END;
    end;


    procedure GenScheduleCard()
    begin
        AppScheduling2.SETRANGE(AppScheduling2."Technician Code", "Technician Code");
        AppScheduling2.SETRANGE(AppScheduling2."Schedule Date", "Customer's Preferred Date");
        IF AppScheduling2.FINDLAST THEN
            EXIT
        ELSE
            AppScheduling.INIT;
        AppScheduling."Entry No" += 1;
        AppScheduling.VALIDATE(AppScheduling."Technician Code", "Technician Code");
        AppScheduling."Technician Name" := "Technician Name";
        AppScheduling."Schedule Date" := "Customer's Preferred Date";
        AppScheduling."Job Category" := "Service Type";
        AppScheduling."Daily Man Hour" := 8;
        AppScheduling."Hours Consumed" := "Service Expected Duration";
        AppScheduling."COF No." := "Customer Order Form No.";
        AppScheduling."Veh Reg No." := "Service Item";
        AppScheduling."Job Type" := Teams;
        AppScheduling.INSERT(TRUE);
    end;
}

