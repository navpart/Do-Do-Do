#pragma warning disable AL0914
table 70034 "Customer Order HeaderX"
#pragma warning restore AL0914
{

    DrillDownPageID = 80043;
    LookupPageID = 80043;

    fields
    {
        field(1; "No."; Code[12])
        {
            TableRelation = "Customer Order HeaderX"."No.";

            trigger OnValidate()
            var
                NoSeriesMgt: Codeunit "No. Series";

            begin
                IF "No." <> xRec."No." THEN BEGIN
                    SalesSetup.GET;
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Reception Date"; Date)
        {
        }
        field(3; "Reception Time"; Time)
        {
        }
        field(4; "Reception Type"; Option)
        {
            OptionCaption = 'Customer Bring-In,Dealer Pick-Up';
            OptionMembers = "Customer Bring-In","Dealer Pick-Up";
        }
        field(5; "Courtesy Vehicle"; Option)
        {
            OptionCaption = 'Need,No Need';
            OptionMembers = Need,"No Need";
        }
        field(6; "Delivery Type"; Option)
        {
            OptionCaption = 'Customer Come-In,Dealer Delivery,Place of Work,Home,Other';
            OptionMembers = "Customer Come-In","Dealer Delivery","Place of Work",Home,Other;
        }
        field(7; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := COPYSTR(CustRec.Name, 1, MAXSTRLEN("Customer Name"));
                    Address := COPYSTR(CustRec.Address, 1, MAXSTRLEN(Address));
                    Address2 := COPYSTR(CustRec."Address 2", 1, MAXSTRLEN(Address2));
                    "Customer Name2" := COPYSTR(CustRec.Name, 1, MAXSTRLEN("Customer Name"));
                    "Customer Address" := COPYSTR(CustRec.Address, 1, MAXSTRLEN(Address));
                    "Customer Address2" := COPYSTR(CustRec.Address, 1, MAXSTRLEN(Address));
                    Mobile := CustRec."Phone No.";
                    "E-mail" := CustRec."E-Mail";
                END;
            end;
        }
        field(8; "Customer Name"; Text[50])
        {
        }
        field(9; Address; Text[50])
        {
        }
        field(10; "Telephone No."; Text[15])
        {
        }
        field(11; Address2; Text[50])
        {
        }
        field(12; Date; Date)
        {
        }
        field(13; "Confirmation Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "Confirmation Date" <> 0D THEN BEGIN
                    "Confirmation Time" := TIME;
                    //"Confirmation Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Confirmation Date" := 0D;
                    "Confirmation Time" := 0T;
                    "Confirmation Staff Name" := '';
                END;
            end;
        }
        field(14; "Confirmation Time"; Time)
        {
        }
        field(15; "Confirmation Staff Name"; Text[50])
        {
        }
        field(16; "Parts Ordered Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF "Parts Ordered Date" <> 0D THEN BEGIN
                    "Parts Ordered Time" := TIME;
                    // "Parts Ordered Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Parts Ordered Date" := 0D;
                    "Parts Ordered Time" := 0T;
                    "Parts Ordered Staff Name" := '';
                END;
            end;
        }
        field(17; "Parts Ordered Time"; Time)
        {
            Editable = false;
        }

        field(18; "Parts Ordered Staff Name"; Text[30])
        {
            Editable = false;
        }
        field(19; "Parts Arrived Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF "Parts Arrived Date" <> 0D THEN BEGIN
                    "Parts Arrived Time" := TIME;
                    "Parts Arrived Staff Name" := USERID;
                    Stage := Stage::"N-2";
                END
                ELSE BEGIN
                    "Parts Arrived Date" := 0D;
                    "Parts Arrived Time" := 0T;
                    "Parts Arrived Staff Name" := '';
                    Stage := Stage::"N-1";
                END;
            end;
        }
        field(20; "Parts Arrived Time"; Time)
        {
            Editable = false;
        }
        field(21; "Parts Arrived Staff Name"; Text[30])
        {
            Editable = false;
        }
        field(22; "Model No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF ModelRec.GET("Model No.") THEN
                    "Model Name" := ModelRec."Model Name"
                ELSE
                    "Model Name" := '';
            end;
        }
        field(23; "Model Name"; Text[40])
        {
            Editable = false;
        }
        field(24; "Vehicle Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE("Service Item Status" = CONST(Active));

            trigger OnValidate()
            begin
                IF ServiceItem.GET("Vehicle Registration No.") THEN BEGIN
                    "Model No." := ServiceItem."Model No.";
                    "Model Year" := ServiceItem."Model Year";
                    "Model Name" := ServiceItem.Description;
                    "Frame No./VIN" := ServiceItem."Chasis No.";
                    "Engine No." := ServiceItem."Engine No.";
                    Home := ServiceItem."Phone No.";
                    Business := ServiceItem.Business;
                    Mobile := ServiceItem.Mobile;
                    "E-mail" := ServiceItem."Customer Email";
                    Brand := ServiceItem."Vehicle Brand";
                    "Vehicle Classification" := ServiceItem."Vehicle Classification";

                    VALIDATE("Customer No.", ServiceItem."Customer No.");

                    FARec.SETFILTER(FARec."No.", '<>%1', '');
                    FARec.SETRANGE("Registration No.", "Vehicle Registration No.");
                    IF FARec.FINDFIRST THEN
                        VALIDATE("FA No.", FARec."No.");

                    //Added by Rildwan
                    i := 0;
                    CustOrderTable2.SETCURRENTKEY("Vehicle Registration No.", "Reception Date");
                    CustOrderTable2.SETFILTER("Vehicle Registration No.", ServiceItem."No.");
                    CustOrderTable2.SETFILTER(Posted, '%1', TRUE);
                    IF CustOrderTable2.FINDLAST THEN BEGIN
                        i := CustOrderTable2.COUNT;
                        IF i > 0 THEN BEGIN
                            "Job No.1" := CustOrderTable2."No.";
                            Odometer1 := CustOrderTable2."Odometer At Reception";
                            Date1 := CustOrderTable2."Reception Date";
                            "Job Description1" := COPYSTR(CustOrderTable2."Job Details", 1, MAXSTRLEN("Job Description1"));
                        END ELSE BEGIN
                            "Job No.1" := '';
                            Odometer1 := 0;
                            Date1 := 0D;
                            "Job Description1" := '';
                        END;

                        IF i > 1 THEN BEGIN
                            CustOrderTable2.NEXT := -1;
                            "Job No.2" := CustOrderTable2."No.";
                            Odometer2 := CustOrderTable2."Odometer At Reception";
                            Date2 := CustOrderTable2."Reception Date";
                            "Job Description2" := COPYSTR(CustOrderTable2."Job Details", 1, MAXSTRLEN("Job Description2"));
                        END ELSE BEGIN
                            "Job No.2" := '';
                            Odometer2 := 0;
                            Date2 := 0D;
                            "Job Description2" := '';
                        END;

                        IF i > 2 THEN BEGIN
                            CustOrderTable2.NEXT := -1;
                            "Job No.3" := CustOrderTable2."No.";
                            Odometer3 := CustOrderTable2."Odometer At Reception";
                            Date3 := CustOrderTable2."Reception Date";
                            "Job Description3" := COPYSTR(CustOrderTable2."Job Details", 1, MAXSTRLEN("Job Description3"));
                        END ELSE BEGIN
                            "Job No.3" := '';
                            Odometer3 := 0;
                            Date3 := 0D;
                            "Job Description3" := '';
                        END;

                    END ELSE BEGIN
                        "Job No.1" := '';
                        Odometer1 := 0;
                        Date1 := 0D;
                        "Job Description1" := '';
                        "Job No.2" := '';
                        Odometer2 := 0;
                        Date2 := 0D;
                        "Job Description2" := '';
                        "Job No.3" := '';
                        Odometer3 := 0;
                        Date3 := 0D;
                        "Job Description3" := '';
                    END;


                    IF "Frame No./VIN" <> '' THEN BEGIN
                        VMI := COPYSTR("Frame No./VIN", 1, 3);
                        VDS := COPYSTR("Frame No./VIN", 4, 6);
                        VIS := COPYSTR("Frame No./VIN", 10, 8);
                    END;

                END;


                
            end;
        }
        field(25; "Contact Telephone No."; Text[15])
        {
        }
        field(26; "Contact Telephone No. Type"; Option)
        {
            OptionCaption = 'Home,Business,Mobile';
            OptionMembers = Home,Business,Mobile;
        }
        field(27; "Available Time From"; Time)
        {
        }
        field(28; "Available Time To"; Time)
        {
        }
        field(29; "Vehicle Driven By"; Text[30])
        {
        }
        field(30; "Vehicle Driven By Type"; Option)
        {
            OptionCaption = 'Owner,Family,Other';
            OptionMembers = Owner,Family,Other;
        }
        field(31; "Completed Reason"; Text[50])
        {
        }
        field(32; "Odometer At Appointment"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(33; "Vehicle Registered Date"; Date)
        {
            CalcFormula = Lookup("Service Item"."Warranty Starting Date (Parts)" WHERE("No." = FIELD("Vehicle Registration No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Frame No./VIN"; Code[20])
        {
            Editable = false;
        }
        field(35; "Engine No."; Code[20])
        {
            Editable = false;
        }
        field(36; "E-mail"; Text[50])
        {
        }
        field(37; "Current Service Due Date"; Date)
        {
        }
        field(38; "Current Service Kilometre"; Code[20])
        {
        }
        field(39; "Operation Code"; Code[20])
        {
            TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model No."));

            trigger OnValidate()
            begin
                GenMaterials;
            end;
        }
        field(40; "Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(41; "Service History"; Boolean)
        {
        }
        field(42; "SSC/SC Information"; Text[30])
        {
        }
        field(43; Appointment; Boolean)
        {
        }
        field(44; Maintenance; Boolean)
        {
        }
        field(45; "General Repair"; Boolean)
        {
        }
        field(46; Internal; Boolean)
        {
        }
        field(47; Warranty; Boolean)
        {
        }
        field(48; "Customer Waiting"; Boolean)
        {
        }
        field(49; "Repeat Repair"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Customer Complaint" = TRUE THEN
                    ERROR('Sorry you can mark either of %1 or %2 and not both', "Customer Complaint", "Repeat Repair")
                ELSE
                    IF "Repeat Repair" THEN BEGIN
                        CompRec.INIT;
                        CompRec."Date of Complaint" := Date;
                        CompRec."COF Date" := Date;
                        CompRec.VALIDATE(CompRec."Customer No.", "Customer No.");
                        CompRec.VALIDATE(CompRec."Vehicle Registration No.", "Vehicle Registration No.");
                        CompRec."Repeat Repair" := TRUE;
                        CompRec.Complaint := "Job Details";
                        CompRec."Job Details" := "Job Details";
                        CompRec."COF No." := "No.";
                        CompRec.INSERT(TRUE);
                        ComplainCode := CompRec."Complain Code";
                        MESSAGE('Complain Card Successfully Created', ComplainCode);
                    END;
            end;
        }
        field(50; "Job Details"; Text[250])
        {
        }
        field(51; "Appointment Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "Appointment Date" <> 0D THEN BEGIN
                    "Appointment Time" := TIME;
                    //"Appointment Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Appointment Time" := 0T;
                    "Appointment Staff Name" := '';
                END;
            end;
        }
        field(52; "Appointment Time"; Time)
        {
        }
        field(53; "Appointment Staff Name"; Text[30])
        {
        }
        field(54; "Estimated Job Time"; Decimal)
        {
        }
        field(55; "Time Changed"; Time)
        {
        }
        field(56; "Model Year"; Integer)
        {
            Editable = false;
        }
        field(57; "Cost Changed"; Decimal)
        {
            Editable = false;
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
        field(63; Brand; Code[20])
        {
            TableRelation = "Vehicle Brand"."Vehicle Brand Code";
        }
        field(67; Quantity1; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(68; Quantity2; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(72; Stock1; Boolean)
        {
        }
        field(73; Stock2; Boolean)
        {
        }
        field(77; ETA1; Date)
        {
        }
        field(78; ETA2; Date)
        {
        }
        field(85; "Walk Around Check"; BLOB)
        {

            trigger OnValidate()
            begin
                IF "Walk Around Reception Date" <> 0D THEN BEGIN
                    "Walk Around Reception Time" := TIME;
                    //"Reception Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Walk Around Reception Time" := 0T;
                    "Reception Staff Name" := '';
                END;
            end;
        }
        field(86; "Additional Job Confirmation"; Boolean)
        {
        }
        field(87; "Car Wash"; Option)
        {
            OptionCaption = 'Needed,Unneeded';
            OptionMembers = Needed,Unneeded;
        }
        field(88; Valuables; Boolean)
        {
        }
        field(89; "Present Estimate w/Explanation"; Boolean)
        {
        }
        field(90; Memo; Text[80])
        {
        }
        field(91; "Courtesy Items"; Text[30])
        {
        }
        field(92; "Payment Method"; Option)
        {
            OptionCaption = 'Credit Card,Other';
            OptionMembers = "Credit Card",Other;
        }
        field(93; "If Other Method"; Text[30])
        {
        }
        field(94; "Odometer At Reception"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(95; "Walk Around Reception Date"; Date)
        {
        }
        field(96; "Walk Around Reception Time"; Time)
        {
        }
        field(97; "Reception Staff Name"; Text[30])
        {
        }
        field(98; "Customer Signature"; BLOB)
        {
        }
        field(99; "Expected Delivery Date"; Date)
        {
        }
        field(100; "Expected Delivery Time"; Time)
        {
        }
        field(101; "If Other Customer's Requests"; Text[30])
        {
        }
        field(102; Estimation; Decimal)
        {
            CalcFormula = Sum("Customer Order LineX"."Amount Inc. VAT" WHERE("Document No." = FIELD("No."),
                                                                              "Additional Jobs" = filter(false)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Estimate := Estimation;
            end;
        }
        field(103; "Replace Parts Keep"; Boolean)
        {
        }
        field(104; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(105; Maintenance2; Boolean)
        {
        }
        field(106; "Customer Name2"; Text[30])
        {
        }
        field(107; "Customer Address"; Text[50])
        {
        }
        field(108; "Customer Address2"; Text[50])
        {
        }
        field(109; "Customer Telephone No."; Text[15])
        {
        }
        field(110; "Model Name2"; Code[30])
        {
        }
        field(111; "Vehicle Registration No.2"; Code[20])
        {
        }
        field(112; "Update Customer Record"; Boolean)
        {
        }
        field(113; "Seat Cover"; Boolean)
        {
        }
        field(114; "Floor Mat"; Boolean)
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
        field(124; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                IF ItemRec.GET("Item No.") THEN
                    Description := ItemRec.Description
                ELSE
                    Description := '';
            end;
        }
        field(125; Description; Text[10])
        {
        }
        field(126; Quantity; Integer)
        {
        }
        field(127; Stock; Boolean)
        {
        }
        field(128; EDA; Date)
        {
        }
        field(129; Cheque; Boolean)
        {
        }
        field(130; Cash; Boolean)
        {
        }
        field(131; "Job Description1"; Text[30])
        {
        }
        field(132; "Job Description2"; Text[30])
        {
        }
        field(133; "Job Description3"; Text[30])
        {
        }
        field(134; Maintenance1; Boolean)
        {
        }
        field(135; "Operation Code Description"; Text[50])
        {
        }
        field(138; "Contact Mobile"; Text[30])
        {
        }
        field(139; Home; Text[30])
        {
        }
        field(140; Business; Text[30])
        {
        }
        field(141; Mobile; Text[20])
        {
        }
        field(142; "Estimate No."; Code[15])
        {
            TableRelation = "Customer Order HeaderX"."No.";

            trigger OnValidate()
            begin
                TESTFIELD("No.");
                "Estimate No." := "No.";
            end;
        }
        field(143; "Total Estimation"; Decimal)
        {
            /* CalcFormula = Sum("Customer Order LineX"."Amount Inc. VAT" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField; */
        }
        field(144; "Location Code"; Code[10])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(145; "Feeding Location"; Code[10])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(146; "Estimate Factor"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(147; "Add. Jobs Estimation"; Decimal)
        {
            /* CalcFormula = Sum("Customer Order LineX"."Amount Inc. VAT" WHERE("Document No." = FIELD("Estimate No."),
                                                                              "Additional Jobs" = filter(true)));
            FieldClass = FlowField; */
        }
        field(148; Total; Decimal)
        {
        }
        field(149; "Service Location"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(150; "Customer Type"; Option)
        {
            OptionCaption = 'CPUS,Warranty,Internal';
            OptionMembers = CPUS,Warranty,Internal;
        }
        field(151; Other; Boolean)
        {
        }
        field(152; "Walk-around Check"; Boolean)
        {
        }
        field(153; "If Other Delivery Type"; Text[30])
        {
        }
        field(154; "Job Instruction No."; Code[15])
        {
        }
        field(155; "Job Instruction Date"; Date)
        {
        }
        field(156; "Estimated Completion Date"; Date)
        {
        }
        field(157; "Estimated Completion Time"; Time)
        {
        }
        field(158; "Key Assigned No."; Code[10])
        {
        }
        field(159; "Stall No."; Option)
        {
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30";
        }
        field(160; "Job Start Date"; Date)
        {
        }
        field(161; "Job Start Time"; Time)
        {
        }
        field(162; "Completion Changed Date"; Date)
        {
        }
        field(163; "Completion Changed Time"; Time)
        {
        }
        field(164; "Delivery Changed Date"; Date)
        {
        }
        field(165; "Delivery Changed Time"; Time)
        {
        }
        field(166; "CC Date"; Date)
        {
            Description = 'CC := Customer Contact';
        }
        field(167; "CC Time"; Time)
        {
            Description = 'CC := Customer Contact';
        }
        field(168; "CC Staff Name"; Text[30])
        {
            Description = 'CC := Customer Contact';
        }
        field(169; "JC Date"; Date)
        {
            Description = 'JC := Job Completion';

            trigger OnValidate()
            begin
                DateDiff := ("JC Date" - "Job Start Date");
            end;
        }
        field(170; "JC Time"; Time)
        {
            Description = 'JC := Job Completion';

            trigger OnValidate()
            begin
                TESTFIELD("JC Date");
                IF "JC Time" <> 0T THEN
                    "Actual Hours Clocked" := ("JC Time" - "Job Start Time") / (3600000)
                ELSE
                    "Actual Hours Clocked" := 0;
            end;
        }
        field(171; "Actual Hours Clocked"; Decimal)
        {
            Editable = false;
        }
        field(172; "Other Findings/Advice"; Text[80])
        {
        }
        field(173; "QC Staff Code"; Code[20])
        {
            Description = 'QC := Quality Control';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("QC Staff Code") THEN
                    "QC Staff Name" := ResRec.Name
                ELSE
                    "QC Staff Name" := '';
            end;
        }
        field(174; "Pre-d C Staff Name"; Code[20])
        {
            Description = 'Pre-d means Pre-delivery Cofirmation';
        }
        field(175; "Pre-d C Confirmed by"; Code[20])
        {
            Description = 'Pre-d means Pre-delivery Cofirmation';
        }
        field(176; Cleanliness; Boolean)
        {
        }
        field(177; "Cleanliness Type"; Option)
        {
            OptionCaption = ' ,Exterior,Interior';
            OptionMembers = " ",Exterior,Interior;
        }
        field(178; Cleanliness2; Boolean)
        {
        }
        field(179; "Courtesy Items Removal"; Boolean)
        {
        }
        field(180; "Courtesy Items Removal2"; Boolean)
        {
        }
        field(181; "Outer Minor P / Seat P"; Boolean)
        {
            Description = 'P means Position';
        }
        field(182; "Outer Minor P / Seat P2"; Boolean)
        {
            Description = 'P means Position';
        }
        field(183; "Clock Adj / Radio Setting"; Boolean)
        {
            Description = 'Adj means Adjustment';
        }
        field(184; "Clock Adj / Radio Setting2"; Boolean)
        {
            Description = 'Adj means Adjustment';
        }
        field(185; "Job CN Date"; Date)
        {
            Description = 'Job Completion Notification';
        }
        field(186; "Job CN Time"; Time)
        {
            Description = 'Job Completion Notification';
        }
        field(187; "Job CN Staff Name"; Code[20])
        {
            Description = 'Job Completion Notification';
        }
        field(188; "Job Details Explanation"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(189; "Fee Explanation"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(190; "Results Confirmation w / Cust."; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(191; "P.S.F.U. (Plan)"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(192; "Level-up"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(193; "JRE Staff Code"; Code[20])
        {
            Description = 'Job Results Explanation';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("JRE Staff Code") THEN
                    "JRE Staff Name" := ResRec.Name
                ELSE
                    "JRE Staff Name" := '';
            end;
        }
        field(194; "Actual Delivery Date"; Date)
        {
        }
        field(195; "Actual Delivery Time"; Time)
        {
        }
        field(196; "Delivery Customer"; Option)
        {
            OptionCaption = 'Owner,Family,Other';
            OptionMembers = Owner,Family,Other;
        }
        field(197; "If Other Customer"; Text[30])
        {
        }
        field(198; "Delivery Staff Name"; Code[20])
        {
        }
        field(199; "P.S.F.U. Staff Name"; Code[20])
        {
        }
        field(200; "P.S.F.U. Confirmed by"; Code[20])
        {
        }
        field(201; "Job Type2"; Option)
        {
            OptionCaption = 'General Repair,Periodic Maintenance,Body and Paint';
            OptionMembers = "General Repair","Periodic Maintenance","Body and Paint";
        }
        field(202; "Parts Desciption"; Text[30])
        {
        }
        field(203; "Job Category"; Option)
        {
            OptionCaption = 'Additional Jobs,Job Stoppage,Other';
            OptionMembers = "Additional Jobs","Job Stoppage",Other;
        }
        field(204; "If Other Job Category"; Text[30])
        {
        }
        field(205; "Fixed"; Boolean)
        {
        }
        field(206; "No Fixed"; Boolean)
        {
        }
        field(207; "P.S.F.U. (Plan) Date"; Date)
        {
        }
        field(208; "P.S.F.U. (Plan) Time"; Time)
        {
        }
        field(209; "P.S.F.U Other"; Text[30])
        {
        }
        field(210; "P.S.F.U. (Actual) Date"; Date)
        {
        }
        field(211; "P.S.F.U. (Actual) Time"; Time)
        {
        }
        field(212; "CT Home"; Text[15])
        {
            Description = 'CT := Contact Telephome';
        }
        field(213; "CT Mobile"; Text[15])
        {
            Description = 'CT := Contact Telephome';
        }
        field(214; "CT Business"; Text[15])
        {
            Description = 'CT := Contact Telephome';
        }
        field(215; "Contact Telephone"; Boolean)
        {
        }
        field(216; "JI E-mail"; Boolean)
        {
        }
        field(217; "JI Other"; Boolean)
        {
        }
        field(218; "JI Other II"; Text[30])
        {
        }
        field(219; "JI EMail2"; Text[50])
        {
        }
        field(220; "Service Type"; Option)
        {
            OptionCaption = 'General Workshop,Body and Paint';
            OptionMembers = "General Workshop","Body and Paint";
        }
        field(221; "Other Payment Type"; Boolean)
        {
        }
        field(222; "Reception Date2"; Date)
        {
        }
        field(223; "Reception Time2"; Time)
        {
        }
        field(224; "Customer Intention/Job Details"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Customer Intention/Job Details" = FALSE THEN BEGIN
                    IF "Customer Intention/Job Details" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Customer Intention/Job Details" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(225; "Customer and Vehicle Info"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Customer and Vehicle Info" = FALSE THEN BEGIN
                    IF "Customer and Vehicle Info" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Customer and Vehicle Info" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(226; Score; Decimal)
        {
            InitValue = 27;
            MaxValue = 31;
            MinValue = 0;
        }
        field(227; "Adjust Veh Reception DateTime"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Adjust Veh Reception DateTime" = FALSE THEN BEGIN
                    IF "Adjust Veh Reception DateTime" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Adjust Veh Reception DateTime" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(228; "Confirm Contact Info/Driver"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Confirm Contact Info/Driver" = FALSE THEN BEGIN
                    IF "Confirm Contact Info/Driver" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Confirm Contact Info/Driver" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(229; "Enter Recptn Appntmt DateTime"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Enter Recptn Appntmt DateTime" = FALSE THEN BEGIN
                    IF "Enter Recptn Appntmt DateTime" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Enter Recptn Appntmt DateTime" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(230; "Print Customer and Veh. Info"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Print Customer and Veh. Info" = FALSE THEN BEGIN
                    IF "Print Customer and Veh. Info" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Print Customer and Veh. Info" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(231; "Print Estimate I"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Print Estimate I" = FALSE THEN BEGIN
                    IF "Print Estimate I" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Print Estimate I" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(232; "Parts Req./Completion DateTime"; Boolean)
        {
            Description = 'Maintenance Reminder and Appointment';

            trigger OnValidate()
            begin
                IF xRec."Parts Req./Completion DateTime" = FALSE THEN BEGIN
                    IF "Parts Req./Completion DateTime" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Parts Req./Completion DateTime" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(233; "Recptn Confirm/Payment Method"; Boolean)
        {
            Description = 'Appointment Preparation';

            trigger OnValidate()
            begin
                IF xRec."Recptn Confirm/Payment Method" = FALSE THEN BEGIN
                    IF "Recptn Confirm/Payment Method" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Recptn Confirm/Payment Method" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(234; "Parts Ordering/Completion Date"; Boolean)
        {
            Description = 'Appointment Preparation';

            trigger OnValidate()
            begin
                IF xRec."Parts Ordering/Completion Date" = FALSE THEN BEGIN
                    IF "Parts Ordering/Completion Date" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Parts Ordering/Completion Date" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(235; "Preparation Status Parts Req."; Boolean)
        {
            Description = 'Appointment Preparation';

            trigger OnValidate()
            begin
                IF xRec."Preparation Status Parts Req." = FALSE THEN BEGIN
                    IF "Preparation Status Parts Req." THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Preparation Status Parts Req." THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(236; "Confirm and Enter Odometer"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Confirm and Enter Odometer" = FALSE THEN BEGIN
                    IF "Confirm and Enter Odometer" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Confirm and Enter Odometer" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(237; "Conduct/Entrer Walkaround Chec"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Conduct/Entrer Walkaround Chec" = FALSE THEN BEGIN
                    IF "Conduct/Entrer Walkaround Chec" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Conduct/Entrer Walkaround Chec" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(238; "Add Job, Valuabes/ Courtesy It"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Add Job, Valuabes/ Courtesy It" = FALSE THEN BEGIN
                    IF "Add Job, Valuabes/ Courtesy It" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Add Job, Valuabes/ Courtesy It" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(239; "Present Estimate I and Xplain"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Present Estimate I and Xplain" = FALSE THEN BEGIN
                    IF "Present Estimate I and Xplain" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Present Estimate I and Xplain" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(240; "Enter Veh Delivery DateTime"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Enter Veh Delivery DateTime" = FALSE THEN BEGIN
                    IF "Enter Veh Delivery DateTime" THEN
                        Score := Score - 1 + 3;
                END ELSE
                    IF NOT "Enter Veh Delivery DateTime" THEN
                        Score := Score - 3 + 1;
            end;
        }
        field(241; "Reconfirm Payment Method"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Reconfirm Payment Method" = FALSE THEN BEGIN
                    IF "Reconfirm Payment Method" THEN
                        Score := Score - 2.5 + 3;
                END ELSE
                    IF NOT "Reconfirm Payment Method" THEN
                        Score := Score - 3 + 2.5;
            end;
        }
        field(242; "Confirm if Car wash is needed"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Confirm if Car wash is needed" = FALSE THEN BEGIN
                    IF "Confirm if Car wash is needed" THEN
                        Score := Score - 2.5 + 3;
                END ELSE
                    IF NOT "Confirm if Car wash is needed" THEN
                        Score := Score - 3 + 2.5;
            end;
        }
        field(243; "Necessity of returnin Repl Par"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Necessity of returnin Repl Par" = FALSE THEN BEGIN
                    IF "Necessity of returnin Repl Par" THEN
                        Score := Score - 2.5 + 3;
                END ELSE
                    IF NOT "Necessity of returnin Repl Par" THEN
                        Score := Score - 3 + 2.5;
            end;
        }
        field(244; "Recptn Detl/Completio DateTime"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Recptn Detl/Completio DateTime" = FALSE THEN BEGIN
                    IF "Recptn Detl/Completio DateTime" THEN
                        Score := Score - 2 + 3;
                END ELSE
                    IF NOT "Recptn Detl/Completio DateTime" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(245; "Obtain Customer Signature"; Boolean)
        {
            Description = 'Reception';

            trigger OnValidate()
            begin
                IF xRec."Obtain Customer Signature" = FALSE THEN BEGIN
                    IF "Obtain Customer Signature" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Obtain Customer Signature" THEN
                        Score := Score - 3 + 2;
            end;
        }
        field(246; "Technician Name"; Text[30])
        {
            FieldClass = Normal;
            TableRelation = Resource;
        }
        field(247; Delivered; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Service Location");
                TESTFIELD("Date Delivered");
                TESTFIELD("Time Delivered");

                IF NOT "DADs Only" THEN BEGIN
                    ServiceAppointments.INIT;
                    ServiceAppointments.VALIDATE("Service Item", "Vehicle Registration No.");
                    //  ServiceAppointments.VALIDATE("Operation Code","Next Operation Code");
                    ServiceAppointments.VALIDATE("Service Due Date", CALCDATE('90D', TODAY));
                    ServiceAppointments."Next Call Date" := CALCDATE('-10D', ServiceAppointments."Service Due Date");
                    ServiceAppointments."Call Type" := ServiceAppointments."Call Type"::"Maintenance Reminder";
                    ServiceAppointments."Customer's Requests" := ServiceAppointments."Customer's Requests"::Appointment;
                    ServiceAppointments."COF No." := "No.";
                    ServiceAppointments."Walk-In" := FALSE;
                    ServiceAppointments.Maintenance := TRUE;
                    ServiceAppointments.INSERT(TRUE);
                    Register4PSF;
                    MESSAGE('Next appointment has been scheduled!');

                    "Actual Delivery Date" := TODAY;

                    IF Delivered = TRUE THEN
                        Stage := Stage::"Job Stoppage";
                END;

                IF "DADs Only" THEN BEGIN
                    "Actual Delivery Date" := TODAY;

                    IF Delivered = TRUE THEN
                        Stage := Stage::"Job Stoppage";
                END;
            end;
        }
        field(248; "Service Advisor"; Code[20])
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
        field(249; "Create Service Order"; Boolean)
        {

            trigger OnValidate()
            begin
                GenerateService;
            end;
        }
        field(250; "Service Order No."; Code[20])
        {
            Editable = false;
            TableRelation = "Service Header"."No.";
            ValidateTableRelation = false;
        }
        field(251; "Post Service Invoice"; Boolean)
        {
        }
        field(252; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(253; Status2; Option)
        {
            OptionCaption = ' ,Awaiting Decision,Awaiting Approval,Awaiting Parts,Work in Progress,Awaiting Sublet,For Quality Control,For Car Wash,Delivery,Carry Over,Completed';
            OptionMembers = " ","Awaiting Decision","Awaiting Approval","Awaiting Parts","Work in Progress","Awaiting Sublet","For Quality Control","For Car Wash",Delivery,"Carry Over",Completed;
        }
        field(254; "Job Opened"; Option)
        {
            OptionCaption = ' ,Appointment Call out,Appointment Call in,Reception,Satelite';
            OptionMembers = " ","Appointment Call out","Appointment Call in",Reception,Satelite;
        }
        field(255; "Service Advisor's Name"; Text[30])
        {
        }
        field(256; Estimate; Decimal)
        {
        }
        field(257; "Additional Job Details"; Text[80])
        {
        }
        field(258; "Next Operation Code"; Code[20])
        {
            TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model No."));

            trigger OnValidate()
            begin
                //TESTFIELD("Reception Date");
                //IF "Actual Delivery Date" = 0D THEN
                //  ERROR('You need to specify Actual Delivery Date!');
                //IF FaultRec.GET("Next Job Type","Model No") THEN
                //   "Next Service Date" := CALCDATE('+3M',"Actual Delivery Date");
            end;
        }
        field(259; "Next Service Date"; Date)
        {
        }
        field(260; Technician; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET(Technician) THEN
                    "Technician Name" := ResRec.Name
                ELSE
                    "Technician Name" := '';
            end;
        }
        field(261; "QC Staff Name"; Text[30])
        {
        }
        field(262; "Job Progress"; Option)
        {
            OptionCaption = ' ,Maintenance Reminder,Appointment,Appointment Prep,Reception,Production,Delivery';
            OptionMembers = " ","Maintenance Reminder",Appointment,"Appointment Prep",Reception,Production,Delivery;
        }
        field(263; "JRE Staff Name"; Text[30])
        {
        }
        field(264; "Total Appointment Time"; Integer)
        {
        }
        field(265; "Total Rem Appt Time"; Integer)
        {
        }
        field(266; "Total Walk in Time"; Integer)
        {
        }
        field(267; "Total Rem W/I Time"; Integer)
        {
        }
        field(268; "Customer Complaint"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Repeat Repair" = TRUE THEN
                    ERROR('Sorry you can mark either of %1 or %2 and not both', "Customer Complaint", "Repeat Repair")
                ELSE
                    IF "Customer Complaint" THEN BEGIN
                        CompRec.INIT;
                        CompRec."Date of Complaint" := Date;
                        CompRec."COF Date" := Date;
                        CompRec.VALIDATE(CompRec."Customer No.", "Customer No.");
                        CompRec.VALIDATE(CompRec."Vehicle Registration No.", "Vehicle Registration No.");
                        CompRec."Repeat Repair" := FALSE;
                        CompRec.Complaint := "Job Details";
                        CompRec."Job Details" := "Job Details";
                        CompRec."COF No." := "No.";
                        CompRec.INSERT(TRUE);
                        ComplainCode := CompRec."Complain Code";
                        MESSAGE('Complain Card Successfully Created', ComplainCode);
                    END;
            end;
        }
        field(269; "Service Duration"; Integer)
        {
        }
        field(270; "Diag/Est"; Boolean)
        {
            Description = 'Diagnosis (Old)';
        }
        field(271; "B & P"; Boolean)
        {
            Description = 'Estimating (Old)';
        }
        field(272; "Priority Class"; Option)
        {
            OptionCaption = ' ,Customer Waiting,Repeat Repair,Promo,Customer Complaint';
            OptionMembers = " ","Customer Waiting","Repeat Repair",Promo,"Customer Complaint";
        }
        field(273; Memo2; Text[80])
        {
        }
        field(274; Rescheduling; Code[20])
        {
            TableRelation = "Service AppointmentsX"."Operation Code";
        }
        field(275; "New Customer"; Boolean)
        {
        }
        field(276; "For Delivery Preparation"; Boolean)
        {
        }
        field(277; "For Invoice"; Boolean)
        {
        }
        field(278; "Appt Confirmed"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Appt Confirmed" = TRUE THEN BEGIN
                    "Confirmation Date" := TODAY;
                    "Confirmation Time" := TIME;
                    //"Confirmation Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Confirmation Date" := 0D;
                    "Confirmation Time" := 0T;
                    "Confirmation Staff Name" := '';
                END;
            end;
        }
        field(279; "For Part Order"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "For Part Order" = TRUE THEN BEGIN
                    "Parts Ordered Date" := TODAY;
                    "Parts Ordered Time" := TIME;
                    //"Parts Ordered Staff Name" := USERID;

                END
                ELSE BEGIN
                    "Parts Ordered Date" := 0D;
                    "Parts Ordered Time" := 0T;
                    "Parts Ordered Staff Name" := '';
                END;

                IF "COF Origin" = "COF Origin"::VRI THEN BEGIN
                    IF VRI2.GET("Vehicle Registration No.") THEN
                        VRI2.VALIDATE(VRI2."Part Order", "For Part Order");
                    VRI2.MODIFY;
                END;
            end;
        }
        field(280; "For Part Arrival"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "For Part Arrival" THEN BEGIN
                    "Parts Arrived Date" := TODAY;
                    "Parts Arrived Time" := TIME;
                    "Parts Arrived Staff Name" := USERID;

                END
                ELSE BEGIN
                    "Parts Arrived Date" := 0D;
                    "Parts Arrived Time" := 0T;
                    "Parts Arrived Staff Name" := '';
                END;
                IF "COF Origin" = "COF Origin"::VRI THEN BEGIN
                    IF VRI2.GET("Vehicle Registration No.") THEN
                        VRI2.VALIDATE(VRI2."Part Arrival", "For Part Arrival");
                    VRI2.MODIFY;
                END;
            end;
        }
        field(281; "For Reception"; Boolean)
        {
        }
        field(282; "For Production"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "For Production" THEN BEGIN
                    IF "COF Origin" = "COF Origin"::VRI THEN BEGIN
                        IF VRI2.GET("Vehicle Registration No.") THEN
                            VRI2.VALIDATE("For Production", "For Production");
                        VRI2.MODIFY;
                    END
                END;
            end;
        }
        field(283; "For Quality Control"; Boolean)
        {
        }
        field(284; "For Payment"; Boolean)
        {
        }
        field(285; "Transfer to TA"; Boolean)
        {
        }
        field(286; "TA Code"; Code[10])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("TA Code") THEN
                    "TA Name" := ResRec.Name
                ELSE
                    "TA Name" := '';
            end;
        }
        field(287; "TA Name"; Text[20])
        {
        }
        field(288; "Shortcut Dimension 1 Code"; Code[10])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(289; "Shortcut Dimension 2 Code"; Code[10])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(290; "Request Batch Name"; Code[10])
        {
            TableRelation = "Requisition Wksh. Name".Name WHERE("Worksheet Template Name" = FILTER('REQ.'),
                                                                 "COF No." = FILTER(<> ''),
                                                                 "Request Type" = filter('Parts'));
        }
        field(291; "Parts Arrived"; Code[10])
        {
            TableRelation = "Service Line"."Document No." WHERE("Document Type" = CONST(Order),
                                                                 "Document No." = FIELD("No."));
        }
        field(292; "For Appt Confirmation"; Boolean)
        {
        }
        field(293; "SSC Available"; Boolean)
        {
        }
        field(294; DateDiff; Decimal)
        {
        }
        field(295; "Order Line Updated"; Boolean)
        {
        }
        field(296; "Est. Req. Batch Name"; Code[10])
        {
            TableRelation = "Requisition Wksh. Name".Name WHERE("Worksheet Template Name" = FILTER('REQ.'),
                                                                 "COF No." = FILTER(<> ''),
                                                                 "Request Type" = filter('Estimate'));
        }
        field(297; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset" WHERE("FA Class Code" = filter('MOTOR_VEH'));
        }
        field(298; "Labour Estimate"; Decimal)
        {
            /*   CalcFormula = Sum("Customer Order LineX"."Amount Inc. VAT" WHERE ("Document No."=FIELD("No."),
                                                                                Type=FILTER(Cost)));
              FieldClass = FlowField; */
        }
        field(299; "Item Estimate"; Decimal)
        {
            CalcFormula = Sum("Customer Order LineX".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Item)));
            FieldClass = FlowField;
        }
        field(300; "Date Delivered"; Date)
        {
        }
        field(301; "Time Delivered"; Time)
        {
        }
        field(302; VDS; Code[10])
        {
        }
        field(303; VIS; Code[10])
        {
        }
        field(304; VMI; Code[10])
        {
        }
        field(305; "Customer Order Type"; Option)
        {
            OptionMembers = ,Insurance,"Direct Shipment","Marketing/Sales","Warranty Account";
        }
        field(306; "Service Req. Code"; Code[10])
        {
            //TableRelation = "Purchase Test".Field17;
        }
        field(307; "VRI Estimate Approved"; Boolean)
        {
        }
        field(308; "COF Origin"; Option)
        {
            OptionCaption = ' ,VRI,Work Order';
            OptionMembers = " ",VRI,"Work Order";
        }
        field(309; "Fuel Level"; Option)
        {
            OptionCaption = ',Empty,1Qtr,Half,3Qtr,Full';
            OptionMembers = ,Empty,"1Qtr",Half,"3Qtr",Full;
        }
        field(310; "No VAT"; Boolean)
        {
        }
        field(312; Stage; Option)
        {
            OptionCaption = 'Greater than 10,N-10,N-9,N-8,N-7,N-6,N-5,N-4,N-3,N-2,N-1,Parts Ordered,Parts Arrived,Today,Waiting for Service,Next Job,Being Serviced,Waiting for Inspection,Waiting for Washing,Waiting for Invoicing,Awaiting Delivery,Waiting for Settlement,Waiting for Decision,Waiting for Approval,Waiting for Parts,Waiting for Sublet,Awaiting DAD,Awaiting Estimate,Job Stoppage,Delivered';
            OptionMembers = "Greater than 10","N-10","N-9","N-8","N-7","N-6","N-5","N-4","N-3","N-2","N-1","Parts Ordered","Parts Arrived",Today,"Waiting for Service","Next Job","Being Serviced","Waiting for Inspection","Waiting for Washing","Waiting for Invoicing","Awaiting Delivery","Waiting for Settlement","Waiting for Decision","Waiting for Approval","Waiting for Parts","Waiting for Sublet","Awaiting DAD","Awaiting Estimate","Job Stoppage",Delivered;

            trigger OnValidate()
            begin
                ServiceMgtSetup.Get();
                //Isolo Mail
                IF "Service Location" = '120ISO' THEN BEGIN
                    CASE Stage OF
                        Stage::"Parts Ordered":
                            IF NOT CONFIRM('Are you sure you want to request for parts?', FALSE) THEN
                                Stage := Stage::"N-1"
                            ELSE BEGIN

                                TESTFIELD("Confirmation Date");
                                TESTFIELD("Confirmation Time");
                                "Parts Ordered Date" := TODAY;
                                "Parts Ordered Time" := TIME;
                                "Parts Ordered Staff Name" := USERID;
                                ToAddresses := ServiceMgtSetup."Parts Order Isolo";
                                CcAddresses := ServiceMgtSetup."Parts Order Isolo CC";
                                BccAddresses := '';
                                Subject := STRSUBSTNO(Text005, "No.");
                                CreateEmailBody("No.", Text007);
                                SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, SenderEmail);

                            end;

                        Stage::"Parts Arrived":
                            IF NOT CONFIRM('Are you sure of availability for parts?', FALSE) THEN
                                Stage := Stage::"Parts Ordered"
                            ELSE BEGIN

                                "Parts Arrived Date" := TODAY;
                                "Parts Arrived Time" := TIME;
                                "Parts Arrived Staff Name" := USERID;
                                ToAddresses := ServiceMgtSetup."Parts Arrival Isolo";
                                CcAddresses := ServiceMgtSetup."Parts Arrival Isolo CC";
                                BccAddresses := '';
                                Subject := STRSUBSTNO(Text010, "No.");
                                CreateEmailBody("No.", Text011);
                                SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, SenderEmail);

                            END;
                    END;

                    //Lekki Mail
                    IF "Service Location" = '113LEK' THEN BEGIN
                        CASE Stage OF
                            Stage::"Parts Ordered":
                                IF NOT CONFIRM('Are you sure you want to request for parts', FALSE) THEN
                                    Stage := Stage::"N-1"
                                ELSE BEGIN

                                    TESTFIELD("Confirmation Date");
                                    TESTFIELD("Confirmation Time");
                                    "Parts Ordered Date" := TODAY;
                                    "Parts Ordered Time" := TIME;
                                    "Parts Ordered Staff Name" := USERID;

                                    ToAddresses := ServiceMgtSetup."Parts Order Lekki";
                                    CcAddresses := ServiceMgtSetup."Parts Order Lekki CC";
                                    BccAddresses := '';
                                    Subject := STRSUBSTNO(Text005, "No.");
                                    CreateEmailBody("No.", Text007);
                                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, SenderEmail);

                                END;

                            Stage::"Parts Arrived":
                                IF NOT CONFIRM('Are you sure of availability for Parts', FALSE) THEN
                                    Stage := Stage::"Parts Ordered"
                                ELSE BEGIN

                                    "Parts Arrived Date" := TODAY;
                                    "Parts Arrived Time" := TIME;
                                    "Parts Arrived Staff Name" := USERID;
                                    ToAddresses := ServiceMgtSetup."Parts Arrival Lekki";
                                    CcAddresses := ServiceMgtSetup."Parts Arrival Lekki CC";
                                    BccAddresses := '';
                                    Subject := STRSUBSTNO(Text010, "No.");
                                    CreateEmailBody("No.", Text011);
                                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, SenderEmail);

                                END;
                        END;
                    END;
                end;
            end;
        }
        field(313; Right; Boolean)
        {
        }
        field(314; Left; Boolean)
        {
        }
        field(315; Front; Boolean)
        {
        }
        field(316; Rear; Boolean)
        {
        }
        field(317; Top; Boolean)
        {
        }
        field(318; "N-3 Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "N-3 Confirmation" = TRUE THEN BEGIN
                    "N-3 Confirmation Date" := CURRENTDATETIME;
                    //  CreateTransferOrder;
                END;
            end;
        }
        field(319; "N-3 Confirmation Date"; DateTime)
        {
        }
        field(320; Posted; Boolean)
        {
        }
        field(321; "Repeat Repair Reason"; Text[100])
        {
        }
        field(322; "QC Result"; Option)
        {
            OptionCaption = ' ,Satisfactory,Not Satisfactory';
            OptionMembers = " ",Satisfactory,"Not Satisfactory";
        }
        field(323; "QC Comment"; Text[150])
        {
        }
        field(324; "Total Line Discount"; Decimal)
        {
            CalcFormula = Sum("Customer Order LineX"."Line Discount Amount" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(325; "Current Action"; Text[50])
        {
        }
        field(328; "Job Clock Time"; Duration)
        {
            CalcFormula = Lookup(ClockingX."Clocked Time" WHERE("Job No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(329; "Job Classification"; Option)
        {
            OptionCaption = ' ,Internal,PDI/VRI,Billable,Warranty';
            OptionMembers = " ",Internal,"PDI/VRI",Billable,Warranty;
        }
        field(330; "Posted By"; Code[25])
        {
        }
        field(331; "Posted DateTime"; DateTime)
        {
        }
        field(332; "LPP Created"; Boolean)
        {
        }
        field(333; "OpexX Created"; Boolean)
        {
        }
        field(334; "DADs Only"; Boolean)
        {
        }
        field(335; "Total Time Taken"; Time)
        {
        }
        field(336; "Initial Job No."; Code[12])
        {
            TableRelation = "Customer Order HeaderX"."No.";
        }
        field(337; Completed; Text[50])
        {
        }
        field(338; Pending; Text[50])
        {
        }
        field(50018; "Vehicle Classification"; Option)
        {
            OptionCaption = ' ,Gray,TNL Sold';
            OptionMembers = " ",Gray,"TNL Sold";
        }
        field(50019; "User ID"; Text[50])
        {
            Editable = false;
            TableRelation = "User Setup";
        }
        field(50020; "Payment for Estimate"; Boolean)
        {
        }
        field(60000; "PM Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60001; "GR Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60002; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60003; "App. No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Estimate No.", "Job Instruction No.", "Vehicle Registration No.", "No.")
        {
        }
        key(Key3; "Customer Name2")
        {
        }
        key(Key4; "Customer Address")
        {
        }
        key(Key5; "Customer Address2")
        {
        }
        key(Key6; "Vehicle Registration No.")
        {
        }
        key(Key7; "Vehicle Registration No.", "Reception Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        CustOrderLinex: Record "Customer Order LineX";

    begin
        //ERROR('You cannot delete this record');
        CustOrderLinex.SetRange("Document No.", Rec."No.");
        CustOrderLinex.DeleteAll();

    end;

    trigger OnInsert()
    var
        NoSeriesMgt: codeunit "No. Series";

    begin
        IF "No." = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Customer Order No.");
            "No. Series" := SalesSetup."Customer Order No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        Date := TODAY;

        "User ID" := USERID;
        IF UserSetup.GET("User ID") THEN
            "User ID" := UserSetup."User ID";

        "Service Location" := UserSetup."Location Code";
        IF UserSetup.GET("Location Code") THEN
            "Service Location" := UserSetup."Location Code";
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CustRec: Record Customer;
        ModelRec: Record Model;
        ServiceItem: Record "Service Item";
        PoServLineRec: Record "Service Invoice Header";
        i: Integer;
        ItemRec: Record Item;
        FaultRec: Record "Fault Setup Header";
        CustOrderLine: Record "Customer Order LineX";
        CustOrderLine2: Record "Customer Order LineX";
        CustOrderRec: Record "Customer Order HeaderX";
        Faultsetup: Record "Fault Setup Line";
        EstHeadRec: Record "Estimate Header";
        J: Text[30];
        ServiceAppointments: Record "Service AppointmentsX";
        ResRec: Record "Resource";
        CustOrderTable: Record "Customer Order HeaderX";
        CustOrderTable2: Record "Customer Order HeaderX";
        NextLine: Integer;
        ServLine: Record "Service Line";
        CompRec: Record "Complain TableX";
        ComplainCode: Code[10];
        ServiceIndex: Record "Service IndexX";
        ServiceIndex2: Record "Service IndexX";
        ServiceHeader: Record "Service Header";
        ServiceHeader2: Record "Service Header";
        ServiceLine: Record "Service Line";
        "SSC/SC": Record "SSC/SC";
        "AppSSC/SC": Record "Appointment SSC/SC";
        "AppSSC/SC2": Record "Appointment SSC/SC";
        "AppSSC/SC3": Record "Appointment SSC/SC";
        JobTask: Record "Job Task";
        "SSC/SCInfo": Text[30];
        "SSC/SCInfo2": Text[500];
        FARec: Record "Fixed Asset";
        ServiceMgtSetup: Record "Service Mgt. Setup";
        SSCLineNo: Integer;
        VRI2: Record "VRI Table";
        VRIRec: Record "VRI Table";
        ClaimNo: Code[20];
        LogistRec: Record "Logistics Order";
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
        Text001: Label 'Parts have been ordered!';
        Text002: Label 'There is nothing to request!';
        ServiceItemLine: Record "Service Item Line";
        Text003: Label 'Service Order has been created!';
        Text004: Label 'Cost changed updated!';
        NextOperationCode: Code[50];
        DeleteError: Label 'You cannot delete a customer order!';
        ServiceInvHeader: Record "Service Invoice Header";
        ClockingSheet: Record ClockingX;
        TechName: Text[50];
        JobStartDate: DateTime;
        JobClockTime: Duration;
        "JobNo.": Code[20];
        ItemJournalLine2: Record "Item Journal Line";
        ItemJournalLine: Record "Item Journal Line";
        CustomerOrderLineXX: Record "Customer Order LineX";
        MaintenanceLedgEntry: Record "Maintenance Ledger Entry";
        MaintenanceLedgEntry2: Record "Maintenance Ledger Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        LineNo: Integer;
        LocalPartPurchaseRegister: Record "Local Part Purchase Register";
        NewLPPNo: Code[20];
        PurchSetup: Record "Purchases & Payables Setup";
        PurchSetup2: Record "Purchases & Payables Setup";
        NewOpexX: Code[10];
        ProcurementHeader: Record "Procurement Header";
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[80];
        Body: Text[500];
        attachement: Text[260];
        Opendialog: Boolean;
        Bcc: Text[80];
        CRLF: Text;
        SendersName: Text;
        Addressee: Text;
        UserSetup2: Record "User Setup";
        // Mail: Codeunit Mail;
        CcAddresses: Text;
        BccAddresses: Text;
        SenderAddress: Text;
        ToAddresses: Text;
        //SMTPMail: Codeunit "400";
        UserSetup: Record "User Setup";
        UserSetup3: Record "User Setup";
        Text005: Label 'Customer Order No: %1  requires your attention for Item Transfer.';
        Text006: Label 'Dear';
        Text008: Label 'Regards,';
        Text009: Label 'Mail sent successfully.';
        Text007: Label 'Customer Order No. %1 transfer order has been created. Kindly proceed to ship the requested items.';
        Text010: Label 'Customer Order No: %1  items are now available.';
        Text011: Label 'Customer Order No. %1 items are now available, kindly carry on with the order.';
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        Email1: Label 'keji@toyotanigeria.com';
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
        EmailBody: Text[1024];
        Salutation: Label 'Dear team,';

    procedure InitRecord()
    var
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";

    begin
        SalesSetup.Get();
        CASE "Job Type2" OF
            "Job Type2"::"General Repair":
                begin
                    "No. Series" := SalesSetup."Customer Order No.";
                    NoSeriesMgt.GetNextNo("No. Series");
                end;

            "Job Type2"::"Periodic Maintenance":
                begin
                    "No. Series" := SalesSetup."Customer Order No. GN";
                    NoSeriesMgt.GetNextNo("No. Series");
                end;
        END;
    end;

    procedure GenPurchaseRequisition()
    var
        RequisitionLine: Record 246;
        RequisitionLine2: Record 246;
        ReqWrkShtName: Record 245;
        ReqWkshTemp: Record 244;
        NextLineNo: Integer;
    begin
    end;

    procedure Register4PSF()
    var
        ServInvRec: Record 5992;
        ServiceIndex: Record 70040;
        COFormRec: Record 50119;
    begin
        TESTFIELD("P.S.F.U. (Plan) Date");
        TESTFIELD("P.S.F.U. (Plan) Time");

        ServiceIndex2.SETCURRENTKEY("COF No.");
        ServiceIndex2.SETRANGE("COF No.", "No.");
        IF ServiceIndex2.FINDFIRST THEN
            ServiceIndex2.DELETEALL;

        ServiceIndex.INIT;
        ServiceIndex."FA No." := "FA No.";
        ServiceIndex.VALIDATE("COF No.", "No.");
        ServiceIndex.VALIDATE("Customer No.", "Customer No.");
        ServiceIndex."Service Location" := "Service Location";
        ServiceIndex."Call Due Date" := "P.S.F.U. (Plan) Date";
        ServiceIndex."Job Details" := "Job Details";
        ServiceIndex."Additional Job Details" := "Additional Job Details";
        ServiceIndex."Vehicle Release Date" := "Actual Delivery Date";
        ServiceIndex."Delivery Date" := "Date Delivered";
        ServiceIndex."Vehicle No." := "Vehicle Registration No.";
        ServiceIndex.Brand := "Brand";
        ServiceIndex.Model := "Model Name";
        ServiceIndex."Delivery Time" := "Time Delivered";
        ServiceIndex.INSERT(TRUE);
        MESSAGE('The vehicle has been scheduled for post service follow-up!');
    end;

    procedure GenMaterials()
    begin
        IF FaultRec.GET("Operation Code", "Model No.") THEN BEGIN
            "Operation Code Description" := FaultRec.Description;
            Faultsetup.SETRANGE(Faultsetup."Operation code", "Operation Code");
            IF Faultsetup.FIND('-') THEN
                REPEAT
                    CustOrderLine.INIT;
                    CustOrderLine.VALIDATE(CustOrderLine."Operation Code", Faultsetup."Operation code");
                    CustOrderLine."Document No." := "No.";
                    CustOrderLine."Line No." := Faultsetup."Line No.";
                    CustOrderLine."Model Description" := Faultsetup."Model Description";
                    CustOrderLine."Model No." := Faultsetup."Service Item Model";
                    CustOrderLine.Type := Faultsetup.Type;
                    CustOrderLine."Location Code" := "Service Location";
                    CustOrderLine.VALIDATE(CustOrderLine."No.", Faultsetup."No.");
                    CustOrderLine.Description := Faultsetup.Description;
                    CustOrderLine.VALIDATE(CustOrderLine."Quantity Received", Faultsetup.Quantity);
                    CustOrderLine.INSERT;
                UNTIL Faultsetup.NEXT = 0;
        END
        ;
    end;

    procedure GeneratEstimate()
    begin
    end;

    procedure AssistEdit(OldCustOrderForm: Record "Customer Order Table."): Boolean
    var
        CustOrder: Record "Customer Order Table.";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        CustOrderRec.COPY(Rec);
        CustOrderRec := Rec;
        SalesSetup.GET;

        /* IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, OldCustOrderForm."No. Series", CustOrderRec."No. Series") THEN BEGIN
            SalesSetup.GET;
            CustOrderRec.TestNoSeries;
            NoSeriesMgt.SetSeries(CustOrderRec."No.");
            Rec := CustOrderRec; */

        "No. Series" := SalesSetup."Customer Order No.";
        NoSeriesMgt.GetNextNo("No. Series");

        EXIT(TRUE);

    end;

    procedure TestNoSeries(): Boolean
    begin
        CASE "Job Type2" OF
            "Job Type2"::"General Repair":
                SalesSetup.TESTFIELD("Customer Order No.");
            "Job Type2"::"Periodic Maintenance":
                SalesSetup.TESTFIELD("Customer Order No. GN");
        END;
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        CASE "Job Type2" OF
            "Job Type2"::"General Repair":
                EXIT(SalesSetup."Customer Order No.");
            "Job Type2"::"Periodic Maintenance":
                EXIT(SalesSetup."Customer Order No. GN");
        END;
    end;

    procedure CreateServiceOrder()
    begin
    end;

    procedure GenService()
    begin
        IF NOT Internal THEN
            GenerateService;
        IF Internal THEN;
        //"GenerateService-I";
        IF Warranty THEN;
        //"GenerateService-W";
    end;

    procedure GenerateService()
    var
        ServiceRec: Record 5900;
        ServiceLine: Record 5902;
        ServItemLine: Record 5901;
    begin
        TESTFIELD("Vehicle Registration No.");
        TESTFIELD("Customer No.");

        ServiceHeader.INIT;
        ServiceHeader."Document Type" := ServiceHeader."Document Type"::Order;
        ServiceHeader.INSERT(TRUE);

        ServiceHeader.VALIDATE(ServiceHeader."No.", "No.");
        ServiceHeader.VALIDATE(ServiceHeader."Customer No.", "Customer No.");
        ServiceHeader.VALIDATE(ServiceHeader."Posting Date", "Expected Delivery Date");
        ServiceHeader."Registration No." := "Vehicle Registration No.";
        ServiceHeader."Posting Description" := "Operation Code" + '/' + "Vehicle Registration No.";
        ServiceHeader."Order Date" := TODAY;
        ServiceHeader."Order Time" := TIME;
        ServiceHeader.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ServiceHeader.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        ServiceHeader.MODIFY;


        ServiceItemLine.INIT;
        ServiceItemLine.VALIDATE("Document Type", ServiceItemLine."Document Type"::Order);
        ServiceItemLine.VALIDATE("Document No.", "No.");
        ServiceItemLine.VALIDATE(ServiceItemLine."Fault Code", CustOrderLine."Job Category");
        ServiceItemLine."Line No." := 10000;
        ServiceItemLine."Job Type" := CustOrderLine."Job Type";
        ServiceItemLine.VALIDATE(ServiceItemLine."Service Item No.", "Vehicle Registration No.");
        ServiceItemLine.INSERT(TRUE);

        IF GET(VRIRec."VRI Code") THEN
            ClaimNo := VRIRec."Claim No.";


        CustOrderLine.SETRANGE(CustOrderLine."Document No.", "No.");
        //CustOrderLine.SETRANGE(Type,CustOrderLine.Type::Item);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        CustOrderLine.SETFILTER(CustOrderLine."No.", '<>%1', '');
        IF CustOrderLine.FINDSET THEN
            REPEAT
                ServiceLine.INIT;
                ServiceLine.VALIDATE("Document Type", ServiceItemLine."Document Type");       //SEGUNIO
                ServiceLine.VALIDATE("Document No.", ServiceItemLine."Document No.");         //SEGUNIO
                ServiceLine."Service Item No." := ServiceItemLine."Service Item No.";                    //SEGUNIO
                ServiceLine."Service Item Line No." := ServiceItemLine."Line No.";                       //SEGUNIO
                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServiceHeader."No.");
                ServiceLine."Customer No." := ServiceHeader."Customer No.";
                //   ServiceLine.VALIDATE(,"Customer Order Form No.");
                ServiceLine."Line No." := CustOrderLine."Line No.";
                ServiceLine.Type := ServiceLine.Type::Item;
                ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                //ServiceLine.VALIDATE(ServiceLine."Variant Code", CustOrderLine."Variant Code");
                ServiceLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                ServiceLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                ServiceLine.Description := CustOrderLine.Description;
                //ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine."Quantity Received");
                ServiceLine."Fault Code" := CustOrderLine."Operation Code";
                // ServiceLine.VALIDATE(ServiceLine."External Doc. No.","Customer Order Form No.");
                //ServiceLine."PR Raised" := CustOrderLine."PR Raised";
                ServiceLine."Claim No." := ClaimNo;
                ServiceLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;

        "Service Order No." := ServiceHeader."No.";
        VALIDATE("For Part Order", TRUE);

        CustOrderLine.SETRANGE("Document No.", "No.");
        CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
        //CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                //CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;


    procedure CreateTransferOrder()
    begin
        CustOrderLine.SETRANGE("Document No.", "No.");
        CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
        CustOrderLine.SETFILTER("Sent to Parts", '%1', FALSE);
        CustOrderLine.SETFILTER("Quantity Requested", '<>%1', 0);
        CustOrderLine.SETFILTER("Location Code", '<>%1', '');

        IF CustOrderLine.FINDFIRST THEN BEGIN
            TransferHeader.INIT;
            TransferHeader.INSERT(TRUE);

            TransferHeader."COF No." := "No.";
            TransferHeader.VALIDATE("Transfer-from Code", '120ISO');
            TransferHeader.VALIDATE("Transfer-to Code", CustOrderLine."Location Code");
            TransferHeader.VALIDATE("In-Transit Code", 'TRANSIT');
            TransferHeader.MODIFY;

            CustOrderLine.RESET;
            CustOrderLine.SETRANGE("Document No.", "No.");
            CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
            CustOrderLine.SETFILTER("Sent to Parts", '%1', FALSE);
            CustOrderLine.SETFILTER("Quantity Requested", '<>%1', 0);
            CustOrderLine.SETFILTER("Location Code", '<>%1', '');
            IF CustOrderLine.FINDFIRST THEN BEGIN
                REPEAT
                    CheckInventoryAvailability(CustOrderLine."No.", "Service Location", CustOrderLine."Quantity Requested");
                    TransferLine.INIT;
                    TransferLine."Document No." := TransferHeader."No.";
                    TransferLine."Line No." := CustOrderLine."Line No.";
                    TransferLine.VALIDATE("Item No.", CustOrderLine."No.");
                    TransferLine.VALIDATE(Quantity, CustOrderLine."Quantity Requested");
                    TransferLine.INSERT(TRUE);

                    CustOrderLine."Sent to Parts" := TRUE;
                    CustOrderLine.MODIFY;
                UNTIL CustOrderLine.NEXT = 0;
            END;

            MESSAGE(Text001);
        END ELSE
            MESSAGE(Text002);
    end;

    procedure CreateTransferOrderLekki()
    begin
        CustOrderLine.SETRANGE("Document No.", "No.");
        CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
        CustOrderLine.SETFILTER("Sent to Parts", '%1', FALSE);
        IF CustOrderLine.FINDFIRST THEN BEGIN
            TransferHeader.INIT;
            TransferHeader.INSERT(TRUE);

            CustOrderLine.SETRANGE("Document No.", "No.");
            CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
            CustOrderLine.SETFILTER("Sent to Parts", '%1', FALSE);
            IF CustOrderLine.FINDFIRST THEN;

            TransferHeader."COF No." := "No.";
            TransferHeader.VALIDATE("Transfer-from Code", '114SER');
            TransferHeader.VALIDATE("Transfer-to Code", CustOrderLine."Location Code");
            TransferHeader.VALIDATE("Direct Transfer", TRUE);
            //TransferHeader.VALIDATE("In-Transit Code",'TRANSIT');
            TransferHeader.MODIFY;

            CustOrderLine.RESET;
            CustOrderLine.SETRANGE("Document No.", "No.");
            CustOrderLine.SETRANGE(Type, CustOrderLine.Type::Item);
            CustOrderLine.SETFILTER("Sent to Parts", '%1', FALSE);
            IF CustOrderLine.FINDFIRST THEN BEGIN
                REPEAT
                    CheckInventoryAvailability(CustOrderLine."No.", "Service Location", CustOrderLine."Quantity Requested");
                    TransferLine.INIT;
                    TransferLine."Document No." := TransferHeader."No.";
                    TransferLine."Line No." := CustOrderLine."Line No.";
                    TransferLine.VALIDATE("Item No.", CustOrderLine."No.");
                    TransferLine.VALIDATE("Variant Code", CustOrderLine."Variant Code");
                    TransferLine.VALIDATE(Quantity, CustOrderLine."Quantity Requested");
                    TransferLine.INSERT(TRUE);

                    CustOrderLine."Sent to Parts" := TRUE;
                    CustOrderLine.MODIFY;
                UNTIL CustOrderLine.NEXT = 0;
            END;

            MESSAGE(Text001);
        END ELSE
            MESSAGE(Text002);
    end;

    procedure CheckInventoryAvailability(ItemNo: Code[20]; LocationCode: Code[10]; RequiredQty: Decimal)
    var
        Item: Record Item;
    begin

        Item.get(ItemNo);
        Item.setfilter("Location Filter", LocationCode);
        Item.CalcFields("Net Change");
        if Item."Net Change" < RequiredQty then
            error('Insufficient inventory for item %1 at location %2.', ItemNo, LocationCode);

    end;

    procedure CreateServiceInvoice()
    begin
        //ServiceInvHeader.

        TESTFIELD("Vehicle Registration No.");
        TESTFIELD("Customer No.");

        ServiceHeader.INIT;
        ServiceHeader."Document Type" := ServiceHeader."Document Type"::Order;
        ServiceHeader."No." := "No.";
        ServiceHeader.INSERT(TRUE);

        ServiceHeader.VALIDATE("Customer No.", "Customer No.");
        ServiceHeader.VALIDATE("Posting Date", TODAY);
        ServiceHeader."Document Date" := TODAY;
        ServiceHeader."Customer Order No." := "No.";
        ServiceHeader."Posting Description" := "Operation Code" + '/' + "Vehicle Registration No.";
        ServiceHeader."Registration No." := "Vehicle Registration No.";
        ServiceHeader."Order Date" := TODAY;
        ServiceHeader."Order Time" := TIME;
        ServiceHeader.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ServiceHeader.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        //ServiceHeader."Prices Including VAT" := TRUE;
        ServiceHeader."Vehicle Registration No." := "Vehicle Registration No.";
        ServiceHeader.Model := "Model No.";
        ServiceHeader.Chassis := "Frame No./VIN";
        ServiceHeader."Engine No." := "Engine No.";
        ServiceHeader."Odometer Reading Reception" := "Odometer At Reception";
        ServiceHeader."Starting Date" := TODAY;
        ServiceHeader."Starting Time" := TIME;
        ServiceHeader."Finishing Date" := TODAY;
        ServiceHeader."Finishing Time" := TIME;
        ServiceHeader."Reception Date" := "Reception Date";
        ServiceHeader."Reception Time" := "Reception Time";
        ServiceHeader."Delivery Date" := "Expected Delivery Date";
        ServiceHeader."Delivery Time" := "Expected Delivery Time";
        ServiceHeader."Job Details" := "Job Details";
        ServiceHeader."B&P" := "B & P";
        ServiceHeader."D/Estimate" := "DADs Only";
        ServiceHeader.PM := Maintenance;
        ServiceHeader.GR := "General Repair";
        ServiceHeader.Warranty := Warranty;
        ServiceHeader.Internal := Internal;
        ServiceHeader."User ID" := USERID;
        ServiceHeader.MODIFY(TRUE);


        ServiceItemLine.INIT;
        ServiceItemLine.VALIDATE(ServiceItemLine."Document Type", ServiceItemLine."Document Type"::Order);
        ServiceItemLine.VALIDATE("Document No.", "No.");
        ServiceItemLine."Line No." := 10000;
        //ServiceItemLine."Fault Code" := CustOrderLine."Job Category";
        ServiceItemLine."Job Type" := CustOrderLine."Job Type";
        ServiceItemLine.VALIDATE(ServiceItemLine."Service Item No.", "Vehicle Registration No.");
        ServiceItemLine.INSERT(TRUE);


        CustOrderLine.SETRANGE("Document No.", "No.");
        CustOrderLine.SETRANGE("Customer Class", CustOrderLine."Customer Class"::Billable);
        CustOrderLine.SETRANGE("Skip Zero Qty", FALSE);
        IF CustOrderLine.FINDSET THEN BEGIN
            REPEAT
                ServiceLine.INIT;
                ServiceLine.VALIDATE("Document Type", ServiceHeader."Document Type");
                ServiceLine."Document No." := "No.";
                ServiceLine."Customer No." := ServiceHeader."Customer No.";
                ServiceLine."Customer Order No." := "No.";
                ServiceLine.VALIDATE("Service Item No.", ServiceItemLine."Service Item No.");
                ServiceLine."Line No." := CustOrderLine."Line No.";
                ServiceLine.VALIDATE(Type, CustOrderLine.Type);
                ServiceLine.VALIDATE("No.", CustOrderLine."No.");
                ServiceLine.VALIDATE("VAT Prod. Posting Group", FORMAT(CustOrderLine."VAT Category"));
                ServiceLine.VALIDATE("Unit Cost", CustOrderLine."Unit Cost");
                ServiceLine.VALIDATE("Unit Price", CustOrderLine."Unit Price");
                ServiceLine.VALIDATE("Amount Including VAT", CustOrderLine."Amount Inc. VAT");
                ServiceLine.VALIDATE("Line Discount %", CustOrderLine."Discount %");
                //  ServiceLine."Line Discount Amount" :=
                ServiceLine.VALIDATE("Variant Code", CustOrderLine."Variant Code");
                ServiceLine.VALIDATE("Location Code", CustOrderLine."Location Code");
                ServiceLine.VALIDATE(Quantity, CustOrderLine."Quantity Requested");
                ServiceLine.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
                ServiceLine.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
                ServiceLine.VALIDATE("Job Type", CustOrderLine."Job Type");
                ServiceLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        END;

        MESSAGE(Text003);
    end;

    procedure CostChanged()
    begin
        CustOrderLine.SETRANGE("Document No.", Rec."No.");
        IF CustOrderLine.FINDFIRST THEN BEGIN
            CustOrderLine.CALCSUMS("Amount Inc. VAT");
            Rec."Cost Changed" := CustOrderLine."Amount Inc. VAT";
            Rec.MODIFY;
        END;

        CustOrderLine2.SETRANGE("Document No.", Rec."No.");
        CustOrderLine2.SETRANGE("Additional Jobs", TRUE);
        IF NOT CustOrderLine2.FINDFIRST THEN BEGIN
            Rec."Cost Changed" := 0;
            Rec.MODIFY;
        END;

        MESSAGE(Text004);
    end;

    procedure EmailRecords(ShowRequestForm: Boolean)
    begin
        SendRecords(ShowRequestForm, TRUE);
    end;

    local procedure SendRecords(ShowRequestForm: Boolean; SendAsEmail: Boolean)
    var
        ReportSelections: Record 77;
        CustomerOrder: Record 70034;
    begin
        /* WITH CustomerOrder DO BEGIN
            COPY(Rec);
            ReportSelections.SETRANGE(Usage,ReportSelections.Usage::"S.Invoice");
             ReportSelections.SETFILTER("Report ID",'<>0');
             ReportSelections.FIND('-');
             REPEAT
               IF NOT SendAsEmail THEN
                 REPORT.RUNMODAL(ReportSelections."Report ID",ShowRequestForm,FALSE,CustomerOrder)
               ELSE
                 SendReport(ReportSelections."Report ID",CustomerOrder)
             UNTIL ReportSelections.NEXT = 0;
           END;  

            SendReport(50310, CustomerOrder);

        END; */

    end;

    local procedure SendReport(ReportId: Integer; var CustomerOrder: Record 70034)
    var
        DocumentMailing: Codeunit 260;
        FileManagement: Codeunit 419;
        ServerAttachmentFilePath: Text[250];
    begin
        /* ServerAttachmentFilePath := COPYSTR(FileManagement.ServerTempFileName('pdf'), 1, 250);
        REPORT.SAVEASPDF(ReportId, ServerAttachmentFilePath, CustomerOrder);
        COMMIT; */
        //DocumentMailing.EmailFileFromCustomerOrder(CustomerOrder,ServerAttachmentFilePath);
    end;

    procedure PostIssue()
    begin
        // IF "Job Classification" = "Job Classification"::" " THEN
        //  ERROR('You must select a Job Classification');

        ItemJournalLine2.SETRANGE("Journal Template Name", 'ITEM');
        ItemJournalLine2.SETRANGE("Journal Batch Name", 'OTHERS');
        IF ItemJournalLine2.FINDFIRST THEN
            ItemJournalLine2.DELETEALL;

        CustomerOrderLineXX.SETRANGE("Document No.", "No.");
        CustomerOrderLineXX.SETRANGE(Type, CustomerOrderLineXX.Type::Item);
        IF CustomerOrderLineXX.FINDFIRST THEN BEGIN
            REPEAT
                ItemJournalLine."Journal Template Name" := 'ITEM';
                ItemJournalLine."Journal Batch Name" := 'OTHERS';
                ItemJournalLine."Line No." := CustomerOrderLineXX."Line No.";
                ItemJournalLine."Posting Date" := "Actual Delivery Date";
                ItemJournalLine."Document Date" := "Actual Delivery Date";
                ItemJournalLine."Document No." := "No.";
                ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Negative Adjmt.";
                ItemJournalLine.VALIDATE("Item No.", CustomerOrderLineXX."No.");
                ItemJournalLine.VALIDATE("Variant Code", CustomerOrderLineXX."Variant Code");
                ItemJournalLine.VALIDATE("Location Code", CustomerOrderLineXX."Location Code");
                ItemJournalLine.VALIDATE("Unit of Measure Code", CustomerOrderLineXX."Unit of Measure");
                ItemJournalLine.VALIDATE(Quantity, CustomerOrderLineXX."Quantity Received");
                IF "Job Classification" = "Job Classification"::"PDI/VRI" THEN
                    ItemJournalLine."Gen. Bus. Posting Group" := 'VRI-TNL';
                IF "Job Classification" = "Job Classification"::Internal THEN
                    ItemJournalLine."Gen. Bus. Posting Group" := 'MAINTCE';
                ItemJournalLine."Gen. Prod. Posting Group" := 'PARTS';
                ItemJournalLine."Unit of Measure Code" := CustomerOrderLineXX."Unit of Measure";
                ItemJournalLine.INSERT;
            UNTIL CustomerOrderLineXX.NEXT = 0;

            CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post", ItemJournalLine);

            //Post Maintenance
            IF "Job Classification" = "Job Classification"::Internal THEN
                InsertMaintJournal;

        END;
        CheckPostedJnl;

    end;

    procedure PostIssuePrint()
    begin
        IF "Job Classification" = "Job Classification"::" " THEN
            ERROR('You must select a Job Classification');
        ItemJournalLine2.SETRANGE("Journal Template Name", 'ITEM');
        ItemJournalLine2.SETRANGE("Journal Batch Name", 'OTHERS');
        IF ItemJournalLine2.FINDFIRST THEN
            ItemJournalLine2.DELETEALL;

        CustomerOrderLineXX.SETRANGE("Document No.", "No.");
        CustomerOrderLineXX.SETRANGE(Type, CustomerOrderLineXX.Type::Item);
        IF CustomerOrderLineXX.FINDFIRST THEN BEGIN
            REPEAT
                ItemJournalLine."Journal Template Name" := 'ITEM';
                ItemJournalLine."Journal Batch Name" := 'OTHERS';
                ItemJournalLine."Line No." := CustomerOrderLineXX."Line No.";
                ItemJournalLine.VALIDATE("Item No.", CustomerOrderLineXX."No.");
                ItemJournalLine."Posting Date" := "Actual Delivery Date";
                ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Negative Adjmt.";
                ItemJournalLine."Document No." := "No.";
                ItemJournalLine."Document Date" := "Actual Delivery Date";
                ItemJournalLine."Location Code" := CustomerOrderLineXX."Location Code";
                IF "Job Classification" = "Job Classification"::"PDI/VRI" THEN
                    ItemJournalLine."Gen. Bus. Posting Group" := 'VRI-TNL';
                ItemJournalLine."Gen. Prod. Posting Group" := 'PARTS';
                IF "Job Classification" = "Job Classification"::Internal THEN
                    ItemJournalLine."Gen. Bus. Posting Group" := 'MAINTCE';
                ItemJournalLine."Gen. Prod. Posting Group" := 'PARTS';

                ItemJournalLine.VALIDATE(Quantity, CustomerOrderLineXX."Quantity Received");
                ItemJournalLine.INSERT;
            UNTIL CustomerOrderLineXX.NEXT = 0;
            CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post+Print", ItemJournalLine);

            //Post Maintenance
            IF "Job Classification" = "Job Classification"::Internal THEN
                InsertMaintJournal;
        END;
        CheckPostedJnl;
    end;

    procedure CheckPostedJnl()
    begin
        ItemLedgEntry.SETCURRENTKEY("Document No.", "Document Type", "Document Line No.");
        ItemLedgEntry.SETRANGE("Document No.", "No.");
        IF ItemLedgEntry.FINDFIRST THEN BEGIN
            Posted := TRUE;
            "Posted By" := USERID;
            "Posted DateTime" := CURRENTDATETIME;
            MODIFY;
        END;
    end;

    procedure PostMaintenanceOnIssue()
    var
        FAJournalLine: Record 5621;
        FAJournalLine2: Record 5621;
    begin
        FAJournalLine2.SETRANGE("Journal Template Name", 'ASSETS');
        FAJournalLine2.SETRANGE("Journal Batch Name", 'DEFAULT');
        IF FAJournalLine2.FINDFIRST THEN
            FAJournalLine2.DELETEALL;

        CustomerOrderLineXX.SETRANGE("Document No.", "No.");
        CustomerOrderLineXX.SETRANGE(Type, CustomerOrderLineXX.Type::Item);
        IF CustomerOrderLineXX.FINDFIRST THEN BEGIN
            REPEAT
                FAJournalLine."Journal Template Name" := 'ASSETS';
                FAJournalLine."Journal Batch Name" := 'DEFAULT';
                FAJournalLine."Line No." := CustomerOrderLineXX."Line No.";
                FAJournalLine."Document No." := "No.";
                FAJournalLine.VALIDATE("FA No.", "FA No.");
                FAJournalLine."FA Posting Type" := FAJournalLine."FA Posting Type"::Maintenance;
                FAJournalLine."FA Posting Date" := "Actual Delivery Date";
                //    FAJournalLine."Maintenance Code" := CustomerOrderLineXX."Maintenance Code";
                FAJournalLine.Description := COPYSTR(STRSUBSTNO(Text003, CustomerOrderLineXX."Job Category", "FA No."), 1, 50);
                FAJournalLine.VALIDATE(Amount, CustomerOrderLineXX.Amount);
                IF FAJournalLine.Amount <> 0 THEN
                    FAJournalLine.INSERT;
            UNTIL CustomerOrderLineXX.NEXT = 0;
            CODEUNIT.RUN(CODEUNIT::"FA. Jnl.-Post", FAJournalLine);
        END;
    end;

    procedure InsertMaintJournal()
    var
        ItemLedgEntry: Record 32;
        MaintenanceLedgEntry: Record 5625;
        MaintenanceLedgEntry2: Record 5625;
    begin
        ItemLedgEntry.SETCURRENTKEY("Document No.");
        ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.", "No.");
        IF ItemLedgEntry.FINDFIRST THEN BEGIN
            REPEAT
                MaintenanceLedgEntry2.SETRANGE("Entry No.");
                IF MaintenanceLedgEntry2.FINDLAST THEN
                    LineNo := MaintenanceLedgEntry2."Entry No.";
                MaintenanceLedgEntry."Entry No." := LineNo + 1;
                MaintenanceLedgEntry."Document No." := ItemLedgEntry."Document No.";
                MaintenanceLedgEntry."Posting Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."Document Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."FA Posting Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."Depreciation Book Code" := 'DEF_DEPR';
                MaintenanceLedgEntry."User ID" := USERID;
                MaintenanceLedgEntry.Quantity := ItemLedgEntry.Quantity;
                MaintenanceLedgEntry.VALIDATE("Global Dimension 1 Code", ItemLedgEntry."Global Dimension 1 Code");
                MaintenanceLedgEntry.VALIDATE("Global Dimension 2 Code", ItemLedgEntry."Global Dimension 2 Code");
                MaintenanceLedgEntry."Dimension Set ID" := ItemLedgEntry."Dimension Set ID";
                CustomerOrderLineXX.SETRANGE("Document No.", ItemLedgEntry."Document No.");
                CustomerOrderLineXX.SETRANGE("Line No.", ItemLedgEntry."Document Line No.");
                IF CustomerOrderLineXX.FINDFIRST THEN BEGIN
                    MaintenanceLedgEntry."FA No." := "FA No.";
                    //      MaintenanceLedgEntry."Maintenance Code" := StoreRequisitionLine."Maintenance Code";
                    MaintenanceLedgEntry.Description := ('Maintenance for ' + "FA No.");
                END;
                ItemLedgEntry.CALCFIELDS("Cost Amount (Actual)");
                MaintenanceLedgEntry."Debit Amount" := ABS(ItemLedgEntry."Cost Amount (Actual)");
                MaintenanceLedgEntry.Amount := ABS(ItemLedgEntry."Cost Amount (Actual)");
                MaintenanceLedgEntry."Dimension Set ID" := ItemLedgEntry."Dimension Set ID";
                MaintenanceLedgEntry.INSERT;
            UNTIL ItemLedgEntry.NEXT = 0;
        END;
    end;

    procedure CreateLPP()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.GET;
        NewLPPNo := NoSeriesMgt.GetNextNo(PurchSetup."LPP Nos.", 0D, TRUE);

        LocalPartPurchaseRegister.INIT;
        LocalPartPurchaseRegister."LPP No." := NewLPPNo;
        LocalPartPurchaseRegister."TCOF No." := "No.";
        LocalPartPurchaseRegister.Date := TODAY;
        LocalPartPurchaseRegister."Order Type" := LocalPartPurchaseRegister."Order Type"::"Isolo Store";

        LocalPartPurchaseRegister.INSERT;

        "LPP Created" := TRUE;
        MODIFY;
    end;

    procedure CreateOpexX()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup2.GET;
        NewOpexX := NoSeriesMgt.GetNextNo(PurchSetup2."Opex Nos.", 0D, TRUE);

        ProcurementHeader.INIT;
        ProcurementHeader."Document Type" := ProcurementHeader."Document Type"::Opex;
        ProcurementHeader."No." := NewOpexX;
        ProcurementHeader.Date := TODAY;
        ProcurementHeader."Opex Type" := ProcurementHeader."Opex Type"::"New Service";
        ProcurementHeader."TCOF No." := "No.";
        ProcurementHeader.INSERT;

        "OpexX Created" := TRUE;
        MODIFY;
    end;

    procedure CreateEmailBody(DocNo: Code[20]; BodyMsg: Text);

    begin

        UserSetup.Get(UserId);

        EmailBody := Salutation;
        EmailBody += '<br><br>';
        EmailBody += STRSUBSTNO(BodyMsg, DocNo);
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;

    end;

    procedure SendEmail(ReceiverEmail: Text; Subject: Text; Body: Text; CCRecipients: Text; BCCRecipients: Text)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ReceiverEmail, Subject, EmailBody, true);
        EmailMessage.AddRecipient(enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;

}

