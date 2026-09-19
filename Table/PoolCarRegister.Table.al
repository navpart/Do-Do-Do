table 70002 "Pool Car Register"
{

    fields
    {
        field(1; "Request No."; Code[20])
        {

        }
        field(2; "Entry Date"; Date)
        {
        }
        field(3; "Request Type"; Option)
        {
            OptionCaption = ' ,Routine,Emergency';
            OptionMembers = " ",Routine,Emergency;
        }
        field(4; Requester; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(5; "Requester Name"; Text[80])
        {
        }
        field(6; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                IF Approved THEN
                    "Approved by" := USERID
                ELSE
                    "Approved by" := '';
            end;
        }
        field(10; "Approved by"; Code[50])
        {
        }
        field(11; Destination; Text[250])
        {
        }
        field(12; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin

                IF "1st Approval" = '' THEN
                    ERROR('You need to choose an approver!');

                IF UserSetup.GET("1st Approval") THEN BEGIN
                    ToName := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    Sender := USERID;

                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    SenderAddress := UserSetup2."E-Mail";

                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    "Current Pending Person" := "1st Approval";

                    Subject := STRSUBSTNO(text001, "Request No.");
                    CreateEmailBody("Request No.", text001, Addressee);
                    SendEmail(ToName, Subject, EmailBody, SenderAddress, '');

                END;
            end;
        }
        field(13; "1st Approval"; Code[50])
        {
            TableRelation = "Head of Department" WHERE("Department Code" = FIELD("Global Dimension 1 code"));

            trigger OnValidate()
            begin
                IF UserSetup.GET("1st Approval") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(14; "2nd Approval"; Code[50])
        {
            TableRelation = "User Setup"."User ID" WHERE("2nd Approval" = const(true));

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval") THEN
                    "2nd Approver" := UserSetup.Name;
            end;
        }
        field(20; Comment; Text[100])
        {
        }
        field(21; "Pickup Date"; Date)
        {
        }
        field(22; "Return Date"; Date)
        {
        }
        field(26; "1st Approver"; Text[50])
        {
        }
        field(27; "1st Approval Status"; Option)
        {
            Caption = '1st Approval Satues';
            OptionCaption = ' ,On hold,Approved,Rejected';
            OptionMembers = " ","On hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", TRUE);

                UserSetup4.GET(USERID);
                IF "1st Approval Status" = "1st Approval Status"::Approved THEN BEGIN

                    IF UserSetup.GET("2nd Approval") THEN BEGIN
                        "1st Approval Time" := CURRENTDATETIME;
                        "Current Pending Person" := "2nd Approval";

                        ToName := UserSetup."E-Mail";
                        //CCName := 'lawal@toyotanigeria.com;kolawole@toyotanigeria.com';
                        subject := STRSUBSTNO(text001, "Request No.");
                        Addressee := UserSetup.Initials;

                        UserSetup2.GET(USERID);
                        SenderName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text001, "Request No.");
                        CreateEmailBody("Request No.", Text012, Addressee);
                        SendEmail(ToName, Subject, EmailBody, '', '');

                    END;
                END;

                CASE "1st Approval Status" OF
                    "1st Approval Status"::Rejected:
                        BEGIN
                            "1st Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            ToName := UserSetup2."E-Mail";
                            subject := STRSUBSTNO(text003, "Request No.");
                            Addressee := UserSetup2.Initials;
                            UserSetup.GET(USERID);
                            SenderName := UserSetup.Initials;
                            SenderAddress := UserSetup."E-Mail";

                            "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your pool car request has been rejected.' + CRLF + CRLF + CRLF +
                            'Regards,' + CRLF + CRLF + SenderName;

                            Subject := STRSUBSTNO(text003, "Request No.");
                            CreateEmailBody("Request No.", Text013, Addressee);
                            SendEmail(ToName, Subject, EmailBody, '', '');

                        END;

                    "1st Approval Status"::"On hold":
                        BEGIN
                            "1st Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            ToName := UserSetup2."E-Mail";
                            subject := STRSUBSTNO(text004, "Request No.");
                            Addressee := UserSetup2.Initials;
                            UserSetup.GET(USERID);
                            SenderName := UserSetup.Initials;
                            SenderAddress := UserSetup."E-Mail";

                            Subject := STRSUBSTNO(text004, "Request No.");
                            CreateEmailBody("Request No.", Text014, Addressee);
                            SendEmail(ToName, Subject, EmailBody, '', CCName);

                        END;
                END;
            end;
        }
        field(28; "1st Approval Time"; DateTime)
        {
        }
        field(29; "1st Approval's Comment"; Boolean)
        {
        }
        field(30; "2nd Approver"; Text[50])
        {
        }
        field(31; "2nd Approval Status"; Option)
        {
            OptionCaption = ' ,On hold,Approved,Rejected';
            OptionMembers = " ","On hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", TRUE);
                TESTFIELD("1st Approval Status", 2);

                UserSetup4.GET(USERID);

                IF "2nd Approval" = "Final Approval" THEN
                    ERROR(text009);


                IF "2nd Approval Status" = "2nd Approval Status"::Approved THEN BEGIN
                    IF UserSetup.GET("Final Approval") THEN BEGIN
                        "2nd Approval Time" := CURRENTDATETIME;
                        "Current Pending Person" := "Final Approval";
                        ToName := UserSetup."E-Mail";
                        CCName := 'lawal@toyotanigeria.com;kolawole@toyotanigeria.com';
                        subject := STRSUBSTNO(text007, "Request No.");
                        Addressee := UserSetup2.Initials;

                        UserSetup2.GET(USERID);
                        SenderName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text007, "Request No.");
                        CreateEmailBody("Request No.", Text015, Addressee);
                        SendEmail(ToName, Subject, EmailBody, '', '');


                    END;
                END;

                CASE "2nd Approval Status" OF
                    "2nd Approval Status"::Rejected:
                        BEGIN
                            "2nd Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            ToName := UserSetup2."E-Mail";
                            CCName := 'lawal@toyotanigeria.com;kolawole@toyotanigeria.com';
                            subject := STRSUBSTNO(text003, "Request No.");
                            Addressee := UserSetup2.Initials;

                            UserSetup.GET(USERID);
                            SenderName := UserSetup.Initials;
                            SenderAddress := UserSetup."E-Mail";

                            "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your pool car request has been rejected.' + CRLF + CRLF + CRLF +
                            'Regards,' + CRLF + CRLF + SenderName;

                            Subject := STRSUBSTNO(text003, "Request No.");
                            CreateEmailBody("Request No.", Text013, Addressee);
                            SendEmail(ToName, Subject, EmailBody, '', '');


                        END;

                    "2nd Approval Status"::"On hold":
                        BEGIN
                            "2nd Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            ToName := UserSetup2."E-Mail";
                            CCName := 'lawal@toyotanigeria.com;kolawole@toyotanigeria.com';
                            subject := STRSUBSTNO(text004, "Request No.");
                            Addressee := UserSetup2.Initials;

                            UserSetup.GET(USERID);
                            SenderName := UserSetup.Initials;
                            SenderAddress := UserSetup."E-Mail";

                            Subject := STRSUBSTNO(text004, "Request No.");
                            CreateEmailBody("Request No.", Text014, Addressee);
                            SendEmail(ToName, Subject, EmailBody, '', '');


                        END;
                END;
            end;
        }
        field(32; "2nd Approval Time"; DateTime)
        {
        }
        field(33; "2nd Approval's Comment"; Boolean)
        {
        }
        field(34; Treated; Boolean)
        {
        }
        field(35; Sender; Text[50])
        {
        }
        field(36; "Sent Time"; DateTime)
        {
        }
        field(46; "Drivers Phone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(48; "No. Of Passenger"; Text[30])
        {
        }
        field(50; "Current Pending Person"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(51; "Mail Body"; Text[250])
        {
        }
        field(52; Hours; Duration)
        {
        }
        field(53; Days; Duration)
        {
        }
        field(54; Employee; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(55; "Final Approval"; Code[50])
        {
            TableRelation = "User Setup"."User ID" WHERE("Final Approval" = const(true));

            trigger OnValidate()
            begin
                IF UserSetup.GET("Final Approval") THEN BEGIN
                    "Final Approver" := UserSetup.Name;
                    "Current Pending Person" := '';
                END;
            end;
        }
        field(56; "Final Approver"; Text[50])
        {
        }
        field(59; "Pickup Time"; Time)
        {
        }
        field(60; "Return Time"; Time)
        {

            trigger OnValidate()
            begin
                IF "Return Time" < "Pickup Time" THEN
                    ERROR('Return Time Cannot be greater than Pickup time');
                Hours := ROUND(("Return Date" - "Pickup Date") + ("Return Time" - "Pickup Time"), 1000 * 60);
            end;
        }
        field(61; Reason; Text[70])
        {
        }
        field(62; "Take-off Location"; Option)
        {
            OptionCaption = ' ,Head Office,Oregun,Isolo';
            OptionMembers = " ","Head Office",Oregun,Isolo;
        }
        field(63; Reject; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD("Request No.");
        
        UserSetup.get(USERID);
        if not UserSetup."System Admin" then
            ERROR('You cannot delete this record. Please contact your system administrator!');
    end;

    trigger OnInsert()
    begin
        HRSetup.GET;
        IF "Request No." = '' THEN BEGIN
            HRSetup.TESTFIELD(HRSetup."Pool Car Nos.");
            "Request No." := NoSeriesMgt.GetNextNo(HRSetup."Pool Car Nos.");
            //NoSeriesMgt.InitSeries(HRSetup."Pool Car Nos.", HRSetup."Pool Car Nos.", 0D, "Request No.", HRSetup."Pool Car Nos.");
            PoolCarReg.SETFILTER(PoolCarReg."Request No.", '<>%1', '');
            PoolCarReg.SETRANGE(PoolCarReg."Send for Approval", FALSE);
            PoolCarReg.SETRANGE(PoolCarReg.Requester, USERID);
            IF PoolCarReg.FindFirst() THEN
                ERROR('Created Pool Car No. %1 not used!\New Pool Car cannot be created', PoolCarReg."Request No.");
        END;

        UserSetup.GET(USERID);
        "Entry Date" := TODAY;
        "Requester Name" := UserSetup.Name;
        Requester := UserSetup."User ID";
        "Global Dimension 1 code" := UserSetup.Department;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        PoolCarReg: Record "Pool Car Register";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        EmplyRec: Record Employee;
        PoolCar: Record "Pool Cars";
        text001: Label 'Pool car document %1 requires your approval.';
        text002: Label 'Pool car document %1 has been approved.';
        text003: Label 'Pool car document %1 has been rejected.';
        text004: Label 'Pool car document %1 is on hold.';
        ToName: Text[80];
        CCName: Text[80];
        Attachment: Text[80];
        Opendialog: Boolean;
        Bcc: Text[80];
        subject: Text[100];
        text005: Label 'Return date cannot be earlier than pickup date!';
        text006: Label 'This document needs your approval.';
        text007: Label 'Pool car document %1 requires your allocation of vehicle';
        text008: Label 'This document has been approved, please allocate a vehicle.';
        Period: Duration;
        text009: Label 'The same person cannot approve this request.';
        CRLF: Text[2];
        Body: Text[200];
        UserSetup2: Record "User Setup";
        Addressee: Text[50];
        SenderName: Text[70];
        UserSetup4: Record "User Setup";
        SenderAddress: Text[50];
        EmailBody: Text[1024];
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
        Text010: Label 'Dear %1,';
        Text011: Label 'Regards,';
        Text012: Label 'Kindly approve this pool car request.';
        Text013: Label 'Please note that your pool car request has been rejected.';
        Text014: Label 'Please note that your pool car request is on-hold.';
        Text015: Label 'Kindly allocate a vehicle for this request.';


    procedure CreateEmailBody(DocNo: Code[20]; BodyMsg: Text; RecipientInitials: Text);

    var
    begin

        UserSetup.get(USERID);

        EmailBody := Format(StrSubstNo(Text010, RecipientInitials));
        EmailBody += '<br><br>';
        EmailBody += FORMAT(STRSUBSTNO(BodyMsg, "Request No."));
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;
        EmailBody += '<br><br>';
        EmailBody += 'This is a system generated mail. Please do not reply to this email ID.';

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

