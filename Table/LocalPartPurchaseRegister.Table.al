table 70018 "Local Part Purchase Register"
{

    fields
    {
        field(1; "LPP No."; Code[10])
        {
            Editable = false;
        }
        field(2; "Requester Code"; Code[30])
        {
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Requester Name"; Text[50])
        {
            Editable = false;
        }
        field(4; "Department Code"; Code[30])
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
            NotBlank = false;
        }
        field(8; "Supplier's Name"; Text[30])
        {
            NotBlank = false;
        }
        field(9; "Profoma Invoice No:"; Code[10])
        {
            NotBlank = false;
        }
        field(10; "Justification for purchase"; Text[100])
        {
        }
        field(11; "Total Purchase Value"; Decimal)
        {
            CalcFormula = Sum("LPP Line".Amount WHERE("Document No." = FIELD("LPP No.")));
            FieldClass = FlowField;
        }
        field(12; "HOD Code"; Code[20])
        {
        }
        field(13; "HOD Name"; Text[30])
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
        field(23; "User ID"; Code[30])
        {
        }
        field(24; "Send To"; Code[30])
        {
            NotBlank = true;
            TableRelation = IF ("Order Type" = FILTER(<> ' ')) "Head of Department"."Head of Department" WHERE("Department Code" = FILTER('05PARTS'));

        }
        field(25; Send; Boolean)
        {
            trigger OnValidate()
            Begin

                TESTFIELD("Send To");
                TESTFIELD("Order Type");

                IF Send = TRUE THEN
                    IF NOT CONFIRM('Are you sure you want to send for Approval', FALSE) THEN
                        Send := FALSE
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup2.GET(USERID);
                        "Sent By" := UserSetup2."User ID";
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";
                        //CcAddresses := '';
                        TimeDate1 := CURRENTDATETIME;

                        PurchSetup.GET;
                        IF "Order Type" <> "Order Type"::" " THEN BEGIN
                            ToAddresses := 'ravinder@toyotanigeria.com';
                            Initials := 'RS/AO'
                        END ELSE BEGIN
                            UserSetup4.GET("Send To");
                            Initials := UserSetup4.Initials;
                            ToAddresses := UserSetup4."E-Mail";
                            BccAddresses := '';
                        END;

                        Subject := STRSUBSTNO(Text026, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text027, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');
                    END;

                HoDPartApproval := TRUE;
            END;


        }
        field(26; "Sent By"; Code[30])
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
                UserSetup4.GET(USERID);
                IF UserSetup4."User ID" <> "Send To" THEN
                    ERROR(Text031);
                TESTFIELD(Send, TRUE);

                IF "Head of Department" = "Head of Department"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                        "Head of Department" := LPPRec."Head of Department"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        ToAddresses := 'aderonke@toyotanigeria.com';
                        CcAddresses.Add('brano@toyotanigeria.com');
                        BccAddresses := 'grace@toyotanigeria.com';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        SenderAddress := UserSetup4."E-Mail";
                        "Name HOD" := UserSetup4.Name;
                        TimeDate2 := CURRENTDATETIME;
                        Addressee := 'team';

                        Subject := STRSUBSTNO(Text006, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text022, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                        ComplianceCheck := TRUE;
                    END;

                IF "Head of Department" = "Head of Department"::"On-hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                        "Head of Department" := LPPRec."Head of Department"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;

                        //CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name HOD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate2 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text011, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "Head of Department" = "Head of Department"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to Reject', FALSE) THEN
                        "Head of Department" := LPPRec."Head of Department"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        //CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name HOD" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate2 := CURRENTDATETIME;
                        Subject := STRSUBSTNO(Text006, "LPP No.");

                        Subject := STRSUBSTNO(Text017, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Rejected1 := TRUE;
                    END;

                "HeadofDept UserID" := USERID;
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
                    ERROR('The request has not been send for audit approval!');

                TESTFIELD("Head of Department", "Head of Department"::Approved);
                IF "Compliance check" <> "Compliance check"::Satisfactory THEN
                    ERROR(Text032);

                UserSetup4.GET(USERID);
                if NOT (UserSetup4."User ID" IN ['ADEWUMI', 'BRANO', 'JOSHUA']) THEN
                    ERROR(Text039);


                IF ("Head of Audit" = "Head of Audit"::Approved) THEN
                    IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                        "Head of Audit" := LPPRec."Head of Audit"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        IF (VendAmt <= 100000) THEN BEGIN

                            /* IF "Order Type" <> "Order Type"::"Isolo Store" THEN begin
                                ToAddresses := 'ravinder@toyotanigeria.com';
                                Addressee := 'RS,';
                            end else begin
                                ToAddresses := 'sylvester@toyotanigeria.com';
                                Addressee := 'SE,';
                            end; */

                            ToAddresses := 'ravinder@toyotanigeria.com';
                            Addressee := 'RS,';

                            HODVisible := TRUE;
                            "Procurement Approval" := TRUE;
                        END;

                        IF (VendAmt >= 500000) THEN BEGIN
                            ToAddresses := 'dynamics@toyotanigeria.com';
                            Addressee := 'MD,';
                            MDVisible := TRUE;
                            "MD Approval" := TRUE;
                        END;

                        IF (VendAmt > 100000) AND (VendAmt < 500000) THEN BEGIN
                            ToAddresses := 'bunmi@toyotanigeria.com';
                            Addressee := 'OAO,';
                            GMVisible := TRUE;
                            "GM Approval" := TRUE;
                        END;

                        Subject := STRSUBSTNO(Text001, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text003, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CCAddresses, '');

                    end;


                IF ("Head of Audit" = "Head of Audit"::"On-hold") THEN
                    IF NOT CONFIRM('Are you sure you want to place on-hold?', FALSE) THEN
                        "Head of Audit" := LPPRec."Head of Audit"::" "
                    ELSE BEGIN

                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        //CcAddresses := '';
                        BccAddresses := '';
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        "Send to" := ToAddresses;
                        Subject := STRSUBSTNO(Text010, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF ("Head of Audit" = "Head of Audit"::Rejected) THEN
                    IF NOT CONFIRM('Are you sure you want to reject?', FALSE) THEN
                        "Head of Audit" := LPPRec."Head of Audit"::" "
                    ELSE BEGIN

                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";

                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        //CcAddresses := '';
                        BccAddresses := '';
                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Name Head of Audit" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate4 := CURRENTDATETIME;

                        "Send to" := ToAddresses;

                        Subject := STRSUBSTNO(Text018, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CCAddresses, '');

                        Rejected1 := TRUE;

                    END;


                "HeadofAudit UserID" := USERID;

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

                IF "Order Type" <> "Order Type"::"Isolo Store" THEN BEGIN
                    TESTFIELD("Head of Audit", "Head of Audit"::Approved);

                    IF "Managing Director" = "Managing Director"::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            UserSetup.GET("Requester Code");
                            Addressee := UserSetup.Initials;
                            ToAddresses := UserSetup."E-Mail";

                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";


                            UserSetup2.GET("Send To");
                            CcAddresses.Add(UserSetup2."E-Mail");
                            BccAddresses := '';
                            Subject := STRSUBSTNO(Text025, "LPP No.");

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "Name MD" := UserSetup4.Name;
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text025, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text024, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            "Genarate LPO" := TRUE;
                        END;

                    IF "Managing Director" = "Managing Director"::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on-hold?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            CcAddresses := GetCCBalancePayment.Split(';'); //here
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name MD" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "Managing Director" = "Managing Director"::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to reject?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            CcAddresses := GetCCBalancePayment.Split(';'); //here
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name MD" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;


                IF "Order Type" = "Order Type"::"Isolo Store" THEN BEGIN
                    IF "Managing Director" = "Managing Director"::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            UserSetup.GET("Sent By");
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";

                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup2.GET("Send To");
                            Addressee := UserSetup2.Initials;
                            ToAddresses := UserSetup2."E-Mail";

                            CcAddresses.Add('albert@toyotanigeria.com');
                            BccAddresses := 'adewumi@toyotanigeria.com';
                            Subject := STRSUBSTNO(Text025, "LPP No.");

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "Name MD" := UserSetup4.Name;
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text025, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text024, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                            "Genarate LPO" := TRUE;
                        END;

                    IF "Managing Director" = "Managing Director"::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;

                            CcAddresses := GetCCBalancePayment.Split(';'); //here
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name MD" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "Managing Director" = "Managing Director"::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to Reject?', FALSE) THEN
                            "Managing Director" := LPPRec."Managing Director"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;

                            CcAddresses := GetCCBalancePayment.Split(';'); //here
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name MD" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate7 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
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

            var
                UserSetupCheck: Record "User Setup";

            begin
                UserSetupCheck.GET(USERID);
                if UserSetupCheck."User ID" <> 'BUNMI' then
                    ERROR('You are not authorized to approve as General Manager.');

                IF "Order Type" <> "Order Type"::"Isolo Store" THEN BEGIN
                    TESTFIELD("Head of Audit", "Head of Audit"::Approved);
                    IF "General Manager" = "General Manager"::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN

                            UserSetup.GET("Sent By");
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";
                            UserSetup2.GET("Send To");
                            ToAddresses := UserSetup."E-Mail";
                            CcAddresses.Add('ravinder@toyotanigeria.com');
                            BccAddresses := '';
                            Subject := STRSUBSTNO(Text029, "LPP No.");
                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "Name GM" := UserSetup4.Name;
                            TimeDate6 := CURRENTDATETIME;
                            Addressee := UserSetup.Initials;

                            Subject := STRSUBSTNO(Text025, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text024, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            "Genarate LPO" := TRUE;
                        END;

                    IF "General Manager" = "General Manager"::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name GM" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate6 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "General Manager" = "General Manager"::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to Reject', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name GM" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate6 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;

                IF "Order Type" = "Order Type"::"Isolo Store" THEN BEGIN
                    IF "General Manager" = "General Manager"::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN
                            UserSetup.GET("Sent By");
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup2.GET("Send To");
                            ToAddresses := UserSetup2."E-Mail";
                            CcAddresses.Add('isuekebho@toyotanigeria.com');

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "Name GM" := UserSetup4.Name;
                            TimeDate6 := CURRENTDATETIME;
                            Addressee := UserSetup.Initials;

                            Subject := STRSUBSTNO(Text025, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text024, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                            "Genarate LPO" := TRUE;
                        END;

                    IF "General Manager" = "General Manager"::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name GM" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate6 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "General Manager" = "General Manager"::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to reject?', FALSE) THEN
                            "General Manager" := LPPRec."General Manager"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Name GM" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate6 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;
            end;
        }
        field(38; "Name GM"; Text[50])
        {
            Description = 'GM Name';
            Editable = false;
        }
        field(39; "HOD's Part Procurement Appr."; Option)
        {
            Description = 'Procurement Approval';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                IF "Order Type" <> "Order Type"::"Isolo Store" THEN BEGIN

                    TESTFIELD("Head of Audit", "Head of Audit"::Approved);

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            TimeDate5 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text019, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text012, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Float := TRUE;
                        END;

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate5 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to reject?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate5 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;


                IF "Order Type" = "Order Type"::"Isolo Store" THEN BEGIN
                    //TESTFIELD("Send To", 'RAVINDER');
                    TESTFIELD("Compliance check", "Compliance check"::Satisfactory);

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::Approved THEN
                        IF NOT CONFIRM('Are you sure you want to approve?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            TimeDate5 := CURRENTDATETIME;
                            Addressee := UserSetup.Initials;

                            Subject := STRSUBSTNO(Text019, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text012, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Float := TRUE;
                        END;

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::"On-hold" THEN
                        IF NOT CONFIRM('Are you sure you want to place on hold?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate5 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        END;

                    IF "HOD's Part Procurement Appr." = "HOD's Part Procurement Appr."::Rejected THEN
                        IF NOT CONFIRM('Are you sure you want to reject?', FALSE) THEN
                            "HOD's Part Procurement Appr." := LPPRec."HOD's Part Procurement Appr."::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "HOD's Part  Appr. Name" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate5 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text017, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;

                "HeadofDeptParts UserID" := USERID;

            end;
        }
        field(40; "HOD's Part  Appr. Name"; Text[30])
        {
            Description = 'Procurement Approval Name';
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
                TESTFIELD("Head of Department", "Head of Department"::Approved);

                // IF "Order Type" <> "Order Type"::"Isolo Store" THEN BEGIN
                UserSetup4.GET(USERID);
                IF NOT UserSetup4."Audit Service Approval" THEN
                    ERROR(Text033);
                IF "Compliance check" = "Compliance check"::Satisfactory THEN
                    IF NOT CONFIRM('Are you sure you this is satisfactory?', FALSE) THEN
                        "Compliance check" := LPPRec."Compliance check"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";
                        ToAddresses := 'adewumi@toyotanigeria.com';
                        Addressee := 'STA';
                        //CcAddresses := 
                        BccAddresses := '';

                        Subject := STRSUBSTNO(Text001, "LPP No.");

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        SenderAddress := UserSetup4."E-Mail";
                        "Confirmed By" := UserSetup4.Name;
                        TimeDate3 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text001, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text021, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Float := TRUE;
                        HoDAuditApproval := TRUE;
                    END;

                IF "Compliance check" = "Compliance check"::"Not Satisfactory" THEN
                    IF NOT CONFIRM('Are you sure you want to select not satisfactory?', FALSE) THEN
                        "Compliance check" := LPPRec."Compliance check"::" "
                    ELSE BEGIN
                        CALCFIELDS("Total Purchase Value");
                        VendAmt := "Total Purchase Value";
                        VendName := "Supplier's Name";
                        VendAddr := "Supplier's Address";
                        Purpose := "Justification for purchase";
                        UserSetup.GET("Sent By");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        //CcAddresses := '';
                        BccAddresses := '';

                        UserSetup4.GET(USERID);
                        SendersName := UserSetup4.Initials;
                        "Confirmed By" := UserSetup4.Name;
                        SenderAddress := UserSetup4."E-Mail";
                        TimeDate3 := CURRENTDATETIME;

                        Subject := STRSUBSTNO(Text006, "LPP No.");
                        CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Rejected1 := TRUE;
                    END;
                //END;

                /*

                IF "Order Type" = "Order Type"::"Isolo Store" THEN BEGIN

                    IF "Compliance check" = "Compliance check"::Satisfactory THEN
                        IF NOT CONFIRM('Are you sure you this is satisfactory?', FALSE) THEN
                            "Compliance check" := LPPRec."Compliance check"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            IF "Total Purchase Value" <= 100000 THEN BEGIN
                                ToAddresses := 'isuekebho@toyotanigeria.com';
                                CcAddresses.add('uzonwanne@toyotanigeria.com');
                                HODVisible := TRUE;
                                "Procurement Approval" := TRUE;
                            END ELSE
                                IF ("Total Purchase Value" > 100001) AND ("Total Purchase Value" < 500000) THEN BEGIN
                                    ToAddresses := 'bunmi@toyotanigeria.com';
                                    CcAddresses.Add('paa@toyotanigeria.com');
                                    Addressee := 'GM';
                                    GMVisible := TRUE;
                                    "GM Approval" := TRUE;
                                END ELSE
                                    IF "Total Purchase Value" >= 500000 THEN BEGIN
                                        ToAddresses := 'dynamics@toyotanigeria.com';
                                        CcAddresses.Add('bunmi@toyotanigeria.com');
                                        Addressee := 'MD';
                                        MDVisible := TRUE;
                                        "MD Approval" := TRUE;
                                    END;

                            BccAddresses := '';
                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            SenderAddress := UserSetup4."E-Mail";
                            "Confirmed By" := UserSetup4.Name;
                            TimeDate3 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text001, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text021, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                            HoDAuditApproval := TRUE;
                        END;

                    IF "Compliance check" = "Compliance check"::"Not Satisfactory" THEN
                        IF NOT CONFIRM('Are you sure you want to select not satisfactory?', FALSE) THEN
                            "Compliance check" := LPPRec."Compliance check"::" "
                        ELSE BEGIN
                            CALCFIELDS("Total Purchase Value");
                            VendAmt := "Total Purchase Value";
                            VendName := "Supplier's Name";
                            VendAddr := "Supplier's Address";
                            Purpose := "Justification for purchase";

                            UserSetup.GET("Sent By");
                            ToAddresses := UserSetup."E-Mail";
                            Addressee := UserSetup.Initials;
                            //CcAddresses := '';
                            BccAddresses := '';

                            UserSetup4.GET(USERID);
                            SendersName := UserSetup4.Initials;
                            "Confirmed By" := UserSetup4.Name;
                            SenderAddress := UserSetup4."E-Mail";
                            TimeDate3 := CURRENTDATETIME;

                            Subject := STRSUBSTNO(Text006, "LPP No.");
                            CreateEmailBody(VendName, VendAddr, VendAmt, Purpose, Text011, Addressee);
                            SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                            Rejected1 := TRUE;
                        END;
                END;

                */

                "Compliance UserID" := USERID;

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
            Editable = true;
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
            Description = 'HOD Payment';
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
        field(57; "Procurement Approval"; Boolean)
        {
        }
        field(58; GenaratePayment; Boolean)
        {
        }
        field(59; "Genarate LPO"; Boolean)
        {
        }
        field(60; Float; Boolean)
        {
        }
        field(61; "Procurement Approved"; Boolean)
        {
        }
        field(62; Closed; Boolean)
        {
        }
        field(63; TimeDate7; DateTime)
        {
            Description = 'MD';
            Editable = false;
        }
        field(64; "HOD Payment"; Option)
        {
            Description = 'HOD Payment';
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

        }
        field(65; "Name HOD Payment"; Text[50])
        {
            Description = 'HOD Name Payment';
            Editable = false;
        }
        field(66; "Voucher Raised"; Boolean)
        {
        }
        field(67; "GM Approval"; Boolean)
        {
        }
        field(68; "MD Approval"; Boolean)
        {
        }
        field(69; "Order Type"; Option)
        {
            OptionCaption = ' ,Warranty,Stock Order,Dealer Emergency order,Dojo Store Order,SPV Order,Isolo Store';
            OptionMembers = " ",Warranty,"Stock Order","Dealer Emergency order","Dojo Store Order","SPV Order","Isolo Store";
        }
        field(70; Rejected; Boolean)
        {
        }
        field(71; "TCOF No."; Code[15])
        {
        }
        field(72; "RFQ No."; Code[15])
        {
        }
        field(73; "Suppliers Code"; Code[10])
        {
        }
        field(74; "HeadofDept UserID"; Code[10]) //for field 31
        {
            Description = 'Head of Department User ID';
            Editable = false;
        }
        field(75; "HeadofAudit UserID"; Code[10]) //for field 33
        {
            Description = 'Head of Audit User ID';
            Editable = false;
        }
        field(76; "HeadofDeptParts UserID"; Code[10]) //for field 39
        {
            Description = 'Head of Department Parts User ID';
            Editable = false;
        }
        field(77; "Compliance UserID"; Code[10]) //for field 41
        {
            Description = 'Compliance User ID';
            Editable = false;
        }
        field(78; Costing; Boolean)
        {

        }
        field(79; "No."; Code[12])
        {
            TableRelation = "Customer Order HeaderX"."No.";
        }
        field(80; "Customer Approved Amount"; Decimal)
        {
        }
        field(81; "Markup Amount"; Decimal)
        {
        }
        field(82; "Cost Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "LPP No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ERROR('You can not delete this entry. Contact your System Administrator!');
    end;

    trigger OnInsert()
    begin
        IF "LPP No." = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("LPP Nos.");
            "No. Series" := PurchSetup."LPP Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "LPP No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        UserSetup.GET(USERID);
        Date := TODAY;
        "Requester Name" := UserSetup.Name;
        "Requester Code" := UserSetup."User ID";
        "Requester Department" := UserSetup.Department;
        "User ID" := UserSetup."User ID";
        DateTime := CURRENTDATETIME;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Employee: Record Employee;
        DimValue: Record "Dimension Value";
        ToAddresses: Text;
        CcAddresses: List of [Text];
        BccAddresses: Text[100];
        Subject: Text[150];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        EditHOD: Boolean;
        EditAudit: Boolean;
        EditGM: Boolean;
        EditMD: Boolean;
        VisibleGM: Boolean;
        VisibleMD: Boolean;
        CRLF: Text[2];
        VendName: Text[150];
        VendAddr: Text[100];
        VendAmt: Decimal;
        UserSetup4: Record "User Setup";
        SendersName: Text[200];
        Addressee: Text[50];
        SenderAddress: Text[200];
        EditSend: Boolean;
        //VendName: Text;
        //VendAddr: Text;
        Purpose: Text;
        Amount: Decimal;
        Text001: Label '%1  requires your approval  for local parts procurement.';
        Text002: Label 'Dear %1,';
        Text003: Label 'The document no. %1 for local part purchase requires your Procurement approval.';
        Text004: Label 'Regards,';
        Text005: Label 'Mail sent successfully.';
        Text006: Label 'Compliance Check: Document No. %1';
        Text007: Label 'You cannot approvee this Transaction.Kindly contact your system Administrator';
        Text008: Label 'Mail sent successfully.';
        Text009: Label 'You are not an auditor. Please contact your system administrator.';
        Text010: Label '%1  is on-hold.';
        Text011: Label 'The above Document No. %1  has been placed on hold.';
        Text012: Label 'The Local  part  purchase  with Document No. %1 has been approved.';
        Text013: Label 'Mail sent successfully.';
        Text014: Label 'Vendor: ';
        Text015: Label 'Address: ';
        Text016: Label 'Amount: ';
        Text017: Label 'The local part purchase with document no. %1 has been rejected.';
        Text018: Label '%1 is rejected.';
        Text019: Label 'Local part purchase document no. %1 has been approved:';
        Text020: Label 'Purpose:';
        Text022: Label 'This document requires a compliance check.';
        Text021: Label 'Compliance check %1 is satisfactory.';
        Text023: Label 'Local part purchase request for  SPV requires your approval';
        LPPLine: Record "LPP Line";
        Text024: Label 'The Local  part  purchase  with Document No. %1 has been approved. ';
        Text025: Label '%1  requires your approval to Procure and Fianance &Account to process payment:';
        Text026: Label '%1  requires your approval';
        Text027: Label 'The document No. %1 for local part purchase  requires approval to process local parts procurement.';
        Text028: Label ' Kindly Proceed to make payment from the departmental float .';
        Text029: Label 'Kindly Proceed to generate an LPO and Finance & Account to process payment.';
        Text030: Label 'Kindly approve the Local part procurement document.';
        Text031: Label 'This Local Purchase is not for your location';
        Text032: Label 'Requester needs to confirm the service delivery before you can proceed.';
        Text033: Label 'You are not an auditor. Please contact your system administrator.';
        Text039: Label 'You do not have permission to perform this function. Contact your system administrator.';
        Initials: Text[10];
        TempEmailItem: Record "Email Item" temporary;
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;
        LPPRec: Record "Local Part Purchase Register";
        EmailBody: Text[1024];
        CopiedReceivers: Text;

    procedure CreateEmailBody(Name: Text; Addr: Text; Value: Decimal; Descr: Text; BodyMsg: Text; RecipientInitials: Text);

    begin

        UserSetup.Get(USERID);

        EmailBody := Format(StrSubstNo(Text002, Addressee));
        EmailBody += '<br><br>';
        EmailBody += FORMAT(STRSUBSTNO(BodyMsg, "LPP No."));
        EmailBody += '<br><br>';
        EmailBody += Text014 + FORMAT(Name);
        EmailBody += '<br>';
        EmailBody += Text015 + FORMAT(Addr);
        EmailBody += '<br>';
        EmailBody += Text016 + FORMAT(Value);
        EmailBody += '<br>';
        EmailBody += Text020 + FORMAT(Descr);
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;
    end;

    procedure SendEmail(ToRecipients: Text; Subject: Text; Body: Text; CCRecipients: list of [Text]; BCCRecipients: Text)
    var

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ToRecipients, Subject, EmailBody, true);
        // EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCRecipients);

        EmailMessage.SetRecipients(Enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;


    procedure GetCCBalancePayment() CCEmails: Text

    var
        UserSetup: Record "User Setup";
        RC2: Text;
        RC3: Text;
        RC4: Text;
        RC5: Text;

    Begin
        IF UserSetup.GET("HeadofDept UserID") THEN
            RC2 := UserSetup."E-Mail";

        IF UserSetup.GET("HeadofAudit UserID") THEN
            RC3 := UserSetup."E-Mail";

        IF UserSetup.GET("HeadofDeptParts UserID") THEN
            RC4 := UserSetup."E-Mail";

        IF UserSetup.GET("Compliance UserID") THEN
            RC5 := UserSetup."E-Mail";

        CopiedReceivers := RC2 + ';' + RC3 + ';' + RC4 + ';' + RC5;

        EXIT(CopiedReceivers);
    End;


}

