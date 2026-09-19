table 50113 "CSI Table"
{

    fields
    {
        field(1; "CSI Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF "CSI Code" <> xRec."CSI Code" THEN BEGIN
                    ServiceSetup.GET;
                    NoSeriesMgt.TestManual(ServiceSetup."CSI No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Dealer Code"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                CustRec.GET("Dealer Code");
                "Dealer Name" := CustRec.Name;
            end;
        }
        field(3; "Dealer Name"; Text[50])
        {
            InitValue = 'Metropolitan Motors';
        }
        field(4; "Customer Tel. No."; Code[20])
        {
        }
        field(5; "Vehicle Model"; Code[20])
        {
        }
        field(6; "COF No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE(Delivered = CONST(true));

            trigger OnValidate()
            begin
                IF COFRec.GET("COF No.") THEN BEGIN
                    VALIDATE("Customer Code", COFRec."Customer No.");
                    VALIDATE("Vehicle Registeration", COFRec."Vehicle Registration No.");
                    "Service / Repair Date" := COFRec."JC Date";
                END;
            end;
        }
        field(7; "Vehicle Registeration"; Code[20])
        {
            Description = 'Service Item No.';
            TableRelation = "Service Item"."No." WHERE("Customer No." = FIELD("Customer Code"));

            trigger OnValidate()
            begin
                IF ServItem.GET("Vehicle Registeration") THEN BEGIN
                    "Vehicle Model" := ServItem."Model No.";
                    VALIDATE("Customer Code", ServItem."Customer No.");
                    "Contact Person Name" := ServItem.Contact;
                END;
            end;
        }
        field(8; "Service / Repair Date"; Date)
        {
        }
        field(9; "Impresion of the Service"; Option)
        {
            Description = 'What was your overall impression of service area /department?';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Impresion of the Service" OF
                    0:
                        CASE "Impresion of the Service" OF
                            1:
                                Score := Score - 4 + (4 - 1.33);
                            2:
                                Score := Score - 4 + (4 - 2.67);
                            3:
                                Score := Score - 4;
                        END;
                    1:
                        CASE "Impresion of the Service" OF
                            0:
                                Score := Score + 1.33;
                            2:
                                Score := Score + 1.33 - 2.67;
                            3:
                                Score := Score + 1.33 - 4;
                        END;
                    2:
                        CASE "Impresion of the Service" OF
                            1:
                                Score := Score + 2.67 - 1.33;
                            0:
                                Score := Score + 2.67;
                            3:
                                Score := Score + 2.67 - 4;
                        END;
                    3:
                        CASE "Impresion of the Service" OF
                            1:
                                Score := Score + 4 - 1.33;
                            2:
                                Score := Score + 4 - 2.67;
                            0:
                                Score := Score + 4;
                        END;
                END;

            end;
        }
        field(10; "Rate The Competence"; Option)
        {
            Description = 'Please Rate the Competence and coutesy of the reception staff';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Rate The Competence" OF
                    0:
                        CASE "Rate The Competence" OF
                            1:
                                Score := Score - 1.9;
                            2:
                                Score := Score - 3.8;
                            3:
                                Score := Score - 5.7;
                        END;
                    1:
                        CASE "Rate The Competence" OF
                            0:
                                Score := Score + 1.9;
                            2:
                                Score := Score + 1.9 - 3.8;
                            3:
                                Score := Score + 1.9 - 5.7;
                        END;

                    2:
                        CASE "Rate The Competence" OF
                            1:
                                Score := Score + 3.8 - 1.9;
                            0:
                                Score := Score + 3.8;
                            3:
                                Score := Score + 3.8 - 5.7;
                        END;

                    3:
                        CASE "Rate The Competence" OF
                            1:
                                Score := Score + 5.7 - 1.9;
                            2:
                                Score := Score + 5.7 - 3.8;
                            0:
                                Score := Score + 5.7;
                        END;
                END;

            end;
        }
        field(11; "Staff Ability to Estimate/Ind"; Option)
        {
            Description = 'Staff Ability to provide and indication in Advance of work involve and /or estimate cost';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Staff Ability to Estimate/Ind" OF
                    0:
                        CASE "Staff Ability to Estimate/Ind" OF
                            1:
                                Score := Score - 1.63;
                            2:
                                Score := Score - 3.27;
                            3:
                                Score := Score - 4.9;
                        END;

                    1:
                        CASE "Staff Ability to Estimate/Ind" OF
                            0:
                                Score := Score + 1.63;
                            2:
                                Score := Score + 1.63 - 3.27;
                            3:
                                Score := Score + 1.63 - 4.9;
                        END;

                    2:
                        CASE "Staff Ability to Estimate/Ind" OF
                            1:
                                Score := Score + 3.27 - 1.63;
                            0:
                                Score := Score + 4.9;
                            3:
                                Score := Score + 3.27 - 4.9;
                        END;

                    3:
                        CASE "Staff Ability to Estimate/Ind" OF
                            1:
                                Score := Score + 4.9 - 1.63;
                            2:
                                Score := Score + 4.9 - 3.27;
                            0:
                                Score := Score + 4.9;
                        END;
                END;

            end;
        }
        field(12; "Service Assurance"; Option)
        {
            Description = 'The assuarance that your vehicle will be well take care of';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Service Assurance" OF
                    0:
                        CASE "Service Assurance" OF
                            1:
                                Score := Score - 2.1;
                            2:
                                Score := Score - 4.2;
                            3:
                                Score := Score - 6.3;
                        END;

                    1:
                        CASE "Service Assurance" OF
                            0:
                                Score := Score + 2.1;
                            2:
                                Score := Score + 2.1 - 4.2;
                            3:
                                Score := Score + 2.1 - 6.3;
                        END;

                    2:
                        CASE "Service Assurance" OF
                            1:
                                Score := Score + 4.2 - 2.1;
                            0:
                                Score := Score + 4.2;
                            3:
                                Score := Score + 4.2 - 6.3;
                        END;

                    3:
                        CASE "Service Assurance" OF
                            1:
                                Score := Score + 6.3 - 2.1;
                            2:
                                Score := Score + 6.3 - 4.2;
                            0:
                                Score := Score + 6.3;
                        END;
                END;

            end;
        }
        field(13; "Interest shown in U as Cust."; Option)
        {
            Description = 'The Interest shown in you as a customer';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Interest shown in U as Cust." OF
                    0:
                        CASE "Interest shown in U as Cust." OF
                            1:
                                Score := Score - 2.23;
                            2:
                                Score := Score - 4.47;
                            3:
                                Score := Score - 6.7;
                        END;

                    1:
                        CASE "Interest shown in U as Cust." OF
                            0:
                                Score := Score + 2.23;
                            2:
                                Score := Score + 2.23 - 4.47;
                            3:
                                Score := Score + 2.23 - 6.7;
                        END;

                    2:
                        CASE "Interest shown in U as Cust." OF
                            1:
                                Score := Score + 4.47 - 2.23;
                            0:
                                Score := Score + 4.47;
                            3:
                                Score := Score + 4.47 - 6.7;
                        END;

                    3:
                        CASE "Interest shown in U as Cust." OF
                            1:
                                Score := Score + 6.7 - 2.23;
                            2:
                                Score := Score + 6.7 - 4.47;
                            0:
                                Score := Score + 6.7;
                        END;
                END;

            end;
        }
        field(14; "Ability to understand Ur need"; Option)
        {
            Description = 'The Staff''s Ability to understand your need';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Ability to understand Ur need" OF
                    0:
                        CASE "Ability to understand Ur need" OF
                            1:
                                Score := Score - 2.23;
                            2:
                                Score := Score - 4.47;
                            3:
                                Score := Score - 6.7;
                        END;

                    1:
                        CASE "Ability to understand Ur need" OF
                            0:
                                Score := Score + 2.23;
                            2:
                                Score := Score + 2.23 - 4.47;
                            3:
                                Score := Score + 2.23 - 6.7;
                        END;

                    2:
                        CASE "Ability to understand Ur need" OF
                            1:
                                Score := Score + 4.47 - 2.23;
                            0:
                                Score := Score + 4.47;
                            3:
                                Score := Score + 4.47 - 6.7;
                        END;

                    3:
                        CASE "Ability to understand Ur need" OF
                            1:
                                Score := Score + 6.7 - 2.23;
                            2:
                                Score := Score + 6.7 - 4.47;
                            0:
                                Score := Score + 6.7;
                        END;
                END;

            end;
        }
        field(15; "Service Delay/Extra Cost Infom"; Boolean)
        {
            Description = 'Where you Informed in advance, of any extral work cost or service delay';
            InitValue = true;

            trigger OnValidate()
            begin
                IF (xRec."Service Delay/Extra Cost Infom" = TRUE) AND ("Service Delay/Extra Cost Infom" = FALSE) THEN
                    Score := Score - 5.1;

                IF (xRec."Service Delay/Extra Cost Infom" = FALSE) AND ("Service Delay/Extra Cost Infom" = TRUE) THEN
                    Score := Score + 5.1;


            end;
        }
        field(16; "Work Completed first Time"; Boolean)
        {
            Description = 'Was the work requested completed correctly first time';
            InitValue = true;

            trigger OnValidate()
            begin
                /* IF (xRec."Work Completed first Time?" = TRUE) AND ("Work Completed first Time?" = FALSE) THEN
                   Score := Score - 6.5
                   ELSE
                   Score := Score + 6.5; */


            end;
        }
        field(17; "How Often you have return job"; Option)
        {
            Description = 'If  Work not Completed correctly, how often did you take your vehicle for dealership before the work was completed correctly?';
            OptionMembers = "1 time","2 Times","3",Times,"4 Times","5 Times"," More than 5 Times","Still Going To Return";
        }
        field(18; "Rate the Service Charge/Job"; Option)
        {
            Description = 'Bearing in mind the entire service experience, Please rate to which the extent cost charged were resonable.';
            OptionCaption = 'Excellent,Good,Fair,Poor';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Rate the Service Charge/Job" OF
                    0:
                        CASE "Rate the Service Charge/Job" OF
                            1:
                                Score := Score - 3.43;
                            2:
                                Score := Score - 6.87;
                            3:
                                Score := Score - 10.3;
                        END;

                    1:
                        CASE "Rate the Service Charge/Job" OF
                            0:
                                Score := Score + 3.43;
                            2:
                                Score := Score + 3.43 - 6.87;
                            3:
                                Score := Score + 3.43 - 10.3;
                        END;

                    2:
                        CASE "Rate the Service Charge/Job" OF
                            1:
                                Score := Score + 6.87 - 3.43;
                            0:
                                Score := Score + 6.87;
                            3:
                                Score := Score + 6.87 - 10.3;
                        END;

                    3:
                        CASE "Rate the Service Charge/Job" OF
                            1:
                                Score := Score + 10.3 - 3.43;
                            2:
                                Score := Score + 10.3 - 6.87;
                            0:
                                Score := Score + 10.3;
                        END;
                END;


            end;
        }
        field(19; "Rate Work Done / Charge Expl."; Option)
        {
            Description = 'Please rate the explanation of workdone and the cost charged on the invoice';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Rate Work Done / Charge Expl." OF
                    0:
                        CASE "Rate Work Done / Charge Expl." OF
                            1:
                                Score := Score - 2.96;
                            2:
                                Score := Score - 5.94;
                            3:
                                Score := Score - 8.9;
                        END;

                    1:
                        CASE "Rate Work Done / Charge Expl." OF
                            0:
                                Score := Score + 2.96;
                            2:
                                Score := Score + 2.96 - 5.94;
                            3:
                                Score := Score + 2.96 - 8.9;
                        END;

                    2:
                        CASE "Rate Work Done / Charge Expl." OF
                            1:
                                Score := Score + 5.94 - 2.96;
                            0:
                                Score := Score + 5.94;
                            3:
                                Score := Score + 5.94 - 8.9;
                        END;

                    3:
                        CASE "Rate Work Done / Charge Expl." OF
                            1:
                                Score := Score + 8.9 - 2.96;
                            2:
                                Score := Score + 8.9 - 5.94;
                            0:
                                Score := Score + 8.9;
                        END;
                END;


            end;
        }
        field(20; "Vehicle Read at Promise Time"; Boolean)
        {
            Description = 'Was the vehicle ready at promised time';
            InitValue = true;

            trigger OnValidate()
            begin
                /*  IF (xRec."Vehicle Read at Promise Time?" = TRUE) AND ("Vehicle Read at Promise Time?" = FALSE) THEN
                    Score := Score - 7.2
                    ELSE
                    Score := Score + 7.2;
                 */

            end;
        }
        field(21; "Any Advice on Observed Issue"; Boolean)
        {
            Description = 'Did The dealership advice you on any issue that may require attention in the future or any give and indication of next service interval';
            InitValue = true;

            trigger OnValidate()
            begin
                IF (xRec."Any Advice on Observed Issue" = TRUE) AND ("Any Advice on Observed Issue" = FALSE) THEN
                    Score := Score - 7.5
                ELSE
                    Score := Score + 7.5;


            end;
        }
        field(22; "Any follow up after service"; Boolean)
        {
            Description = 'After service did you receive any of the following from the dealership to determine your satisfaction with the service ; a telephone call, a letter or card (may have been given on collection a fax, E-mail or SMS)';
            InitValue = true;

            trigger OnValidate()
            begin
                /*  IF (xRec."Any follow up after service?" = TRUE) AND ("Any follow up after service?" = FALSE) THEN
                    Score := Score - 4.1
                    ELSE
                    Score := Score + 4.1;
                 */

            end;
        }
        field(23; "Any unresolved problem"; Boolean)
        {
            Description = 'Did you have any unresolved problem after the service';
            InitValue = true;
        }
        field(24; "Rate Willingness to resolve it"; Option)
        {
            Description = 'If any problem unresolved please rate the willingness of the dealership to sort this problem out';
            OptionMembers = Excellent,Good,Fair,Poor;

            trigger OnValidate()
            begin
                CASE xRec."Rate Willingness to resolve it" OF
                    0:
                        CASE "Rate Willingness to resolve it" OF
                            1:
                                Score := Score - 2.03;
                            2:
                                Score := Score - 4.07;
                            3:
                                Score := Score - 6.1;
                        END;

                    1:
                        CASE "Rate Willingness to resolve it" OF
                            0:
                                Score := Score + 2.03;
                            2:
                                Score := Score + 2.03 - 4.07;
                            3:
                                Score := Score + 2.03 - 6.1;
                        END;

                    2:
                        CASE "Rate Willingness to resolve it" OF
                            1:
                                Score := Score + 4.07 - 2.03;
                            0:
                                Score := Score + 4.07;
                            3:
                                Score := Score + 4.07 - 6.1;
                        END;

                    3:
                        CASE "Rate Willingness to resolve it" OF
                            1:
                                Score := Score + 6.1 - 2.03;
                            2:
                                Score := Score + 6.1 - 4.07;
                            0:
                                Score := Score + 6.1;
                        END;
                END;


            end;
        }
        field(25; "Would you recommend dealer"; Option)
        {
            Description = 'Would you recommend dealership to a friend';
            OptionCaption = 'Definitely,Probably,May be,Probably Not,Definitely Not';
            OptionMembers = Definitely,Probably,"May be","Probably Not","Definitely Not";

            trigger OnValidate()
            begin
                /* CASE xRec."Would you recommend dealer?" OF
                0 : CASE "Would you recommend dealer?" OF
                     1: Score := Score - 2.5;
                     2: Score := Score - 5.0;
                     3: Score := Score - 7.5;
                     4: Score := Score - 10;
                     END;
                
                1 : CASE "Would you recommend dealer?" OF
                     0: Score := Score + 2.5;
                     2: Score := Score + 2.5 - 5;
                     3: Score := Score + 2.5 - 7.5;
                     4: Score := Score + 2.5 - 10;
                     END;
                
                2 : CASE "Would you recommend dealer?" OF
                     1: Score := Score + 5 - 2.5;
                     0: Score := Score + 5;
                     3: Score := Score + 5 - 7.5;
                     4: Score := Score + 5 - 10;
                     END;
                
                3 : CASE "Would you recommend dealer?" OF
                     1: Score := Score + 7.5 - 2.5;
                     2: Score := Score + 7.5 - 5;
                     0: Score := Score + 7.5;
                     4: Score := Score + 7.5 - 10;
                     END;
                4 : CASE "Would you recommend dealer?" OF
                     1: Score := Score + 10 - 2.5;
                     2: Score := Score + 10 - 5;
                     0: Score := Score + 10;
                     3: Score := Score + 10 - 7.5;
                     END;
                  END; */

            end;
        }
        field(26; "Interviewer Name"; Text[50])
        {
        }
        field(27; "Date Of Interview"; Date)
        {
        }
        field(28; Score; Decimal)
        {
            InitValue = 17;
            MaxValue = 21;
            MinValue = 0;
        }
        field(29; "No. Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(30; "Customer Code"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Customer Code") THEN BEGIN
                    "Customer Name" := CustRec.Name;
                    "Customer Tel. No." := CustRec."Phone No.";
                END;
            end;
        }
        field(31; "Customer Name"; Text[50])
        {
        }
        field(32; "Contact Person Name"; Text[50])
        {
        }
        field(33; "Contact Person Tel. No."; Code[20])
        {
        }
        field(34; "Dealer Reminded you of Service"; Boolean)
        {
            Description = 'Did the Dealer contact you to remind you of your vehicle''s maintenance service or repairs';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Dealer Reminded you of Service" = FALSE THEN BEGIN
                    IF "Dealer Reminded you of Service" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Dealer Reminded you of Service" THEN
                        Score := Score - 2 + 1;
                IF "Dealer Reminded you of Service" THEN BEGIN
                    "Dealer Reminded you Score" := 1;
                    "Dealer Reminded you Value" := AH;
                END
                ELSE BEGIN
                    "Dealer Reminded you Score" := 2;
                    "Dealer Reminded you Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(35; "Apptmt Date your Desired Date"; Boolean)
        {
            Description = 'Were you able to get an appointment on the day you desired';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Apptmt Date your Desired Date" = FALSE THEN BEGIN
                    IF "Apptmt Date your Desired Date" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Apptmt Date your Desired Date" THEN
                        Score := Score - 2 + 1;
                IF "Apptmt Date your Desired Date" THEN BEGIN
                    "Apptm Date ur Desired Score" := 1;
                    "Apptm Date ur Desired Value" := AH;
                END
                ELSE BEGIN
                    "Apptm Date ur Desired Score" := 2;
                    "Apptm Date ur Desired Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(36; "Workshop easy to Locate"; Boolean)
        {
            Description = 'Was the Dealer location convenient for you';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Workshop easy to Locate" = FALSE THEN BEGIN
                    IF "Workshop easy to Locate" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Workshop easy to Locate" THEN
                        Score := Score - 2 + 1;
                IF "Workshop easy to Locate" THEN BEGIN
                    "Workshop easy Access Score" := 1;
                    "Workshop easy Access Value" := AH;
                END
                ELSE BEGIN
                    "Workshop easy Access Score" := 2;
                    "Workshop easy Access Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(37; "Was the Sevice Facility Clean"; Boolean)
        {
            Description = 'Was the service facility clean';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Was the Sevice Facility Clean" = FALSE THEN BEGIN
                    IF "Was the Sevice Facility Clean" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Was the Sevice Facility Clean" THEN
                        Score := Score - 2 + 1;
                IF "Was the Sevice Facility Clean" THEN BEGIN
                    "Service Facility Clean" := 1;
                    "Service Facility Clean Value" := AH;
                END
                ELSE BEGIN
                    "Service Facility Clean" := 2;
                    "Service Facility Clean Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(38; "SA Treat u wt Courtesy/Respect"; Boolean)
        {
            Description = 'Did the Service Advisor treat you with courtesy and respect';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."SA Treat u wt Courtesy/Respect" = FALSE THEN BEGIN
                    IF "SA Treat u wt Courtesy/Respect" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "SA Treat u wt Courtesy/Respect" THEN
                        Score := Score - 2 + 1;
                IF "SA Treat u wt Courtesy/Respect" THEN BEGIN
                    "SA Treat respectful Score" := 1;
                    "SA Treat respectful Value" := AH;
                END
                ELSE BEGIN
                    "SA Treat respectful Score" := 2;
                    "SA Treat respectful Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(39; "SA aware of Service History"; Boolean)
        {
            Description = 'Was the Service Advisor aware of your vehicle''s service history';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."SA aware of Service History" = FALSE THEN BEGIN
                    IF "SA aware of Service History" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "SA aware of Service History" THEN
                        Score := Score - 2 + 1;
                IF "SA aware of Service History" THEN BEGIN
                    "SA aware of Serv History Score" := 1;
                    "SA aware of Serv History Value" := AH;
                END
                ELSE BEGIN
                    "SA aware of Serv History Score" := 2;
                    "SA aware of Serv History Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(40; "Estimate provided b4 service"; Boolean)
        {
            Description = 'Were you provided with/told about the estimated charges (even where the service was free) before the work was performed';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Estimate provided b4 service" = FALSE THEN BEGIN
                    IF "Estimate provided b4 service" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Estimate provided b4 service" THEN
                        Score := Score - 2 + 1;
                IF "Estimate provided b4 service" THEN BEGIN
                    "Estimate Provided Score" := 1;
                    "Estimate Provided Value" := AH;
                END
                ELSE BEGIN
                    "Estimate Provided Score" := 2;
                    "Estimate Provided Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(41; "Work Completed correctly 1st T"; Boolean)
        {
            Description = 'Was the work requested completed correctly the first time';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Work Completed correctly 1st T" = FALSE THEN BEGIN
                    IF "Work Completed correctly 1st T" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Work Completed correctly 1st T" THEN
                        Score := Score - 2 + 1;
                IF "Work Completed correctly 1st T" THEN BEGIN
                    "Work Completed 1st T Score" := 1;
                    "Work Completed 1st T Value" := AH;
                END
                ELSE BEGIN
                    "Work Completed 1st T Score" := 2;
                    "Work Completed 1st T Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(42; "Vehicle Ready at Promised Time"; Boolean)
        {
            Description = 'Was your vehicle ready when promised';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Vehicle Ready at Promised Time" = FALSE THEN BEGIN
                    IF "Vehicle Ready at Promised Time" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Vehicle Ready at Promised Time" THEN
                        Score := Score - 2 + 1;
                IF "Vehicle Ready at Promised Time" THEN BEGIN
                    "Veh. Ready at Said Time Score" := 1;
                    "Veh. Ready at Said Time Value" := AH;
                END
                ELSE BEGIN
                    "Veh. Ready at Said Time Score" := 2;
                    "Veh. Ready at Said Time Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(43; "Service/Repair Cost Reasonable"; Boolean)
        {
            Description = 'Do you feel the costs charged for servicing or repairing the vehicle were reasonable';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."Service/Repair Cost Reasonable" = FALSE THEN BEGIN
                    IF "Service/Repair Cost Reasonable" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "Service/Repair Cost Reasonable" THEN
                        Score := Score - 2 + 1;
                IF "Service/Repair Cost Reasonable" THEN BEGIN
                    "Serv/Repair Cost OK Score" := 1;
                    "Serv/Repair Cost OK Value" := AH;
                END
                ELSE BEGIN
                    "Serv/Repair Cost OK Score" := 2;
                    "Serv/Repair Cost OK Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(44; "SA explained work done at  Del"; Boolean)
        {
            Description = 'When you picked up your vehicle, did the Service Advisor explain to you the actual work that was performed';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."SA explained work done at  Del" = FALSE THEN BEGIN
                    IF "SA explained work done at  Del" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "SA explained work done at  Del" THEN
                        Score := Score - 2 + 1;
                IF "SA explained work done at  Del" THEN BEGIN
                    "SA Explain Wk/done Score" := 1;
                    "SA Explain Wk/done Value" := AH;
                END
                ELSE BEGIN
                    "SA Explain Wk/done Score" := 2;
                    "SA Explain Wk/done Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(45; "SA Advised  Preventive Measure"; Boolean)
        {
            Description = 'Did the Service Advisor advise you of any issues that may require attention in future or give and indication of the next service interval';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."SA Advised  Preventive Measure" = FALSE THEN BEGIN
                    IF "SA Advised  Preventive Measure" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "SA Advised  Preventive Measure" THEN
                        Score := Score - 2 + 1;
                IF "SA Advised  Preventive Measure" THEN BEGIN
                    "SA Advised Score" := 1;
                    "SA Advised Value" := AH;
                END
                ELSE BEGIN
                    "SA Advised Score" := 2;
                    "SA Advised Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(46; "PSF Satisfaction Confirmation"; Boolean)
        {
            Description = 'Were you contacted after the service was complete to see if the work was performed to your satisfaction';

            trigger OnValidate()
            begin
                AH := 7.69230769230769;
                IF xRec."PSF Satisfaction Confirmation" = FALSE THEN BEGIN
                    IF "PSF Satisfaction Confirmation" THEN
                        Score := Score - 1 + 2;
                END ELSE
                    IF NOT "PSF Satisfaction Confirmation" THEN
                        Score := Score - 2 + 1;
                IF "PSF Satisfaction Confirmation" THEN BEGIN
                    "PSF 4 Customer Satisfaction" := 1;
                    "PSF 4 Cust Satisfaction Value" := AH;
                END
                ELSE BEGIN
                    "PSF 4 Customer Satisfaction" := 2;
                    "PSF 4 Cust Satisfaction Value" := 0;
                END;
                VALIDATE("Total Values");
            end;
        }
        field(47; "Dealer Reminded you Score"; Decimal)
        {
        }
        field(48; "Apptm Date ur Desired Score"; Decimal)
        {
        }
        field(49; "Workshop easy Access Score"; Decimal)
        {
        }
        field(50; "Service Facility Clean"; Decimal)
        {
        }
        field(51; "SA Treat respectful Score"; Decimal)
        {
        }
        field(52; "SA aware of Serv History Score"; Decimal)
        {
        }
        field(53; "Estimate Provided Score"; Decimal)
        {
        }
        field(54; "Work Completed 1st T Score"; Decimal)
        {
        }
        field(55; "Veh. Ready at Said Time Score"; Decimal)
        {
        }
        field(56; "Serv/Repair Cost OK Score"; Decimal)
        {
        }
        field(57; "SA Explain Wk/done Score"; Decimal)
        {
        }
        field(58; "SA Advised Score"; Decimal)
        {
        }
        field(59; "PSF 4 Customer Satisfaction"; Decimal)
        {
        }
        field(60; "Dealer Reminded you Value"; Decimal)
        {
        }
        field(61; "Apptm Date ur Desired Value"; Decimal)
        {
        }
        field(62; "Workshop easy Access Value"; Decimal)
        {
        }
        field(63; "Service Facility Clean Value"; Decimal)
        {
        }
        field(64; "SA Treat respectful Value"; Decimal)
        {
        }
        field(65; "SA aware of Serv History Value"; Decimal)
        {
        }
        field(66; "Estimate Provided Value"; Decimal)
        {
        }
        field(67; "Work Completed 1st T Value"; Decimal)
        {
        }
        field(68; "Veh. Ready at Said Time Value"; Decimal)
        {
        }
        field(69; "Serv/Repair Cost OK Value"; Decimal)
        {
        }
        field(70; "SA Explain Wk/done Value"; Decimal)
        {
        }
        field(71; "SA Advised Value"; Decimal)
        {
        }
        field(72; "PSF 4 Cust Satisfaction Value"; Decimal)
        {
        }
        field(73; "Total Values"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Values" := ("Dealer Reminded you Value" + "Apptm Date ur Desired Value" + "Workshop easy Access Value" +
                                   "Service Facility Clean Value" + "SA Treat respectful Value" + "SA aware of Serv History Value" +
                                   "Estimate Provided Value" + "Work Completed 1st T Value" + "Veh. Ready at Said Time Value" +
                                   "Serv/Repair Cost OK Value" + "SA Explain Wk/done Value" + "SA Advised Value" +
                                   "PSF 4 Cust Satisfaction Value");

                AJ72 := ("SA Treat respectful Value" + "SA aware of Serv History Value" + "Estimate Provided Value" +
                         "SA Explain Wk/done Value" + "SA Advised Value");

                AH72 := ("SA Treat respectful Deflt" + "SA aware of Serv History Deflt" + "Estimate Provided Deflt" +
                         "SA Explain Wk/done Deflt" + "SA Advised Deflt");
                "Customer Care Skill by SA" := (AJ72 / AH72);

                AJ73 := ("Work Completed 1st T Value" + "Veh. Ready at Said Time Value");

                AH73 := ("Work Completed 1st T Deflt" + "Veh. Ready at Said Time Deflt");
                "Fix it Right" := (AJ73 / AH73);


                "Total Values Obt" := ("Total Values" / 100);
                "Cust. Serv Skill by SA Obt" := ("Customer Care Skill by SA" / 1);
                "Fix it Right Obt" := ("Fix it Right" / 1);
            end;
        }
        field(74; "Customer Care Skill by SA"; Decimal)
        {
        }
        field(75; "Fix it Right"; Decimal)
        {
        }
        field(76; AJ72; Decimal)
        {
        }
        field(77; AH72; Decimal)
        {
        }
        field(78; AJ73; Decimal)
        {
        }
        field(79; AH73; Decimal)
        {
        }
        field(80; "Dealer Reminded you Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(81; "Apptm Date ur Desired Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(82; "Workshop easy Access Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(83; "Service Facility Clean Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(84; "SA Treat respectful Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(85; "SA aware of Serv History Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(86; "Estimate Provided Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(87; "Work Completed 1st T Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(88; "Veh. Ready at Said Time Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(89; "Serv/Repair Cost OK Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(90; "SA Explain Wk/done Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(91; "SA Advised Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(92; "PSF 4 Cust Satisfaction Deflt"; Decimal)
        {
            InitValue = 7.69230769230769;
        }
        field(93; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(94; "CSI Done"; Boolean)
        {
        }
        field(95; "Dealer Reminded you Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(96; "Apptm Date ur Desired Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(99; "Workshop easy Access Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(100; "Service Facility Clean Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(101; "SA Treat respectful Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(102; "SA aware of Serv History Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(103; "Estimate Provided Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(104; "Work Completed 1st T Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(105; "Veh. Ready at Said Time Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(106; "Serv/Repair Cost OK Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(107; "SA Explain Wk/done Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(108; "SA Advised Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(109; "PSF 4 Customer Satisf. Count"; Integer)
        {
            CalcFormula = Count("CSI Table" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                   "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(110; "Dealer Reminded you Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Dealer Reminded you Value" WHERE("CSI Done" = CONST(true),
                                                                             "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(111; "Apptm Date ur Desired Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Apptm Date ur Desired Value" WHERE("CSI Done" = CONST(true),
                                                                               "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(112; "Workshop easy Access Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Workshop easy Access Value" WHERE("CSI Done" = CONST(true),
                                                                              "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(113; "Service Facility Clean Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Service Facility Clean Value" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                                                "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(114; "SA Treat respectful Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."SA Treat respectful Value" WHERE("CSI Done" = CONST(true),
                                                                             "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(115; "SA aware of Serv History Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."SA aware of Serv History Value" WHERE("CSI Done" = CONST(true),
                                                                                  "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(116; "Estimate Provided Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Estimate Provided Value" WHERE("Date Of Interview" = FIELD("Date Filter"),
                                                                           "CSI Done" = CONST(true)));
            FieldClass = FlowField;
        }
        field(117; "Work Completed 1st T Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Work Completed 1st T Value" WHERE("CSI Done" = CONST(true),
                                                                              "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(118; "Veh. Ready at Said Time Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Veh. Ready at Said Time Value" WHERE("CSI Done" = CONST(true),
                                                                                 "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(119; "Serv/Repair Cost OK Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."Serv/Repair Cost OK Value" WHERE("CSI Done" = CONST(true),
                                                                             "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(120; "SA Explain Wk/done Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."SA Explain Wk/done Value" WHERE("CSI Done" = CONST(true),
                                                                            "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(121; "SA Advised Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."SA Advised Value" WHERE("CSI Done" = CONST(true),
                                                                    "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(122; "PSF 4 Customer Satisf. Sum"; Decimal)
        {
            CalcFormula = Sum("CSI Table"."PSF 4 Cust Satisfaction Value" WHERE("CSI Done" = CONST(true),
                                                                                 "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(123; "Max Value"; Decimal)
        {
            InitValue = 2;
            MaxValue = 2;
            MinValue = 0;
        }
        field(124; "Total Values Obt"; Decimal)
        {
        }
        field(125; "Fix it Right Obt"; Decimal)
        {
        }
        field(126; "Cust. Serv Skill by SA Obt"; Decimal)
        {
        }
        field(127; "Total Values Average"; Decimal)
        {
            CalcFormula = Average("CSI Table"."Total Values Obt" WHERE("CSI Done" = CONST(true),
                                                                        "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(128; "Fix it Right Average"; Decimal)
        {
            CalcFormula = Average("CSI Table"."Fix it Right Obt" WHERE("CSI Done" = CONST(true),
                                                                        "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(129; "Cust. Serv Skill by SA Average"; Decimal)
        {
            CalcFormula = Average("CSI Table"."Cust. Serv Skill by SA Obt" WHERE("CSI Done" = CONST(true),
                                                                                  "Date Of Interview" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "CSI Code")
        {
            Clustered = true;
        }
        key(Key2; "CSI Done")
        {
            SumIndexFields = "Dealer Reminded you Value", "Apptm Date ur Desired Value", "Workshop easy Access Value", "Service Facility Clean Value", "SA Treat respectful Value", "SA aware of Serv History Value", "Estimate Provided Value", "Work Completed 1st T Value", "Veh. Ready at Said Time Value", "Serv/Repair Cost OK Value", "SA Explain Wk/done Value", "SA Advised Value", "PSF 4 Cust Satisfaction Value", "Total Values Obt", "Fix it Right Obt", "Cust. Serv Skill by SA Obt";
        }
        key(Key3; "CSI Done", "Date Of Interview")
        {
            SumIndexFields = "Dealer Reminded you Value", "Apptm Date ur Desired Value", "Workshop easy Access Value", "Service Facility Clean Value", "SA Treat respectful Value", "SA aware of Serv History Value", "Estimate Provided Value", "Work Completed 1st T Value", "Veh. Ready at Said Time Value", "Serv/Repair Cost OK Value", "SA Explain Wk/done Value", "SA Advised Value", "PSF 4 Cust Satisfaction Value", "Total Values Obt", "Fix it Right Obt", "Cust. Serv Skill by SA Obt";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "CSI Code" = '' THEN BEGIN
            ServiceSetup.GET;
            ServiceSetup.TESTFIELD("CSI No.");
            Rec."No. Series" := ServiceSetup."CSI No.";
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            Rec."CSI Code" := NoSeriesMgt.GetNextNo("No. Series");

        END;
        AH := 7.69230769230769;
    end;

    var
        CSI: Record "CSI Table";
        ServiceSetup: Record "Service Mgt. Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JobRec: Record Job;
        CustRec: Record Customer;
        ServItem: Record "Service Item";
        AH: Decimal;
        COFRec: Record "Customer Order Table.";


    procedure AssistEdit(OldCsi: Record "CSI Table"): Boolean
    begin
        /* WITH CSI DO BEGIN
          CSI := Rec;
          ServiceSetup.GET;
          ServiceSetup.TESTFIELD("CSI No.");
          IF NoSeriesMgt.SelectSeries(ServiceSetup."CSI No.",OldCsi."No. Series","No. Series") THEN BEGIN
            ServiceSetup.GET;
            ServiceSetup.TESTFIELD("CSI No.");
            NoSeriesMgt.SetSeries("CSI Code");
            Rec := CSI;
            EXIT(TRUE);
          END;
        END; */
    end;
}

