table 50052 "Complain Table"
{
    Caption = 'Complain Table';
    DataCaptionFields = "Complain Code", "Date of Complaint";

    fields
    {
        field(1; "Complain Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Complain Code" <> xRec."Complain Code" THEN BEGIN
                    ServMgtSetup.GET;
                    NoSeriesMgt.TestManual(ServMgtSetup."Complain Nos");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Date of Complaint"; Date)
        {
        }
        field(3; "Vendor Code"; Code[20])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                IF Vendor.GET("Vendor Code") THEN
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(4; "Vendor Name"; Text[50])
        {
        }
        field(5; "Purchase Date"; Date)
        {
        }
        field(6; "Model Category"; Option)
        {
            OptionCaption = ' ,New,Used,Lease';
            OptionMembers = " ",New,Used,Lease;
        }
        field(7; Complaint; Text[150])
        {
        }
        field(8; Complaint1; Text[150])
        {
        }
        field(9; "Date of Request to TNL"; Date)
        {
        }
        field(10; "Date of TNL Reply to Dealer"; Date)
        {
        }
        field(11; "Vehicle Category"; Option)
        {
            OptionCaption = ' ,New Vehicle,Warranty,Goodwill,Extended Warranty,Actual Reasons';
            OptionMembers = " ","New Vehicle",Warranty,Goodwill,"Extended Warranty","Actual Reasons";
        }
        field(12; "Customer's Satisfaction"; Option)
        {
            OptionCaption = ' ,Yes,No,Unclear';
            OptionMembers = " ",Yes,No,Unclear;
        }
        field(13; Reason; Text[100])
        {
        }
        field(14; "Date Closed"; Date)
        {
        }
        field(15; "Operation Area Problem"; Text[30])
        {
        }
        field(16; "Preventive Measures"; Text[100])
        {
        }
        field(17; "Preventive Measures 2"; Text[100])
        {
        }
        field(18; "COF No."; Code[20])
        {
            TableRelation = "Service Header"."No.";

            trigger OnValidate()
            begin
                IF COFRec.GET("COF No.") THEN BEGIN
                    "Customer No." := COFRec."Customer No.";
                    "Customer Name" := COFRec."Customer Name";
                    "Customer Address" := COFRec.Address;
                    "Customer Address1" := COFRec.Address2;
                    "Chassis No." := COFRec."Frame No./VIN";
                    "Engine No." := COFRec."(Engine No)";
                    "Vehicle Registration No." := COFRec."Vehicle Registration No.";
                    "Model No." := COFRec."Model No";
                    "Model Name" := COFRec."Model Name";
                    /* "Model Year" := COFRec."Model Year";
                    "Job Details" := COPYSTR(COFRec."Job Details", 1, MAXSTRLEN("Job Details"));
                    "Job Details1" := COPYSTR(COFRec."Additional Job Details", 1, MAXSTRLEN("Job Details1")); */
                    "COF Date" := COFRec."Customer Order Form Date";
                END;

                /*  IF COFRec.GET("COF No.") THEN
                     "Repeat Repair" := COFRec."Repeat Repair";
                 VALIDATE("Vehicle Registration No."); */
            end;
        }
        field(19; "Vehicle Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE("Customer No." = FIELD("Customer No."));

            trigger OnValidate()
            begin
                IF ServiceItem.GET("Vehicle Registration No.") THEN BEGIN
                    "Model Name" := ServiceItem.Make;
                    "Model No." := ServiceItem."Model No.";
                    "Model Year" := ServiceItem."Model Year";
                    "Registered Date" := ServiceItem."Sales Date";
                    "Chassis No." := ServiceItem."Chasis No.";
                    "Engine No." := ServiceItem."Engine No.";
                    VALIDATE("Vendor Code", ServiceItem."Vendor No.");
                    "Purchase Date" := ServiceItem."Sales Date";
                END;
            end;
        }
        field(20; "Job Details"; Text[150])
        {
        }
        field(21; "Job Details1"; Text[100])
        {
        }
        field(22; "COF Date"; Date)
        {
        }
        field(23; "Model No."; Code[20])
        {
        }
        field(24; "Model Name"; Text[30])
        {
        }
        field(25; "Model Year"; Integer)
        {
        }
        field(26; "Registered Date"; Date)
        {
        }
        field(27; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(28; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF Customer.GET("Customer No.") THEN
                    "Customer Name" := Customer.Name;
                "Customer Address" := Customer.Address;
                "Customer Address1" := Customer."Address 2";
            end;
        }
        field(29; "Customer Name"; Text[50])
        {
        }
        field(30; "Customer Address"; Text[50])
        {
        }
        field(31; "Customer Address1"; Text[50])
        {
        }
        field(32; "Chassis No."; Code[20])
        {
        }
        field(33; "Engine No."; Code[20])
        {
        }
        field(34; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(35; "Start Time"; Time)
        {
        }
        field(36; "End Time"; Time)
        {
        }
        field(37; "Job Duration"; Decimal)
        {
        }
        field(38; "Start Date"; Date)
        {
        }
        field(39; "End Date"; Date)
        {
        }
        field(40; "Corrective Measures"; Text[100])
        {
        }
        field(41; "Corrective Measures 2"; Text[100])
        {
        }
        field(42; "When Resolved"; DateTime)
        {
        }
        field(43; "Amount Expected on Job"; Decimal)
        {
        }
        field(44; "Fault Discovered"; Text[100])
        {
        }
        field(45; "Last Job/Service Done"; Code[20])
        {
        }
        field(46; "Present Complain"; Text[100])
        {
        }
        field(47; "Present Complain 2"; Text[100])
        {
        }
        field(48; "Repeat Repair"; Boolean)
        {
            Editable = false;
        }
        field(49; Resolved; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Complain Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Complain Code" = '' THEN BEGIN
            ServMgtSetup.GET;
            ServMgtSetup.TESTFIELD("Complain Nos");
            Rec."No. Series" := ServMgtSetup."Complain Nos";
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            Rec."Complain Code" := NoSeriesMgt.GetNextNo("No. Series");

        END;
        "Date of Complaint" := TODAY;
    end;

    var
        ServMgtSetup: Record "Service Mgt. Setup";
        CompRec: Record "Complain Table";
        NoSeriesMgt: Codeunit "No. Series";
        Customer: Record Customer;
        ServiceItem: Record "Service Item";
        Vendor: Record Vendor;
        COFRec: Record "Customer Order Table.";

    procedure AssistEdit(OldComplain: Record "Complain Table"): Boolean
    begin
        CompRec := Rec;
        ServMgtSetup.GET;
        ServMgtSetup.TESTFIELD("Complain Nos");
        IF NoSeriesMgt.LookupRelatedNoSeries(ServMgtSetup."Complain Nos", OldComplain."No. Series", CompRec."No. Series") THEN BEGIN
            CompRec."Complain Code" := NoSeriesMgt.GetNextNo(CompRec."No. Series");
            Rec := CompRec;
            EXIT(TRUE);
        END;
    end;
}

