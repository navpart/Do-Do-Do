table 70033 "Service AppointmentsX"
{
    Permissions = tabledata 70033 = rimd;

    fields
    {
        field(1; "Service Item"; Code[20])
        {
            TableRelation = "Service Item"."No.";
            ValidateTableRelation = false;  // for CRM

            trigger OnValidate()
            begin

                if ServiceItem.GET("Service Item") then begin
                    "Engine No." := ServiceItem."Engine No.";
                    VIN := ServiceItem."Chasis No.";
                    "Model Code" := ServiceItem."Model No.";
                    "Model Year" := ServiceItem."Model Year";
                    "Model Name" := ServiceItem.Description;
                end;

                VALIDATE("Customer No.", ServiceItem."Customer No.");

                "Contact Person" := ServiceItem."User Person";
                "Phone No. 1" := ServiceItem.Business;
                "Phone No. 2" := ServiceItem.Mobile;
                Email := ServiceItem."Customer Email";

                "First Call Date" := TODAY;
                "First Call No." := ServiceItem.Business;
                "First Call Contact" := ServiceItem."User Person";
                FARec.SETFILTER(FARec."No.", '<>%1', '');
                FARec.SETRANGE(FARec."Registration No.", "Service Item");
                IF FARec.FINDFIRST THEN
                    VALIDATE("Fixed Asset No.", FARec."No.");

                /*
                  ServHeader.SETCURRENTKEY("Vehicle Registration No.","Reception Date");
                  ServHeader.SETRANGE(ServHeader."Vehicle Registration No.","Service Item");
                  ServHeader.SETFILTER(ServHeader.Posted,'%1',TRUE);
                  IF ServHeader.FINDLAST THEN
                  BEGIN
                    i := ServHeader.COUNT;
                    "Job No.1" := ServHeader."No.";
                    Odometer1  := ServHeader."Odometer Reading Reception";
                    Date1      := ServHeader."Reception Date";
                    "Job Description1" := COPYSTR(ServHeader."Job Details",1,MAXSTRLEN("Job Description1"));
                  END
                  ELSE BEGIN
                    "Job No.1" := '';
                    Odometer1  := 0;
                    Date1      := 0D;
                    "Job Description1" := '';
                  END;
                
                  IF i > 1 THEN
                  BEGIN
                    ServHeader.NEXT := -1;
                    "Job No.2" := ServHeader."No.";
                    Odometer2  := ServHeader."Odometer Reading Reception";
                    Date2      := ServHeader."Reception Date";
                    "Job Description2" := COPYSTR(ServHeader."Job Details",1,MAXSTRLEN("Job Description2"));
                  END
                  ELSE BEGIN
                    "Job No.2" := '';
                    Odometer2  := 0;
                    Date2      := 0D;
                    "Job Description2" := '';
                  END;
                
                  IF i > 2 THEN
                  BEGIN
                    ServHeader.NEXT := -1;
                    "Job No.3" := ServHeader."No.";
                    Odometer3  := ServHeader."Odometer Reading Reception";
                    Date3      := ServHeader."Reception Date";
                    "Job Description3" := COPYSTR(ServHeader."Job Details",1,MAXSTRLEN("Job Description3"));
                  END
                  ELSE BEGIN
                     "Job No.3" := '';
                     Odometer3  := 0;
                     Date3      := 0D;
                     "Job Description3" := '';
                  END;
                 */


                IF VIN <> '' THEN BEGIN
                    VDS := COPYSTR(VIN, 1, 8);
                    VMI := COPYSTR(VIN, 9, 3);
                    VIS := COPYSTR(VIN, 12, 6);
                END;

            end;
        }
        field(2; "Operation Code"; Code[20])
        {
            //TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model Code"));
            TableRelation = "Fault Setup Header"."Operation Code";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                ServiceItem.SETCURRENTKEY("No.");
                if ServiceItem.GET("Service Item") then begin
                    if FaultRec.GET("Operation Code", ServiceItem."Model No.") then begin
                        Description := FaultRec.Description;
                        "Expected Service Duration" := FaultRec."Duration In Hours";
                        "Service Slot" := FaultRec."Duration In Hours" * 2;
                        "Service Due Kilometer" := FaultRec."Service KM";
                        //VALIDATE("Chasis No.",ServiceItem."Chasis No.");
                    end;
                end;
            end;
        }
        field(3; Description; Text[50])
        {
            Editable = false;
        }
        field(4; "Service Due Date"; Date)
        {

            trigger OnValidate()
            begin
                "Next Call Date" := CALCDATE('-10D', "Service Due Date");
                RetDay := DATE2DWY("Next Call Date", 1);
                CASE RetDay OF
                    6:
                        "Next Call Date" := CALCDATE('2D', "Next Call Date");  //saturday
                    7:
                        "Next Call Date" := CALCDATE('1D', "Next Call Date");  //sunday
                END;
            end;
        }
        field(5; "Actual Service Date"; Date)
        {
        }
        field(6; "Service Due Kilometer"; Integer)
        {
        }
        field(7; "Actual Service Kilometer"; Integer)
        {
        }
        field(8; Serviced; Boolean)
        {
        }
        field(9; Remark; Text[50])
        {
        }
        field(10; "Expected Service Duration"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                "Service Slot" := "Expected Service Duration" * 2;
            end;
        }
        field(11; "Contact Person"; Text[50])
        {
        }
        field(12; "Phone No. 1"; Code[20])
        {
        }
        field(13; "Phone No. 2"; Code[20])
        {
        }
        field(14; Mobile; Code[30])
        {
            CalcFormula = Lookup(Customer."Phone No." WHERE("No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(15; Email; Text[100])
        {
            CalcFormula = Lookup(Customer."E-Mail" WHERE("No." = FIELD("Customer No.")));
            Description = 'Customers Email';
            FieldClass = FlowField;
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
        field(17; Comment; Text[70])
        {
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
                    IF ("Repeat Call Date" <> 0D) AND ("Repeat Call Date" <> "Next Call Date") THEN
                        "Last Call Date" := "Next Call Date";
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
        field(30; "Agreed Date"; Date)
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

                DaysBeforeDue;

            end;
        }
        field(31; "Engine No."; Code[20])
        {
            Editable = false;
        }
        field(32; VIN; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF VIN <> '' THEN BEGIN
                    VDS := COPYSTR(VIN, 1, 8);
                    VMI := COPYSTR(VIN, 9, 3);
                    VIS := COPYSTR(VIN, 12, 6);
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
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Fault Code", "Operation Code");
                        IF "AppSSC/SC2".FINDLAST THEN
                            EXIT
                        ELSE
                            "AppSSC/SC".INIT;
                        "AppSSC/SC"."SSC/SC Code" := "SSC/SC"."SSC/SC Code";
                        "AppSSC/SC"."Line No." := "SSC/SC"."Line No.";
                        "AppSSC/SC"."Service Item Code" := "Service Item";
                        "AppSSC/SC"."Fault Code" := "Operation Code";
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
            Editable = false;
        }
        field(34; "Contact Email"; Text[50])
        {
        }
        field(35; "Appointment Status"; Option)
        {
            OptionCaption = ' ,Confirmed Appointment,Received Appointment';
            OptionMembers = " ","Confirmed Appointment","Received Appointment";

            trigger OnValidate()
            begin
                IF "Appointment Status" = "Appointment Status"::"Confirmed Appointment" THEN BEGIN
                    TESTFIELD("Agreed Date");
                    TESTFIELD("Agreed Time");
                    GenCOF;
                END;
            end;
        }
        field(36; "Call Type"; Option)
        {
            OptionCaption = ' ,Appointment,Maintenance Reminder';
            OptionMembers = " ",Appointment,"Maintenance Reminder";
        }
        field(37; "Schedule Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(38; "Next Call Date"; Date)
        {

            trigger OnValidate()
            begin
                RetDay := DATE2DWY("Next Call Date", 1);
                CASE RetDay OF
                    //6:  "Next Call Date." := CALCDATE('2D',"Next Call Date.");
                    7:
                        "Next Call Date" := CALCDATE('1D', "Next Call Date");
                END;

                IF ("Next Call Date" <> "First Call Date") AND ("Repeat Call Date" <> "Next Call Date") THEN
                    "Last Call Date" := "Next Call Date";
            end;
        }
        field(39; "Appointment No."; Code[20])
        {
        }
        field(40; "Additional Jobs"; Text[250])
        {
        }
        field(42; "Send Reminder"; Boolean)
        {

            /*    trigger OnValidate()
               begin
                   Mailsent := mailgenerator.NewMessage(Email, "Contact Email", Subject, STRSUBSTNO(Text0002, "Service Item", "Operation Code",
                   "Agreed Date"), Attachment, '', FALSE);
               end; */
        }
        field(43; "COF No."; Code[20])
        {
            TableRelation = "Customer Order HeaderX"."No." WHERE(Delivered = filter(true));
        }
        field(44; "COF Date"; Date)
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
            Editable = false;
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
                IF Resource.GET("Technician Code") THEN
                    "Technician Name" := Resource.Name
                ELSE
                    "Technician Name" := '';
            end;
        }
        field(135; "Technician Name"; Text[30])
        {
            Editable = false;
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
        field(148; Appointment; Boolean)
        {

            trigger OnValidate()
            begin
                IF Appointment THEN
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
        field(151; "Technician Hour"; Decimal)
        {
            BlankZero = true;
        }
        field(152; "Asst.Technician Hour"; Decimal)
        {
            BlankZero = true;
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
        field(156; "Asst. Technician Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF Resource.GET("Asst. Technician Code") THEN
                    "Asst. Technician Name" := Resource.Name
                ELSE
                    "Asst. Technician Name" := '';
            end;
        }
        field(157; "Asst. Technician Name"; Text[30])
        {
            Editable = false;
        }
        field(158; VDS; Code[10])
        {
            Editable = false;
        }
        field(159; VIS; Code[10])
        {
            Editable = false;
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
        field(171; "Body and Paint"; Boolean)
        {
            Description = 'Estimating';
        }
        field(172; Maintenance; Boolean)
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
        field(176; "Agreed Time"; Time)
        {
        }
        field(178; Estimate; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Total Price" WHERE("Operation code" = FIELD("Operation Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(179; VAT; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."VAT Amount" WHERE("Operation code" = FIELD("Operation Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(180; "Estimate Incl. VAT"; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Price Incl VAT" WHERE("Operation code" = FIELD("Operation Code")));
            Editable = false;
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
        field(184; "Odometer At Appointment"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
        }
        field(185; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(186; "Service Advisor Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF Resource.GET("Service Advisor Code") THEN
                    "Service Advisor's Name" := Resource.Name
                ELSE
                    "Service Advisor's Name" := '';
            end;
        }
        field(187; "Service Advisor's Name"; Text[30])
        {
            Editable = false;
        }
        field(188; "Stall No."; Option)
        {
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30";
        }
        field(189; "Booking Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF "Booking Date" <> 0D THEN BEGIN
                    "Booking Time" := TIME;
                    "Staff Name" := USERID;
                END;
            end;
        }
        field(190; "Booking Time"; Time)
        {
            Editable = false;
        }
        field(191; "Staff Name"; Text[30])
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
            Editable = false;
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
            Editable = false;
        }
        field(196; VMI; Code[10])
        {
            Editable = false;
        }
        field(197; "Check SSC"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Check SSC" = TRUE THEN
                    VALIDATE(VIN);
            end;
        }
        field(50000; "Delivery Date"; Date)
        {
        }
        field(50001; "Delivery Time"; Time)
        {
        }
        field(50002; "Days Before Due Date"; Option)
        {
            OptionCaption = 'Greater than 10,N-10,N-9,N-8,N-7,N-6,N-5,N-4,N-3,N-2,N-1,Today''s Appointment';
            OptionMembers = "Greater than 10","N-10","N-9","N-8","N-7","N-6","N-5","N-4","N-3","N-2","N-1","Today's Appointment";
        }
        field(50003; "No. Series"; Code[20])
        {
        }
        field(50004; Closed; Boolean)
        {
        }
        field(50005; "Nature of Repair"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Model Name"; Text[50])
        {
        }


        field(50007; "Other Requests"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Towing Service Required"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }

        field(50009; "Checked In"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Checked In By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Checked In Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Checked In Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Pickup Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Pickup Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; Picture1; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; Picture2; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; Picture3; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; Picture4; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PM,GR';
            OptionMembers = PM,GR;
        }
        field(50020; "Towing Address"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Amount Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Payment Ref."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Approve Estimate"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approve,Contact Service Adviser';
            OptionMembers = Approve,"Contact Service Adviser";
        }
        field(50024; "Estimate Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Job Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Repair,Periodic Maintenance,Body and Paint';
            OptionMembers = "General Repair","Periodic Maintenance","Body and Paint";
        }
    }

    keys
    {
        key(Key1; "Appointment No.", "Service Item")
        {
        }
        key(Key2; "Service Item", "Operation Code")
        {
            Clustered = true;
        }
        key(Key3; "Operation Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Appointment No." = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Appointment Nos.");
            "No. Series" := SalesSetup."Appointment Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Appointment No." := NoSeriesMgt.GetNextNo("No. Series");

            //NoSeriesMgt.InitSeries(SalesSetup."Appointment Nos.", xRec."No. Series", 0D, "Appointment No.", "No. Series");
        END;

        "User ID" := USERID;
        //UserSetup.GET(USERID);
        "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Filter";
        "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Filter";
        "Serving Store" := UserSetup."Location Code";

        "Booking Date" := TODAY;
        "Booking Time" := TIME;
    end;

    var
        FaultRec: Record 50109;
        ServiceItem: Record 5940;
        SerappSch: Record 70033;
        SerappSch2: Record 70033;
        Custrec: Record 18;
        RetDay: Integer;
        Text0001: Label 'Kindly be informed that Your Vehicle with Registration No. %1 will be due for  %2 service on %3. Kindly confirm the Appointment.';
        Mailsent: Boolean;
        Text0002: Label 'This is to remind you of your Vehicle with Registration No. %1 that has been scheduled for  %2 service appointment on %3. Kindly reconfirm the Appointment.';
        mailgenerator: Codeunit 397;
        Subject: Label 'Service Appointment Confirmation';
        Attachment: Text[100];
        COFRec: Record 70034;
        NewCode: Code[20];
        OperationCodeCount: Integer;
        servsetup: Record 5911;
        PoServLineRec: Record 5992;
        i: Integer;
        PoServHeadRec: Record 5992;
        "SSC/SC": Record 50046;
        Resource: Record 156;
        HourSlot: Record 50048;
        HourUnit: Decimal;
        HourSlotInfo: Record 50049;
        HourSlotInfo1: Record 50049;
        J: Decimal;
        "LineNo.": Integer;
        Hrrec: Code[10];
        "AppSSC/SC": Record 50054;
        "AppSSC/SC2": Record 50054;
        CompCard: Record 70039;
        UserSetup: Record 91;
        ServiceRec: Record 5940;
        ResCapEntry: Record 160;
        ResouceRegister: Record 50055;
        "COF No.": Code[20];
        FARec: Record 5600;
        ServHeader: Record 5900;
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record 311;
        Text003: Label 'The date cannot be earlier than today!';

    procedure GenAppoint()
    begin
        /*TESTFIELD("Appointment No.",'');
        IF ServiceItem.GET("Service Item") THEN BEGIN
          ServApp.INIT;
          ServApp."Appointment Date" := "Expected Reception Date";
          ServApp."Customer No." := ServiceItem."Customer No.";
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
        //TESTFIELD("COF No.");
        IF ServiceItem.GET("Service Item") THEN BEGIN
            COFRec.INIT;
            COFRec.Date := TODAY;
            COFRec.VALIDATE("Vehicle Registration No.", "Service Item");
            COFRec."Service Location" := "Serving Store";
            COFRec."Reception Date" := "Agreed Date";
            COFRec."Reception Time" := "Agreed Time";
            COFRec.VALIDATE("Appointment Date", "Next Call Date");
            COFRec."Technician Name" := "Technician Name";
            COFRec."Estimated Job Time" := "Expected Service Duration";
            COFRec."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
            COFRec."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
            COFRec.Appointment := Appointment;
            COFRec.Maintenance := Maintenance;
            COFRec."General Repair" := "General Repair";
            COFRec.Internal := Internal;
            COFRec.Warranty := Warranty;
            COFRec."Customer Waiting" := "Customer Waiting";
            COFRec."Repeat Repair" := "Repeat Repair";
            COFRec."Odometer At Appointment" := "Odometer At Appointment";
            COFRec."FA No." := "Fixed Asset No.";
            COFRec."SSC Available" := "SSC Available";
            COFRec."Appointment Date" := "Booking Date";
            COFRec."Appointment Time" := "Booking Time";
            COFRec."Appointment Staff Name" := "Staff Name";
            COFRec.Teams := Teams;
            COFRec."Stall No." := "Stall No.";
            COFRec."Key Assigned No." := "Key Assigned No.";
            COFRec."Service Advisor" := "Service Advisor Code";
            COFRec."Service Advisor's Name" := "Service Advisor's Name";
            COFRec.Internal := Internal;
            COFRec.Warranty := Warranty;
            COFRec."Customer Waiting" := "Customer Waiting";
            COFRec."B & P" := "Body and Paint";
            COFRec."Diag/Est" := "Diag/Est";
            COFRec."Operation Code" := "Operation Code";
            COFRec."Operation Code Description" := Description;
            COFRec."Job Type2" := "Job Type";
            COFRec."Job Details" := "Job Details";
            COFRec."General Repair" := "General Repair";
            COFRec."Repeat Repair" := "Repeat Repair";
            COFRec."Customer Complaint" := "Customer Complaint";
            COFRec.VALIDATE(COFRec."FA No.", "Fixed Asset No.");
            COFRec."Expected Delivery Date" := "Expected Delivery Date";
            COFRec."Expected Delivery Time" := "Expected Delivery Time";
            COFRec.VDS := VDS;
            COFRec.VMI := VMI;
            COFRec.VIS := VIS;
            COFRec.Stage := "Days Before Due Date";
            COFRec."App. No." := "Appointment No.";
            UserSetup.GET(USERID);
            COFRec."Confirmation Staff Name" := UserSetup."User ID";
            COFRec.INSERT(TRUE);

            Rec."COF No." := COFRec."No.";
            Rec."COF Date" := TODAY;
            Rec.MODIFY;

            MESSAGE('%1 has been created.', Rec."COF No.");

            "AppSSC/SC".SETRANGE("Service Item Code", Rec."Service Item");
            "AppSSC/SC".SETRANGE("Fault Code", Rec."Operation Code");
            "AppSSC/SC".SETFILTER("COF No.", '');
            IF "AppSSC/SC".FINDFIRST THEN
                "AppSSC/SC".MODIFYALL("COF No.", Rec."COF No.");
        END;
    end;

    procedure Genschedu()
    begin
        ServiceItem.GET("Service Item");
        Custrec.GET(ServiceItem."Customer No.");
        servsetup.GET();
        IF "Service Due Date" = 0D THEN
            "Service Due Date" := TODAY;
        FaultRec.SETRANGE(FaultRec."Model No.", ServiceItem."Model No.");
        SerappSch2.SETRANGE(SerappSch2."Service Item", "Service Item");
        IF SerappSch2.FIND('+') THEN BEGIN
            FaultRec.GET(SerappSch2."Operation Code", "Model Code");
            FaultRec.NEXT(1);
        END ELSE
            IF FaultRec.FIND('-') THEN
                SerappSch.INIT;
        SerappSch."Service Item" := "Service Item";
        SerappSch."Operation Code" := FaultRec."Operation Code";
        SerappSch.Description := FaultRec.Description;
        SerappSch."Service Due Date" := CALCDATE('3M', "Service Due Date");
        SerappSch."Service Due Date" := CALCDATE(servsetup."First Service Default Interval", "Service Due Date");
        SerappSch."Agreed Date" := SerappSch."Service Due Date";
        SerappSch.VALIDATE(SerappSch."Customer No.", ServiceItem."Customer No.");
        SerappSch."Contact Person" := ServiceItem.Contact;
        SerappSch."Phone No. 1" := ServiceItem.Business;
        SerappSch."Phone No. 2" := ServiceItem.Mobile;
        SerappSch."First Call No." := ServiceItem.Business;
        SerappSch."First Call Contact" := ServiceItem."User Person";
        SerappSch."Repeat Call No." := ServiceItem.Mobile;
        SerappSch."Repeat Call Contact" := ServiceItem."User Person";
        SerappSch."Last Call No." := ServiceItem.Mobile;
        SerappSch."Last Call Contact" := ServiceItem."User Person";
        SerappSch.Email := ServiceItem."Customer Email";
        SerappSch."Contact Email" := ServiceItem."User Email";
        SerappSch."Phone No. 1" := ServiceItem."Phone No.";
        SerappSch."Engine No." := ServiceItem."Engine No.";
        SerappSch.VALIDATE(SerappSch.VIN, ServiceItem."Chasis No.");
        SerappSch."Model Code" := ServiceItem."Model No.";
        SerappSch."Model Year" := ServiceItem."Model Year";
        SerappSch."Walk-In" := FALSE;
        SerappSch."Next Call Date" := CALCDATE('-10D', SerappSch."Service Due Date");
        SerappSch.VALIDATE(SerappSch."First Call Date", SerappSch."Next Call Date");
        RetDay := DATE2DMY(SerappSch."Next Call Date", 1);
        CASE RetDay OF
            //6:  SerappSch."Next Call Date." := CALCDATE('2D',SerappSch."Next Call Date.");
            7:
                SerappSch."Next Call Date" := CALCDATE('1D', SerappSch."Next Call Date");
        END;
        SerappSch.INSERT;
        SerappSch.VALIDATE(SerappSch."Operation Code", FaultRec."Operation Code");
        Rec := SerappSch;
        /*
          i := 0;
        PoServLineRec.SETFILTER(PoServLineRec."Vehicle Registration No.",ServiceItem."No.");
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
        ServiceItem.GET("Service Item");
        Custrec.GET(ServiceItem."Customer No.");
        IF "Service Due Date" = 0D THEN
            "Service Due Date" := TODAY;
        FaultRec.SETRANGE(FaultRec."Model No.", ServiceItem."Model No.");
        //IF FaultRec.FIND(FaultRec."Operation Code") THEN
        IF FaultRec.FIND('-') THEN
            OperationCodeCount := FaultRec.COUNT;
        IF OperationCodeCount > 1 THEN BEGIN
            FaultRec.NEXT := +1;
            SerappSch.INIT;
            SerappSch."Service Item" := "Service Item";
            SerappSch."Operation Code" := FaultRec."Operation Code";
            SerappSch.Description := FaultRec.Description;
            SerappSch."Service Due Date" := CALCDATE('3M', "Service Due Date");
            SerappSch."Agreed Date" := SerappSch."Service Due Date";
            SerappSch."Customer No." := ServiceItem."Customer No.";
            SerappSch."Contact Person" := ServiceItem.Contact;
            SerappSch."Phone No. 1" := ServiceItem."Phone No.";
            SerappSch."Engine No." := ServiceItem."Engine No.";
            SerappSch.VIN := ServiceItem."Chasis No.";
            SerappSch."Model Code" := ServiceItem."Model No.";
            SerappSch."Next Call Date" := CALCDATE('-10D', SerappSch."Service Due Date");
            RetDay := DATE2DMY(SerappSch."Next Call Date", 1);
            CASE RetDay OF
                //6:  SerappSch."Next Call Date." := CALCDATE('2D',SerappSch."Next Call Date.");
                7:
                    SerappSch."Next Call Date" := CALCDATE('1D', SerappSch."Next Call Date");
            END;
            SerappSch."Contact Email" := Custrec."E-Mail";
            SerappSch.INSERT;
            Rec := SerappSch;
        END;
    end;

    procedure GenScheduleCard()
    begin
        /*AppScheduling2.SETRANGE(AppScheduling2."Technician Code","Technician Code");
        AppScheduling2.SETRANGE(AppScheduling2."Schedule Date","Customer's Preferred Date");
        IF AppScheduling2.FINDLAST THEN
          EXIT
        ELSE
        AppScheduling.INIT;
          AppScheduling."Entry No" += 1;
          AppScheduling.VALIDATE(AppScheduling."Technician Code","Technician Code");
          AppScheduling."Technician Name" := "Technician Name";
          AppScheduling."Schedule Date" := "Customer's Preferred Date";
          AppScheduling."Job Category" := "Service Type";
          AppScheduling."Daily Man Hour" := 8;
          AppScheduling."Hours Consumed" := "Service Expected Duration";
          AppScheduling."COF No." := "Customer Order Form No.";
          AppScheduling."Veh Reg No." := "Service Item";
          AppScheduling."Job Type" := Teams;
          AppScheduling.INSERT(TRUE);
         */

    end;

    procedure DaysBeforeDue()
    begin
        //"Next Call Date" := CALCDATE('-10D',"Service Due Projected Date");
        //RetDay := DATE2DWY("Next Call Date",1);

        //CASE RetDay OF
        //    6:  "Next Call Date" := CALCDATE('2D',"Next Call Date");  //saturday
        //    7:  "Next Call Date" := CALCDATE('1D',"Next Call Date");  //sunday
        //END;


        //IF "Expected Reception Date" < TODAY THEN
        //ERROR(Text003);

        IF ("Agreed Date" - TODAY) > 10 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"Greater than 10";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 10 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-10";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 9 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-9";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 8 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-8";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 7 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-7";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 6 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-6";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 5 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-5";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 4 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-4";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 3 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-3";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 2 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-2";
            MODIFY;
        END;

        IF ("Agreed Date" - TODAY) = 1 THEN BEGIN
            "Days Before Due Date" := "Days Before Due Date"::"N-1";
            MODIFY;
        END;

        IF "Appointment Status" = "Appointment Status"::"Confirmed Appointment" THEN
            IF "Days Before Due Date" = "Days Before Due Date"::"Greater than 10" THEN BEGIN
                Closed := FALSE;
                MODIFY := TRUE;
            END ELSE BEGIN
                Closed := TRUE;
                MODIFY := TRUE;
            END;

        IF "Appointment Status" = "Appointment Status"::"Confirmed Appointment" THEN
            IF "Agreed Date" < TODAY THEN BEGIN
                Closed := TRUE;
                MODIFY := TRUE;
            END;
    end;
}

