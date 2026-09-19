table 70040 "Service IndexX"
{

    fields
    {
        field(1; "Index No."; Code[20])
        {

            /* trigger OnValidate()
            begin
                IF "Index No." <> xRec."Index No." THEN BEGIN
                    servicesetup.GET;
                    NoseriesMgt.TestManual(servicesetup."Service Index Nos.");
                    "No. Series" := '';
                END;
            end; */
        }
        field(2; "COF No."; Code[20])
        {

            trigger OnValidate()
            begin
                // IF CustRec.GET("COF No.") THEN BEGIN
                //      := CustRec.Name;
                //     "Contact Person"   := CustRec.Contact;
                //     "Contact Phone No.":= CustRec."Phone No.";
                //     "E-Mail" := CustRec."E-Mail";

                //   END;
            end;
        }
        field(3; "Delivery Date"; Date)
        {

            trigger OnValidate()
            begin
                /*"Call Due Date" := CALCDATE('2D',ServInd."Delivery Date");
                RetDay := DATE2DWY("Call Due Date",1);
                CASE RetDay OF
                    6:  "Call Due Date" := CALCDATE('2D',"Call Due Date");
                    7:  "Call Due Date" := CALCDATE('1D',"Call Due Date");
                END;
                */

            end;
        }
        field(4; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := CustRec.Name;
                    "Contact Person" := CustRec.Contact;
                    "Contact Phone No." := CustRec."Phone No.";
                    "E-Mail" := CustRec."E-Mail";

                END;
            end;
        }
        field(5; "Customer Name"; Text[50])
        {
        }
        field(6; "Contact Person"; Text[30])
        {
        }
        field(7; "Contact Position"; Text[30])
        {
        }
        field(8; "Contact Phone No."; Code[20])
        {
        }
        field(9; "Contact Mobile Phone"; Code[20])
        {
        }
        field(10; "Vehicle No."; Code[15])
        {
            TableRelation = "Service Item"."No." WHERE("Customer No." = FIELD("Customer No."));
        }
        field(11; Model; Code[40])
        {
        }
        field(12; "Make of the Vehicle"; Text[30])
        {
        }
        field(13; "Job Card No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE(Delivered = filter(true));
        }
        field(14; "Responsible Supervisor"; Code[20])
        {
        }
        field(15; "Call Due Date"; Date)
        {

            trigger OnValidate()
            begin
                RetDay := DATE2DWY("Call Due Date", 1);
                CASE RetDay OF
                    6:
                        "Call Due Date" := CALCDATE('2D', "Call Due Date");
                    7:
                        "Call Due Date" := CALCDATE('1D', "Call Due Date");
                END;
            end;
        }
        field(16; Called; Boolean)
        {
        }
        field(17; "Call Response"; Option)
        {
            OptionCaption = ' ,Satisfactory,Not Satisfactory,Fairly Satisfactory';
            OptionMembers = " ",Satisfactory,"Not Satisfactory","Fairly Satisfactory";
        }
        field(18; "Repeat Call 1"; Boolean)
        {
        }
        field(19; "Repeat Call 2"; Boolean)
        {
        }
        field(20; "Repeat Call 3"; Boolean)
        {
        }
        field(21; "Repeat Call 1 Date"; Date)
        {
        }
        field(22; "Repeat Call 2 Date"; Date)
        {
        }
        field(23; "Repeat Call 3 Date"; Date)
        {
        }
        field(24; "Call 1 Response"; Text[50])
        {
        }
        field(25; "Call 2 Response"; Text[50])
        {
        }
        field(26; "Call 3 Response"; Text[50])
        {
        }
        field(27; "Action"; Option)
        {
            OptionCaption = ' ,Closed,Call Again,Open Return Job,Send Mail,Send SMS';
            OptionMembers = " ",Closed,"Call Again","Open Return Job","Send Mail","Send SMS";
        }
        field(28; "Driver's Name"; Text[30])
        {
        }
        field(29; "Driver's Phone (Mobile)"; Code[20])
        {
        }
        field(30; "E-Mail"; Text[50])
        {
        }
        field(31; "No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(32; "Work Completed the First Time"; Decimal)
        {
            Description = 'Was the works req''d completed correctly the first time';
            MaxValue = 10;
            MinValue = 0;
        }
        field(33; "Treatment Reception/Delivery"; Decimal)
        {
            Description = 'How were you treated during the reception and  delivery  process?';
            MaxValue = 10;
            MinValue = 0;
        }
        field(34; "Waitting Time at Reception"; Decimal)
        {
            Description = 'Describe the waiting time at the receptiion';
            MaxValue = 10;
            MinValue = 0;
        }
        field(35; "Service Accuracy"; Decimal)
        {
            Description = 'Do you consider the time for the service / repair reasonable';
            MaxValue = 10;
            MinValue = 0;
        }
        field(36; "Was the Veh. Finished On Time"; Decimal)
        {
            Description = 'Was the vehicle ready at the promised  time?';
            MaxValue = 10;
            MinValue = 0;
        }
        field(37; "Work/Est. Explanation Recept"; Decimal)
        {
            Description = 'Was the work required and estimate charges explained at the reception ?';
            MaxValue = 10;
            MinValue = 0;
        }
        field(38; "Reason for Failed Finishd Time"; Text[50])
        {
        }
        field(39; "Standard Expectations"; Decimal)
        {
            Description = 'Did the standard of work  meet your expectations and satisfaction?';
            MaxValue = 10;
            MinValue = 0;
        }
        field(40; "Will you Recomend Us to Other"; Decimal)
        {
            Description = 'Would you recommend our service department?';
            MaxValue = 10;
            MinValue = 0;
        }
        field(41; "Service Order No."; Code[20])
        {
        }
        field(42; "Service Invoice No."; Code[20])
        {
        }
        field(43; Score; Decimal)
        {
            Editable = false;
            MinValue = 0;
        }
        field(44; "Follow Up Required"; Boolean)
        {
        }
        field(45; Comment; Text[250])
        {
        }
        field(46; "Any Difficulty on appo."; Decimal)
        {
        }
        field(47; "Treat Reception/Delivery"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            ValuesAllowed = 123;
        }
        field(48; "How is Wait Time at Reception"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(49; "Service Accuracy score"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            ValuesAllowed = 13;
        }
        field(50; "Was Vehicle Finished On Time"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(51; "Work/Est. Explant Reception"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(52; "Reason for Fail Finishing Time"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            ValuesAllowed = 1;
        }
        field(53; "Did Stdrd Expectations Satis"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(54; "Will you Recormend Us to Other"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            MaxValue = 10;
            MinValue = 0;
            ValuesAllowed = 13;
        }
        field(55; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(56; "Any Difficulty on appo. Ave"; Decimal)
        {
            /* CalcFormula = Sum("Service Index"."Any Difficulty on appo." WHERE("Call Due Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField; */
        }
        field(57; "Treat Reception/Deli Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Treat Reception/Delivery" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(58; "Wait Time at Reception Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."How is Wait Time at Reception" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(59; "Service Accuracy score Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Service Accuracy score" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(60; "Vehicle Finished On Time  Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Was Vehicle Finished On Time" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(61; "Work/Est. Explant Recep Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Work/Est. Explant Reception" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(62; "Reason 4 Fail Finish Time Ave"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            ValuesAllowed = 1;
        }
        field(63; "Stdrd Expectations Satis Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Did Stdrd Expectations Satis" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(64; "Recormend Us to Other Ave"; Decimal)
        {
            /* CalcFormula = Average("Service Index"."Will you Recormend Us to Other" WHERE("Invoice Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(65; "Any Difficulty on appo. sum"; Integer)
        {
            /* CalcFormula = Count("Service Index" WHERE("Call Due Date" = FIELD("Date Filter"),
                                                       Done = filter(true)));
            Description = 'Sum counts the number of records, Dada';
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(66; "Treat Reception/Deli sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE("Call Due Date" = FIELD("Date Filter"),
                                                        Done = filter(true)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(67; "Wait Time at Reception sum"; Integer)
        {
            /* CalcFormula = Count("Service Index" WHERE(Call Due Date=FIELD(Date Filter),
                                                       Done=CONST(Yes)));
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(68; "Service Accuracy score sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE (Call Due Date=FIELD(Date Filter),
                                                        Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 13; */
        }
        field(69; "Vehicle Finished On Time  sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE (Call Due Date=FIELD(Date Filter),
                                                        Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 13; */
        }
        field(70; "Work/Est. Explant Recep sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE (Call Due Date=FIELD(Date Filter),
                                                        Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(71; "Reason 4 Fail Finish Time sum"; Integer)
        {
            ValuesAllowed = 1;
        }
        field(72; "Stdrd Expectations Satis sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE (Call Due Date=FIELD(Date Filter),
                                                        Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(73; "Recormend Us to Other sum"; Integer)
        {
            /*  CalcFormula = Count("Service Index" WHERE (Call Due Date=FIELD(Date Filter),
                                                        Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 13; */
        }
        field(74; "Any Difficulty on appo. Cont"; Decimal)
        {
            /*  CalcFormula = Sum("Service Index"."Any Difficulty on appo." WHERE (Call Due Date=FIELD(Date Filter),
                                                                                Done=CONST(Yes)));
             FieldClass = FlowField; */
        }
        field(75; "Treat Reception/Deli Cont"; Decimal)
        {
            /*  CalcFormula = Sum("Service Index"."Treat Reception/Delivery" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                 Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(76; "Wait Time at Reception Cont"; Decimal)
        {
            /*  CalcFormula = Sum("Service Index"."How is Wait Time at Reception" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                      Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(77; "Service Accuracy score Cont"; Decimal)
        {
            /*  CalcFormula = Sum("Service Index"."Service Accuracy score" WHERE (Call Due Date=FIELD(Date Filter),
                                                                               Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 13; */
        }
        field(78; "Vehicle Finished On Time Cont"; Decimal)
        {
            /* CalcFormula = Sum("Service Index"."Was Vehicle Finished On Time" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                    Done=CONST(Yes)));
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(79; "Work/Est. Explant Recep Cont"; Decimal)
        {
            /* CalcFormula = Sum("Service Index"."Work/Est. Explant Reception" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                   Done=CONST(Yes)));
            FieldClass = FlowField;
            ValuesAllowed = 123; */
        }
        field(80; "Reason 4 Fail Finish Time Cont"; Integer)
        {
            ValuesAllowed = 1;
        }
        field(81; "Stdrd Expectations Satis Cont"; Decimal)
        {
            /*  CalcFormula = Sum("Service Index"."Did Stdrd Expectations Satis" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                     Done=CONST(Yes)));
             FieldClass = FlowField;
             ValuesAllowed = 123; */
        }
        field(82; "Recormend Us to Other Cont"; Decimal)
        {
            /* CalcFormula = Sum("Service Index"."Will you Recormend Us to Other" WHERE (Call Due Date=FIELD(Date Filter),
                                                                                      Done=CONST(Yes)));
            FieldClass = FlowField;
            ValuesAllowed = 13; */
        }
        field(83; "PSFU Actual Date"; Date)
        {
        }
        field(84; "PSFU Actual Time"; Time)
        {
        }
        field(85; "PSFU Staff Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                IF ResRec.GET("PSFU Staff Code") THEN
                    "PSFU Staff Name" := ResRec.Name;
            end;
        }
        field(86; "PSFU Staff Name"; Text[30])
        {
        }
        field(87; "Job Details"; Text[250])
        {
        }
        field(88; "Additional Job Details"; Text[100])
        {
        }
        field(89; "Vehicle Release Date"; Date)
        {
        }
        field(90; "Fix it right"; Boolean)
        {
        }
        field(91; "Fix it right %"; Decimal)
        {
        }
        field(92; Done; Boolean)
        {

            trigger OnValidate()
            begin
                Score := "Work Completed the First Time" + "Treatment Reception/Delivery" + "Waitting Time at Reception"
                  + "Service Accuracy" + "Work/Est. Explanation Recept" + "Was the Veh. Finished On Time" + "Standard Expectations" + "Will you Recomend Us to Other";
            end;
        }
        field(93; "Fix it right Count"; Integer)
        {
            /* CalcFormula = Count("Service Index" WHERE ("Fix it right"=filter(true)));
            FieldClass = FlowField; */
        }
        field(94; "Total Count"; Integer)
        {
            /* CalcFormula = Count("Service Index" WHERE ("Date Filter"=FIELD("Date Filter")));
            FieldClass = FlowField; */
        }
        field(95; "Fix it Right Fields Total"; Integer)
        {
        }
        field(96; "Fix it Right Ratio"; Decimal)
        {
        }
        field(97; "Maximum Score for Question"; Decimal)
        {
            InitValue = 3;

            trigger OnValidate()
            begin
                "Total Obtainable" := "Maximum Score for Question" * "No of Persons interviewed";
            end;
        }
        field(98; "No of Persons interviewed"; Decimal)
        {
            InitValue = 3;

            trigger OnValidate()
            begin
                "Total Obtainable" := "Maximum Score for Question" * "No of Persons interviewed";
            end;
        }
        field(99; "Total Obtainable"; Decimal)
        {
        }
        field(100; "Score Obtained"; Decimal)
        {
            /*    CalcFormula = Sum("Service Index"."Any Difficulty on appo.");
               FieldClass = FlowField;

               trigger OnValidate()
               begin
                   MARKS := "Score Obtained"/"Total Obtainable";
               end; */
        }
        field(101; MARKS; Decimal)
        {
        }
        field(102; Completed; Boolean)
        {
            TableRelation = "Customer Order Table.".Delivered WHERE(Delivered = FIELD(Completed));
        }
        field(103; "Max Score1"; Integer)
        {
            Description = 'by Dada to Calculate Max Obtainable Score';
        }
        field(104; "Max Score2"; Integer)
        {
        }
        field(105; "Max Score3"; Integer)
        {
        }
        field(106; "Max Score4"; Integer)
        {
        }
        field(107; "Max Score5"; Integer)
        {
        }
        field(108; "Max Score6"; Integer)
        {
        }
        field(109; "Max Score7"; Integer)
        {
        }
        field(110; "Max Score8"; Integer)
        {
        }
        field(111; Average1; Decimal)
        {
            Description = 'to Calculate Average Score';
        }
        field(112; Average2; Decimal)
        {
        }
        field(113; Average3; Decimal)
        {
        }
        field(114; Average4; Decimal)
        {
        }
        field(115; Average5; Decimal)
        {
        }
        field(116; Average6; Decimal)
        {
        }
        field(117; Average7; Decimal)
        {
        }
        field(118; Average8; Decimal)
        {
        }
        field(119; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset" WHERE("FA Class Code" = filter('MOTOR_VEH'));
        }
        field(120; "Company Fleet"; Boolean)
        {
        }
        field(121; "Service Location"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = filter(false));
        }
        field(122; Memo; Text[50])
        {
        }
        field(123; "Other Findings/Advice"; Text[50])
        {
        }
        field(124; "Customer's Feedback"; Text[150])
        {
        }
        field(125; Brand; Code[20])
        {
            TableRelation = "Vehicle Brand"."Vehicle Brand Code";
        }
        field(126; "Delivery Time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Index No.")
        {
            Clustered = true;
            SumIndexFields = "Any Difficulty on appo.", "Treat Reception/Delivery", "How is Wait Time at Reception", "Service Accuracy score", "Was Vehicle Finished On Time", "Work/Est. Explant Reception", "Reason for Fail Finishing Time", "Will you Recormend Us to Other", "Did Stdrd Expectations Satis";
        }
        key(Key2; "Delivery Date")
        {
            SumIndexFields = "Any Difficulty on appo.", "Treat Reception/Delivery", "How is Wait Time at Reception", "Service Accuracy score", "Was Vehicle Finished On Time", "Work/Est. Explant Reception", "Reason for Fail Finishing Time", "Will you Recormend Us to Other", "Did Stdrd Expectations Satis";
        }
        key(Key3; "Call Due Date", Done)
        {
            SumIndexFields = "Any Difficulty on appo.", "Treat Reception/Delivery", "How is Wait Time at Reception", "Service Accuracy score", "Was Vehicle Finished On Time", "Work/Est. Explant Reception", "Reason for Fail Finishing Time", "Did Stdrd Expectations Satis", "Will you Recormend Us to Other";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Index No." = '' THEN BEGIN
            servicesetup.GET;
            servicesetup.TESTFIELD("Service Index Nos.");
            "No. Series" := servicesetup."Service Index Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Index No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
        VALIDATE("No of Persons interviewed");
    end;

    var
        ServInd: Record 70040;
        servicesetup: Record 5911;
        NoseriesMgt: Codeunit "No. Series";
        CustRec: Record 18;
        ServInvHead: Record 5992;
        RetDay: Integer;
        Rec1: Integer;
        Rec2: Integer;
        Rec3: Integer;
        ResRec: Record 156;


    procedure AssistEdit(OldInd: Record 50045): Boolean
    begin
        /* WITH ServInd DO BEGIN
            ServInd := Rec;
            servicesetup.GET;
            servicesetup.TESTFIELD(servicesetup."Service Index Nos.");
            IF NoseriesMgt.SelectSeries(servicesetup."Service Index Nos.", OldInd."No. Series", "No. Series") THEN BEGIN
                servicesetup.GET;
                servicesetup.TESTFIELD(servicesetup."Service Index Nos.");
                NoseriesMgt.SetSeries("Index No.");
                Rec := ServInd;
                EXIT(TRUE);
            END;
        END; */
    end;
}

