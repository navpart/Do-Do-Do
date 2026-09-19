table 50119 "Customer Order Table."
{
    /* DrillDownPageID = 70074;
    LookupPageID = 70074; */

    fields
    {
        field(1; "Customer Order Form No."; Code[12])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";

            trigger OnValidate()
            begin
                IF "Customer Order Form No." <> xRec."Customer Order Form No." THEN BEGIN
                    SalesSetup.GET;
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Reception Date"; Date)
        {
            Description = 'Vehicle Reception';
        }
        field(3; "Reception Time"; Time)
        {
            Description = 'Vehicle Reception';
        }
        field(4; "Reception Type"; Option)
        {
            Description = 'Vehicle Reception';
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
                    "Customer Telephone No." := CustRec."Phone No.";
                    "E-mail" := CustRec."E-Mail";
                END
                ELSE BEGIN
                    "Customer Name" := '';
                    Address := '';
                    Address2 := '';
                    "Customer Name2" := '';
                    "Customer Address" := '';
                    "Customer Address2" := '';
                    "Customer Telephone No." := '';
                    "E-mail" := '';
                END;
            end;
        }
        field(8; "Customer Name"; Text[50])
        {
        }
        field(9; Address; Text[50])
        {
        }
        field(10; "Telephone No."; Text[30])
        {
        }
        field(11; Address2; Text[50])
        {
        }
        field(12; "Customer Order Form Date"; Date)
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
        field(15; "Confirmation Staff Name"; Text[30])
        {
        }
        field(16; "Parts Ordered Date"; Date)
        {

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
        }
        field(18; "Parts Ordered Staff Name"; Text[30])
        {
        }
        field(19; "Parts Arrived Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "Parts Arrived Date" <> 0D THEN BEGIN
                    "Parts Arrived Time" := TIME;
                    //"Parts Arrived Staff Name" := USERID;
                END
                ELSE BEGIN
                    "Parts Arrived Date" := 0D;
                    "Parts Arrived Time" := 0T;
                    "Parts Arrived Staff Name" := '';
                END;
            end;
        }
        field(20; "Parts Arrived Time"; Time)
        {
        }
        field(21; "Parts Arrived Staff Name"; Text[30])
        {
        }
        field(22; "Model No"; Code[20])
        {

            trigger OnValidate()
            begin
                IF ModelRec.GET("Model No") THEN
                    "Model Name" := ModelRec."Model Name"
                ELSE
                    "Model Name" := '';
            end;
        }
        field(23; "Model Name"; Text[40])
        {
        }
        field(24; "Vehicle Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE("Service Item Status" = filter('Active'));

            trigger OnValidate()
            begin
                IF ServiceRec.GET("Vehicle Registration No.") THEN BEGIN
                    ServiceRec.CALCFIELDS(ServiceRec.Name, ServiceRec.Address, ServiceRec."Address 2", ServiceRec."Customer Email", ServiceRec."Phone No.");
                    VALIDATE("Customer No.", ServiceRec."Customer No.");
                    "Model No" := ServiceRec."Model No.";
                    "Model Year" := ServiceRec."Model Year";
                    "Model Name" := ServiceRec.Description;
                    IF "Model Name" = '' THEN
                        "Model Name" := ServiceRec.Make;
                    "Frame No./VIN" := ServiceRec."Chasis No.";
                    IF "Frame No./VIN" = '' THEN
                        "Frame No./VIN" := ServiceRec."Serial No.";
                    "(Engine No)" := ServiceRec."Engine No.";
                    Home := ServiceRec."Phone No.";
                    Business := ServiceRec.Business;
                    Mobile := ServiceRec.Mobile;
                    "Model Name2" := ServiceRec.Description;
                    "Vehicle Registration No.2" := "Vehicle Registration No.";
                    "Contact Home" := ServiceRec."Phone No.";
                    "Contact Business" := ServiceRec.Business;
                    "Contact Mobile" := ServiceRec.Mobile;
                    "Vehicle Registered Date" := ServiceRec."Installation Date";
                    "E-mail" := ServiceRec."User Email";
                    "Current Service Due Date" := ServiceRec."Last Service Date";

                    FARec.SETFILTER(FARec."No.", '<>%1', '');
                    FARec.SETRANGE(FARec."Registration No.", "Vehicle Registration No.");
                    IF FARec.FINDFIRST THEN
                        VALIDATE("FA No.", FARec."No.");

                    i := 0;
                    ServiceHeader2.SETCURRENTKEY("Vehicle Registration No.", "Reception Date");
                    ServiceHeader2.SETFILTER(ServiceHeader2."Vehicle Registration No.", ServiceRec."No.");
                    ServiceHeader2.SETFILTER(ServiceHeader2.Posted, '%1', TRUE);
                    IF ServiceHeader2.FINDLAST THEN BEGIN
                        i := ServiceHeader2.COUNT;
                        IF i > 0 THEN BEGIN
                            "Job No.1" := ServiceHeader2."No.";
                            Odometer1 := ServiceHeader2."Odometer Reading Reception";
                            Date1 := ServiceHeader2."Reception Date";
                            "Job Description1" := COPYSTR(ServiceHeader2."Job Details", 1, MAXSTRLEN("Job Description1"));
                        END ELSE BEGIN
                            "Job No.1" := '';
                            Odometer1 := 0;
                            Date1 := 0D;
                            "Job Description1" := '';
                        END;

                        IF i > 1 THEN BEGIN
                            ServiceHeader2.NEXT := -1;
                            "Job No.2" := ServiceHeader2."No.";
                            Odometer2 := ServiceHeader2."Odometer Reading Reception";
                            Date2 := ServiceHeader2."Reception Date";
                            "Job Description2" := COPYSTR(ServiceHeader2."Job Details", 1, MAXSTRLEN("Job Description2"));
                        END ELSE BEGIN
                            "Job No.2" := '';
                            Odometer2 := 0;
                            Date2 := 0D;
                            "Job Description2" := '';
                        END;

                        IF i > 2 THEN BEGIN
                            ServiceHeader2.NEXT := -1;
                            "Job No.3" := ServiceHeader2."No.";
                            Odometer3 := ServiceHeader2."Odometer Reading Reception";
                            Date3 := ServiceHeader2."Reception Date";
                            "Job Description3" := COPYSTR(ServiceHeader2."Job Details", 1, MAXSTRLEN("Job Description3"));
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
                            "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Service Item Code", "Vehicle Registration No.");
                            "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Fault Code", "Job Type");
                            IF "AppSSC/SC2".FINDLAST THEN BEGIN
                                "AppSSC/SC3".SETRANGE(VDS, "AppSSC/SC2".VDS);
                                "AppSSC/SC3".SETRANGE(VIS, "AppSSC/SC2".VIS);
                                "AppSSC/SC3".SETRANGE("Fault Code", "AppSSC/SC2"."Fault Code");
                                IF "AppSSC/SC3".FINDFIRST THEN
                                    REPEAT
                                        "SSC/SCInfo" := "SSC/SCInfo" + "AppSSC/SC3"."SSC/SC Code" + ',' + ' ';
                                        "SSC/SCInfo2" := "SSC/SCInfo2" + "AppSSC/SC3"."SSC/SC Description" + ',' + ' ';
                                    UNTIL "AppSSC/SC2".NEXT = 0;
                                "SSC/SC Information" := "SSC/SCInfo";
                                IF "SSC/SCInfo2" <> '' THEN
                                    MESSAGE('SSC INFO IS %1', "SSC/SCInfo2");
                                EXIT
                            END
                            ELSE
                                "AppSSC/SC".INIT;
                            "AppSSC/SC"."SSC/SC Code" := "SSC/SC"."SSC/SC Code";
                            "AppSSC/SC"."Line No." := "SSC/SC"."Line No.";
                            "AppSSC/SC"."Service Item Code" := "Vehicle Registration No.";
                            "AppSSC/SC"."Fault Code" := "Job Type";
                            "AppSSC/SC"."SSC/SC Date From" := "SSC/SC"."SSC/SC Date From";
                            "AppSSC/SC"."SSC/SC Date To" := "SSC/SC"."SSC/SC Date To";
                            "AppSSC/SC"."Issue Date" := "SSC/SC"."Issue Date";
                            "AppSSC/SC"."SCSC Status" := "SSC/SC"."SCSC Status";
                            "AppSSC/SC"."SSC/SC Description" := "SSC/SC"."SSC/SC Description";
                            "AppSSC/SC".Applied := "SSC/SC".Applied;
                            "AppSSC/SC"."Model No." := "SSC/SC"."Model No.";
                            "AppSSC/SC"."C/I No" := "SSC/SC"."C/I No";
                            "AppSSC/SC".VDS := "SSC/SC".VDS;
                            "AppSSC/SC".VIS := "SSC/SC".VIS;
                            "AppSSC/SC".VMI := VMI;
                            "AppSSC/SC"."Range From" := "SSC/SC"."Range From";
                            "AppSSC/SC"."Range To" := "SSC/SC"."Range To";
                            "AppSSC/SC".INSERT;
                            //Introduced 13-12-2011
                            CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
                            IF NOT CustOrderLine.FINDLAST THEN
                                SSCLineNo := 10000
                            ELSE
                                SSCLineNo := CustOrderLine."Line No." + 10000;
                            CustOrderLine.INIT;
                            CustOrderLine."Customer Order Form No." := "Customer Order Form No.";
                            CustOrderLine."Line No." := SSCLineNo;
                            CustOrderLine."Customer Class" := CustOrderLine."Customer Class"::Warranty;
                            CustOrderLine."Model Description" := '';
                            CustOrderLine."Model No." := "SSC/SC"."Model No.";
                            CustOrderLine."Line Type" := CustOrderLine."Line Type"::"Sundry Spares";
                            CustOrderLine.VALIDATE(CustOrderLine."No.", 'SSC/SC');
                            CustOrderLine.Description := COPYSTR("SSC/SC"."SSC/SC Description", 1, MAXSTRLEN(CustOrderLine.Description));
                            CustOrderLine.VALIDATE(CustOrderLine.Quantity, 1);
                            CustOrderLine.INSERT;

                        UNTIL "SSC/SC".NEXT = 0;
                END;
            end;
        }
        field(25; "Contact Telephone No."; Text[30])
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
        field(31; "If Other Type"; Text[30])
        {
        }
        field(32; "Odometer Reading At Appointmen"; Decimal)
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
        }
        field(35; "(Engine No)"; Code[20])
        {
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
        field(39; "Job Type"; Code[20])
        {
            TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model No"));

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
        field(43; "Customer's Requests"; Option)
        {
            OptionCaption = 'Appointment,Walk-In,Others';
            OptionMembers = Appointment,"Walk-In",Others;
        }
        field(44; Maintenance; Text[30])
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
                        CompRec."Date of Complaint" := "Customer Order Form Date";
                        CompRec."COF Date" := "Customer Order Form Date";
                        CompRec.VALIDATE(CompRec."Customer No.", "Customer No.");
                        CompRec.VALIDATE(CompRec."Vehicle Registration No.", "Vehicle Registration No.");
                        CompRec."Repeat Repair" := TRUE;
                        CompRec.Complaint := "Job Details";
                        CompRec."Job Details" := "Job Details";
                        CompRec."COF No." := "Customer Order Form No.";
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
        }
        field(57; "Cost Changed"; Decimal)
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
        field(90; Memo; Text[50])
        {
        }
        field(91; "Courtesy Items"; Text[30])
        {
        }
        field(92; "Payment Method"; Option)
        {
            OptionCaption = 'Credit Card,Cash,Other';
            OptionMembers = "Credit Card",Cash,Other;
        }
        field(93; "If Other Method"; Text[30])
        {
        }
        field(94; "Odometer Reading At Reception"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                IF "Odometer Reading At Reception" <> 0 THEN
                    ServiceHeader.SETRANGE("No.", "Customer Order Form No.");
                IF ServiceHeader.FINDFIRST THEN BEGIN
                    ServiceHeader."Odometer Reading Reception" := "Odometer Reading At Reception";
                    ServiceHeader.MODIFY
                END
                ELSE
                    EXIT;
                IF "Odometer Reading At Reception" = 0 THEN
                    ServiceHeader.SETRANGE("No.", "Customer Order Form No.");
                IF ServiceHeader.FINDFIRST THEN
                    IF ServiceHeader."Odometer Reading Reception" <> 0 THEN
                        EXIT;
            end;
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
            CalcFormula = Sum("Customer Order Line"."Amount Inc. VAT" WHERE("Customer Order Form No." = FIELD("Customer Order Form No."),
                                                                             "Service Type" = FIELD("Service Type")));
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
        field(109; "Customer Telephone No."; Text[30])
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
            //TableRelation = "Service Invoice Header"."No." WHERE (Field50010=FIELD("Vehicle Registration No."));
        }
        field(116; "Job No.2"; Code[20])
        {
            //TableRelation = "Service Invoice Header".No. WHERE (Field50010=FIELD(Vehicle Registration No.));
        }
        field(117; "Job No.3"; Code[20])
        {
            //TableRelation = "Service Invoice Header".No. WHERE (Field50010=FIELD(Vehicle Registration No.));
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
        field(135; "Job Type Description"; Text[50])
        {
        }
        field(136; "Contact Home"; Text[30])
        {
        }
        field(137; "Contact Business"; Text[30])
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
        field(141; Mobile; Text[30])
        {
        }
        field(142; "Estimate No."; Code[15])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";

            trigger OnValidate()
            begin
                TESTFIELD("Customer Order Form No.");
                "Estimate No." := "Customer Order Form No.";
            end;
        }
        field(143; "Total Estimation"; Decimal)
        {
            CalcFormula = Sum("Customer Order Line"."Amount Inc. VAT" WHERE("Customer Order Form No." = FIELD("Customer Order Form No.")));
            FieldClass = FlowField;
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
            CalcFormula = Sum("Customer Order Line"."Amount Inc. VAT" WHERE("Customer Order Form No." = FIELD("Estimate No."),
                                                                             "Additional Jobs" = CONST(true)));
            FieldClass = FlowField;
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
        }
        field(172; "Other Findings/Advice"; Text[50])
        {
        }
        field(173; "QC Staff"; Code[20])
        {
            Description = 'QC := Quality Control';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("QC Staff") THEN
                    "Quality Control Staff Code" := ResRec.Name
                ELSE
                    "Quality Control Staff Code" := '';
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
        field(201; "Job Type2"; Text[50])
        {
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
        field(212; "CT Home"; Text[30])
        {
            Description = 'CT := Contact Telephome';
        }
        field(213; "CT Mobile"; Text[30])
        {
            Description = 'CT := Contact Telephome';
        }
        field(214; "CT Business"; Text[30])
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
        }
        field(247; Delivered; Boolean)
        {

            trigger OnValidate()
            begin

                ServiceHeader.SETRANGE("Document Type", ServiceHeader."Document Type"::Order);
                ServiceHeader.SETRANGE("No.", "Customer Order Form No.");
                IF ServiceHeader.FINDFIRST THEN
                    IF ServiceHeader.Posted = FALSE THEN
                        ERROR('This Job cannot be delivered. It has unposted Part Order!') ELSE BEGIN

                        IF "COF Origin" = "COF Origin"::VRI THEN BEGIN
                            IF Delivered = TRUE THEN BEGIN
                                IF VRI2.GET("Vehicle Registration No.") THEN
                                    IF VRI2."Estimate Approved" = FALSE THEN
                                        IF "Customer No." = '970000' THEN
                                            EXIT ELSE
                                            ERROR('Estimate has not been approved by O&L!') ELSE
                                        VRI2.VALIDATE(VRI2.Delivered, TRUE);
                                VRI2.MODIFY;
                            END
                            ELSE BEGIN
                                IF VRI2.GET("Vehicle Registration No.") THEN
                                    VRI2.VALIDATE(VRI2.Delivered, FALSE);
                                VRI2.MODIFY;
                            END;
                        END;

                        IF Delivered THEN BEGIN
                            IF Maintenance2 = TRUE THEN BEGIN
                                IF "Job Type" <> '' THEN BEGIN
                                    TESTFIELD("Next Job Type");
                                    TESTFIELD("Next Service Date");
                                    IF ServAppSch.GET("Vehicle Registration No.", "Job Type") THEN BEGIN
                                        ServAppSch."Service Date" := "JC Date";
                                        ServAppSch."Serviced Kilometer" := "Odometer Reading At Reception";
                                        ServAppSch.Serviced := TRUE;
                                        ServAppSch.MODIFY;
                                    END;
                                    ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                                    ServAppSch.SETRANGE(ServAppSch."Service Code", "Next Job Type");
                                    IF NOT ServAppSch.FINDFIRST THEN BEGIN
                                        ServAppSch.INIT;
                                        ServAppSch.VALIDATE(ServAppSch."Service Item", "Vehicle Registration No.");
                                        ServAppSch.VALIDATE(ServAppSch."Service Code", "Next Job Type");
                                        ServAppSch.VALIDATE(ServAppSch."Service Due Projected Date", "Next Service Date");
                                        ServAppSch.VALIDATE(ServAppSch."Expected Reception Date", "Next Service Date");
                                        ServAppSch."Next Call Date." := CALCDATE('-10D', ServAppSch."Expected Reception Date");
                                        ServAppSch."Call Type" := ServAppSch."Call Type"::"Maintenance Reminder";
                                        ServAppSch."Walk-In" := FALSE;
                                        ServAppSch.Maintenance2 := TRUE;
                                        ServAppSch."Customer's Requests" := ServAppSch."Customer's Requests"::Appointment;
                                        ServAppSch.INSERT;
                                        MESSAGE('Next Service Appointment Schedule Successfully Created!');
                                    END;
                                END;
                                Register4PSF;
                                "Date Delivered" := TODAY;
                                "Time Delivered" := TIME;
                            END
                            ELSE BEGIN
                                IF ServAppSch.GET("Vehicle Registration No.", "Job Type") THEN BEGIN
                                    ServAppSch."Service Date" := "JC Date";
                                    ServAppSch."Serviced Kilometer" := "Odometer Reading At Reception";
                                    ServAppSch.Serviced := TRUE;
                                    ServAppSch.MODIFY;
                                END;
                                Register4PSF;
                                "Date Delivered" := TODAY;
                                "Time Delivered" := TIME;
                                MESSAGE('The Vehicle Successfully Scheduled for Post Service Follow-up!');
                            END;
                        END
                        ELSE BEGIN
                            "Date Delivered" := 0D;
                            "Time Delivered" := 0T;
                            //TO REMOVE THE UPDATE DONE ON THE CURRENT APPOINTNENT SCHEDULE
                            ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                            ServAppSch.SETRANGE(ServAppSch."Service Code", "Job Type");
                            IF ServAppSch.FINDFIRST THEN BEGIN
                                ServAppSch."Service Date" := 0D;
                                ServAppSch."Serviced Kilometer" := 0;
                                ServAppSch.Serviced := FALSE;
                                ServAppSch.MODIFY;
                            END;
                            //TO DELETE THE NEXT APPOINTNENT SCHEDULE
                            ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                            ServAppSch.SETRANGE(ServAppSch."Service Code", "Next Job Type");
                            IF ServAppSch.FINDFIRST THEN
                                ServAppSch.DELETE;
                            //TO DELETE THE PSF ENTRY CREATED
                            ServiceIndex.SETRANGE(ServiceIndex."Job Card No.", "Customer Order Form No.");
                            IF ServiceIndex.FINDFIRST THEN
                                ServiceIndex.DELETE;
                        END;
                    END;

                ServiceHeader.SETRANGE("Document Type", ServiceHeader."Document Type"::Order);
                ServiceHeader.SETRANGE("No.", "Customer Order Form No.");
                IF NOT ServiceHeader.FINDFIRST THEN
                    IF NOT CONFIRM('This COF does not have a Part Order associated with it\do you still want to close it?', FALSE) THEN
                        EXIT ELSE BEGIN
                        IF "COF Origin" = "COF Origin"::VRI THEN BEGIN
                            IF Delivered = TRUE THEN BEGIN
                                IF VRI2.GET("Vehicle Registration No.") THEN
                                    IF VRI2."Estimate Approved" = FALSE THEN
                                        ERROR('Estimate has not been approved by O&L!') ELSE
                                        VRI2.VALIDATE(VRI2.Delivered, TRUE);
                                VRI2.MODIFY;
                            END
                            ELSE BEGIN
                                IF VRI2.GET("Vehicle Registration No.") THEN
                                    VRI2.VALIDATE(VRI2.Delivered, FALSE);
                                VRI2.MODIFY;
                            END;
                        END;

                        IF Delivered THEN BEGIN
                            IF Maintenance2 = TRUE THEN BEGIN
                                IF "Job Type" <> '' THEN BEGIN
                                    TESTFIELD("Next Job Type");
                                    TESTFIELD("Next Service Date");
                                    IF ServAppSch.GET("Vehicle Registration No.", "Job Type") THEN BEGIN
                                        ServAppSch."Service Date" := "JC Date";
                                        ServAppSch."Serviced Kilometer" := "Odometer Reading At Reception";
                                        ServAppSch.Serviced := TRUE;
                                        ServAppSch.MODIFY;
                                    END;
                                    ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                                    ServAppSch.SETRANGE(ServAppSch."Service Code", "Next Job Type");
                                    IF NOT ServAppSch.FINDFIRST THEN BEGIN
                                        ServAppSch.INIT;
                                        ServAppSch.VALIDATE(ServAppSch."Service Item", "Vehicle Registration No.");
                                        ServAppSch.VALIDATE(ServAppSch."Service Code", "Next Job Type");
                                        ServAppSch.VALIDATE(ServAppSch."Service Due Projected Date", "Next Service Date");
                                        ServAppSch.VALIDATE(ServAppSch."Expected Reception Date", "Next Service Date");
                                        ServAppSch."Next Call Date." := CALCDATE('-10D', ServAppSch."Expected Reception Date");
                                        ServAppSch."Call Type" := ServAppSch."Call Type"::"Maintenance Reminder";
                                        ServAppSch."Walk-In" := FALSE;
                                        ServAppSch.Maintenance2 := TRUE;
                                        ServAppSch."Customer's Requests" := ServAppSch."Customer's Requests"::Appointment;
                                        ServAppSch.INSERT;
                                        MESSAGE('Next Service Appointment Schedule Successfully Created!');
                                    END;
                                END;
                                Register4PSF;
                                "Date Delivered" := TODAY;
                                "Time Delivered" := TIME;
                            END
                            ELSE BEGIN
                                IF ServAppSch.GET("Vehicle Registration No.", "Job Type") THEN BEGIN
                                    ServAppSch."Service Date" := "JC Date";
                                    ServAppSch."Serviced Kilometer" := "Odometer Reading At Reception";
                                    ServAppSch.Serviced := TRUE;
                                    ServAppSch.MODIFY;
                                END;
                                Register4PSF;
                                "Date Delivered" := TODAY;
                                "Time Delivered" := TIME;

                                MESSAGE('The Vehicle Successfully Scheduled for Post Service Follow-up!');
                            END;
                        END
                        ELSE BEGIN
                            "Date Delivered" := 0D;
                            "Time Delivered" := 0T;
                            //TO REMOVE THE UPDATE DONE ON THE CURRENT APPOINTNENT SCHEDULE
                            ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                            ServAppSch.SETRANGE(ServAppSch."Service Code", "Job Type");
                            IF ServAppSch.FINDFIRST THEN BEGIN
                                ServAppSch."Service Date" := 0D;
                                ServAppSch."Serviced Kilometer" := 0;
                                ServAppSch.Serviced := FALSE;
                                ServAppSch.MODIFY;
                            END;
                            //TO DELETE THE NEXT APPOINTNENT SCHEDULE
                            ServAppSch.SETRANGE(ServAppSch."Service Item", "Vehicle Registration No.");
                            ServAppSch.SETRANGE(ServAppSch."Service Code", "Next Job Type");
                            IF ServAppSch.FINDFIRST THEN
                                ServAppSch.DELETE;
                            //TO DELETE THE PSF ENTRY CREATED
                            ServiceIndex.SETRANGE(ServiceIndex."Job Card No.", "Customer Order Form No.");
                            IF ServiceIndex.FINDFIRST THEN
                                ServiceIndex.DELETE;
                        END;
                    END;

                LogistRec.SETCURRENTKEY("VRI Code");
                LogistRec.SETRANGE("VRI Code", "Vehicle Registration No.");
                IF LogistRec.FINDFIRST THEN BEGIN
                    LogistRec.TESTFIELD("VRI To WShop");
                    IF Delivered THEN BEGIN
                        LogistRec.Completed := TRUE;
                        LogistRec.MODIFY;
                    END ELSE BEGIN
                        LogistRec.Completed := FALSE;
                        LogistRec.MODIFY;
                    END;
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
        field(253; Status; Option)
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
        field(258; "Next Job Type"; Code[20])
        {
            TableRelation = "Fault Setup Header"."Operation Code" WHERE("Model No." = FIELD("Model No"));

            trigger OnValidate()
            begin
                TESTFIELD("Reception Date");
                IF "Actual Delivery Date" = 0D THEN
                    ERROR('You need to specify Actual Delivery Date!');
                IF FaultRec.GET("Next Job Type", "Model No") THEN
                    "Next Service Date" := CALCDATE('+3M', "Actual Delivery Date");
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
        field(261; "Quality Control Staff Code"; Text[30])
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
                        CompRec."Date of Complaint" := "Customer Order Form Date";
                        CompRec."COF Date" := "Customer Order Form Date";
                        CompRec.VALIDATE(CompRec."Customer No.", "Customer No.");
                        CompRec.VALIDATE(CompRec."Vehicle Registration No.", "Vehicle Registration No.");
                        CompRec."Repeat Repair" := FALSE;
                        CompRec.Complaint := "Job Details";
                        CompRec."Job Details" := "Job Details";
                        CompRec."COF No." := "Customer Order Form No.";
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
        field(273; Memo2; Text[40])
        {
        }
        field(274; Rescheduling; Code[20])
        {
            TableRelation = "Service Appointment Scheduled"."Service Code";
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
                                                                 "Document No." = FIELD("Customer Order Form No."));
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
            CalcFormula = Sum("Customer Order Line".Amount WHERE("Customer Order Form No." = FIELD("Customer Order Form No."),
                                                                  "Line Type" = FILTER('<>Item'),
                                                                  "Service Type" = FIELD("Service Type")));
            FieldClass = FlowField;
        }
        field(299; "Item Estimate"; Decimal)
        {
            CalcFormula = Sum("Customer Order Line".Amount WHERE("Customer Order Form No." = FIELD("Customer Order Form No."),
                                                                  "Line Type" = CONST(Item),
                                                                  "Service Type" = FIELD("Service Type")));
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
        field(305; "Customer Order Form Type"; Option)
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
        field(311; GSM; Text[15])
        {
        }
    }

    keys
    {
        key(Key1; "Customer Order Form No.")
        {
            Clustered = true;
        }
        key(Key2; "Estimate No.", "Job Instruction No.", "Vehicle Registration No.", "Customer Order Form No.")
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
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.","Customer Order Form No.");
        //CustOrderLine.DELETEALL;
        Error('You cannot delete this record!');
    end;

    trigger OnInsert()
    begin
        SalesSetup.GET;
        CASE "Service Type" OF
            "Service Type"::"General Workshop":
                begin
                    SalesSetup.TestField("Customer Order No.");
                    "No. Series" := SalesSetup."Customer Order No.";
                    if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                        "No. Series" := xRec."No. Series";
                    "Customer Order Form No." := NoSeriesMgt.GetNextNo("No. Series")
                end;
            "Service Type"::"Body and Paint":
                Begin
                    SalesSetup.TestField(SalesSetup."Customer Order No. GN");
                    "No. Series" := SalesSetup."Customer Order No. GN";
                    if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                        "No. Series" := xRec."No. Series";
                    "Customer Order Form No." := NoSeriesMgt.GetNextNo("No. Series")
                End;
        END;

        IF "Customer Order Form No." <> '' THEN BEGIN
            "Estimate No." := "Customer Order Form No.";
            "Job Instruction No." := "Customer Order Form No.";
        END;

        "Customer Order Form Date" := TODAY;
        "Job Instruction Date" := TODAY
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        CustRec: Record Customer;
        ModelRec: Record Model;
        ServiceRec: Record "Service Item";
        PoServLineRec: Record "Service Invoice Header";
        i: Integer;
        ItemRec: Record Item;
        FaultRec: Record "Fault Setup Header";
        CustOrderLine: Record "Customer Order Line";
        CustOrderRec: Record "Customer Order Table.";
        Faultsetup: Record "Fault Setup Line";
        EstHeadRec: Record "Estimate Header";
        J: Text[30];
        ServAppSch: Record "Service Appointment Scheduled";
        ResRec: Record "Resource";
        CustOrderTable: Record "Customer Order Table.";
        NextLine: Integer;
        ServLine: Record "Service Line";
        CompRec: Record "Complain Table";
        ComplainCode: Code[10];
        ServiceIndex: Record "Service Index";
        ServiceIndex2: Record "Service Index";
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


    procedure InitRecord()
    begin
        SalesSetup.Get();
        CASE "Service Type" OF
            "Service Type"::"General Workshop":
                begin
                    "No. Series" := SalesSetup."Customer Order No.";
                    NoSeriesMgt.GetNextNo("No. Series");
                end;
            "Service Type"::"Body and Paint":
                Begin
                    "No. Series" := SalesSetup."Customer Order No. GN";
                    NoSeriesMgt.GetNextNo("No. Series");
                End;
        END;
    end;


    procedure GenPurchaseRequisition()
    var
        RequisitionLine: Record "Requisition Line";
        RequisitionLine2: Record "Requisition Line";
        ReqWrkShtName: Record "Requisition Wksh. Name";
        ReqWkshTemp: Record "Req. Wksh. Template";
        NextLineNo: Integer;
    begin
    end;


    procedure Register4PSF()
    var
        ServInvRec: Record "Service Invoice Header";
        ServiceIndex: Record "Service Index";
        COFormRec: Record "Customer Order Table.";
    begin
        /* ServiceIndex2.SETCURRENTKEY("Invoice No.");
        ServiceIndex2.SETRANGE("Invoice No.", "Customer Order Form No.");
        IF ServiceIndex2.FINDFIRST THEN
            ServiceIndex2.DELETEALL; */

        TESTFIELD("P.S.F.U. (Plan) Date");
        TESTFIELD("P.S.F.U. (Plan) Time");
        ServiceIndex.SETRANGE("Job Card No.", "Customer Order Form No.");
        IF NOT ServiceIndex.FINDFIRST THEN BEGIN
            ServiceHeader.SETRANGE("No.", "Customer Order Form No.");
            IF ServiceHeader.FINDFIRST THEN BEGIN
                ServiceIndex.INIT;
                ServiceIndex."FA No." := "FA No.";
                ServiceIndex."Company Fleet" := TRUE;
                //ServiceIndex.VALIDATE(ServiceIndex."Invoice No.", ServiceHeader."No.");
                ServiceIndex.VALIDATE(ServiceIndex."Customer No.", ServiceHeader."Customer No.");
                ServiceIndex."Call Due Date" := "P.S.F.U. (Plan) Date";
                ServiceIndex."Job Details" := "Job Details";
                ServiceIndex."Additional Job Details" := "Additional Job Details";
                ServiceIndex."Vehicle Release Date" := "Actual Delivery Date";
                ServiceIndex.INSERT(TRUE);
                MESSAGE('The vehicle has been scheduled for post service follow-up!');
            END;
        END;
    end;


    procedure GenMaterials()
    begin
        IF FaultRec.GET("Job Type", "Model No") THEN BEGIN
            "Job Type Description" := FaultRec.Description;
            Faultsetup.SETRANGE(Faultsetup."Operation code", "Job Type");
            IF Faultsetup.FIND('-') THEN
                REPEAT
                    CustOrderLine.INIT;
                    CustOrderLine.VALIDATE(CustOrderLine."Operation Code", Faultsetup."Operation code");
                    CustOrderLine."Customer Order Form No." := "Customer Order Form No.";
                    CustOrderLine."Line No." := Faultsetup."Line No.";
                    CustOrderLine."Model Description" := Faultsetup."Model Description";
                    CustOrderLine."Model No." := Faultsetup."Service Item Model";
                    CustOrderLine."Line Type" := Faultsetup.Type;
                    CustOrderLine."Location Code" := "Service Location";
                    CustOrderLine.VALIDATE(CustOrderLine."No.", Faultsetup."No.");
                    CustOrderLine.Description := Faultsetup.Description;
                    CustOrderLine.VALIDATE(CustOrderLine.Quantity, Faultsetup.Quantity);
                    CustOrderLine.INSERT;
                UNTIL Faultsetup.NEXT = 0;
        END;
    end;


    procedure GeneratEstimate()
    begin
    end;


    procedure AssistEdit(OldCustOrderForm: Record "Customer Order Table."): Boolean
    var
        CustOrder: Record "Customer Order Table.";
    begin
        /* WITH CustOrderRec DO BEGIN
            COPY(Rec);
            CustOrderRec := Rec;
            SalesSetup.GET;
            IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, OldCustOrderForm."No. Series", "No. Series") THEN BEGIN
                SalesSetup.GET;
                TestNoSeries;
                NoSeriesMgt.SetSeries("Customer Order Form No.");
                Rec := CustOrderRec;
                EXIT(TRUE);
            END;
        END; */
    end;


    procedure TestNoSeries(): Boolean
    begin
        CASE "Service Type" OF
            "Service Type"::"General Workshop":
                SalesSetup.TESTFIELD("Customer Order No.");
            "Service Type"::"Body and Paint":
                SalesSetup.TESTFIELD("Customer Order No. GN");
        END;
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        CASE "Service Type" OF
            "Service Type"::"General Workshop":
                EXIT(SalesSetup."Customer Order No.");
            "Service Type"::"Body and Paint":
                EXIT(SalesSetup."Customer Order No. GN");
        END;
    end;


    /*  procedure "Create Service Order"()
     begin

     end; */


    procedure GenService()
    begin
        IF NOT Internal THEN
            GenerateService;
        IF Internal THEN
            "GenerateService-I";
        IF Warranty THEN
            "GenerateService-W";
    end;


    procedure GenerateService()
    var
        ServiceRec: Record "Service Header";
        ServiceLine: Record "Service Line";
        ServItemLine: Record "Service Item Line";
    begin
        TESTFIELD("Vehicle Registration No.");
        TESTFIELD("Customer No.");
        ServiceRec.INIT;
        ServiceRec."Document Type" := ServiceRec."Document Type"::Order;
        ServiceRec.VALIDATE(ServiceRec."No.", "Customer Order Form No.");
        ServiceRec.VALIDATE(ServiceRec."Customer No.", "Customer No.");
        ServiceRec.VALIDATE(ServiceRec."Posting Date", "Expected Delivery Date");
        //ServiceRec."User ID" := USERID;
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Vehicle Registration No." := "Vehicle Registration No.";
        ServiceRec.VALIDATE("FA No.", "FA No.");
        ServiceRec.Model := "Model No";
        ServiceRec.Chassis := "Frame No./VIN";
        ServiceRec."Engine No." := "(Engine No)";
        ServiceRec."Odometer Reading Reception" := "Odometer Reading At Reception";
        ServiceRec.Make := "Model Name";
        ServiceRec.Model := "Model No";
        ServiceRec."Service Advisor" := "Service Advisor";
        ServiceRec."Service Advisor's Name" := "Service Advisor's Name";
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Job Details" := "Job Details";
        ServiceRec."Order Date" := TODAY;
        ServiceRec."Order Time" := TIME;
        ServiceRec."Customer's Requests" := "Customer's Requests";
        ServiceRec."Reception Date" := "Reception Date";
        ServiceRec."Reception Time" := "Reception Time";
        ServiceRec."Delivery Date" := "Expected Delivery Date";
        ServiceRec."Delivery Time" := "Expected Delivery Time";
        ServiceRec.INSERT(TRUE);
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");

        ServItemLine.INIT;
        ServItemLine.VALIDATE(ServItemLine."Document Type", ServItemLine."Document Type"::Order);
        ServItemLine."Document No." := "Customer Order Form No.";
        ServItemLine.VALIDATE(ServItemLine."Fault Code", "Job Type");
        ServItemLine."Line No." := 10000;
        ServItemLine."Job Type" := CustOrderLine."Job Type";
        ServItemLine.VALIDATE(ServItemLine."Service Item No.", "Vehicle Registration No.");
        ServItemLine.INSERT(TRUE);

        IF GET(VRIRec."VRI Code") THEN
            ClaimNo := VRIRec."Claim No.";


        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        CustOrderLine.SETRANGE("Line Type", CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE("On Part Order", FALSE);
        CustOrderLine.SETFILTER("No.", '<>%1', '');
        IF CustOrderLine.FINDSET THEN
            REPEAT
                ServiceLine.INIT;
                ServiceLine.VALIDATE(ServiceLine."Document Type", ServItemLine."Document Type");       //SEGUNIO
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServItemLine."Document No.");         //SEGUNIO
                ServiceLine."Service Item No." := ServItemLine."Service Item No.";                    //SEGUNIO
                ServiceLine."Service Item Line No." := ServItemLine."Line No.";                       //SEGUNIO
                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServiceRec."No.");
                ServiceLine."Customer No." := ServiceRec."Customer No.";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No.");
                ServiceLine."Line No." := CustOrderLine."Line No.";
                ServiceLine.Type := ServiceLine.Type::Item;
                ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                ServiceLine.VALIDATE(ServiceLine."Variant Code", CustOrderLine.Variant);
                ServiceLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                ServiceLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                ServiceLine.Description := CustOrderLine.Description;
                ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                ServiceLine."Fault Code" := CustOrderLine."Operation Code";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No.");
                ServiceLine."PR Raised" := CustOrderLine."PR Raised";
                ServiceLine."Claim No." := ClaimNo;
                ServiceLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;

        "Service Order No." := ServiceRec."No.";
        VALIDATE("For Part Order", TRUE);

        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        CustOrderLine.SETRANGE("Line Type", CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;


    procedure "GenerateService-I"()
    var
        ServiceRec: Record "Service Header";
        ServiceLine: Record "Service Line";
        ServItemLine: Record "Service Item Line";
    begin
        ServiceMgtSetup.GET;

        TESTFIELD("Vehicle Registration No.");
        TESTFIELD("Customer No.");
        ServiceRec.INIT;
        ServiceRec."Document Type" := ServiceRec."Document Type"::Order;
        ServiceMgtSetup.TESTFIELD(ServiceMgtSetup."Default Internal Customer");
        IF Internal THEN BEGIN
            ServiceRec.VALIDATE(ServiceRec."No.", "Customer Order Form No." + '-' + 'I');
            ServiceRec.VALIDATE(ServiceRec."Customer No.", "Customer No.");
        END;
        ServiceRec.VALIDATE(ServiceRec."Posting Date", "Expected Delivery Date");
        //ServiceRec."User ID" := USERID;
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Vehicle Registration No." := "Vehicle Registration No.";
        ServiceRec.Model := "Model No";
        ServiceRec."Model Year" := "Model Year";
        ServiceRec.Chassis := "Frame No./VIN";
        ServiceRec."Engine No." := "(Engine No)";
        ServiceRec."Odometer Reading Reception" := "Odometer Reading At Reception";
        ServiceRec.Make := "Model Name";
        ServiceRec.Model := "Model No";
        ServiceRec."Service Advisor" := "Service Advisor";
        ServiceRec."Service Advisor's Name" := "Service Advisor's Name";
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Job Details" := "Job Details";
        ServiceRec."Order Date" := TODAY;
        ServiceRec."Order Time" := TIME;
        ServiceRec."Customer's Requests" := "Customer's Requests";
        ServiceRec."Additional Job Details" := "Additional Job Details";
        ServiceRec."Reception Time" := "Reception Time";
        ServiceRec."Delivery Date" := "Expected Delivery Date";
        ServiceRec."Delivery Time" := "Expected Delivery Time";
        ServiceRec."Job Posting Group" := 'MOTOR';
        ServiceRec.Internal := Internal;
        ServiceRec.Warranty := Warranty;
        ServiceRec.PM := Maintenance2;
        ServiceRec.GR := "General Repair";
        ServiceRec."D/Estimate" := "Diag/Est";
        ServiceRec."B&P" := "B & P";
        ServiceRec.INSERT(TRUE);
        COMMIT;
        ServiceRec.VALIDATE(ServiceRec."Bill-to Customer No.", ServiceMgtSetup."Default Internal Customer");
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");

        ServItemLine.INIT;
        ServItemLine.VALIDATE(ServItemLine."Document Type", ServItemLine."Document Type"::Order);
        IF Internal THEN
            ServItemLine.VALIDATE(ServItemLine."Document No.", "Customer Order Form No." + '-' + 'I');
        ServItemLine.VALIDATE(ServItemLine."Fault Code", "Job Type");
        ServItemLine."Line No." := 10000;
        ServItemLine."Job Type" := CustOrderLine."Job Type";
        ServItemLine.VALIDATE(ServItemLine."Service Item No.", "Vehicle Registration No.");
        ServItemLine.INSERT(TRUE);

        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        //CustOrderLine.SETRANGE("Line Type",CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE(CustOrderLine."Customer Class", CustOrderLine."Customer Class"::Internal);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        CustOrderLine.SETFILTER(CustOrderLine."No.", '<>%1', '');
        IF CustOrderLine.FINDSET THEN
            REPEAT
                ServiceLine.INIT;
                ServiceLine.VALIDATE(ServiceLine."Document Type", ServItemLine."Document Type");       //SEGUNIO
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServItemLine."Document No.");         //SEGUNIO
                ServiceLine."Service Item No." := ServItemLine."Service Item No.";                    //SEGUNIO
                ServiceLine."Customer Class" := CustOrderLine."Customer Class";
                ServiceLine."Service Item Line No." := ServItemLine."Line No.";                       //SEGUNIO
                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServiceRec."No.");
                ServiceLine."Customer No." := ServiceRec."Customer No.";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No.");
                ServiceLine."Line No." := CustOrderLine."Line No.";
                IF CustOrderLine."Line Type" = CustOrderLine."Line Type"::Item THEN
                    ServiceLine.Type := ServiceLine.Type::Item
                ELSE
                    ServiceLine.Type := ServiceLine.Type::Cost;
                ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                ServiceLine.VALIDATE(ServiceLine."Variant Code", CustOrderLine.Variant);
                ServiceLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                ServiceLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                ServiceLine.Description := CustOrderLine.Description;
                ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                ServiceLine."Fault Code" := CustOrderLine."Operation Code";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No.");
                ServiceLine."PR Raised" := CustOrderLine."PR Raised";
                ServiceLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;

        "Service Order No." := ServiceRec."No.";
        VALIDATE("For Part Order", TRUE);

        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Customer Class", CustOrderLine."Customer Class"::Internal);
        //CustOrderLine.SETRANGE("Line Type",CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;


        //UPDATE JOB DETAILS ON SERVICE LINE
        ServiceLine.SETRANGE(ServiceLine."Document Type", ServiceLine."Document Type"::Order);
        ServiceLine.SETRANGE(ServiceLine."Document No.", "Customer Order Form No." + '-' + 'I');
        IF ServiceLine.FINDSET THEN BEGIN
            JobTask.SETRANGE(JobTask."Job No.", "Customer Order Form No." + '-' + 'I');
            IF JobTask.FINDFIRST THEN
                REPEAT
                    ServiceLine."Job No." := "Customer Order Form No." + '-' + 'I';
                    ServiceLine."Job Task No." := JobTask."Job Task No.";
                    ServiceLine."Job Line Type" := ServiceLine."Job Line Type"::"Both Budget and Billable";
                    ServiceLine.MODIFY;
                UNTIL ServiceLine.NEXT = 0;
        END;
    end;


    procedure "GenerateService-W"()
    var
        ServiceRec: Record "Service Header";
        ServiceLine: Record "Service Line";
        ServItemLine: Record "Service Item Line";
    begin
        ServiceMgtSetup.GET;

        TESTFIELD("Vehicle Registration No.");
        TESTFIELD("Customer No.");
        ServiceRec.INIT;
        ServiceRec."Document Type" := ServiceRec."Document Type"::Order;
        IF Warranty THEN BEGIN
            ServiceRec.VALIDATE(ServiceRec."No.", "Customer Order Form No." + '-' + 'W');
            ServiceRec.VALIDATE(ServiceRec."Customer No.", "Customer No.");
        END;
        ServiceRec.VALIDATE(ServiceRec."Posting Date", "Expected Delivery Date");
        //ServiceRec."User ID" := USERID;
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Vehicle Registration No." := "Vehicle Registration No.";
        ServiceRec.Model := "Model No";
        ServiceRec."Model Year" := "Model Year";
        ServiceRec.Chassis := "Frame No./VIN";
        ServiceRec."Engine No." := "(Engine No)";
        ServiceRec."Odometer Reading Reception" := "Odometer Reading At Reception";
        ServiceRec.Make := "Model Name";
        ServiceRec.Model := "Model No";
        ServiceRec."Service Advisor" := "Service Advisor";
        ServiceRec."Service Advisor's Name" := "Service Advisor's Name";
        ServiceRec.Description := "Job Type Description";
        ServiceRec."Job Details" := "Job Details";
        ServiceRec."Order Date" := TODAY;
        ServiceRec."Order Time" := TIME;
        ServiceRec."Customer's Requests" := "Customer's Requests";
        ServiceRec."Additional Job Details" := "Additional Job Details";
        ServiceRec."Reception Time" := "Reception Time";
        ServiceRec."Delivery Date" := "Expected Delivery Date";
        ServiceRec."Delivery Time" := "Expected Delivery Time";
        ServiceRec."Job Posting Group" := 'MOTOR';
        ServiceRec.Internal := Internal;
        ServiceRec.Warranty := Warranty;
        ServiceRec.PM := Maintenance2;
        ServiceRec.GR := "General Repair";
        ServiceRec."D/Estimate" := "Diag/Est";
        ServiceRec."B&P" := "B & P";
        ServiceRec.INSERT(TRUE);
        COMMIT;
        ServiceRec.VALIDATE(ServiceRec."Bill-to Customer No.", ServiceMgtSetup."Default Warranty Customer");
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ServiceRec.VALIDATE(ServiceRec."Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");

        ServItemLine.INIT;
        ServItemLine.VALIDATE(ServItemLine."Document Type", ServItemLine."Document Type"::Order);
        IF Warranty THEN
            ServItemLine.VALIDATE(ServItemLine."Document No.", "Customer Order Form No." + '-' + 'W');
        ServItemLine.VALIDATE(ServItemLine."Fault Code", "Job Type");
        ServItemLine."Line No." := 10000;
        ServItemLine."Job Type" := CustOrderLine."Job Type";
        ServItemLine.VALIDATE(ServItemLine."Service Item No.", "Vehicle Registration No.");
        ServItemLine.INSERT(TRUE);

        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        //CustOrderLine.SETRANGE("Line Type",CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE(CustOrderLine."Customer Class", CustOrderLine."Customer Class"::Warranty);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        CustOrderLine.SETFILTER(CustOrderLine."No.", '<>%1', '');
        IF CustOrderLine.FINDSET THEN
            REPEAT
                ServiceLine.INIT;
                ServiceLine.VALIDATE(ServiceLine."Document Type", ServItemLine."Document Type");       //SEGUNIO
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServItemLine."Document No.");         //SEGUNIO
                ServiceLine."Service Item No." := ServItemLine."Service Item No.";                    //SEGUNIO
                ServiceLine."Customer Class" := CustOrderLine."Customer Class";
                ServiceLine."Service Item Line No." := ServItemLine."Line No.";                       //SEGUNIO
                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                ServiceLine.VALIDATE(ServiceLine."Document No.", ServiceRec."No.");
                ServiceLine."Customer No." := ServiceRec."Customer No.";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No.");
                ServiceLine."Line No." := CustOrderLine."Line No.";
                IF CustOrderLine."Line Type" = CustOrderLine."Line Type"::Item THEN
                    ServiceLine.Type := ServiceLine.Type::Item
                ELSE
                    ServiceLine.Type := ServiceLine.Type::Cost;
                ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                ServiceLine.VALIDATE(ServiceLine."Variant Code", CustOrderLine.Variant);
                ServiceLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                ServiceLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                ServiceLine.Description := CustOrderLine.Description;
                ServiceLine."Model Description" := CustOrderLine."Model Description";
                ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                ServiceLine."Fault Code" := CustOrderLine."Operation Code";
                ServiceLine.VALIDATE(ServiceLine."WSR No.", "Customer Order Form No." + '-' + 'W');
                ServiceLine."PR Raised" := CustOrderLine."PR Raised";
                ServiceLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;

        "Service Order No." := ServiceRec."No.";
        VALIDATE("For Part Order", TRUE);

        CustOrderLine.SETRANGE("Customer Order Form No.", "Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Customer Class", CustOrderLine."Customer Class"::Warranty);
        //CustOrderLine.SETRANGE("Line Type",CustOrderLine."Line Type"::Item);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;


        //UPDATE JOB DETAILS ON SERVICE LINE
        ServiceLine.SETRANGE(ServiceLine."Document Type", ServiceLine."Document Type"::Order);
        ServiceLine.SETRANGE(ServiceLine."Document No.", "Customer Order Form No." + '-' + 'W');
        IF ServiceLine.FINDSET THEN BEGIN
            JobTask.SETRANGE(JobTask."Job No.", "Customer Order Form No." + '-' + 'W');
            IF JobTask.FINDFIRST THEN
                REPEAT
                    ServiceLine."Job No." := "Customer Order Form No." + '-' + 'W';
                    ServiceLine."Job Task No." := JobTask."Job Task No.";
                    ServiceLine."Job Line Type" := ServiceLine."Job Line Type"::"Both Budget and Billable";
                    ServiceLine.MODIFY;
                UNTIL ServiceLine.NEXT = 0;
        END;
    end;
}

