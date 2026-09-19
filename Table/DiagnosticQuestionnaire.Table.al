table 50120 "Diagnostic Questionnaire"
{

    fields
    {
        field(1; "Diagnostic Questionnier No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Diagnostic Questionnier No." <> xRec."Diagnostic Questionnier No." THEN BEGIN
                    SalesSetup.GET;
                    NoSeriesMgt.TestManual("Diagnostic Questionnier No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "SA Name"; Text[30])
        {
        }
        field(4; "Reception Date"; Date)
        {
        }
        field(5; "Reception Time"; Time)
        {
        }
        field(6; "Reception Type"; Option)
        {
            OptionCaption = 'Customer Bring-in,Dealer Pick-up';
            OptionMembers = "Customer Bring-in","Dealer Pick-up";
        }
        field(7; "Courtesy Vehicle"; Option)
        {
            OptionCaption = 'No Need,Need';
            OptionMembers = "No Need",Need;
        }
        field(8; "Delivery Type"; Option)
        {
            OptionCaption = 'Customer Come-in,Dealer Delivery';
            OptionMembers = "Customer Come-in","Dealer Delivery";
        }
        field(9; "Delivery Date"; Date)
        {
        }
        field(10; "Delivery Time"; Time)
        {
        }
        field(11; "Confirmation Date"; Date)
        {
        }
        field(12; "Customer Order No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE("Service Type" = filter('General Workshop'));

            trigger OnValidate()
            begin
                IF COFRec.GET("Customer Order No.") THEN BEGIN
                    Date := COFRec."Customer Order Form Date";
                    "SA Name" := COFRec."Service Advisor's Name";
                    "Reception Date" := COFRec."Reception Date";
                    "Reception Time" := COFRec."Reception Time";
                    "Reception Type" := COFRec."Reception Type";
                    "Delivery Date" := COFRec."Expected Delivery Date";
                    "Delivery Time" := COFRec."Expected Delivery Time";
                    Phenomena := COFRec."Job Details";
                    "Confirmation Date" := COFRec."Confirmation Date";
                    "Confirmation Time" := COFRec."Confirmation Time";
                    "Confirmation Staff Name" := COFRec."Confirmation Staff Name";
                    "Vehicle Driven By" := COFRec."Vehicle Driven By Type";
                    "Vehicle Driven by Name" := COFRec."Vehicle Driven By";
                    "Contact Telephone" := COFRec.Home;
                    "Contact Available Time from" := COFRec."Available Time From";
                    "Contact Available Time to" := COFRec."Available Time To";
                    "Odometer Reading at Appointmen" := COFRec."Odometer Reading At Appointmen";
                    "Key Assined No." := COFRec."Key Assigned No.";
                    "Stall No." := COFRec."Stall No.";
                    VALIDATE("Vehicle Registration No.", COFRec."Vehicle Registration No.");
                    VALIDATE("Customer No.", COFRec."Customer No.");
                END;
            end;
        }
        field(13; "Vehicle Driven By"; Option)
        {
            OptionCaption = 'Owner,Family,Other';
            OptionMembers = Owner,Family,Other;
        }
        field(14; "Odometer Reading at Appointmen"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(15; "Customer No."; Code[10])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CusRec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := CusRec.Name;
                    Address := CusRec.Address;
                    Telephone := CusRec."Phone No.";
                END;
            end;
        }
        field(16; "Customer Name"; Text[50])
        {
        }
        field(17; Address; Text[50])
        {
        }
        field(18; Telephone; Code[20])
        {
        }
        field(19; "Vehicle Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No.";

            trigger OnValidate()
            begin
                IF ServItemRec.GET("Vehicle Registration No.") THEN BEGIN
                    "Model Name" := ServItemRec.Make;
                    "Model Code" := ServItemRec."Model No.";
                    VALIDATE("Customer No.", ServItemRec."Customer No.");
                    "Customer Name" := ServItemRec.Name;
                    Address := ServItemRec.Address;
                    Telephone := ServItemRec.Business;
                    "Engine No." := ServItemRec."Engine No.";
                    "Model Year" := ServItemRec."Model Year";
                    "Chassis No." := ServItemRec."Chasis No.";
                    "Registered Date" := ServItemRec."Installation Date";
                END;
            end;
        }
        field(20; "Registered Date"; Date)
        {
        }
        field(21; "Model Name"; Text[50])
        {
        }
        field(22; "Model Code"; Code[20])
        {
        }
        field(23; "Engine No."; Code[20])
        {
        }
        field(24; "Confirmation Time"; Time)
        {
        }
        field(25; Phenomena; Text[250])
        {
        }
        field(26; "From When"; Option)
        {
            OptionCaption = 'Recently,1 Week Ago,Other';
            OptionMembers = Recently,"1 Week Ago",Other;
        }
        field(27; "State if Other"; Text[30])
        {
        }
        field(28; Frequency; Option)
        {
            OptionCaption = 'Always,Occasionally,One Time Only,Other';
            OptionMembers = Always,Occasionally,"One Time Only",Other;
        }
        field(29; "State Other Frequency"; Text[30])
        {
        }
        field(30; Place; Option)
        {
            OptionCaption = 'Ordinary Road,Expressway,Slope,Traffic ';
            OptionMembers = "Ordinary Road",Expressway,Slope,"Traffic ";
        }
        field(31; "Warning Lamp"; Option)
        {
            OptionCaption = ' ,Light On,Flashing,Multiple Flashing';
            OptionMembers = " ","Light On",Flashing,"Multiple Flashing";
        }
        field(32; Starting; Option)
        {
            OptionCaption = 'Starting,Idling,Moving';
            OptionMembers = Starting,Idling,Moving;
        }
        field(33; "If Moving"; Option)
        {
            OptionCaption = ' ,Constant Speed,Accelerating,Decelerating';
            OptionMembers = " ","Constant Speed",Accelerating,Decelerating;
        }
        field(34; Stopped; Option)
        {
            OptionCaption = 'Stopped,Engine Cold,Engine Warm,Shift Position';
            OptionMembers = Stopped,"Engine Cold","Engine Warm","Shift Position";
        }
        field(35; Speedmeter; Code[10])
        {
        }
        field(36; Tachometer; Code[10])
        {
        }
        field(37; Advancing; Boolean)
        {
        }
        field(38; "Shifting Gear"; Boolean)
        {
        }
        field(39; "Backing Up"; Boolean)
        {
        }
        field(40; Bracking; Boolean)
        {
        }
        field(41; "Number of Occupants"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(42; "Vehicle Load"; Decimal)
        {
        }
        field(43; "Towing Load"; Decimal)
        {
        }
        field(44; Surface; Option)
        {
            OptionCaption = ' ,Flat,Bumpy,Rough,Other';
            OptionMembers = " ",Flat,Bumpy,Rough,Other;
        }
        field(45; "If Other Surface (State)"; Text[30])
        {
        }
        field(46; Weather; Option)
        {
            OptionCaption = ' ,Fine,Cloudy,Rain,Snow,Outside Tempt.';
            OptionMembers = " ",Fine,Cloudy,Rain,Snow,"Outside Tempt.";
        }
        field(47; "A/C Temp Setting"; Code[10])
        {
        }
        field(48; "Fan Speed Setting"; Code[10])
        {
        }
        field(49; "Recir. Position"; Code[10])
        {
        }
        field(50; "Air Flow Mode"; Code[10])
        {
        }
        field(51; "Condition Staff Name"; Text[50])
        {
        }
        field(52; "Condition Date"; Date)
        {
        }
        field(53; "Condition Time"; Time)
        {
        }
        field(54; "Contact Telephone"; Code[20])
        {
        }
        field(55; "Contact Available Time to"; Time)
        {
        }
        field(56; "Contact Staff Name"; Text[50])
        {
        }
        field(57; "Contact Date"; Date)
        {
        }
        field(58; "Contact Time"; Time)
        {
        }
        field(59; "Confirmed with Customer"; Boolean)
        {
        }
        field(60; "Additional Job Confirmation"; Boolean)
        {
        }
        field(61; Valuable; Boolean)
        {
        }
        field(62; "Seat Cover"; Boolean)
        {
        }
        field(63; "Floor Mat"; Boolean)
        {
        }
        field(64; "Walk-Arround Check"; BLOB)
        {
        }
        field(65; "Inspection Detaile/Result"; Text[250])
        {
        }
        field(66; "Key Assined No."; Code[20])
        {
        }
        field(67; "Stall No."; Option)
        {
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30";
        }
        field(68; Reappearance; Boolean)
        {
        }
        field(69; "Result Discovered/Prediction"; Text[50])
        {
        }
        field(70; "Main Cause1"; Text[250])
        {
        }
        field(71; "Main Cause2"; Text[250])
        {
        }
        field(72; "Main Cause3"; Text[250])
        {
        }
        field(73; "Main Cause4"; Text[250])
        {
        }
        field(74; "Start Date"; Date)
        {
        }
        field(75; "Start Time"; Time)
        {
        }
        field(76; "End Date"; Date)
        {
        }
        field(77; "End Time"; Time)
        {
        }
        field(78; "Time Required"; Decimal)
        {
        }
        field(79; DTR; Option)
        {
            OptionCaption = 'Need,No Need';
            OptionMembers = Need,"No Need";
        }
        field(80; "Instruction Staff Name"; Text[50])
        {
        }
        field(81; "Confirmed By"; Code[10])
        {
        }
        field(82; "Confirmed Date"; Date)
        {
        }
        field(83; "Confirmed Time"; Time)
        {
        }
        field(84; Warranty; Boolean)
        {
        }
        field(85; Destination; Text[50])
        {
        }
        field(86; "In Charge"; Text[50])
        {
        }
        field(87; "Receiving Status"; Option)
        {
            OptionCaption = ' ,Being Received,Planned to be received';
            OptionMembers = " ","Being Received","Planned to be received";
        }
        field(88; "Receiving Status Date"; Date)
        {
        }
        field(89; "Receiving Status Time"; Time)
        {
        }
        field(90; "Vehicle Status"; Option)
        {
            OptionCaption = ' ,Recurrence,Difficulty in Cause Identification,Difficulty Repair';
            OptionMembers = " ",Recurrence,"Difficulty in Cause Identification","Difficulty Repair";
        }
        field(91; Requests; Option)
        {
            OptionCaption = ' ,Actual Vehicle Check,Repair Information Provision,Repair Assistance,Others';
            OptionMembers = " ","Actual Vehicle Check","Repair Information Provision","Repair Assistance",Others;
        }
        field(92; "If Requests is Other Pls State"; Text[50])
        {
        }
        field(93; "Support Request Date"; Date)
        {
        }
        field(94; "Support Request Time"; Time)
        {
        }
        field(95; "Support Staff Name"; Text[50])
        {
        }
        field(96; "If Shift Position"; Text[30])
        {
        }
        field(97; "Outside Tempt."; Decimal)
        {
        }
        field(98; "Odometer Reading at Reception"; Decimal)
        {
        }
        field(99; "Job Instruction"; Text[250])
        {
        }
        field(100; DTC1; Text[30])
        {
        }
        field(101; DTC2; Text[30])
        {
        }
        field(102; DTC3; Text[30])
        {
        }
        field(103; DTC4; Text[30])
        {
        }
        field(104; Status1; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
        field(105; Status2; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
        field(106; Status3; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
        field(107; Status4; Option)
        {
            OptionCaption = ' ,C,P,H';
            OptionMembers = " ",C,P,H;
        }
        field(108; "Freeze Frame Data Saved1"; Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(109; "Freeze Frame Data Saved2"; Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(110; "Freeze Frame Data Saved3"; Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(111; "Freeze Frame Data Saved4"; Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(112; "Support Request Staff Name"; Text[30])
        {
        }
        field(113; "Confirmation Staff Name"; Text[30])
        {
        }
        field(114; Condition; Option)
        {
            OptionCaption = 'Starting,Idling,Moving';
            OptionMembers = Starting,Idling,Moving;
        }
        field(115; Shift; Text[30])
        {
        }
        field(116; "Job Instruction Staff Name"; Text[30])
        {
        }
        field(117; "No. Series"; Code[10])
        {
        }
        field(118; "If Other, Driven by"; Text[30])
        {
        }
        field(119; "Contact Available Time from"; Time)
        {
        }
        field(120; "Multiple Flashing"; Text[30])
        {
        }
        field(121; Condition1; Option)
        {
            OptionCaption = ' ,Stopped,Engine Cold,Engine Warm,Shift Position';
            OptionMembers = " ",Stopped,"Engine Cold","Engine Warm","Shift Position";
        }
        field(122; Condition2; Option)
        {
            OptionCaption = 'Advancing,Shift Gears,Backing Up,Braking';
            OptionMembers = Advancing,"Shift Gears","Backing Up",Braking;
        }
        field(123; "Walk-Around Check"; Boolean)
        {
        }
        field(124; Result; Option)
        {
            OptionCaption = ' ,Discovered,Prediction,Follow Status';
            OptionMembers = " ",Discovered,Prediction,"Follow Status";
        }
        field(125; "If Prediction"; Text[30])
        {
        }
        field(128; "Driver's Name"; Text[30])
        {
        }
        field(129; "Model Year"; Integer)
        {
        }
        field(130; "Chassis No."; Code[20])
        {
        }
        field(131; "SA Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("SA Code") THEN
                    "SA Name" := ResRec.Name;
            end;
        }
        field(132; "COF No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(133; "Vehicle Driven by Name"; Text[30])
        {
        }
        field(134; Traffic; Boolean)
        {
        }
        field(135; Right; Boolean)
        {
        }
        field(136; Left; Boolean)
        {
        }
        field(137; Front; Boolean)
        {
        }
        field(138; Rear; Boolean)
        {
        }
        field(139; Top; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Diagnostic Questionnier No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Diagnostic Questionnier No." = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Auto Sale Invoice No.");
            "No. Series" := SalesSetup."Auto Sale Invoice No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Diagnostic Questionnier No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        COFRec: Record "Customer Order Table.";
        CusRec: Record Customer;
        ServItemRec: Record "Service Item";
        ResRec: Record Resource;


    procedure AssistEdit(OldDiagQue: Record "Diagnostic Questionnaire"): Boolean
    var
        DiagQue: Record "Diagnostic Questionnaire";
    begin
        /* WITH DiagQue DO BEGIN
            DiagQue := Rec;
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Auto Sale Invoice No.");
            IF NoSeriesMgt.SelectSeries(SalesSetup."Auto Sale Invoice No.", OldDiagQue."No. Series", "No. Series") THEN BEGIN
                NoSeriesMgt.SetSeries("Diagnostic Questionnier No.");
                Rec := DiagQue;
                EXIT(TRUE);
            END;
        END; */
    end;
}

