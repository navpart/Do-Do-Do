table 50142 "Job instruction Header"
{

    fields
    {
        field(1; "Job Instruction No."; Code[10])
        {

            trigger OnValidate()
            begin

                IF "Job Instruction No." <> xRec."Job Instruction No." THEN BEGIN
                    SalesSetup.GET;
                    NoSeriesMgt.TestManual(SalesSetup."Job Instruction No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Customer Order Form No."; Code[10])
        {
        }
        field(3; Date; Date)
        {
        }
        field(4; "Vehicle Registered Date"; Date)
        {
        }
        field(5; SA; Code[20])
        {
        }
        field(6; "Job Type"; Code[20])
        {
            TableRelation = "CSI Table"."CSI Code";

            trigger OnValidate()
            begin

                IF FaultRec.GET("Job Type") THEN
                    "Job Type2" := FaultRec."Dealer Code";
            end;
        }
        field(7; "Car Wash"; Option)
        {
            OptionCaption = 'Needed,Unneeded';
            OptionMembers = Needed,Unneeded;
        }
        field(8; "Replaced Parts Keep"; Boolean)
        {
        }
        field(9; "Key Assigned No."; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; "Stall No."; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(11; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(12; "Customer Name"; Text[30])
        {
        }
        field(13; "Customer Name2"; Text[30])
        {
        }
        field(14; "Model No."; Code[20])
        {
        }
        field(15; "Model Name"; Text[30])
        {
        }
        field(16; "Vehicle Registration No."; Code[10])
        {
        }
        field(17; Model; Code[20])
        {
        }
        field(18; "Frame No./VIN"; Code[20])
        {
        }
        field(19; "(Engine No)"; Code[20])
        {
        }
        field(20; "Contact Telephone No."; Text[30])
        {
        }
        field(21; "Contact Telephone No. Type"; Option)
        {
            OptionCaption = 'Home,Business,Mobile';
            OptionMembers = Home,Business,Mobile;
        }
        field(22; "E-mail"; Text[80])
        {
        }
        field(23; "EC Date"; Date)
        {
            Description = 'EC means Estimation Completion';
        }
        field(24; "EC Time"; Time)
        {
            Description = 'EC means Estimation Completion';
        }
        field(25; "EC Delivery Date"; Date)
        {
            Description = 'EC means Estimation Completion';
        }
        field(26; "EC Delivery Time"; Time)
        {
            Description = 'EC means Estimation Completion';
        }
        field(27; "Job Details / Replaced Parts"; Text[50])
        {
        }
        field(28; "Part No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin

                IF ItemRec.GET("Part No.") THEN
                    "Parts Desciption" := ItemRec.Description;
            end;
        }
        field(29; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(30; Results; Option)
        {
            OptionCaption = ' ,Inspected,Changed';
            OptionMembers = " ",Inspected,Changed;
        }
        field(31; "Change of Delivery Time"; Time)
        {
        }
        field(32; "Necessary Part No."; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(33; Stock; Boolean)
        {
        }
        field(34; ETA; Time)
        {
            Description = 'ETA means Expected Time of Delivery';
        }
        field(35; EDA; Date)
        {
            Description = 'EDA means Expected Date of Delivery';
        }
        field(36; "Cus C Date"; Date)
        {
            Description = 'CC means Customer Contact';
        }
        field(37; "Cus C Time"; Time)
        {
            Description = 'CC means Customer Contact';
        }
        field(38; "Cus C Staff Name"; Code[20])
        {
        }
        field(39; "Cmp C Date"; Date)
        {
            Description = 'Cmp C means Completion Changed';
        }
        field(40; "Cmp C Time"; Time)
        {
            Description = 'Cmp C means Completion Changed';
        }
        field(41; "Del C Date"; Date)
        {
            Description = 'Del C means Delivery Changed';
        }
        field(42; "Del C Time"; Time)
        {
            Description = 'Del C means Delivery Changed';
        }
        field(43; "Job Start Date"; Date)
        {
        }
        field(44; "Job Start Time"; Time)
        {
        }
        field(45; "Job C Date"; Date)
        {
            Description = 'Job C means Job Completion';
        }
        field(46; "Job C Time"; Time)
        {
            Description = 'Job C means Job Completion';
        }
        field(47; "Actual Hours Clocked"; Time)
        {
        }
        field(48; "Technician Name"; Code[10])
        {
        }
        field(49; "QC Staff name"; Code[10])
        {
            Description = 'QC means Quality Control';
        }
        field(50; "Other Findings/Advice"; Text[50])
        {
        }
        field(51; Memo; Text[50])
        {
        }
        field(52; Cleanliness; Boolean)
        {
        }
        field(53; "Cleanliness Type"; Option)
        {
            OptionCaption = ' ,Exterior,Interior';
            OptionMembers = " ",Exterior,Interior;
        }
        field(54; Cleanliness2; Boolean)
        {
        }
        field(55; "Courtesy Items Removal"; Boolean)
        {
        }
        field(56; "Courtesy Items Removal2"; Boolean)
        {
        }
        field(57; "Outer Minor P / Seat P"; Boolean)
        {
            Description = 'P means Position';
        }
        field(58; "Outer Minor P / Seat P2"; Boolean)
        {
            Description = 'P means Position';
        }
        field(59; "Clock Adj / Radio Setting"; Boolean)
        {
            Description = 'Adj means Adjustment';
        }
        field(60; "Clock Adj / Radio Setting2"; Boolean)
        {
            Description = 'Adj means Adjustment';
        }
        field(61; "Pre-d C Staff Name"; Code[10])
        {
            Description = 'Pre-d means Pre-delivery Cofirmation';
        }
        field(62; "Pre-d C Confirmed by"; Code[10])
        {
            Description = 'Pre-d means Pre-delivery Cofirmation';
        }
        field(63; "P.S.F.U. (Plan) Date"; Date)
        {
        }
        field(64; "P.S.F.U. (Plan) Time"; Time)
        {
        }
        field(65; Other; Text[30])
        {
        }
        field(66; "P.S.F.U. (Actual) Date"; Date)
        {
        }
        field(67; "P.S.F.U. (Actual) Time"; Time)
        {
        }
        field(68; "Customer Type"; Option)
        {
            OptionCaption = 'Owner,Family,Other';
            OptionMembers = Owner,Family,Other;
        }
        field(69; "If Other Cus Type"; Text[30])
        {
        }
        field(70; "Fixed"; Boolean)
        {
            Description = 'P.S.F.U. (GJ)';
        }
        field(71; "Followup Status"; Boolean)
        {
            Description = 'P.S.F.U. (GJ)';
        }
        field(72; "FollowupAgain Date"; Date)
        {
            Description = 'P.S.F.U. (GJ)';
        }
        field(73; "FollowupAgain Time"; Time)
        {
            Description = 'P.S.F.U. (GJ)';
        }
        field(74; "Not Fixed"; Boolean)
        {
            Description = 'P.S.F.U. (GJ)';
        }
        field(75; "Appointment Date for RR"; Date)
        {
            Description = 'RR means Repeate Repair';
        }
        field(76; "Appointment Time for RR"; Time)
        {
            Description = 'RR means Repeate Repair';
        }
        field(77; "Job CN Date"; Date)
        {
            Description = 'Job Completion Notification';
        }
        field(78; "Job CN Time"; Time)
        {
            Description = 'Job Completion Notification';
        }
        field(79; "Job CN Staff Name"; Code[10])
        {
            Description = 'Job Completion Notification';
        }
        field(80; "Job Details Explanation"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(81; "Free Explanation"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(82; "Results Confirmation w / Cust."; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(83; "Walk-around Check"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(84; "P.S.F.U. (Plan)"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(85; "Level-up"; Boolean)
        {
            Description = 'Job Results Explanation';
        }
        field(86; "JRE Staff Name"; Code[10])
        {
            Description = 'Job Results Explanation';
        }
        field(87; "Delivery Date"; Date)
        {
        }
        field(88; "Delivery Time"; Time)
        {
        }
        field(89; "Delivery Customer"; Option)
        {
            OptionCaption = 'Owner,Family,Other';
            OptionMembers = Owner,Family,Other;
        }
        field(90; "If Other Customer"; Text[30])
        {
        }
        field(91; "Delivery Staff Name"; Code[10])
        {
        }
        field(92; "P.S.F.U. Staff Name"; Code[10])
        {
        }
        field(93; "P.S.F.U. Confirmed by"; Code[10])
        {
        }
        field(94; "Job Type2"; Text[50])
        {
        }
        field(95; "Parts Desciption"; Text[50])
        {
        }
        field(96; "Job Category"; Option)
        {
            OptionCaption = 'Additional Jobs,Job Stoppage,Other';
            OptionMembers = "Additional Jobs","Job Stoppage",Other;
        }
        field(97; "If Other Job Category"; Text[30])
        {
        }
        field(98; Fixed2; Boolean)
        {
        }
        field(99; "Not Fixed2"; Boolean)
        {
        }
        field(100; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Job Instruction No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FaultRec: Record "CSI Table";
        ItemRec: Record Item;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JobInstRec: Record "Job instruction Header";


    procedure AssistEdit("OldJobInst.": Record "Job instruction Header"): Boolean
    var
        JobInstRec: Record "Job instruction Header";
    begin

        /*  WITH JobInstRec DO BEGIN
           JobInstRec := Rec;
           SalesSetup.GET;
           SalesSetup.TESTFIELD("Job Instruction No.");
           IF NoSeriesMgt.SelectSeries(SalesSetup."Job Instruction No.","OldJobInst."."No. Series","No. Series") THEN BEGIN
             SalesSetup.GET;
             SalesSetup.TESTFIELD("Job Instruction No.");
             NoSeriesMgt.SetSeries("Job Instruction No.");
             Rec := JobInstRec;
             EXIT(TRUE);
           END;
         END; */
    end;
}

