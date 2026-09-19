table 70025 "TNL Work Order"
{

    fields
    {
        field(1; "Request No."; Code[20])
        {

            trigger OnValidate()
            begin
                HRSetup.GET;
                IF "Request No." = '' THEN BEGIN
                    HRSetup.TESTFIELD("Work Order No.");
                    "Request No." := NoSeriesMgt.GetNextNo(HRSetup."Work Order No.");

                    //NoSeriesMgt.InitSeries(HRSetup."Work Order No.", HRSetup."Work Order No.", 0D, "Request No.", HRSetup."Work Order No.");
                    PoolCarReg.SETFILTER(PoolCarReg."Request No.", '<>%1', '');
                    PoolCarReg.SETRANGE(PoolCarReg."User ID", USERID);
                    IF PoolCarReg.FIND('-') THEN
                        ERROR('Created Request No. %1 not used!\New Request cannot be created', PoolCarReg."Request No.");
                END;
            end;
        }
        field(2; "Entry Date"; Date)
        {
        }
        field(3; "Request Type"; Option)
        {
            OptionCaption = ' ,Servicing,Repair,B&P,Accidental';
            OptionMembers = " ",Servicing,Repair,"B&P",Accidental;
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

                IF "1st Approval" = '' THEN BEGIN
                    Addressee := UserSetup.Initials;
                    Sender := USERID;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    SenderAddress := 'Alamu@toyotanigeria.com;kolawole@toyotanigeria.com;ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    Addressee := 'Akintoye@toyotanigeria.com';
                    subject := STRSUBSTNO(text001, "Request No.");

                    /*     WITH TempEmailItem DO BEGIN
                            "Send to" := Addressee;
                            "Send CC" := SenderAddress;
                            "Send BCC" := '';
                            Subject := STRSUBSTNO(text001, "Request No.");

                            CRLF := '';
                            CRLF[1] := 13;
                            CRLF[2] := 10;

                            BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                            BodyStream.WRITETEXT(Text013 + ' ' + TEXT029 + ',');
                            BodyStream.WRITETEXT(CRLF + CRLF);
                            BodyStream.WRITETEXT(Text014 + ' ' + STRSUBSTNO(text030, "Request No.") + CRLF + CRLF + CRLF +
                            Text026 + ' ' + FORMAT("Related Job") + CRLF + CRLF +
                            Text027 + ' ' + Reason + CRLF + CRLF +
                            Text015 + ' ' + STRSUBSTNO("Request No.") + CRLF + CRLF +
                            Text017 + ' ' + FORMAT("Request Type") + CRLF + CRLF +
                            Text021 + ' ' + FORMAT("KM Covered") + CRLF + CRLF +
                            Text028 + ' ' + FORMAT(Make) + CRLF + CRLF +
                            Text023 + ' ' + FORMAT(Model) + CRLF + CRLF +
                            Text025 + ' ' + FORMAT("TNL Service Centre") + CRLF + CRLF +
                            Text018 + CRLF +
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
            TableRelation = "User Setup" WHERE("User ID" = FILTER('TOYOTANIGERIA\AKINTOYE|TOYOTANIGERIA\STANLEY'));

            trigger OnValidate()
            begin
                IF UserSetup.GET("1st Approval") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(14; "2nd Approval"; Code[50])
        {

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval") THEN
                    "2nd Approver" := UserSetup.Name;
            end;
        }
        field(15; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";

            trigger OnValidate()
            var
                IncomingDocument: Record 130;
            begin
                IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description));
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


                IF "1st Approval Status" = "1st Approval Status"::Approved THEN BEGIN
                    "1st Approval Time" := CURRENTDATETIME;
                    UserSetup2.GET(Requester);
                    SenderName := UserSetup2.Initials;
                    SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                    "User ID" := USERID;
                    Addressee := UserSetup2."E-Mail";
                    subject := STRSUBSTNO(text002, "Request No.");

                    /*  WITH TempEmailItem DO BEGIN
                         "Send to" := Addressee;
                         "Send CC" := SenderAddress;
                         "Send BCC" := '';
                         Subject := STRSUBSTNO(text002, "Request No.");

                         CRLF := '';
                         CRLF[1] := 13;
                         CRLF[2] := 10;

                         BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                         BodyStream.WRITETEXT(Text013 + ' ' + SenderName + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(text002, "Request No.") + CRLF + CRLF + CRLF +
                         Text018 + CRLF +
                         SenderName);
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                         Body := BodyBlob.Blob;
                         Send(FALSE);
                     END; */
                END;



                CASE "1st Approval Status" OF
                    "1st Approval Status"::Rejected:
                        BEGIN
                            "1st Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            SenderName := UserSetup2.Initials;
                            SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                            "User ID" := USERID;
                            Addressee := UserSetup2."E-Mail";
                            subject := STRSUBSTNO(text003, "Request No.");

                            /*   WITH TempEmailItem DO BEGIN
                                  "Send to" := Addressee;
                                  "Send CC" := SenderAddress;
                                  "Send BCC" := '';
                                  Subject := STRSUBSTNO(text003, "Request No.");

                                  CRLF := '';
                                  CRLF[1] := 13;
                                  CRLF[2] := 10;

                                  BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                                  BodyStream.WRITETEXT(Text013 + ' ' + SenderName + ',');
                                  BodyStream.WRITETEXT(CRLF + CRLF);
                                  BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(text003, "Request No.") + CRLF + CRLF + CRLF +
                                  Text018 + CRLF +
                                  SenderName);
                                  BodyStream.WRITETEXT(CRLF + CRLF);
                                  BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                                  Body := BodyBlob.Blob;
                                  Send(FALSE);
                              END */
                            ;
                        END;


                    "1st Approval Status"::"On hold":
                        BEGIN
                            "1st Approval Time" := CURRENTDATETIME;
                            UserSetup2.GET(Requester);
                            SenderName := UserSetup2.Initials;
                            SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                            "User ID" := USERID;
                            Addressee := UserSetup2."E-Mail";
                            subject := STRSUBSTNO(text004, "Request No.");

                            /*   WITH TempEmailItem DO BEGIN
                                  "Send to" := Addressee;
                                  "Send CC" := SenderAddress;
                                  "Send BCC" := '';
                                  Subject := STRSUBSTNO(text004, "Request No.");

                                  CRLF := '';
                                  CRLF[1] := 13;
                                  CRLF[2] := 10;

                                  BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                                  BodyStream.WRITETEXT(Text013 + ' ' + SenderName + ',');
                                  BodyStream.WRITETEXT(CRLF + CRLF);
                                  BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(text004, "Request No.") + CRLF + CRLF + CRLF +
                                  Text018 + CRLF +
                                  SenderName);
                                  BodyStream.WRITETEXT(CRLF + CRLF);
                                  BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                                  Body := BodyBlob.Blob;
                                  Send(FALSE);
                              END; */
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
                    SenderAddress := 'lawal@toyotanigeria.com;jokojeje@toyotanigeria.com;kolawole@toyotanigeria.com;ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
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
                        BodyStream.WRITETEXT(Text013 + ' ' + ToName + ',');
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT038, "Request No.") + CRLF + CRLF + CRLF +
                        TEXT032 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                        TEXT033 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                        TEXT043 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                        TEXT034 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                        TEXT035 + ' ' + Comment + CRLF + CRLF +
                        Text018 + CRLF +
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
                    SenderAddress := 'lawal@toyotanigeria.com;jokojeje@toyotanigeria.com;kolawole@toyotanigeria.com;ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(TEXT039, "Request No.");

                    /*  WITH TempEmailItem DO BEGIN
                         "Send to" := Addressee;
                         "Send CC" := SenderAddress;
                         "Send BCC" := '';
                         Subject := STRSUBSTNO(TEXT039, "Request No.");

                         CRLF := '';
                         CRLF[1] := 13;
                         CRLF[2] := 10;

                         BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                         BodyStream.WRITETEXT(Text013 + ' ' + ToName + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT039, "Request No.") + CRLF + CRLF + CRLF +
                         TEXT032 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                         TEXT033 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                         TEXT043 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                         TEXT034 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                         TEXT035 + ' ' + Comment + CRLF + CRLF +
                         Text018 + CRLF +
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
                    SenderAddress := 'lawal@toyotanigeria.com;jokojeje@toyotanigeria.com;kolawole@toyotanigeria.com;ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
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
                         BodyStream.WRITETEXT(Text013 + ' ' + ToName + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(text031 + ' ' + STRSUBSTNO(TEXT040, "Request No.") + CRLF + CRLF + CRLF +
                         TEXT032 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                         TEXT033 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                         TEXT043 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                         TEXT034 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                         TEXT035 + ' ' + Comment + CRLF + CRLF +
                         Text018 + CRLF +
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
            TableRelation = "User Setup"."User ID" WHERE("Final Approval" = filter(true));

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
        field(64; "TNL Service Centre"; Option)
        {
            OptionCaption = ' ,Kojo,ENL,Other';
            OptionMembers = " ",Kojo,ENL,Other;
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
        field(70; "Responsible Driver"; Text[50])
        {
        }
        field(71; "Job Done"; Option)
        {
            OptionCaption = ' ,Satisfactory, Not Satisfactory';
            OptionMembers = " ",Satisfactory," Not Satisfactory";

            trigger OnValidate()
            begin
                /*CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;
                
                
                IF "Job Done" = "Job Done"::Satisfactory THEN BEGIN
                  UserSetup2.GET(Requester);
                  ToName  := 'Akintoye@toyotanigeria.com';
                  CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com;kolawole@toyotanigeria.com;ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;odus@toyotanigeria.com';
                  //CCName := 'bolaji.fasola@codeware.com.ng';
                  subject := STRSUBSTNO(text011,"Request No.");
                  Addressee := UserSetup2.Name;
                  UserSetup.GET(USERID);
                  "Job Done Id" := UserSetup."User ID";
                  "Job Done Name" :=  UserSetup.Name;
                  "Job Done Time" :=  CURRENTDATETIME;
                  SenderName :=  UserSetup.Name;
                  "Mail Body" := 'Dear ' +
                  Addressee +',' + CRLF + CRLF + 'Please note that I am satisfied with the job done on the ' + STRSUBSTNO(text010,"Request No.") + ' for the vehicle, The invoice will be sent to the Head office soon.' + CRLF + CRLF + CRLF +
                
                  'Regards,' + CRLF + CRLF + SenderName;
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

            trigger OnValidate()
            begin
                //TESTFIELD("Send for Payment Approval",TRUE);

                //CRLF := '';
                //CRLF[1] := 13;
                //CRLF[2] := 10;
                //
                //     UserSetup4.GET(USERID);
                //IF UserSetup4."User ID" <>"Payment Approval" THEN
                //  ERROR('You  do not  have the right to approve this transaction');
                //
                //IF "Payment Approval Status" = "Payment Approval Status"::Approved THEN BEGIN
                //    "Payment Approval Time" := CURRENTDATETIME;
                //  UserSetup2.GET(Requester);
                //  ToName  := UserSetup2."E-Mail";

                //    //CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                //    CCName := 'bolaji.fasola@codeware.com.ng';
                //    subject := STRSUBSTNO(text007,"Request No.");
                //    Addressee := UserSetup.Name;
                //
                //    UserSetup2.GET(USERID);
                //    SenderName :=  UserSetup2.Name;

                //    "Mail Body" := 'Dear ' + Addressee +',' + CRLF + CRLF + 'Please note that your request has been approved.' + CRLF + CRLF + CRLF +
                //    'Regards,' + CRLF + CRLF + SenderName;
                //    Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);
                //END;
                //CASE "Payment Approval Status" OF
                //"Payment Approval Status"::Rejected:
                //  BEGIN
                //  "Payment Approval Time" := CURRENTDATETIME;
                //  UserSetup2.GET(Requester);
                //  ToName  := UserSetup2."E-Mail";
                //  //CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                //  CCName := 'bolaji.fasola@codeware.com.ng';
                //  subject := STRSUBSTNO(text003,"Request No.");
                //  Addressee := UserSetup2.Name;

                //  UserSetup.GET(USERID);
                //  SenderName :=  UserSetup.Name;

                //  "Mail Body" :='Dear ' + Addressee +',' + CRLF + CRLF + 'Please note that your request has been rejected.' + CRLF + CRLF + CRLF +
                //  'Regards,'+ CRLF + CRLF + SenderName;
                //  Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);

                //  END;
                //"Payment Approval Status"::"On hold":
                //  BEGIN
                //  "Payment Approval Time" := CURRENTDATETIME;
                //  UserSetup2.GET(Requester);
                //  ToName  := UserSetup2."E-Mail";
                //  //CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com';
                //  CCName := 'bolaji.fasola@codeware.com.ng';
                //  subject := STRSUBSTNO(text004,"Request No.");
                //  Addressee := UserSetup2.Name;
                //
                //  UserSetup.GET(USERID);
                //  SenderName :=  UserSetup.Name;

                //  "Mail Body" := 'Dear ' + Addressee +',' + CRLF + CRLF + 'Please note that your request is on-hold.' + CRLF + CRLF + CRLF +
                //  'Regards,'+ CRLF + CRLF + SenderName;
                //  Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);
                //END;
                //END;
            end;
        }
        field(74; "Payment Approval Time"; DateTime)
        {
        }
        field(75; "Payment Approval Comment"; Boolean)
        {
        }
        field(76; "Payment Approval"; Code[50])
        {

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
                //CRLF := '';
                //CRLF[1] := 13;
                //CRLF[2] := 10;

                //IF "Payment Approval" = '' THEN
                //  ERROR('You need to choose an approver!');

                //IF UserSetup.GET("Payment Approval") THEN BEGIN
                //   Addressee := UserSetup.Name;
                //   Sender := USERID;
                //   UserSetup2.GET(USERID);
                //   SenderName :=  UserSetup2.Name;
                //  "Sent Payment Approval Time"  := CURRENTDATETIME;
                //  "User ID" := USERID;
                //  //"Current Pending Person" := "Payment Approval";
                //  ToName  := UserSetup."E-Mail";
                //  subject := STRSUBSTNO(text001,"Request No.");
                //  Body := 'Dear ' + Addressee + ','  + CRLF + CRLF + 'Kindly approve this payment request.' + CRLF + CRLF + CRLF +
                //  'Regards,' + CRLF + CRLF + SenderName;
                //  Mail.NewMessage(ToName,CCName,Bcc,subject,Body,Attachment,TRUE);
                //END;
            end;
        }
        field(78; "Sent Payment Approval Time"; DateTime)
        {
        }
        field(79; "Payment Raised"; Boolean)
        {
        }
        field(80; "Job Done Time"; DateTime)
        {
        }
        field(81; "Job Done Id"; Code[50])
        {
        }
        field(82; "Job Done Name"; Text[100])
        {
        }
        field(83; "Payment Confirmed"; Boolean)
        {

            trigger OnValidate()
            begin
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;


                IF "Payment Confirmed" = TRUE THEN BEGIN
                    UserSetup2.GET(Requester);
                    Addressee := UserSetup2.Name;
                    "Payment Approval" := UserSetup2."User ID";
                    "Payment Approver" := UserSetup2.Name;
                    "Payment Approval Time" := CURRENTDATETIME;
                    UserSetup.GET(USERID);
                    SenderName := UserSetup.Name;
                    ToName := UserSetup2."E-Mail";
                    CCName := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com; ibidapo-obe@toyotanigeria.com; stanley@toyotanigeria.com;Onimisi@toyotanigeria.com';
                    //CCName := 'bolaji.fasola@codeware.com.ng';
                    subject := STRSUBSTNO(text002, "Request No.");

                    "Mail Body" := 'Dear ' + Addressee + ',' + CRLF + CRLF + 'Please note that the invoice has been verified ok. The payment process can now proceed.' + CRLF + CRLF + CRLF +

                    'Regards,' + CRLF + CRLF + SenderName;
                    //Mail.NewMessage(ToName, CCName, Bcc, subject, "Mail Body", Attachment, TRUE);

                END;
            end;
        }
        field(84; "Invoice Received"; Boolean)
        {

            trigger OnValidate()
            begin


                TESTFIELD("Send Invoice File", TRUE);

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
                    SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com; ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;Onimisi@toyotanigeria.com';

                    /* WITH TempEmailItem DO BEGIN
                        "Send to" := Addressee;
                        "Send CC" := SenderAddress;
                        "Send BCC" := '';
                        Subject := STRSUBSTNO(TEXT044, "Request No.");

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;

                        BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                        BodyStream.WRITETEXT(Text013 + ' ' + ToName + ',');
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(text045 + ' ' + STRSUBSTNO(text046, "Request No.") + CRLF + CRLF + CRLF +
                        Text018 + CRLF +
                        SenderName);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                        Body := BodyBlob.Blob;
                        Send(FALSE);
                    END; */
                END;
            end;
        }
        field(85; "Collector Id"; Code[50])
        {
        }
        field(86; "Collector Name"; Text[100])
        {
        }
        field(87; "Collection Time"; DateTime)
        {
        }
        field(88; "Transaction Close"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Transaction Close" = TRUE THEN BEGIN
                    UserSetup5.GET(USERID);
                    "Close User Id" := UserSetup5."User ID";
                    "Closer Name" := UserSetup5.Name;
                    "Close Time" := CURRENTDATETIME;
                END;
            end;
        }
        field(89; "Close User Id"; Text[30])
        {
        }
        field(90; "Close Time"; DateTime)
        {
        }
        field(91; "Closer Name"; Text[100])
        {
        }
        field(92; Description; Text[50])
        {
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
                IncomingDocument: Record 130;
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

            trigger OnValidate()
            begin
                "Total Amount" := ("Items Value" + "Labour Value" + "VAT Amount");
                MODIFY;
            end;
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
        field(101; "Send Invoice File"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Incoming Document Entry No.1");

                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;

                IF "Send Invoice File" = TRUE THEN BEGIN
                    UserSetup2.GET(Requester);
                    SenderName := UserSetup2.Initials;
                    UserSetup.GET(USERID);
                    SenderName := UserSetup.Name;
                    "Send Invoice ID" := UserSetup."User ID";
                    "Send Invoice Name" := UserSetup.Name;
                    "Send Invoice Time" := CURRENTDATETIME;
                    SenderAddress := 'lawal@toyotanigeria.com; kolawole@toyotanigeria.com; ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com;Onimisi@toyotanigeria.com;paa@toyotanigeria.com;sylvester@toyotanigeria.com';
                    "User ID" := USERID;
                    Addressee := 'Akintoye@toyotanigeria.com';
                    subject := STRSUBSTNO(TEXT041, "Request No.");
                    /* 
                                        WITH TempEmailItem DO BEGIN
                                            "Send to" := Addressee;
                                            "Send CC" := SenderAddress;
                                            "Send BCC" := '';
                                            Subject := STRSUBSTNO(TEXT041, "Request No.");

                                            CRLF := '';
                                            CRLF[1] := 13;
                                            CRLF[2] := 10;

                                            BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                                            BodyStream.WRITETEXT(Text013 + ' ' + TEXT029 + ',');
                                            BodyStream.WRITETEXT(CRLF + CRLF);
                                            BodyStream.WRITETEXT(Text014 + ' ' + STRSUBSTNO(TEXT042, "Request No.") + CRLF + CRLF + CRLF +
                                            Text018 + CRLF +
                                            SenderName);
                                            BodyStream.WRITETEXT(CRLF + CRLF);
                                            BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                                            Body := BodyBlob.Blob;
                                            Send(FALSE);
                                        END; */
                END;
            end;
        }
        field(102; "Send Invoice Time"; DateTime)
        {
        }
        field(103; "Send Invoice Name"; Text[100])
        {
        }
        field(104; "Send Invoice ID"; Code[50])
        {
        }
        field(105; "Estimate Sender Time"; DateTime)
        {
        }
        field(106; "Estimate Sender Name"; Text[100])
        {
        }
        field(107; "Estimate Sender ID"; Code[50])
        {
        }
        field(108; "Send Estimate"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Send Estimate" = TRUE THEN BEGIN
                    Addressee := 'Akintoye@toyotanigeria.com';
                    Sender := USERID;
                    UserSetup2.GET(USERID);
                    SenderName := UserSetup2.Initials;
                    SenderAddress := 'sylvester@toyotanigeria.com;eot@toyotanigeria.com;Alamu@toyotanigeria.com;kolawole@toyotanigeria.com; Akintoye@toyotanigeria.com; ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com';
                    "Estimate Sender ID" := UserSetup2."User ID";
                    "Estimate Sender Name" := UserSetup2.Name;
                    "Estimate Sender Time" := CURRENTDATETIME;
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    subject := STRSUBSTNO(text012, "Request No.");

                    /*  WITH TempEmailItem DO BEGIN
                         "Send to" := Addressee;
                         "Send CC" := SenderAddress;
                         "Send BCC" := '';
                         Subject := STRSUBSTNO(text012, "Request No.");

                         CRLF := '';
                         CRLF[1] := 13;
                         CRLF[2] := 10;

                         BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                         BodyStream.WRITETEXT(Text013 + ' ' + TEXT029 + ',');
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT(TEXT036 + ' ' + STRSUBSTNO(TEXT037, "Request No.") + CRLF + CRLF + CRLF +
                         TEXT032 + ' ' + FORMAT("Items Value") + CRLF + CRLF +
                         TEXT033 + ' ' + FORMAT("Labour Value") + CRLF + CRLF +
                         TEXT043 + ' ' + FORMAT("VAT Amount") + CRLF + CRLF +
                         TEXT034 + ' ' + FORMAT("Total Amount") + CRLF + CRLF +
                         TEXT035 + ' ' + Comment + CRLF + CRLF +
                         Text018 + CRLF +
                         SenderName);
                         BodyStream.WRITETEXT(CRLF + CRLF);
                         BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                         Body := BodyBlob.Blob;
                         Send(FALSE);
                     END; */
                END;

                /*//TESTFIELD("Incoming Document Entry No.1");
                
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;
                
                Total_Amount := FORMAT("Total Amount");
                Labour_Value := FORMAT("Labour Value");
                Items_Value  := FORMAT("Items Value");
                
                
                IF "Send Estimate" = TRUE THEN BEGIN
                  UserSetup2.GET(Requester);
                  ToName  := 'eot@toyotanigeria.com; Alamu@toyotanigeria.com';
                  CCName := 'sylvester@toyotanigeria.com; kolawole@toyotanigeria.com; Akintoye@toyotanigeria.com; ibidapo-obe@toyotanigeria.com;stanley@toyotanigeria.com';
                  Bcc := 'shuaib@toyotanigeria.com';
                  subject := STRSUBSTNO(text012,"Request No.");
                  Addressee := UserSetup2.Name;
                  UserSetup.GET(USERID);
                  SenderName :=  UserSetup.Name;
                  "Estimate Sender ID" := UserSetup."User ID";
                  "Estimate Sender Name" := UserSetup.Name;
                  "Estimate Sender Time" := CURRENTDATETIME;  "Mail Body" := 'Dear ' +   Addressee +',' + CRLF + CRLF + 'Please confirm the estimate for ' + STRSUBSTNO(text010,"Request No.") + ' received for your review.' + CRLF + CRLF + CRLF +
                  'Items not in TNL stock: ' + Items_Value  + CRLF + 'Labour: ' + Labour_Value + CRLF + 'Total Amount:  ' + Total_Amount + CRLF + 'Comment: ' + Comment + CRLF +
                  'Regards,' + CRLF + CRLF + SenderName;
                  Mail.NewMessage(ToName,CCName,Bcc,subject,"Mail Body",Attachment,TRUE);
                
                END;
                */

            end;
        }
        field(109; "Request Location"; Option)
        {
            OptionMembers = " ",Abuja,Portharcourt;
        }
        field(110; "Related Job"; Option)
        {
            OptionCaption = ' ,Warranty,Insurance';
            OptionMembers = " ",Warranty,Insurance;
        }
        field(111; "VAT Amount"; Decimal)
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
            HRSetup.TESTFIELD("Work Order No.");
            "Request No." := NoSeriesMgt.GetNextNo(HRSetup."Work Order No.");
            //NoSeriesMgt.InitSeries(HRSetup."Work Order No.", HRSetup."Work Order No.", 0D, "Request No.", HRSetup."Work Order No.");
        END;

        UserSetup.GET(USERID);
        "Entry Date" := TODAY;
        "Requester Name" := UserSetup.Name;
        Requester := UserSetup."User ID";
        "Global Dimension 1 code" := UserSetup.Department;
        //"TNL Service Centre" := 'ÉNL Service Workshop';
    end;

    var
        HRSetup: Record 5218;
        PoolCarReg: Record 70002;
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record 91;
        EmplyRec: Record 5200;
        PoolCar: Record 70005;
        text001: Label 'Work Order Document   ''%1''  requires your approval';
        text002: Label 'Work Order Document ''%1'' has been approved';
        text003: Label 'Work Order Document ''%1'' has been rejected';
        text004: Label 'Work Order Document ''%1'' is on hold';
        Mail: Codeunit 397;
        ToName: Text[80];
        CCName: Text[250];
        Attachment: Text[80];
        Opendialog: Boolean;
        Bcc: Text[80];
        subject: Text[100];
        text005: Label 'Return date cannot be earlier than pickup date!';
        text006: Label 'This document needs your approval.';
        text007: Label 'Pool Car Document   ''%1''  requires your Allocation of Vehicle';
        text008: Label 'This document has been approved.';
        Period: Duration;
        text009: Label 'The same person cannot approve this request.';
        CRLF: Text[2];
        Body: Text[700];
        UserSetup2: Record 91;
        Addressee: Text[50];
        SenderName: Text[70];
        UserSetup4: Record 91;
        WorkOrder: Record 70025;
        RequestTypeTxt: Text[50];
        KilometerCovTxt: Text[50];
        UserSetup5: Record 91;
        IncomingDoc: Record 130;
        IncomingDoc1: Record 130;
        Items_Value: Text[50];
        Labour_Value: Text[50];
        Total_Amount: Text[50];
        MakeTxt: Text[50];
        modelTxt: Text[50];
        cOMMENT: Text[50];
        text010: Label 'Work Order Document ''%1'' ';
        text011: Label 'Work Order Document ''%1'' Job Completed';
        text012: Label 'Work Order Document ''%1'' dealer estimate approval';
        text022: Label 'Work Order Document ''%1'' dealer estimate has been confirmed ';
        RelateJob: Text[50];
        Dealer: Text;
        //SMTPMail: Codeunit 400;
        SenderAddress: Text[200];
        //EmailBody: Record 99008535;
        BodyTxt: Text;
        //BodyBlob: Record 99008535;
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record 9500 temporary;
        Text132: Label 'Mail sent!';
        Text013: Label 'Dear';
        Text014: Label 'Kindly approve this';
        Text015: Label 'Request No : ';
        Text016: Label 'Requester Name :';
        Text017: Label 'Request Type :';
        Text018: Label 'Regards';
        Text019: Label 'Please note that your leave request has been rejected.';
        Text020: Label 'Please note that your  request is on-hold.';
        Text021: Label 'KM Covered :';
        Text028: Label 'Make :';
        Text023: Label 'Model :';
        Text024: Label 'Related Job :';
        Text025: Label 'TNL Service Centre :';
        Text026: Label 'Relate Job :';
        Text027: Label 'Reason :';
        TEXT029: Label 'AJ';
        text030: Label 'Work Order Document   ''%1'' which  requires your approval';
        text031: Label 'Please note that your request for';
        TEXT032: Label 'Items not in TNL stock:';
        TEXT033: Label 'Labour:';
        TEXT034: Label 'Total Amount:';
        TEXT035: Label 'Comment:';
        TEXT036: Label 'Please confirm the estimate for';
        TEXT037: Label 'Work Order Document   ''%1'' received for your review.';
        TEXT038: Label 'Work Order Document ''%1'' estimate has been approved';
        TEXT039: Label 'Work Order Document ''%1'' estimate has been rejected';
        TEXT040: Label 'Work Order Document ''%1'' estimate has been placed on-hold';
        TEXT041: Label 'Invoice for Work Order Document ''%1'' sent for payment process';
        TEXT042: Label 'dealer invoice Document ''%1''  attached for the repair of pool vehicle.';
        TEXT043: Label 'VAT 7.5% :';
        TEXT044: Label 'Work Order Document ''%1'' Invoice has been received';
        text045: Label 'Please note that the invoice for';
        text046: Label 'Work Order Document ''%1'' has been received at the head office and the payment process will start soon for payment.';


    procedure GetIncomingDocumentURL(): Text[1000]
    var
        IncomingDocument: Record 130;
    begin
        IF "Incoming Document Entry No." = 0 THEN
            EXIT('');

        IncomingDocument.GET("Incoming Document Entry No.");
        EXIT(IncomingDocument.GetURL);
    end;


    procedure GetIncomingDocumentURL1(): Text[1000]
    var
        IncomingDocument2: Record 130;
    begin
        IF "Incoming Document Entry No.1" = 0 THEN
            EXIT('');

        IncomingDocument2.GET("Incoming Document Entry No.1");
        EXIT(IncomingDocument2.GetURL);
    end;


    procedure AssistEdit(OldCust: Record 70025): Boolean
    var
        Cust: Record 70025;
    begin
        /*  WITH Cust DO BEGIN
             Cust := Rec;
             HRSetup.GET;
             HRSetup.TESTFIELD("Work Order No.");
             IF NoSeriesMgt.SelectSeries(HRSetup."Work Order No.", HRSetup."Work Order No.", HRSetup."Work Order No.") THEN BEGIN
                 NoSeriesMgt.SetSeries("Request No.");
                 Rec := Cust;
                 EXIT(TRUE);
             END;
         END; */
    end;
}

