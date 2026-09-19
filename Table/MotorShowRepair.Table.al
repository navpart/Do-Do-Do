table 70026 "Motor Show Repair"
{

    fields
    {
        field(1; "Request No."; Code[20])
        {

            trigger OnValidate()
            begin
                HRSetup.GET;
                IF "Request No." = '' THEN BEGIN
                    HRSetup.Get();
                    HRSetup.TESTFIELD("Motor Show Repair No.");
                    "Request No." := NoSeriesMgt.GetNextNo(HRSetup."Motor Show Repair No.");

                    PoolCarReg.SETFILTER(PoolCarReg."Request No.", '<>%1', '');
                    PoolCarReg.SETRANGE(PoolCarReg."User ID", USERID);
                    IF PoolCarReg.FindFirst() THEN
                        ERROR('Created Request No. %1 not used!\New Request cannot be created', PoolCarReg."Request No.");
                END;
            end;
        }
        field(2; "Entry Date"; Date)
        {
        }
        field(3; "Request Type"; Option)
        {
            OptionCaption = ' ,Servicing,Repair';
            OptionMembers = " ",Servicing,Repair;
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
        field(7; "Global Dimension 1 code"; Code[20])
        {
            Caption = 'Global Dimention 1 code';
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
        field(12; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "1st Approval" = '' THEN
                    ERROR('You need to choose an approver!');

                IF UserSetup.GET("1st Approval") THEN BEGIN
                    Addressee := UserSetup."E-Mail";
                    ToName := UserSetup.Initials;
                    Sender := USERID;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    SenderAddress := 'Alamu@toyotanigeria.com; smo@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    //Addressee  := 'Akintoye@toyotanigeria.com';
                    subject := STRSUBSTNO(text001, "Request No.");

                    /*  WITH TempEmailItem DO BEGIN
                         "Send to" := Addressee;
                         "Send CC" := SenderAddress;
                         "Send BCC" := '';
                         Subject := STRSUBSTNO(text001, "Request No.");

                         CRLF := '';
                         CRLF[1] := 13;
                         CRLF[2] := 10;

                         BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                         BodyStream.WRITETEXT(text020 + ' ' + ToName + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(text021 + ' ' + STRSUBSTNO(text022, "Request No.") + CRLF + CRLF + CRLF +
                         text019 + ' ' + FORMAT(Reason) + CRLF + CRLF +
                         text016 + ' ' + FORMAT("KM Covered") + CRLF + CRLF +
                         text014 + ' ' + FORMAT(Make) + CRLF + CRLF +
                         text015 + ' ' + FORMAT(Model) + CRLF + CRLF +
                         text017 + ' ' + FORMAT("Auto Show Location") + CRLF + CRLF +
                         text018 + CRLF +
                         SenderName);
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                         Body := BodyBlob.Blob;
                         Send(FALSE);
                     END; */
                END;
            end;
        }
        field(13; "1st Approval"; Code[50])
        {
            TableRelation = "User Setup" WHERE("User ID" = FILTER('TOYOTANIGERIA\EOT|TOYOTANIGERIA\BOLAJI|AZUREAD\CODEWARENIGERIA|TOYOTANIGERIA\SHUAIB'));

            trigger OnValidate()
            begin
                IF UserSetup.GET("1st Approval") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(14; "2nd Approval"; Code[50])
        {
            TableRelation = "User Setup" WHERE("User ID" = FILTER('TOYOTANIGERIA\OLUKOYA|TOYOTANIGERIA\BOLAJI|AZUREAD\CODEWARENIGERIA|TOYOTANIGERIA\SHUAIB'));

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval") THEN
                    "2nd Approver" := UserSetup.Name;
            end;
        }
        field(20; Comment; Text[100])
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
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                UserSetup4.GET(USERID);
                //IF UserSetup4."User ID" <>"1st Approval" THEN
                //ERROR('You  do not  have the right to approve this transaction');

                IF "1st Approval Status" = "1st Approval Status"::Approved THEN BEGIN

                    IF UserSetup.GET("2nd Approval") THEN BEGIN
                        "1st Approval Time" := CURRENTDATETIME;
                        "Current Pending Person" := "2nd Approval";
                        ToName := UserSetup."E-Mail";
                        CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                        //CCName := 'bolaji.fasola@codeware.com.ng';
                        subject := STRSUBSTNO(text001, "Request No.");
                        Addressee := UserSetup.Initials;

                        UserSetup2.GET(USERID);
                        SenderName := UserSetup2.Initials;
                        "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Kindly approve this request.' + CRLF + CRLF + CRLF +
                        'Regards,' + CRLF + CRLF + SenderName;

                        //Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);
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

                            "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your request has been rejected.' + CRLF + CRLF + CRLF +
                            'Regards,' + CRLF + CRLF + SenderName;
                            //Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);

                        END;
                    "1st Approval Status"::"On hold":
                        BEGIN
                            "1st Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            ToName := UserSetup2."E-Mail";
                            subject := STRSUBSTNO(text004, "Request No.");
                            Addressee := UserSetup2.Name;

                            UserSetup.GET(USERID);
                            SenderName := UserSetup.Name;

                            "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your request is on-hold.' + CRLF + CRLF + CRLF +
                            'Regards,' + CRLF + CRLF + SenderName;
                            //Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);
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
                // TESTFIELD("1st Approval Status",2);
                //TESTFIELD("Incoming Document Entry No.");

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "2nd Approval Status" = "2nd Approval Status"::Approved THEN BEGIN
                    UserSetup.GET(USERID);
                    "2nd Approver" := UserSetup.Name;
                    "2nd Approval Time" := CURRENTDATETIME;
                    UserSetup2.GET(USERID);
                    Addressee := UserSetup2."E-Mail";
                    ToName := UserSetup2.Initials;
                    Sender := USERID;
                    UserSetup.GET(USERID);
                    SenderName := UserSetup.Initials;
                    SenderAddress := 'odus@toyotanigeria.com; faith@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(TEXT038, "Request No.");

                    /* WITH TempEmailItem DO BEGIN
                        "Send to" := Addressee;
                        "Send CC" := SenderAddress;
                        "Send BCC" := '';
                        Subject := STRSUBSTNO(TEXT038, "Request No.");

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;

                        BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                        BodyStream.WRITETEXT(text029 + ' ' + ToName + ',');
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT038, "Request No.") + CRLF + CRLF + CRLF +
                        text023 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                        text024 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                        text025 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                        text026 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                        text027 + ' ' + Comment + CRLF + CRLF +
                        text018 + CRLF +
                        SenderName);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                        Body := BodyBlob.Blob;
                        Send(FALSE);
                    END; */
                END;


                IF "2nd Approval Status" = "2nd Approval Status"::Rejected THEN BEGIN
                    UserSetup.GET(USERID);
                    "2nd Approver" := UserSetup.Name;
                    "2nd Approval Time" := CURRENTDATETIME;
                    UserSetup2.GET(USERID);
                    Addressee := UserSetup2."E-Mail";
                    ToName := UserSetup2.Initials;
                    Sender := USERID;
                    UserSetup.GET(USERID);
                    SenderName := UserSetup.Initials;
                    SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(TEXT039, "Request No.");

                    /* WITH TempEmailItem DO BEGIN
                        "Send to" := Addressee;
                        "Send CC" := SenderAddress;
                        "Send BCC" := '';
                        Subject := STRSUBSTNO(TEXT039, "Request No.");

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;

                        BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                        BodyStream.WRITETEXT(text029 + ' ' + ToName + ',');
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT039, "Request No.") + CRLF + CRLF + CRLF +
                        text023 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                        text024 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                        text025 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                        text026 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                        text027 + ' ' + Comment + CRLF + CRLF +
                        text018 + CRLF +
                        SenderName);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                        Body := BodyBlob.Blob;
                        Send(FALSE);
                    END; */
                END;

                IF "2nd Approval Status" = "2nd Approval Status"::"On hold" THEN BEGIN
                    UserSetup.GET(USERID);
                    "2nd Approver" := UserSetup.Name;
                    "2nd Approval Time" := CURRENTDATETIME;
                    UserSetup2.GET(USERID);
                    Addressee := UserSetup2."E-Mail";
                    ToName := UserSetup2.Initials;
                    Sender := USERID;
                    UserSetup.GET(USERID);
                    SenderName := UserSetup.Initials;
                    SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(TEXT040, "Request No.");

                    /*  WITH TempEmailItem DO BEGIN
                         "Send to" := Addressee;
                         "Send CC" := SenderAddress;
                         "Send BCC" := '';
                         Subject := STRSUBSTNO(TEXT040, "Request No.");

                         CRLF := '';
                         CRLF[1] := 13;
                         CRLF[2] := 10;

                         BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                         BodyStream.WRITETEXT(text029 + ' ' + ToName + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT040, "Request No.") + CRLF + CRLF + CRLF +
                         text023 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                         text024 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                         text025 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                         text026 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                         text027 + ' ' + Comment + CRLF + CRLF +
                         text018 + CRLF +
                         SenderName);
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                         Body := BodyBlob.Blob;
                         Send(FALSE);
                     END; */
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
            TableRelation = "User Setup"."User ID";

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
        field(64; "Auto Show Location"; Option)
        {
            OptionCaption = ' ,Abuja,Lagos';
            OptionMembers = " ",Abuja,Lagos;
        }
        field(65; Make; Option)
        {
            OptionMembers = " ",Toyota,Nissan,Honda;
        }
        field(66; Model; Option)
        {
            OptionMembers = " ",AVENSIS,CAMRY,COASTER,CONQUEST,COROLLA,"C-SUV",DYNA,FORTUNER,HIACE,HILUX,LANDCRUSER,PRADO,RAV4,RUSH,STARLET,YARIS;
        }
        field(67; "Registration No."; Text[11])
        {
        }
        field(68; "KM Covered"; Decimal)
        {
        }
        field(69; "Reference No."; Text[30])
        {
        }
        field(70; "Responsible Dealer"; Option)
        {
            OptionMembers = " ",ENL,TNL,Others;
        }
        field(71; "Job Done"; Option)
        {
            OptionCaption = ' ,Satisfactory, Not Satisfactory';
            OptionMembers = " ",Satisfactory," Not Satisfactory";

            trigger OnValidate()
            begin
                /*// TESTFIELD("Send for Approval",TRUE);
                // TESTFIELD("1st Approval Status",2);
                
                
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;
                
                
                //IF "Job Done" = "Job Done"::Satisfactory THEN BEGIN
                
                ////IF "2nd Approval Status" = "2nd Approval Status"::Approved THEN BEGIN
                //    "2nd Approval Time" := CURRENTDATETIME;
                //  UserSetup2.GET(Requester);
                //  //ToName  := UserSetup2."E-Mail";
                //   ToName  := 'faith@toyotanigeria.com';
                //    //CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                //    //CCName := 'bolaji.fasola@codeware.com.ng';
                //    subject := STRSUBSTNO(text007,"Request No.");
                //    Addressee := UserSetup.Initials;
                //
                //    UserSetup2.GET(USERID);
                //    SenderName :=  UserSetup2.Initials;
                
                //    "Mail Body" := 'Dear ' + Addressee +',' + CRLF + CRLF + 'Kindly note that this motor show repair order has been completed.' + CRLF + CRLF + CRLF +
                //     'Please process the payment.' + CRLF + CRLF + CRLF +
                //    'Regards,' + CRLF + CRLF + SenderName;
                //    Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);
                
                IF "Related Job" = "Related Job"::Insurance THEN BEGIN
                
                      UserSetup2.GET("1st Approval");
                
                  ToName  :='faith@toyotanigeria.com';
                  CCName  :='lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                   // CCName := 'abdulsalaamsola@gmail.com';
                    subject := STRSUBSTNO(text010,"Request No.");
                    Addressee := UserSetup2.Initials;
                
                    UserSetup.GET(USERID);
                    SenderName :=UserSetup.Initials;
                  "Job Done Id" := UserSetup."User ID";
                  "Job Done Name" :=  UserSetup.Name;
                  "Job Done Time" :=  CURRENTDATETIME;
                
                    Body := 'Dear ' + Addressee + ',' + CRLF + CRLF +
                    'Please note that the repair has been completed.' + CRLF + CRLF + CRLF +
                    'Kindly Proceed to process the payment' + CRLF + CRLF + CRLF +
                    'Regards,' + CRLF + CRLF +
                    SenderName;
                    Mail.NewMessage(ToName,CCName,Bcc,subject,Body,Attachment,TRUE);
                
                
                
                
                END ELSE
                IF "Related Job" = "Related Job"::Warranty THEN BEGIN
                
                        UserSetup2.GET("1st Approval");
                
                  ToName  := 'odus@toyotanigeria.com';
                  CCName  :='lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                
                   // CCName := 'basit.abdulsalam@codeware.com.ng';
                    subject := STRSUBSTNO(text010,"Request No.");
                    Addressee := UserSetup2.Initials;
                
                    UserSetup.GET(USERID);
                    SenderName :=UserSetup.Initials;
                  "Job Done Id" := UserSetup."User ID";
                  "Job Done Name" :=  UserSetup.Name;
                  "Job Done Time" :=  CURRENTDATETIME;
                
                    "Mail Body" := 'Dear ' + Addressee +',' + CRLF + CRLF +
                      'Please note that the repair has been completed.' + CRLF + CRLF + CRLF +
                      'Kindly Proceed to process the payment' + CRLF + CRLF + CRLF +
                    'Regards,' + CRLF + CRLF +
                    SenderName;
                    Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);
                END;
                */

            end;
        }
        field(72; "Payment Approver"; Text[50])
        {
        }
        field(73; "Payment Approval Status"; Option)
        {
            OptionCaption = ' ,On hold,Approved,Rejected';
            OptionMembers = " ","On hold",Approved,Rejected;

            trigger OnLookup()
            begin
                TESTFIELD("Send for Payment Approval", TRUE);
            end;
        }
        field(74; "Payment Approval Time"; DateTime)
        {
        }
        field(76; "Payment Approval"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("Payment Approval") THEN
                    "Payment Approver" := UserSetup.Name;
            end;
        }
        field(77; "Send for Payment Approval"; Boolean)
        {

            trigger OnValidate()
            begin

                /* CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "Related Job" = "Related Job"::Insurance THEN BEGIN
                    UserSetup4.GET(USERID);

                    IF UserSetupRec.GET(USERID) THEN BEGIN
                        "Payment Approval" := UserSetupRec."User ID";
                        "Payment Approval Time" := CURRENTDATETIME;
                    END;
                    UserSetup2.GET(Requester);
                    ToName := UserSetup2."E-Mail";
                    CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                    //CCName := 'abdulsalaamsola@gmail.com';
                    subject := STRSUBSTNO(text007, "Request No.");
                    Addressee := UserSetup.Name;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Name;
                    "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your request has been approved.' + CRLF + CRLF + CRLF +
                    'Regards,' + CRLF + CRLF + SenderName;
                    Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);
                END ELSE
                    IF "Related Job" = "Related Job"::Warranty THEN BEGIN
                        UserSetup4.GET(USERID);
                        IF UserSetupRec.GET(USERID) THEN BEGIN
                            "Payment Approval" := UserSetupRec."User ID";
                            "Payment Approval Time" := CURRENTDATETIME;
                        END;
                        UserSetup2.GET(Requester);
                        ToName := UserSetup2."E-Mail";
                        CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                        //CCName := 'basit.abdulsalam@codeware.com.ng';
                        subject := STRSUBSTNO(text007, "Request No.");
                        Addressee := UserSetup.Name;

                        UserSetup2.GET(USERID);
                        SenderName := UserSetup2.Name;

                        "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that your request has been approved.' + CRLF + CRLF + CRLF +
                        'Regards,' + CRLF + CRLF + SenderName;
                        Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);
                    END; */
            end;
        }
        field(78; "Sent Payment Approval Time"; DateTime)
        {
        }
        field(79; "Payment Confirmed"; Boolean)
        {
        }
        field(80; "Related Job"; Option)
        {
            OptionCaption = ' ,Warranty,Insurance';
            OptionMembers = " ",Warranty,Insurance;
        }
        field(81; "3rd Approval"; Code[50])
        {
        }
        field(82; "3rd Approver"; Text[50])
        {
        }
        field(83; "3rd Approval Status"; Option)
        {
            OptionCaption = ' ,On hold,Approved,Rejected';
            OptionMembers = " ","On hold",Approved,Rejected;
        }
        field(84; "3rd Approval Time"; DateTime)
        {
        }
        field(85; "3rd Approval Comment"; Boolean)
        {
        }
        field(86; "Job Done Time"; DateTime)
        {
        }
        field(87; "Job Done Id"; Code[50])
        {

            trigger OnValidate()
            begin
                UserSetup4.GET(USERID);
                "Job Done Name" := UserSetup4."User ID";
                "Job Done Time" := CURRENTDATETIME;
            end;
        }
        field(88; "Job Done Name"; Text[100])
        {
        }
        field(89; Close; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                UserSetupRec.GET(USERID);
                "Job Closing Officer" := UserSetupRec."User ID";

                "Close Date" := CURRENTDATETIME;
            end;
        }
        field(90; "Job Closing Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(91; "Close Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(93; URL; Text[250])
        {
        }
        field(94; URL1; Text[250])
        {
        }
        field(95; "Incoming Document Entry No.1"; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IF Description1 = '' THEN
                    Description1 := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description1));
            end;
        }
        field(96; Description1; Text[100])
        {
        }
        field(97; "Items Value"; Decimal)
        {
        }
        field(98; "Labour Value"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Amount" := ("Items Value" + "Labour Value" + "VAT Amount");
                MODIFY;
            end;
        }
        field(99; "Total Amount"; Decimal)
        {
        }
        field(100; "Admin Comment"; Text[200])
        {
        }
        field(101; "Send Attach File"; Boolean)
        {

            trigger OnValidate()
            begin

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;


                IF "Send Attach File" = TRUE THEN BEGIN
                    UserSetup2.GET(Requester);
                    Sender := USERID;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    Addressee := 'eot@toyotanigeria.com; Alamu@toyotanigeria.com';
                    SenderAddress := 'smo@toyotanigeria.com;odus@toyotanigeria.com;faith@toyotanigeria.com';
                    "Estimate Sender ID" := UserSetup2."User ID";
                    "Estimate Sender Name" := UserSetup2.Name;
                    "Estimate Sender Time" := CURRENTDATETIME;
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(text012, "Request No.");

                    /*   WITH TempEmailItem DO BEGIN
                          "Send to" := Addressee;
                          "Send CC" := SenderAddress;
                          "Send BCC" := '';
                          Subject := STRSUBSTNO(text012, "Request No.");

                          CRLF := '';
                          CRLF[1] := 13;
                          CRLF[2] := 10;

                          BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                          BodyStream.WRITETEXT(text020);
                          BodyStream.WRITETEXT(CRLF + CRLF);
                          BodyStream.WRITETEXT(STRSUBSTNO(text028, "Request No.") + CRLF + CRLF + CRLF +
                          text023 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                          text024 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                          text025 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                          text026 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                          text027 + ' ' + Comment + CRLF + CRLF +
                          text018 + CRLF +
                          SenderName);
                          BodyStream.WRITETEXT(CRLF + CRLF);
                          BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                          Body := BodyBlob.Blob;
                          Send(FALSE);
                      END; */
                END;
            end;
        }
        field(102; "Send Attach Time"; DateTime)
        {
        }
        field(103; "Send Attach Name"; Text[100])
        {
        }
        field(104; "Send Attach ID"; Code[50])
        {
        }
        field(105; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description));
            end;
        }
        field(106; Description; Text[50])
        {
        }
        field(107; "Estimate Sender Time"; DateTime)
        {
        }
        field(108; "Estimate Sender Name"; Text[100])
        {
        }
        field(109; "Estimate Sender ID"; Code[50])
        {
        }
        field(110; "Send Estimate"; Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD("Incoming Document Entry No.1");

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "Send Estimate" = TRUE THEN BEGIN
                    //UserSetup2.GET(Requester);
                    Sender := USERID;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    Addressee := 'eot@toyotanigeria.com; Alamu@toyotanigeria.com';
                    SenderAddress := 'odus@toyotanigeria.com;faith@toyotanigeria.com';
                    "Estimate Sender ID" := UserSetup2."User ID";
                    "Estimate Sender Name" := UserSetup2.Name;
                    "Estimate Sender Time" := CURRENTDATETIME;
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(TEXT041, "Request No.");

                    /* WITH TempEmailItem DO BEGIN
                        "Send to" := Addressee;
                        "Send CC" := SenderAddress;
                        "Send BCC" := '';
                        Subject := STRSUBSTNO(TEXT041, "Request No.");

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;

                        BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                        BodyStream.WRITETEXT(text020);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(text045 + ' ' + STRSUBSTNO(TEXT042, "Request No.") + CRLF + CRLF + CRLF +
                        text018 + CRLF +
                        SenderName);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                        Body := BodyBlob.Blob;
                        Send(FALSE);
                    END; */
                END;
            end;
        }
        field(111; "Invoice Received"; Boolean)
        {

            trigger OnValidate()
            begin

                TESTFIELD("Send Estimate", TRUE);

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;


                IF "Invoice Received" = TRUE THEN BEGIN
                    UserSetup2.GET(Requester);
                    Addressee := UserSetup2.Name;
                    ToName := UserSetup2.Initials;
                    UserSetup.GET(USERID);
                    "Collector Id" := UserSetup."User ID";
                    "Collector Name" := UserSetup.Name;
                    "Collection Time" := CURRENTDATETIME;
                    SenderName := UserSetup.Name;
                    SenderAddress := 'odus@toyotanigeria.com;faith@toyotanigeria.com;Onimisi@toyotanigeria.com';

                    /*        WITH TempEmailItem DO BEGIN
                               "Send to" := Addressee;
                               "Send CC" := SenderAddress;
                               "Send BCC" := '';
                               Subject := STRSUBSTNO(TEXT044, "Request No.");

                               CRLF := '';
                               CRLF[1] := 13;
                               CRLF[2] := 10;

                               BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                               BodyStream.WRITETEXT(text029 + ' ' + ToName + ',');
                               BodyStream.WRITETEXT(CRLF + CRLF);
                               BodyStream.WRITETEXT(text045 + ' ' + STRSUBSTNO(text046, "Request No.") + CRLF + CRLF + CRLF +
                               text018 + CRLF +
                               SenderName);
                               BodyStream.WRITETEXT(CRLF + CRLF);
                               BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                               Body := BodyBlob.Blob;
                               Send(FALSE);
                           END; */
                END;
            end;
        }
        field(112; "Collector Id"; Code[50])
        {
        }
        field(113; "Collector Name"; Text[100])
        {
        }
        field(114; "Collection Time"; DateTime)
        {
        }
        field(115; "VAT Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Amount" := ("Items Value" + "Labour Value" + "VAT Amount");
                MODIFY;
            end;
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
        //TESTFIELD("Request No.");
        //ERROR('Kindly contact your System Administrator');
    end;

    trigger OnInsert()
    begin
        HRSetup.GET;
        IF "Request No." = '' THEN BEGIN
            HRSetup.TESTFIELD("Motor Show Repair No.");
            "Request No." := NoSeriesMgt.GetNextNo(HRSetup."Motor Show Repair No.");
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
        text001: Label 'Motor Show Repair  ''%1''  requires your approval';
        text002: Label 'Motor Show Repair ''%1'' has been approved';
        text003: Label 'Motor Show Repair ''%1'' has been rejected';
        text004: Label 'Motor Show Repair ''%1'' is on hold';
        //Mail: Codeunit Mail;
        ToName: Text[80];
        CCName: Text[300];
        Attachment: Text[80];
        Opendialog: Boolean;
        Bcc: Text[100];
        subject: Text[100];
        text005: Label 'Return date cannot be earlier than pickup date!';
        text006: Label 'This document needs your approval.';
        text007: Label 'This document  ''%1''  requires your Attention';
        text008: Label 'This document has been approved.';
        Period: Duration;
        text009: Label 'The same person cannot approve this request.';
        CRLF: Text[2];
        Body: Text[300];
        UserSetup2: Record "User Setup";
        Addressee: Text[50];
        SenderName: Text[70];
        UserSetup4: Record "User Setup";
        WorkOrder: Record "TNL Work Order";
        text010: Label 'Motor Show Repair Order    ''%1''  ';
        UserSetupRec: Record "User Setup";
        IncomingDoc: Record "Incoming Document";
        IncomingDoc1: Record "Incoming Document";
        Items_Value: Text[20];
        Labour_Value: Text[20];
        MakeTxt: Text[20];
        modelTxt: Text[20];
        KilometerCovTxt: Text[20];
        ShowLocatnTxt: Text[20];
        Total_Amount: Text[20];
        Relate_Job: Text[20];
        text012: Label 'Motor Show Repair Document ''%1'' dealer estimate sent for approval';
        text013: Label 'Motor Show Repair Document ''%1'' dealer estimate has been confirmed ';
        text014: Label 'Make :';
        text015: Label 'Model :';
        text016: Label 'KM Covered :';
        text017: Label 'Auto Show Location :';
        text018: Label 'Regards,';
        text019: Label 'Reason :';
        text020: Label 'Dear Sir,';
        text021: Label 'Kindly approve this motor show repair order ';
        text022: Label 'document ''%1''.';
        SenderAddress: Text[200];
        //EmailBody: Record "99008535";
        BodyTxt: Text;
        //BodyBlob: Record "99008535";
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
        text023: Label 'Items not in TNL Inventory';
        text024: Label 'Labour Value :';
        text025: Label 'VAT Amount :';
        text026: Label 'Total Amount :';
        text027: Label 'Comment :';
        text028: Label '''Please confirm the estimate for Motor Show Repair Order ''%1'' received from the Dealer for the repair job to start.''';
        TEXT038: Label 'Motor Show Repair Document ''%1'' estimate has been approved';
        TEXT039: Label 'Motor Show Repair Document ''%1'' estimate has been rejected';
        TEXT040: Label 'Motor Show Repair Document ''%1'' estimate has been placed on-hold';
        TEXT041: Label 'Invoice for motor show repair Document ''%1'' sent for payment process';
        TEXT042: Label 'dealer invoice for Document ''%1''  attached for the repair of motor show repairs.';
        TEXT043: Label 'VAT 7.5% :';
        TEXT044: Label 'Motor Show Repair Document ''%1'' Invoice has been received';
        text045: Label 'Please note that the invoice for';
        text046: Label 'Work Order Document ''%1'' has been received at the head office and the payment process will start soon for payment.';
        text031: Label 'Please note that your request for';
        text029: Label 'Dear';

    procedure GetIncomingDocumentURL(): Text[1000]
    var
        IncomingDocument: Record "Incoming Document";
    begin
        IF "Incoming Document Entry No." = 0 THEN
            EXIT('');

        IncomingDocument.GET("Incoming Document Entry No.");
        EXIT(IncomingDocument.GetURL);
    end;

    procedure GetIncomingDocumentURL1(): Text[1000]
    var
        IncomingDocument2: Record "Incoming Document";
    begin
        IF "Incoming Document Entry No.1" = 0 THEN
            EXIT('');

        IncomingDocument2.GET("Incoming Document Entry No.1");
        EXIT(IncomingDocument2.GetURL);
    end;
}

