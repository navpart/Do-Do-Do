table 70027 "Change Management"
{

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(2; "Requesters Name"; Code[50])
        {
            TableRelation = Employee."Last Name";
        }
        field(3; "Requesters Location"; Text[30])
        {
        }
        field(4; Designation; Text[50])
        {
        }
        field(5; "Request Type"; Option)
        {
            OptionCaption = ',,New,Modification';
            OptionMembers = ,,New,Modification;
        }
        field(6; "Request Category"; Option)
        {
            OptionCaption = ',,NAV Report,NAV Module,NAV Page,TDMS Portal,Website,Others';
            OptionMembers = ,,"NAV Report","NAV Module","NAV Page","TDMS Portal",Website,Others;
        }
        field(7; Description; Text[100])
        {
        }
        field(8; "Previous Mthd Used"; Text[30])
        {
        }
        field(9; Justififcation; Text[100])
        {
        }
        field(10; "Request Objective"; Text[50])
        {
        }
        field(11; "Benefit to TNL"; Text[30])
        {
        }
        field(12; "Requetsers Hod Name"; Code[30])
        {
        }
        field(13; Status; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                // IF "Head of Department" <> "Head of Department"::Approved THEN
                //  ERROR(Text040);
                // IF "Head of Audit" <> "Head of Audit"::Approved THEN
                //  ERROR(Text041);
                // IF ("General Manager" <> "General Manager"::Approved) AND
                //  ("MDs Status" <> "MDs Status"::Approved) THEN
                //  ERROR(Text042);

                /*  CRLF := '';
                 CRLF[1] := 13;
                 CRLF[2] := 10;

                 IF Status = Status::Approved THEN BEGIN
                     UserSetup.GET("Send To");
                     IF UserSetup."User ID" <> "Send To" THEN
                         ERROR(Text040);
                     ToAddresses := 'adewumi@toyotanigeria.com';
                     CcAddresses := 'agbesua@toyotanigeria.com;';
                     BccAddresses := '';
                     Subject := STRSUBSTNO(Text013, "No.");
                     UserSetup4.GET(USERID);
                     SendersName := UserSetup4.Initials;
                     "Requetsers Hod Name" := UserSetup4.Name;
                     SenderAddress := UserSetup4."E-Mail";
                     "Date Hod" := CURRENTDATETIME;
                     Body := Text025 + 'STA,' +
                     CRLF + CRLF + STRSUBSTNO(Text037, "No.") + CRLF + CRLF + CRLF +
                     Text029 + FORMAT("Request Type") + CRLF +
                     Text030 + FORMAT(Description) + CRLF +
                     Text027 + CRLF + CRLF + SendersName;
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END;
                 END;

                 IF Status = Status::"On-hold" THEN BEGIN
                     UserSetup.GET("User ID");
                     ToAddresses := UserSetup."E-Mail";
                     Addressee := UserSetup.Name;
                     CcAddresses := '';
                     BccAddresses := '';
                     Subject := STRSUBSTNO(Text017, "No.");

                     UserSetup4.GET(USERID);
                     SendersName := UserSetup4.Initials;
                     "Requetsers Hod Name" := UserSetup4.Name;
                     SenderAddress := UserSetup4."E-Mail";
                     "Date Hod" := CURRENTDATETIME;
                     Body := Text025 + UserSetup.Initials + ',' + CRLF + CRLF +
                     STRSUBSTNO(Text033, "No.") + CRLF + CRLF + CRLF +
                     Text029 + FORMAT("Request Type") + CRLF +
                     Text030 + FORMAT(Description) + CRLF +
                     Text027 + CRLF + CRLF + SendersName;
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END;
                 END;

                 IF Status = Status::Rejected THEN BEGIN
                     UserSetup.GET("User ID");
                     ToAddresses := UserSetup."E-Mail";
                     Addressee := UserSetup.Name;
                     CcAddresses := '';
                     BccAddresses := '';
                     Subject := STRSUBSTNO(Text018, "No.");
                     UserSetup4.GET(USERID);
                     SendersName := UserSetup4.Initials;
                     "Requetsers Hod Name" := UserSetup4.Name;
                     SenderAddress := UserSetup4."E-Mail";
                     "Date Hod" := CURRENTDATETIME;

                     Body := Text025 + UserSetup.Initials + ',' + CRLF + CRLF +
                     STRSUBSTNO(Text034, "No.") + CRLF + CRLF + CRLF +
                     Text029 + FORMAT("Request Type") + CRLF +
                     Text030 + FORMAT(Description) + CRLF +
                     Text027 + CRLF + CRLF + SendersName;
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END;
                 END; */
            end;
        }
        field(14; "Date Hod"; DateTime)
        {
        }
        field(15; "HOD Audit Name"; Code[30])
        {
        }
        field(16; "Method of Implementation"; Option)
        {
            OptionCaption = ',,In-House,External Party,Under SLA';
            OptionMembers = ,,"In-House","External Party","Under SLA";
        }
        field(17; Cost; Code[30])
        {
        }
        field(18; "Responsible TNL Staff"; Text[50])
        {
        }
        field(19; Date1; DateTime)
        {
        }
        field(20; Status1; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                //mail to be sent to Accounts for payment
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                UserSetup4.GET(USERID);
                // IF (UserSetup4."User ID" <> 'TOYOTANIGERIA\ADEWUMI')  THEN
                // IF (UserSetup4."User ID" <> 'TOYOTANIGERIA\AGBESUA') THEN
                // ERROR(Text039);

                IF Status1 = Status1::Approved THEN BEGIN
                    ToAddresses := 'dynamics@toyotanigeria.com';
                    CcAddresses := '';
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    Date1 := CURRENTDATETIME;
                    "HOD Audit Name" := UserSetup4.Name;
                    Subject := STRSUBSTNO(Text013, "No.");
                    Body := Text025 + 'Sir,' + CRLF + CRLF +
                    STRSUBSTNO(Text037, "No.") + CRLF + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;



                IF Status1 = Status1::"On-hold" THEN BEGIN
                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text017, "No.");

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    Date1 := CURRENTDATETIME;
                    Body := Text025 + Addressee + ',' + CRLF + CRLF +
                    STRSUBSTNO(Text033, "No.") + CRLF + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;

                IF Status1 = Status1::Rejected THEN BEGIN
                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text018, "No.");

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    Date1 := CURRENTDATETIME;
                    // "HOD Audit Name" := UserSetup.Name;
                    Body := Text025 + Addressee + ',' + CRLF + CRLF +
                    STRSUBSTNO(Text034, "No.") + CRLF + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;

                //IF Status1 = Status1:: Approved THEN BEGIN
                //  UserSetup.GET(USERID);
                //  "HOD Audit Name" := UserSetup.Name;
                //END ELSE  BEGIN
                //  "HOD Audit Name" := '';
                //  MODIFY;
                //END;
            end;
        }
        field(21; "MDs Status"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;
                TESTFIELD(Status1, Status1::Approved);
                UserSetup4.GET(USERID);
                // IF UserSetup4."User ID" <> 'TOYOTANIGERIA\OLAKUNLE' THEN
                //IF UserSetup4."User ID" <> 'TOYOTANIGERIA\BUNMI' THEN
                // IF (UserSetup4."User ID" <> 'TOYOTANIGERIA\OLAKUNLE') AND (UserSetup4."User ID" <> 'TOYOTANIGERIA\BUNMI') THEN
                //  ERROR(Text039);

                IF "MDs Status" = "MDs Status"::Approved THEN BEGIN

                    UserSetup.GET("User ID");
                    UserSetup2.GET("Send To");

                    ToAddresses := 'bolaji@toyotanigeria.com;' + 'joshua@toyotanigeria.com; ';
                    CcAddresses := 'adewumi@toyotanigeria.com; agbesua@toyotanigeria.com' + ';' + UserSetup2."E-Mail" + UserSetup."E-Mail";
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text010, "No.");
                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    SenderAddress := UserSetup4."E-Mail";
                    "MDS Date" := CURRENTDATETIME;

                    Body := Text025 + UserSetup.Initials + ';' + CRLF + CRLF +
                    STRSUBSTNO(Text036, "No.") + CRLF + CRLF +
                      Text029 + FORMAT("Request Type") + CRLF +
                   Text027 + CRLF + CRLF + SendersName;
                    /*  IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END; */
                END;

                IF "MDs Status" = "MDs Status"::"On-hold" THEN BEGIN
                    UserSetup.GET("User ID");
                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := PurchSetup."Audit Dept. Approvers" + ';' + UserSetup2."E-Mail";
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text017, "No.");
                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    SenderAddress := UserSetup4.Initials;
                    //"MDS Date":= CURRENTDATETIME;
                    Body := Text025 + UserSetup.Initials + CRLF + CRLF +
                    STRSUBSTNO(Text033, "No.") + CRLF + CRLF + CRLF +
                      Text029 + FORMAT("Request Type") + CRLF +
                      Text030 + FORMAT(Description) + CRLF +
                  Text027 + CRLF + CRLF + SendersName;
                    /*  IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END; */
                END;

                IF "MDs Status" = "MDs Status"::Rejected THEN BEGIN
                    UserSetup.GET("User ID");
                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := PurchSetup."Audit Dept. Approvers" + ';' + UserSetup2."E-Mail";
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text018, "No.");
                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    SenderAddress := UserSetup4."E-Mail";
                    // "MDS Date" := CURRENTDATETIME;

                    Body := Text025 + UserSetup.Initials + CRLF + CRLF +
                    STRSUBSTNO(Text034, "No.") + CRLF + CRLF + CRLF +
                      Text029 + FORMAT("Request Type") + CRLF +
                      Text030 + FORMAT(Description) + CRLF +
                      Text027 + CRLF + CRLF + SendersName;
                    /*    IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                           Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                       IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                           SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                           SMTPMail.Send;
                           MESSAGE(Text032);

                       END; */
                END;
            end;
        }
        field(22; "MDS Date"; DateTime)
        {
        }
        field(23; "Implemented By"; Text[30])
        {
        }
        field(24; "No of Days"; Integer)
        {

            trigger OnValidate()
            begin
                "Completion Date" := "Start Date" + "No of Days";
            end;
        }
        field(25; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                "Completion Date" := "Start Date" + "No of Days";
            end;
        }
        field(26; "Completion Date"; Date)
        {

            trigger OnValidate()
            begin
                "Completion Date" := "Start Date" + "No of Days";
            end;
        }
        field(27; "Tested By"; Text[30])
        {
        }
        field(28; "Reqster Test Date"; DateTime)
        {
        }
        field(29; "Reqster Assessment"; Option)
        {
            OptionCaption = ', ,Satisfactory,UnSatisfactory';
            OptionMembers = ," ",Satisfactory,UnSatisfactory;

            trigger OnValidate()
            begin

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;



                IF "Reqster Assessment" = "Reqster Assessment"::Satisfactory THEN BEGIN
                    ToAddresses := 'bolaji@toyotanigeria.com';
                    CcAddresses := 'joshua@toyotanigeria.com';
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    "Reqster Test Date" := CURRENTDATETIME;
                    "Assessment  By" := UserSetup4.Name;

                    Subject := STRSUBSTNO(Text013, "No.");
                    Body := Text025 + 'Sir,' + CRLF + CRLF +
                    STRSUBSTNO(Text059, "No.") + CRLF + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;

                IF "Reqster Assessment" = "Reqster Assessment"::UnSatisfactory THEN BEGIN
                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text017, "No.");

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    "Reqster Test Date" := CURRENTDATETIME;
                    "Assessment  By" := UserSetup.Name;
                    Body := Text025 + Addressee + ',' + CRLF +
                    STRSUBSTNO(Text060, "No.") + CRLF +
                    Text061 + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /*  IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                         Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                     IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                         SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                         SMTPMail.Send;
                         MESSAGE(Text032);
                     END; */
                END;
            end;
        }
        field(30; "Requester Sign Date"; DateTime)
        {
        }
        field(31; "Go live Date"; DateTime)
        {
        }
        field(32; "Reviewed By"; Text[30])
        {
        }
        field(33; "Post Date"; DateTime)
        {
        }
        field(34; "Send To"; Code[30])
        {
            TableRelation = "Head of Department"."Head of Department" WHERE("Department Code" = FIELD("Requesters Location"));
        }
        field(35; Send; Boolean)
        {

            trigger OnValidate()
            begin
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;
                IF Send = TRUE THEN BEGIN
                    UserSetup2.GET(USERID);
                    // "Requester Code" := UserSetup2."User ID";
                    SendersName := "Requesters Name";
                    SenderAddress := UserSetup2."E-Mail";
                    UserSetup.GET("Send To");
                    ToAddresses := UserSetup."E-Mail2";
                    Addressee := UserSetup.Initials;
                    SendTime := CURRENTDATETIME;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text007, "No.");
                    Body := Text025 + Addressee + ',' +
                    CRLF + CRLF + STRSUBSTNO(Text026, "No.") +
                    CRLF + CRLF + CRLF + Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;
            end;
        }
        field(36; "User ID"; Code[30])
        {
        }
        field(37; "Department Code"; Code[10])
        {
        }
        field(38; "Requester Code"; Code[30])
        {

            trigger OnValidate()
            begin
                //IF Employee.GET("Requester Code") THEN BEGIN
                //"Requesters Name" := Employee."First Name" + ' ' + Employee."Last Name";
                //"Department Code" := Employee."Global Dimension 1 Code";
                //END;
            end;
        }
        field(39; "No. Series"; Code[10])
        {
        }
        field(40; Date; DateTime)
        {
        }
        field(43; "Sent By"; Code[30])
        {
        }
        field(44; SendTime; DateTime)
        {
        }
        field(45; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document" WHERE(Status = FILTER(New | Released));

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description));
            end;
        }
        field(46; "Reviewed Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Reviewed Confirmation" = TRUE THEN BEGIN
                    UserSetup.GET(USERID);
                    "Post Date" := CURRENTDATETIME;
                    "Reviewed By" := UserSetup.Name
                END;
            end;
        }
        field(47; "Test Confirmation"; Boolean)
        {
        }
        field(48; "Assessment  By"; Text[30])
        {
        }
        field(49; "Requester Sign-off Con."; Boolean)
        {

            trigger OnValidate()
            begin

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "Requester Sign-off Con." = TRUE THEN BEGIN

                    UserSetup.GET(USERID);
                    IF UserSetup."User ID" <> "User ID" THEN
                        ERROR(Text063);


                    ToAddresses := 'bolaji@toyotanigeria.com';
                    CcAddresses := 'joshua@toyotanigeria.com';
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "HOD Audit Name" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    "Requester Sign Date" := CURRENTDATETIME;
                    "Sign-Off Name" := UserSetup4.Name;

                    Subject := STRSUBSTNO(Text013, "No.");
                    Body := Text025 + 'Sir,' + CRLF + CRLF +
                    STRSUBSTNO(Text062, "No.") + CRLF + CRLF + CRLF +
                    Text029 + FORMAT("Request Type") + CRLF +
                    Text030 + FORMAT(Description) + CRLF +
                    Text027 + CRLF + CRLF + SendersName;
                    /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                        Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                        SMTPMail.CreateMessage(SendersName, SenderAddress, ToAddresses, Subject, Body, TRUE);
                        SMTPMail.Send;
                        MESSAGE(Text032);
                    END; */
                END;
            end;
        }
        field(50; "Sign-Off Name"; Text[30])
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
            PurchSetup.TESTFIELD("Change Mangment No");
            Rec."No. Series" := PurchSetup."Change Mangment No";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");

        END;

        UserSetup.GET(USERID);
        Date := CURRENTDATETIME;
        "Requesters Name" := UserSetup.Name;
        "Requester Code" := UserSetup."Employee No.";
        "User ID" := UserSetup."User ID";
        "Requesters Location" := UserSetup.Department;
        "Department Code" := UserSetup.Department;
        IF Employee.GET("Requester Code") THEN BEGIN
            //"Requesters Name" := Employee."First Name" + ' ' + Employee."Last Name";
            "Department Code" := Employee."Global Dimension 1 Code";
            Designation := Employee.Designation;
        END;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Employee: Record Employee;
        DimValue: Record "Dimension Value";
        //Mail: Codeunit Mail;
        ToAddresses: Text;
        CcAddresses: Text[200];
        BccAddresses: Text[100];
        Subject: Text[70];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup4: Record "User Setup";
        SendersName: Text;
        SenderAddress: Text;
        Addressee: Code[20];
        CRLF: Text[2];
        //SMTPMail: Codeunit "400";
        Text001: Label 'The above Capex Requisition requires your approval.';
        Text002: Label 'This transaction requires 3 quotes!';
        Text003: Label 'adewumi@toyotanigeria.com';
        Text004: Label 'bunmi@toyotanigeria.com';
        Text005: Label 'This capital expenditure has been approved. Prepare an online LPO and send it to your Head of department for necessary approvals.';
        Text006: Label 'This transaction has been approved. Prepare an IOU and send it for necessary approvals.';
        Text007: Label '%1  requires your approval for Change Management Request.';
        Text008: Label 'agbesua@toyotanigeria.com';
        Text009: Label 'dynamics@toyotanigeria.com';
        Text010: Label '%1 %2 has been approved.';
        Text011: Label 'A request for payment has been made. Kindly approve.';
        Text012: Label 'This document requires a compliance check and approval for payment.';
        Text013: Label 'Change Management  Request: %1';
        Text014: Label 'Kindly prepare payment for this procurement.';
        Text015: Label 'A payment voucher has been raised.';
        Text016: Label 'The supplier has been fully paid.';
        Text017: Label '%1  is on hold.';
        Text018: Label '%1 has been rejected.';
        Text020: Label 'Compliance Check: %1 ';
        Text021: Label 'Please create an IOU and send it for necessary approvals.';
        Text022: Label 'Kindly approve this 3rd party operationg expense.';
        Text023: Label 'This transaction requires 3 quotes!';
        Text024: Label 'Opex %1 requires your approval.';
        Text025: Label 'Dear ';
        Text026: Label 'The above Request  with document number %1 requires your approval.';
        Text027: Label 'Regards,';
        Text028: Label 'A prefered quote has not been selected!';
        Text029: Label 'Request type: ';
        Text030: Label 'Description: ';
        Text031: Label 'Amount: ';
        Text032: Label 'Mail sent successfully.';
        Text033: Label 'The above Request with document number %1 has been placed on hold.';
        Text034: Label 'The above Request with document number %1 has been rejected.';
        Text035: Label 'Your Request with document number %1 has been approved. You can proceed.';
        Text036: Label 'Your Request with document number %1 has been approved. Proceed to implement the Change.';
        Text037: Label 'Kindly approve the change management request with document number %1 .';
        Text038: Label 'Kindly check the Change Management template for %1 .';
        Text039: Label 'You do not have permission to perform this function. Contact your system administrator.';
        Text040: Label 'Requester''s head of department needs to approve this transaction before you can proceed.';
        Text041: Label 'Head of audit needs to approve this transaction before you can proceed.';
        Text042: Label 'General manager or managing director needs to approve this transaction before you can proceed.';
        Text043: Label 'Requester needs to confirm the service delivery before you can proceed.';
        Text044: Label 'You are not an auditor. Please contact your system administrator.';
        Text045: Label 'Audit needs to confirm the service delivery before you can proceed.';
        Text046: Label 'Requester''s head of department needs to confirm service delivery before you can proceed.';
        Text047: Label ' Payment Request: %1 %2';
        Text048: Label '%1 %2 has been approved for payment. Please check  and proceed for Payment.';
        Text049: Label '%1 %2 requires compliance check.';
        Text050: Label '%1 %2 has been approved for payment. Please proceed with the  payment. ';
        Text051: Label 'Compliance Check: %1 %2 not Satisfactory';
        Text052: Label 'Audit check: %1 %2';
        Text053: Label '%1 %2 Audit  check Not Satisfactory.';
        Text054: Label 'Head of Audit Approval is needed';
        Text055: Label 'Purchase Justification :';
        Text056: Label 'Compliance Check %1 %2 is Satisfactory.Kindly approve the Payment';
        Text057: Label 'Advance Payment :';
        Text058: Label 'Balance :';
        Text059: Label 'The change Management Request %1 Requester Assessment is satisfactory.';
        Text060: Label 'The above change Management Request with document %1 Requester Assessment is Unsatisfactory.';
        Text061: Label 'Reason For Unsatisfactory:__________________________________________________________';
        Text062: Label 'The change Management Request  is Sign-off for deployment';
        Text063: Label 'The requester is the only one that can sign-off the chanagement request!';
}

