table 60000 "EARQ Header"
{

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(2; "Registration No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF ServiceItem.GET("Registration No.") THEN BEGIN
                    VIN := ServiceItem."Chasis No.";
                    "Model Name" := ServiceItem.Make;
                    "Body Color" := ServiceItem.Colour;
                    "Model Year" := ServiceItem."Model Year";
                END;
            end;
        }
        field(3; VIN; Code[20])
        {
        }
        field(4; "Model Name"; Text[30])
        {
        }
        field(5; "Body Color"; Text[30])
        {
        }
        field(6; "Model Year"; Integer)
        {
        }
        field(7; "SC/SSC Information"; Text[70])
        {
        }
        field(8; "Insurance Co. Contacted"; Boolean)
        {
        }
        field(9; "Insurance Company"; Text[30])
        {
        }
        field(10; "Policy Holder"; Text[30])
        {
        }
        field(11; "Policy Type"; Text[30])
        {
        }
        field(12; "Policy No."; Code[10])
        {
        }
        field(13; "Policy Expiry"; Date)
        {
        }
        field(14; "Insured Amount"; Decimal)
        {
        }
        field(15; Excess; Decimal)
        {
        }
        field(16; "Customer No."; Code[20])
        {
        }
        field(17; "Customer Name"; Text[70])
        {
        }
        field(18; Address; Text[70])
        {
        }
        field(19; "Telephone No."; Code[11])
        {
        }
        field(20; "Mobile No."; Code[11])
        {
        }
        field(21; Email; Text[30])
        {
        }
        field(22; "Date of Initial Contact"; Date)
        {
        }
        field(23; "Staff Name"; Text[30])
        {
        }
        field(24; "Injuries Sustained"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(25; "Injury Details"; Text[100])
        {
        }
        field(26; "Damaged Area"; Text[100])
        {
        }
        field(27; "Object"; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(28; Vehicle; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(29; Person; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(30; Other; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(31; "Accident Details"; Text[150])
        {
        }
        field(32; "Area to be Repaired"; Text[70])
        {
        }
        field(33; "Payment Source"; Option)
        {
            OptionCaption = 'Customer Paying,Insurance,Both Customer paying and Insurance';
            OptionMembers = "Customer Paying",Insurance,"Both Customer paying and Insurance";
        }
        field(34; "Scheduled Visit Date"; Date)
        {
        }
        field(35; "Scheduled Visit Time"; Time)
        {
        }
        field(36; Drivable; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(37; "Tow Truck Required"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(38; "Courtesy Car Required"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(39; "Vehicle Location"; Text[30])
        {
        }
        field(40; "Tow Truck Date"; Date)
        {
        }
        field(41; "Tow Truck Time"; Time)
        {
        }
        field(42; "Courtesy Car SD"; Date)
        {
            Description = 'Start Date';
        }
        field(43; "Courtesy Car ED"; Date)
        {
            Description = 'End Date';
        }
        field(44; "Explanation of Process"; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(45; "Explanation of Items"; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(46; "Reception Date"; Date)
        {
        }
        field(47; "Reception Time"; Time)
        {
        }
        field(48; "Staff No."; Code[20])
        {
        }
        field(49; "Staff Name2"; Text[50])
        {
            Description = 'Reception Staff';
        }
        field(50; Odometer; Decimal)
        {
        }
        field(51; "Courtesy Item Installed"; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(52; "Valuables Removed"; Option)
        {
            OptionCaption = ' ,Yes';
            OptionMembers = " ",Yes;
        }
        field(53; "Scheduled Completion Date"; Date)
        {
        }
        field(54; "Scheduled Completion Time"; Time)
        {
        }
        field(55; "Nature of Repair"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Towing Service Required"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(57; "Other Requests"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "General Repair Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Booking Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                IF "Booking Date" <> 0D THEN BEGIN
                    "Booking Time" := TIME;
                    "Staff Name" := USERID;
                END;
            end;
        }
        field(60; "Booking Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(61; "Checked In"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Checked In By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Checked In Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Checked In Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Pickup Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Pickup Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(67; Picture1; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(68; Picture2; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(69; Picture3; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(70; Picture4; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(71; Right; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(72; Left; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(73; Front; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(74; Rear; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(75; Top; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Received In"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(77; "Body Work Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(78; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Appointment Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Confirmed Appointment,Received Appointment,Reception,Estimation,Awaiting Estimate Approval,Estimate Approved';
            OptionMembers = " ","Confirmed Appointment","Received Appointment",Reception,Estimation,"Awaiting Estimate Approval","Estimate Approved";

            trigger OnValidate()
            begin
                /*IF "Appointment Status" = "Appointment Status"::"Estimate Approved" THEN BEGIN
                  RepairOrder.INIT;
                  RepairOrder.COPY(Rec,FALSE);
                END;
                */

            end;
        }
        field(80; "BP Amount"; Decimal)
        {
            CalcFormula = Sum("EARQ Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                               "Job Type" = FILTER(BP)));
            FieldClass = FlowField;
        }
        field(81; "GR Amount"; Decimal)
        {
            CalcFormula = Sum("EARQ Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                               "Job Type" = FILTER(GR)));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(82; "VAT Amount"; Decimal)
        {
            CalcFormula = Sum("EARQ Line".VAT WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(83; "Expected Completion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Towing Address"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(85; "Total Estimate"; Decimal)
        {
            CalcFormula = Sum("EARQ Line"."Amount Inc. VAT" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(86; "Approve Estimate"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approve,Contact Service Adviser';
            OptionMembers = Approve,"Contact Service Adviser";
        }
        field(87; "Estimate Approved"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Estimate Approved" = TRUE THEN
                    "Appointment Status" := "Appointment Status"::"Estimate Approved";
            end;
        }
        field(88; "Amount Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(89; "Payment Ref."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "RO No."; Code[10])
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
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Appointment BP Nos.");
            "No. Series" := SalesSetup."Appointment BP Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        "Booking Date" := TODAY;
        "Booking Time" := TIME;
    end;

    var
        ServiceItem: Record "Service Item";
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RepairOrder: Record "Repair Order";
        RepairOrderLine: Record "Repair Order Line";
}

