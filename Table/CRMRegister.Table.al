table 70011 "CRM Register"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;
        }
        field(2; Date; Date)
        {
            Editable = false;
        }
        field(3; "Date Matter Occured"; Date)
        {
        }
        field(4; "Nature of Complain"; Option)
        {
            OptionCaption = 'Serious,general';
            OptionMembers = Serious,general;
        }
        field(5; S; Code[10])
        {
        }
        field(6; "Customer Name"; Text[100])
        {
        }
        field(7; "Customer Phone"; Code[20])
        {
        }
        field(8; "Customer Email"; Text[30])
        {
        }
        field(9; "Company Name"; Text[30])
        {
        }
        field(10; Vin; Code[20])
        {
        }
        field(11; "Registration No"; Code[10])
        {
        }
        field(12; "Model Code"; Code[10])
        {
        }
        field(13; "Registration Date"; Date)
        {
        }
        field(14; "Date of delivery"; Date)
        {
        }
        field(15; "Date of Purchase"; Date)
        {
        }
        field(16; "Due Date of delivery"; Date)
        {
        }
        field(17; Milage; Code[10])
        {
        }
        field(18; "Production date"; Date)
        {
        }
        field(19; "Mode of Contact"; Option)
        {
            OptionCaption = ',Email,Phone,twitter,web';
            OptionMembers = ,Email,Phone,twitter,web;
        }
        field(20; "Type of complaint"; Option)
        {
            OptionCaption = ',Quality,Service,Sales,Others';
            OptionMembers = ,Quality,Service,Sales,Others;
        }
        field(21; "Complaint Tittle"; Text[200])
        {
        }
        field(22; Priority; Option)
        {
            OptionCaption = ',High,Medium,Low';
            OptionMembers = ,High,Medium,Low;
        }
        field(23; "Resolution Type"; Option)
        {
            OptionCaption = ',Problem Solved,Information provided';
            OptionMembers = ,"Problem Solved","Information provided";
        }
        field(24; "Resolution Details"; Text[250])
        {
        }
        field(25; Remark; Text[250])
        {
        }
        field(26; "Date of Resolution"; Date)
        {
        }
        field(27; "User ID"; Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF UserSetup.GET("User ID") THEN
                    "User name" := UserSetup.Name;
            end;
        }
        field(28; "User name"; Text[100])
        {
            Editable = false;
        }
        field(29; "User ID Resolution"; Code[30])
        {
            TableRelation = "Head of Department"."Head of Department" WHERE("Department Code" = FIELD("Department Code"));

            trigger OnValidate()
            begin
                IF UserSetup.GET("User ID Resolution") THEN
                    "User Name Resolution" := UserSetup.Name;
            end;
        }
        field(30; "User Name Resolution"; Text[100])
        {
        }
        field(31; "User ID Escalate"; Code[30])
        {
            TableRelation = "Head of Department"."Head of Department" WHERE("Department Code" = FIELD("Department Code"));

            trigger OnValidate()
            begin
                IF UserSetup.GET("User ID Escalate") THEN
                    "User Name Escalate" := UserSetup.Name;
            end;
        }
        field(32; "User Name Escalate"; Text[100])
        {
        }
        field(33; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(34; "Department Code"; Code[40])
        {
        }
        field(35; "Escalate Visible"; Boolean)
        {
        }
        field(36; "Resolution Visible"; Boolean)
        {
        }
        field(37; Status; Option)
        {
            OptionCaption = ',Pending,Resolved';
            OptionMembers = ,Pending,Resolved;
        }
        field(38; "Dealer's Name"; Text[30])
        {
        }
        field(39; "Type of Call"; Option)
        {
            OptionMembers = ,Complain,Enquiry,Request;

            trigger OnValidate()
            begin
                IF "Type of Call" = "Type of Call"::Enquiry THEN
                    Enquiry := TRUE ELSE
                    Enquiry := FALSE;

                IF "Type of Call" = "Type of Call"::Complain THEN
                    Complaint := TRUE ELSE
                    Complaint := FALSE;
            end;
        }
        field(40; "Dealer's No"; Code[10])
        {
            TableRelation = Customer."No." WHERE("No." = FILTER('TDV*|TDP*'));

            trigger OnValidate()
            begin
                IF Custrec.GET("Dealer's No") THEN
                    "Dealer's Name" := Custrec.Name;
            end;
        }
        field(41; "Enquiry Type"; Option)
        {
            OptionCaption = ',Price of Vehicle,Price of Parts,Dealer''s Service Center,Product,Others,Lease/Hire purchase ';
            OptionMembers = ,"Price of Vehicle","Price of Parts","Dealer's Service Center",Product,Others,"Lease/Hire purchase ";
        }
        field(42; "Enguiry Detail"; Text[250])
        {
        }
        field(43; Enquiry; Boolean)
        {
        }
        field(44; Complaint; Boolean)
        {
        }
        field(45; "Action Taken Enquiry"; Text[250])
        {
        }
        field(46; Location; Option)
        {
            OptionCaption = ',Abia, Abuja,Adamawa, Akwa Ibom, Anambra, Bauchi, Bayelsa, Benue';
            OptionMembers = ,Abia," Abuja",Adamawa," Akwa Ibom"," Anambra"," Bauchi"," Bayelsa"," Benue";
        }
        field(47; "Model Classification"; Option)
        {
            OptionCaption = ',Vehicle Sales,Part Sales,Service,Others';
            OptionMembers = ,"Vehicle Sales","Part Sales",Service,Others;
        }
        field(48; "Classification of Complaint"; Option)
        {
            OptionCaption = ',General,Serious';
            OptionMembers = ,General,Serious;
        }
        field(49; "Action Taken Compliant"; Text[250])
        {
        }
        field(50; City; Text[50])
        {
        }
        field(51; "Escalate Send"; Boolean)
        {
        }
        field(52; Resolution; Boolean)
        {
        }
        field(53; "Complaint Details"; Text[250])
        {
        }
        field(54; "Dealer's Location"; Option)
        {
            OptionCaption = ',Abia, Abuja,Adamawa, Akwa Ibom, Anambra, Bauchi, Bayelsa, Benue';
            OptionMembers = ,Abia," Abuja",Adamawa," Akwa Ibom"," Anambra"," Bauchi"," Bayelsa"," Benue";
        }
        field(55; Title; Option)
        {
            OptionCaption = ',Mr,Mrs,Miss';
            OptionMembers = ,Mr,Mrs,Miss;
        }
        field(56; "Mode Type"; Option)
        {
            OptionCaption = ' ,New,Pre-owned';
            OptionMembers = " ",New,"Pre-owned";
        }
        field(57; "Request Type"; Option)
        {
            OptionCaption = ',PDI,Price Quotation';
            OptionMembers = ,PDI,"Price Quotation";
        }
        field(58; "Action Taken Request"; Text[250])
        {
        }
        field(59; "Request Detail"; Text[250])
        {
        }
        field(60; "Enquiry Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Vin)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        IF "No." = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD(PurchSetup."Complaint No");
            Rec."No. Series" := PurchSetup."Complaint No";
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            Rec."No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        UserSetup.GET(USERID);
        Date := TODAY;
        "User ID" := UserSetup."User ID";
        "User name" := UserSetup.Name;
        "Department Code" := UserSetup.Department;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        ToAddresses: Text;
        CcAddresses: Text[200];
        BccAddresses: Text[100];
        Subject: Text[70];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        VisibleEscalate: Boolean;
        VisibleResolution: Boolean;
        Custrec: Record Customer;
        ItemLedger: Record "Item Ledger Entry";
        //legercard: Page "50122";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ItemRec: Record Item;
        VisbleEnquiry: Boolean;
        VisibleComplaint: Boolean;
}

