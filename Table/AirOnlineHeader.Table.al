table 70022 "Air Online Header"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;
        }
        field(2; "Requester Code"; Code[50])
        {
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Requester Name"; Text[50])
        {
            Editable = false;
        }
        field(4; "Department Code"; Code[10])
        {
            Editable = false;
        }
        field(5; "Requester Department"; Text[30])
        {
            Editable = false;
        }
        field(6; Date; Date)
        {
            Editable = false;
        }
        field(7; "Supplier's Address"; Text[50])
        {
            Editable = false;
        }
        field(8; "Supplier's Name"; Text[30])
        {
            Editable = false;
            NotBlank = false;
        }
        field(9; "Profoma Invoice No:"; Code[10])
        {
            NotBlank = false;
        }
        field(10; "Port of Loading"; Text[50])
        {
        }
        field(11; "Total Invoice Value"; Decimal)
        {
            CalcFormula = Sum("Air Online Order Line"."Amount (FCY)" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(12; "Port Of Discharge/Dest."; Text[50])
        {
        }
        field(13; "Agreed Payment Term"; Text[50])
        {
        }
        field(14; Approved1; Boolean)
        {
        }
        field(15; Approved2; Boolean)
        {
        }
        field(16; "On-Hold1"; Boolean)
        {
        }
        field(17; "On-Hold2"; Boolean)
        {
        }
        field(18; Rejected1; Boolean)
        {
        }
        field(19; Rejected2; Boolean)
        {
            Editable = false;
        }
        field(20; Comment1; Text[70])
        {
        }
        field(21; Comment2; Text[70])
        {
        }
        field(22; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(23; "User ID"; Code[50])
        {
        }
        field(24; "Send To"; Code[30])
        {
            NotBlank = true;
            TableRelation = "Head of Department"."Head of Department" WHERE("Department Code" = FILTER('05PARTS'));
        }
        field(25; Send; Boolean)
        {

            trigger OnValidate()
            begin
                IF Send THEN
                    IF NOT CONFIRM('Are you sure you want to send for approval?', FALSE) THEN
                        Send := FALSE
                    ELSE BEGIN

                        /* CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";*/

                        UserSetup2.GET(USERID);
                        "Sent By" := UserSetup2."User ID";
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        TimeDate1 := CURRENTDATETIME;

                        PurchSetup.GET;
                        ToAddresses := 'ravinder@toyotanigeria.com';
                        CcAddresses := 'oshunniyi@toyotanigeria.com';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(Text001, "No.");
                        CreateEmailBody("No.", Text003, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        HoDPartApproval := TRUE;
                    END;
            end;
        }
        field(26; "Sent By"; Code[50])
        {
        }
        field(27; Approved3; Boolean)
        {
        }
        field(28; Rejected3; Boolean)
        {
        }
        field(29; "On-Hold3"; Boolean)
        {
        }
        field(30; Comment3; Text[70])
        {
        }
        field(31; "Head of Department"; Option)
        {
            Description = 'HOD';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                TESTFIELD(Send, TRUE);
                TESTFIELD("Send To", USERID);
                IF "Head of Department" = "Head of Department"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                        "Head of Department" := AirOnlineHeader."Head of Department"::" "
                    ELSE BEGIN

                        /* CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address"; */

                        ToAddresses := 'brano@toyotanigeria.com';
                        CcAddresses := 'olamide@toyotanigeria.com';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(Text001, "No.");
                        SendersName := UserSetup4.Initials;
                        "Name HOD" := UserSetup4.Name;

                        TimeDate2 := CURRENTDATETIME;

                        UserSetup4.GET(USERID);
                        SenderAddress := UserSetup4."E-Mail";

                        Subject := STRSUBSTNO(Text001, "No.");
                        CreateEmailBody("No.", Text003, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');



                        ComplianceCheck := TRUE;
                    END;

                IF "Head of Department" = "Head of Department"::"On-hold" THEN
                    IF NOT CONFIRM('Are you sure you want place this order on-hold?', FALSE) THEN
                        "Head of Department" := AirOnlineHeader."Head of Department"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name HOD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate2 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text014, "No.");
                        CreateEmailBody("No.", Text009, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');



                    END;

                IF "Head of Department" = "Head of Department"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                        "Head of Department" := AirOnlineHeader."Head of Department"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name HOD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate2 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text015, "No.");
                        CreateEmailBody("No.", Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        Rejected1 := TRUE;
                    END;
            end;
        }
        field(32; "Name HOD"; Text[50])
        {
            Description = 'HOD Name';
            Editable = false;
        }
        field(33; "Head of Audit"; Option)
        {
            Description = 'HOD Audit';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                IF Send = FALSE THEN
                    ERROR('The request has not been send for Audit Approval');

                TESTFIELD("Head of Department", "Head of Department"::Approved);


                IF ("Head of Audit" = "Head of Audit"::Approved) THEN
                    IF NOT CONFIRM('Are you sure you want to Approve this?', FALSE) THEN
                        "Head of Audit" := AirOnlineHeader."Head of Audit"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        IF (VendAmt <= 1500) THEN BEGIN
                            ToAddresses := 'bunmi@toyotanigeria.com';
                            Addressee := 'OAO,';
                            GMapproval := TRUE;
                        END;

                        IF (VendAmt > 1500) THEN BEGIN
                            ToAddresses := 'dynamics@toyotanigeria.com';
                            Addressee := 'MD,';
                            MDapproval := TRUE;
                        END;

                        Subject := STRSUBSTNO(Text001, "No.");
                        CreateEmailBody("No.", Text003, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                    END;

                IF ("Head of Audit" = "Head of Audit"::"On-hold") THEN
                    IF NOT CONFIRM('Are you sure you want place this order ON_HOLD?', FALSE) THEN
                        "Head of Audit" := AirOnlineHeader."Head of Audit"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("User ID");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text014, "No.");
                        CreateEmailBody("No.", Text009, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                    END;

                IF ("Head of Audit" = "Head of Audit"::Rejected) THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT this?', FALSE) THEN
                        "Head of Audit" := AirOnlineHeader."Head of Audit"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup.GET("User ID");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(Text011, "No.");
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text011, "No.");
                        CreateEmailBody("No.", Text015, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        Rejected1 := TRUE;
                    END;
            end;
        }
        field(34; "Name Head of Audit"; Text[50])
        {
            Description = 'HOD Audit Name';
            Editable = false;
        }
        field(35; "Managing Director"; Option)
        {
            Description = 'MD';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Head of Audit", "Head of Audit"::Approved);
                // IF USERID <> 'TOYOTANIGERIA\OLAKUNLE' THEN
                //  ERROR('YOU ARE NOT AUTHORIZED TO APPROVE THIS');
                IF "Managing Director" = "Managing Director"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to Approve this?', FALSE) THEN
                        "Managing Director" := AirOnlineHeader."Managing Director"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup.GET("User ID");
                        ToAddresses := UserSetup."E-Mail";
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name MD" := UserSetup4.Name;
                        TimeDate5 := CURRENTDATETIME;
                        Addressee := UserSetup.Initials;
                        SenderAddress := UserSetup4."E-Mail";

                        Subject := STRSUBSTNO(Text016, "No.");
                        CreateEmailBody("No.", Text010, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        "Genarate FM" := TRUE;
                    END;

                IF "Managing Director" = "Managing Director"::"On-hold" THEN
                    IF NOT CONFIRM('Are you sure you want place this order ON_HOLD?', FALSE) THEN
                        "Managing Director" := AirOnlineHeader."Managing Director"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name MD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate5 := CURRENTDATETIME;
                        //Subject := STRSUBSTNO(Text006,"No.");

                        Subject := STRSUBSTNO(Text014, "No.");
                        CreateEmailBody("No.", Text009, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "Managing Director" = "Managing Director"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT this?', FALSE) THEN
                        "Managing Director" := AirOnlineHeader."Managing Director"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name MD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate5 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text015, "No.");
                        CreateEmailBody("No.", Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        Rejected1 := TRUE;
                    END;
            end;
        }
        field(36; "Name MD"; Text[50])
        {
            Description = 'MD Name';
            Editable = false;
        }
        field(37; "General Manager"; Option)
        {
            Description = 'GM';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Head of Audit", "Head of Audit"::Approved);
                IF "General Manager" = "General Manager"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                        "General Manager" := AirOnlineHeader."General Manager"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        UserSetup.GET("User ID");
                        ToAddresses := UserSetup."E-Mail";
                        CcAddresses := '';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(Text010, "No.");
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name GM" := UserSetup4.Name;
                        TimeDate6 := CURRENTDATETIME;
                        Addressee := UserSetup.Initials;
                        SenderAddress := UserSetup4."E-Mail";

                        Subject := STRSUBSTNO(Text016, "No.");
                        CreateEmailBody("No.", Text010, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        "Genarate FM" := TRUE;
                    END;

                IF "General Manager" = "General Manager"::"On-hold" THEN
                    IF NOT CONFIRM('Are you sure you want place this order on-hold?', FALSE) THEN
                        "General Manager" := AirOnlineHeader."General Manager"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name GM" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate6 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text014, "No.");
                        CreateEmailBody("No.", Text009, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "General Manager" = "General Manager"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                        "General Manager" := AirOnlineHeader."General Manager"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name GM" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate6 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text015, "No.");
                        CreateEmailBody("No.", Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                        Rejected1 := TRUE;
                    END;
            end;
        }
        field(38; "Name GM"; Text[50])
        {
            Description = 'GM Name';
            Editable = false;
        }
        field(39; GMapproval; Boolean)
        {

        }
        field(40; MDapproval; Boolean)
        {
            Editable = false;
        }
        field(41; "Compliance check"; Option)
        {
            Description = 'Compliance';
            OptionCaption = ' ,Satisfactory,Not Satisfactory';
            OptionMembers = " ",Satisfactory,"Not Satisfactory";

            trigger OnValidate()
            begin
                TESTFIELD(Send, TRUE);

                IF "Compliance check" = "Compliance check"::Satisfactory THEN
                    IF NOT CONFIRM('Are you sure you this Order is SATISFACTORY?', FALSE) THEN
                        "Compliance check" := AirOnlineHeader."Compliance check"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";
                        ToAddresses := 'Adewumi@toyotanigeria.com';
                        CcAddresses := 'agbesua@toyotanigeria.com';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Confirmed By" := UserSetup4.Name;
                        TimeDate3 := CURRENTDATETIME;
                        SenderAddress := UserSetup4."E-Mail";

                        Subject := STRSUBSTNO(Text012, "No.");
                        CreateEmailBody("No.", Text013, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        HoDAuditApproval := TRUE;
                    END;

                IF "Compliance check" = "Compliance check"::"Not Satisfactory" THEN
                    IF NOT CONFIRM('Are you sure this order is not satisfactory?', FALSE) THEN
                        "Compliance check" := AirOnlineHeader."Compliance check"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Invoice Value");
                        VendAmt := "Total Invoice Value";
                        "Supplier Name" := "Supplier's Name";
                        "Supplier Address" := "Supplier's Address";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Confirmed By" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate3 := CURRENTDATETIME;
                        // Subject := STRSUBSTNO(Text006,"No.");

                        Subject := STRSUBSTNO(Text014, "No.");
                        CreateEmailBody("No.", Text009, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(42; "Confirmed By"; Text[30])
        {
            Description = 'Compliance Name';
            Editable = false;
        }
        field(43; DateTime; DateTime)
        {
            Description = 'Requester';
            Editable = false;
        }
        field(44; TimeDate1; DateTime)
        {
            Description = 'Sender';
            Editable = false;
        }
        field(45; TimeDate2; DateTime)
        {
            Description = 'HOD';
            Editable = false;
        }
        field(46; TimeDate3; DateTime)
        {
            Description = 'Compliance';
            Editable = false;
        }
        field(47; TimeDate4; DateTime)
        {
            Description = 'HOD Audit';
            Editable = false;
        }
        field(48; TimeDate5; DateTime)
        {
            Description = 'MD';
            Editable = false;
        }
        field(49; TimeDate6; DateTime)
        {
            Description = 'GM';
            Editable = false;
        }
        field(50; HODVisible; Boolean)
        {
        }
        field(51; GMVisible; Boolean)
        {
        }
        field(52; MDVisible; Boolean)
        {
        }
        field(53; SendEditable; Boolean)
        {
        }
        field(54; HoDPartApproval; Boolean)
        {
        }
        field(55; HoDAuditApproval; Boolean)
        {
        }
        field(56; ComplianceCheck; Boolean)
        {
        }
        field(57; "Total Line"; Decimal)
        {
        }
        field(58; "Ancillary Charges"; Decimal)
        {
        }
        field(59; "FOB ROISSY"; Decimal)
        {
        }
        field(60; Freight; Decimal)
        {
        }
        field(61; "CPT LAGOS NIGERIA"; Decimal)
        {
        }
        field(62; "Team(Unit) Head Comment"; Text[100])
        {
        }
        field(63; "Genarate FM"; Boolean)
        {
        }
        field(64; "Generated FM"; Boolean)
        {
        }
        field(65; "Air Order Type"; Option)
        {
            OptionCaption = ' ,Form M,DHL';
            OptionMembers = " ","Form M",DHL;
        }
        field(66; "Suppliers No."; Code[30])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                IF Vendor.GET("Suppliers No.") THEN BEGIN
                    "Supplier's Name" := Vendor.Name;
                    "Supplier's Address" := Vendor.Address;
                END ELSE BEGIN
                    "Supplier's Name" := '';
                    "Supplier's Address" := '';
                END;
            end;
        }
        field(67; "Purchase Order Issued"; Boolean)
        {
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
            PurchSetup.GET;
            PurchSetup.TESTFIELD("FM Nos.");
            "No." := NoSeriesMgt.GetNextNo(PurchSetup."FM Nos.");
            //NoSeriesMgt.InitSeries(PurchSetup."FM Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;

        UserSetup.GET(USERID);
        Date := TODAY;
        "Requester Name" := UserSetup.Name;
        "Requester Code" := UserSetup."User ID";
        "Requester Department" := UserSetup.Department;
        "User ID" := UserSetup."User ID";
        //DateTime := CURRENTDATETIME;
    end;

    var
        CRLF: Text[2];
        UserSetup: Record "User Setup";
        NoSeriesMgt: Codeunit "No. Series";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup2: Record "User Setup";
        //Mail: Codeunit Mail;
        ToAddresses: Text;
        CcAddresses: Text[200];
        BccAddresses: Text[100];
        Subject: Text[150];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        VendName: Text[150];
        VendAddr: Text[100];
        VendAmt: Decimal;
        UserSetup4: Record "User Setup";
        SendersName: Text[200];
        Addressee: Text[50];
        SenderAddress: Text[200];
        "Supplier Name": Text;
        "Supplier Address": Text;
        Amount: Decimal;
        Text001: Label '%1 requires your approval.';
        Text002: Label 'Dear %1,';
        Text003: Label 'The document no. %1 for Air Order Parts requires approval.';
        Text004: Label 'Vendor: ';
        Text005: Label 'Address: ';
        Text006: Label 'Amount: ';
        Text007: Label 'Regards,';
        Text008: Label 'Mail sent successfully.';
        Text009: Label 'The above document no. %1 has been placed on hold.';
        Text010: Label 'The Air Order  with document no. %1 has been approved.';
        Text011: Label 'The Air Order with document no. %1 has been rejected.';
        Text012: Label 'Compliance Check.';
        Text013: Label 'Compliance Check %1 is satisfactory.';
        Text014: Label 'Document On-hold.';
        Text015: Label 'Document Rejection.';
        Text016: Label 'Document Approved.';
        Vendor: Record Vendor;
        //EmailBody: Record TempBlob;
        BodyTxt: Text;
        //BodyBlob: Record TempBlob;
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
        AirOnlineHeader: Record "Air Online Header";
        AirOnlineLine: Record "Air Online Order Line";
        EmailBody: Text[1024];
        Text029: Label 'Vendor: ';
        Text030: Label 'Address: ';
        Text031: Label 'Amount: ';

    procedure CreateEmailBody(DocNo: Code[20]; BodyMsg: Text; RecipientInitials: Text);
    var

        VendName: Text;
        VendAddr: Text;
        VendAmt: Decimal;

    begin
        UserSetup.get(USERID);

        CALCFIELDS("Total Invoice Value");
        VendAmt := "Total Invoice Value";
        "Supplier Name" := "Supplier's Name";
        "Supplier Address" := "Supplier's Address";
        VendName := "Supplier's Name";
        VendAddr := "Supplier's Address";


        EmailBody := Format(StrSubstNo(Text002, SendersName));
        EmailBody += '<br><br>';
        EmailBody += FORMAT(STRSUBSTNO(BodyMsg, "No."));
        EmailBody += '<br><br>';
        EmailBody += Text029 + FORMAT(VendName);
        EmailBody += '<br>';
        EmailBody += Text030 + FORMAT(VendAddr);
        EmailBody += '<br>';
        EmailBody += Text031 + FORMAT(VendAmt);
        EmailBody += '<br>';
        EmailBody += '<br><br>';
        EmailBody += 'Yours sincerely,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;

    end;

    procedure SendEmail(ToRecipients: Text; Subject: Text; Body: Text; CCRecipients: Text; BCCRecipients: Text)
    var

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ToRecipients, Subject, EmailBody, true);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;
}

