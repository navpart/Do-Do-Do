tableextension 50010 "Sales Header Ext" extends "Sales Header"
{
    fields
    {

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var

                Customer: Record Customer;

            begin
                if Customer.get("Sell-to Customer No.") then
                    "Customer Line discount" := Customer."Customer Line Discount";

            end;
        }

        field(50001; Quantity; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document No." = FIELD("No.")));
            DecimalPlaces = 0 : 5;
        }
        field(50003; "Order Type"; Option)
        {
            OptionMembers = " ",Sea,Air,Land;
        }
        field(50151; "First User ID"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(50152; "Last User ID"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(50153; Modified; Date)
        {
        }
        field(50154; "Address 3"; Text[30])
        {
        }
        field(50155; "P.O.Box"; Text[30])
        {
        }
        field(50156; "Del.Add. 3"; Text[30])
        {
        }
        field(50157; "Del.P.O.Box"; Text[30])
        {
        }
        field(50159; "Status(DOS)"; Text[4])
        {
        }
        field(50161; "xForeign Currency"; Boolean)
        {
            BlankZero = true;
            InitValue = false;
        }
        field(50162; xStatus; Text[16])
        {
        }
        field(50163; "Send for Approval"; Boolean)
        {

            trigger OnValidate()

            begin
                IF UserSetup2.GET(USERID) THEN
                    SenderEmail := UserSetup2."E-Mail";

                IF "Send for Approval" = TRUE THEN
                    TESTFIELD("1st Approval to");
                TESTFIELD("1st Apprv. Status", 0);
                "Current pending Person" := "1st Approval to";

                IF UserSetup.GET("1st Approval to") THEN BEGIN
                    ReceiverEmail := UserSetup."E-Mail";
                    ReceiverInitials := UserSetup.Initials;
                    Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                    "Mail Body" := STRSUBSTNO(WaitingforApprovalText, "No.");
                    CreateEmailBody("No.", Addressee, "Mail Body");
                    SendEmail(ReceiverEmail, Subject, EmailBody, CCName, SenderEmail);
                    "Sent Time" := CURRENTDATETIME;
                    Sender := USERID;
                END;
            end;
        }
        field(50164; Sender; Code[50])
        {
        }
        field(50165; "Send to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50166; Approved; Boolean)
        {

            trigger OnValidate()
            begin

                UserSetup.get(USERID);
                if not UserSetup."Credit Memo Approval" then
                    Error('You cannot approve this document!');

                "Approved Time" := CURRENTDATETIME;
                "Approved By" := USERID;
            end;
        }
        field(50167; "Sent Time"; DateTime)
        {
        }
        field(50168; "Approved Time"; DateTime)
        {
        }
        field(50169; "Mail Body"; Text[250])
        {
        }
        field(50170; "Approved By"; Code[50])
        {
        }
        field(50171; "User Department"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'User Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50173; "1st Approval to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()

            begin
                IF UserSetup.GET("1st Approval to") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(50174; "1st Approver"; Text[50])
        {
        }
        field(50175; "1st Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()

            begin

                IF "Shortcut Dimension 1 Code" = '09MARKET' THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Approval to", USERID);
                    "1st Approval Time" := 0DT;

                    CASE "1st Apprv. Status" OF
                        "1st Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                TESTFIELD("2nd Approval to");
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";

                                "1st Approval Time" := CURRENTDATETIME;

                                UserSetup.GET("2nd Approval to");
                                "Current pending Person" := "2nd Approval to";
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text073, "No.");
                                "Mail Body" := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "1st Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";

                                "1st Approval Time" := CURRENTDATETIME;

                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "1st Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                "1st Approval Time" := CURRENTDATETIME;
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;

                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'DEFECTIVE') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Approval to", USERID);
                    "1st Approval Time" := 0DT;

                    CASE "1st Apprv. Status" OF
                        "1st Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                TESTFIELD("2nd Approval to");
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";

                                "1st Approval Time" := CURRENTDATETIME;

                                UserSetup.GET("2nd Approval to");
                                "Current pending Person" := "2nd Approval to";
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text073, "No.");
                                "Mail Body" := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "1st Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                "1st Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "1st Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                "1st Approval Time" := CURRENTDATETIME;
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;


                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'NDEFECTIVE') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Approval to", USERID);
                    "1st Approval Time" := 0DT;
                    CASE "1st Apprv. Status" OF
                        "1st Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                TESTFIELD("2nd Approval to");
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                "1st Approval Time" := CURRENTDATETIME;
                                UserSetup.GET("2nd Approval to");
                                "Current pending Person" := "2nd Approval to";
                                ToName := UserSetup."E-Mail";
                                CCName := 'brano@toyotanigeria.com;' + 'ravinder@toyotanigeria.com;' + 'grace@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text073, "No.");
                                "Mail Body" := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "1st Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                "1st Approval Time" := CURRENTDATETIME;
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;


                        "1st Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order ON_HOLD?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                "1st Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;


                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'ERROR') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Approval to", USERID);
                    "1st Approval Time" := 0DT;
                    CASE "1st Apprv. Status" OF
                        "1st Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to APPROVE this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                TESTFIELD("2nd Approval to");
                                "1st Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET("2nd Approval to");
                                // "Current pending Person" := "2nd Approval to";
                                ToName := UserSetup."E-Mail";
                                CCName := 'brano@toyotanigeria.com;' + 'ravinder@toyotanigeria.com;' + 'grace@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text073, "No.");
                                "Mail Body" := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;


                        "1st Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to REJECT this?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                "1st Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);


                            END;


                        "1st Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order ON_HOLD?', FALSE) THEN
                                "1st Apprv. Status" := SalesHeader."1st Apprv. Status"::" "
                            ELSE BEGIN
                                "1st Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;

            end;

        }
        field(50176; "1st Approval Time"; DateTime)
        {
        }
        field(50177; "1st Approver's Comment"; Boolean)
        {

        }
        field(50178; "2nd Approval to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval to") THEN BEGIN
                    "2nd Approver" := UserSetup.Name;
                    "2nd Approval to" := "2nd Approval to";
                    MODIFY;
                END;
            end;
        }
        field(50179; "2nd Approver"; Text[50])
        {
        }
        field(50180; "2nd Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;
            trigger OnValidate()
            begin


                IF "Shortcut Dimension 1 Code" = '09MARKET' THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Apprv. Status", 2);
                    TESTFIELD("2nd Approval to", USERID);
                    "2nd Approval Time" := 0DT;
                    CASE "2nd Apprv. Status" OF
                        "2nd Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to APPROVE this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'oshunniyi@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text074, "No.");
                                "Mail Body" := STRSUBSTNO(Text074, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                        "2nd Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to REJECT this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                        "2nd Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order ON_HOLD?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                Subject := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;


                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'DEFECTIVE') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Apprv. Status", 2);
                    TESTFIELD("2nd Approval to", USERID);
                    "2nd Approval Time" := 0DT;
                    CASE "2nd Apprv. Status" OF
                        "2nd Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to APPROVE this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'brano@toyotanigeria.com;' + 'oshunniyi@toyotanigeria.com;' + 'ravinder@toyotanigeria.com;' + 'grace@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                        "2nd Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                        "2nd Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;

                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'NDEFECTIVE') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Apprv. Status", 2);
                    TESTFIELD("2nd Approval to", USERID);
                    "2nd Approval Time" := 0DT;
                    CASE "2nd Apprv. Status" OF
                        "2nd Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to APPROVE this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                // TESTFIELD("3rd Approval to");
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text073, "No.");
                                "Mail Body" := STRSUBSTNO(Text073, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "2nd Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                        "2nd Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;
                IF ("Shortcut Dimension 1 Code" = '05PARTS') AND ("Reason Code" = 'ERROR') THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    TESTFIELD("1st Apprv. Status", 2);
                    TESTFIELD("2nd Approval to", USERID);
                    "2nd Approval Time" := 0DT;
                    CASE "2nd Apprv. Status" OF
                        "2nd Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to approve this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                // TESTFIELD("3rd Approval to");
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text074, "No.");
                                "Mail Body" := STRSUBSTNO(Text074, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "2nd Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to rject this?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;

                        "2nd Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "2nd Apprv. Status" := SalesHeader."2nd Apprv. Status"::" "
                            ELSE BEGIN
                                "2nd Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;

            end;

        }
        field(50181; "2nd Approval Time"; DateTime)
        {
        }
        field(50182; "2nd Approver's Comment"; Boolean)
        {
        }
        field(50188; "Final Approval to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

        }
        field(50189; "Final Approver's Name"; Text[50])
        {
        }
        field(50190; "Final Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()

            begin

                IF "Shortcut Dimension 1 Code" = '05PARTS' THEN BEGIN
                    TESTFIELD("Send for Approval", TRUE);
                    "Final Approval Time" := 0DT;
                    //"Final Approver's Name" := UserSetup.Name;

                    CASE "Final Apprv. Status" OF
                        "Final Apprv. Status"::Approved:
                            IF NOT CONFIRM('Are you sure you want to APPROVE this?', FALSE) THEN
                                "Final Apprv. Status" := SalesHeader."Final Apprv. Status"::" "
                            ELSE BEGIN
                                TESTFIELD("1st Approval to");
                                "Final Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                //"Current pending Person" := "Final Approval to";
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text074, "No.");
                                "Mail Body" := STRSUBSTNO(Text074, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;


                        "Final Apprv. Status"::Rejected:
                            IF NOT CONFIRM('Are you sure you want to reject this?', FALSE) THEN
                                "Final Apprv. Status" := SalesHeader."Final Apprv. Status"::" "
                            ELSE BEGIN
                                "Final Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text075, "No.");
                                "Mail Body" := STRSUBSTNO(Text075, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;


                        "Final Apprv. Status"::"on Hold":
                            IF NOT CONFIRM('Are you sure you want place this order on hold?', FALSE) THEN
                                "Final Apprv. Status" := SalesHeader."Final Apprv. Status"::" "
                            ELSE BEGIN
                                "Final Approval Time" := CURRENTDATETIME;
                                IF UserSetup2.GET(USERID) THEN
                                    SenderEmail := UserSetup2."E-Mail";
                                UserSetup.GET(Sender);
                                ToName := UserSetup."E-Mail";
                                CCName := 'ravinder@toyotanigeria.com';
                                Subject := STRSUBSTNO(Text076, "No.");
                                "Mail Body" := STRSUBSTNO(Text076, "No.");
                                SenderInitial := UserSetup2.Initials;
                                Initials := UserSetup.Initials;

                                CreateEmailBody("No.", Initials, "Mail Body");
                                SendEmail(ToName, Subject, EmailBody, CCName, SenderEmail);

                            END;
                    END;
                END;


            end;

        }
        field(50191; "Final Approval Time"; DateTime)
        {
        }
        field(50192; "Final Approver's Comment"; Boolean)
        {
        }
        field(50194; "Current pending Person"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(50195; Attachment; Text[250])
        {
        }
        field(50196; "Send for 2nd Apprv."; Boolean)
        {


        }
        field(50197; "Send for 3rd Apprv."; Boolean)
        {

        }
        field(50258; "Foreign Currency"; Boolean)
        {
        }
        field(50259; "Tracker No."; Code[10])
        {
        }
        field(50260; "Include Accessory"; Boolean)
        {
        }
        field(50261; "Shelf No."; Code[10])
        {
        }
        field(50262; "Sales Time"; Time)
        {
        }
        field(50263; Posting_Time; DateTime)
        {
        }
        field(50264; "Online Order"; Boolean)
        {
        }
        field(50267; "Total Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" WHERE("Document No." = FIELD("No.")));
        }
        field(50268; "Vehicle Order No."; Code[50])
        {

        }
        field(60108; "Customer Line Discount"; Decimal)
        {
            trigger OnValidate()
            begin
                UserSetup.get(USERID);

                if not UserSetup."Unit Price Approval" then
                    ERROR('You do not have permission for this action!');

                if not UserSetup."System Admin" then
                    error('Only System Admin can approve Customer Line Discount!');

                if UserSetup."System Admin" and ("Customer Line Discount" <> 0) then begin
                    Locked := true;
                    modify();
                end else begin
                    Locked := false;
                    Modify();
                end;

            end;
        }
        field(60109; "Serial No"; Code[20])
        {
        }
        field(60110; "Inventory Group"; Code[10])
        {
        }
        field(60111; "Finance Apprv Status"; Enum "Document Status")
        {
            trigger OnValidate()
            begin

                TESTFIELD("Finance Send to", USERID);
                "Finance Approved Time" := 0DT;

                //"HOD Marketing Signature" := UserSetup.Signature; //why?

                IF UserSetup2.GET(UserId) THEN
                    SenderEmail := UserSetup2."E-Mail";

                CASE "Finance Apprv Status" OF
                    "Finance Apprv Status"::Approved:
                        BEGIN

                            UserSetup.GET("Marketing Send To");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                            "Mail Body" := STRSUBSTNO(WaitingforApprovalText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //marketing gets email

                            CallAPI.OnlineOrderingStatus(Rec."Vehicle Order No.", 'Finance', Rec."Finance Approved By");
                        END;

                    "Finance Apprv Status"::Rejected:
                        BEGIN
                            UserSetup.GET("Logistics Sender");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(RejectedText, "No.");
                            "Mail Body" := STRSUBSTNO(RejectedText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //logistics sender gets email
                        END;

                    "Finance Apprv Status"::"On-Hold":
                        BEGIN

                            UserSetup.GET("Logistics Sender");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(OnholdText, "No.");
                            "Mail Body" := STRSUBSTNO(OnholdText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail) //logistics sender gets email

                        END;
                END;

                UserRec.GET(UserId);
                "Finance Approved By" := UserRec.Name;
                "Finance Approved Time" := CURRENTDATETIME;
            end;
        }
        field(60112; "Finance Send to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(60113; "Marketing Send To"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("Marketing Send To") THEN
                    "Marketing Sender" := UserSetup.Name;
                "Marketing Sent Time" := CURRENTDATETIME;
            end;
        }
        field(60114; "Marketing Apprv Status"; Enum "Document Status")
        {
            trigger OnValidate()
            begin
                TESTFIELD("Marketing Send To", USERID);
                "Marketing Approved Time" := 0DT;

                // "HOD Finance Signature" := UserSetup.Signature;   //why?

                IF UserSetup2.GET(USERID) THEN
                    SenderEmail := UserSetup2."E-Mail";

                CASE "Marketing Apprv Status" OF
                    "Marketing Apprv Status"::Approved:
                        BEGIN

                            TESTFIELD("Marketing Send To");
                            UserSetup.GET("Marketing Send To"); // this is wrong. who should get email?
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                            "Mail Body" := STRSUBSTNO(WaitingforApprovalText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail);

                            CallAPI.OnlineOrderingStatus(Rec."Vehicle Order No.", 'Marketing', Rec."Marketing Approved By");


                            IF VehicleOrderOnline.GET("Vehicle Order No.") THEN BEGIN
                                VehicleOrderOnline.SETRANGE("Order No.", "Vehicle Order No.");
                                VehicleOrderOnline."Approval Status Changed" := TRUE;
                                VehicleOrderOnline.MODIFY;
                            END;
                        END;

                    "Marketing Apprv Status"::Rejected:
                        BEGIN

                            UserSetup.GET("Logistics Sender");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(RejectedText, "No.");
                            "Mail Body" := STRSUBSTNO(RejectedText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //logistics sender gets email

                        END;

                    "Marketing Apprv Status"::"On-Hold":
                        BEGIN

                            UserSetup.GET("Logistics Sender");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(OnholdText, "No.");
                            "Mail Body" := STRSUBSTNO(OnholdText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail) //logistics sender gets email
                        END;
                END;

                UserRec.GET(UserId);
                "Marketing Approved By" := UserRec.Name;
                "Marketing Approved Time" := CURRENTDATETIME;

            end;
        }
        field(60115; "Logistics Send to"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(60116; "Logistics Apprv Status"; Enum "Document Status")
        {
            trigger OnValidate()
            begin

                TESTFIELD("Logistics Send to", USERID);
                "Logistics Approved Time" := 0DT;

                //"HOD Marketing Signature" := UserSetup.Signature; //why? which UserSetup?

                IF UserSetup2.GET(USERID) THEN
                    SenderEmail := UserSetup2."E-Mail";

                CASE "Logistics Apprv Status" OF
                    "Logistics Apprv Status"::Approved:
                        BEGIN

                            TESTFIELD("Finance Send to");
                            UserSetup.GET("Finance Send to");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                            "Mail Body" := STRSUBSTNO(WaitingforApprovalText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //finance gets email

                            CallAPI.OnlineOrderingStatus(Rec."Vehicle Order No.", 'Logistics', Rec."Logistics Approved By");

                        END;

                    "Logistics Apprv Status"::Rejected:
                        BEGIN
                            UserSetup.GET("Logistics Sender");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(RejectedText, "No.");
                            "Mail Body" := STRSUBSTNO(RejectedText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //logistics sender gets email
                        END;

                    "Logistics Apprv Status"::"On-Hold":
                        BEGIN
                            UserSetup.GET("Logistics Send to");
                            ReceiverEmail := UserSetup."E-Mail";
                            ReceiverInitials := UserSetup.Initials;

                            Subject := STRSUBSTNO(OnholdText, "No.");
                            "Mail Body" := STRSUBSTNO(OnholdText, "No.");
                            CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                            SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail); //logistics sender gets email
                        END;
                END;

                UserRec.GET("Logistics Send to");
                "Logistics Approved By" := UserRec.Name;
                "Logistics Approved Time" := CURRENTDATETIME;


            end;
        }
        field(60117; "Logistics Sent Time"; DateTime)
        {
        }
        field(60118; "Logistics Approved Time"; DateTime)
        {
        }
        field(60119; "Logistics Approved By"; Code[50])
        {
        }
        field(60120; "Logistics Sender"; Code[50])
        {
        }
        field(60122; "Logistic Sent Time"; DateTime)
        {
        }
        field(60123; "Finance Approved By"; Text[50])
        {
        }
        field(60124; "Marketing Sender"; Text[50])
        {
        }
        field(60125; "Marketing Sent Time"; DateTime)
        {
        }
        field(60126; "Finance Approved Time"; DateTime)
        {
        }
        field(60127; "Marketing Approved By"; Text[50])
        {
        }
        field(60128; "Marketing Approved Time"; DateTime)
        {
        }
        field(60129; "Retail Cost"; Decimal)
        {
            //CalcFormula = Sum("Sales Line"."Retail Cost" WHERE(Document No.=FIELD(No.)));
            //FieldClass = FlowField;
        }
        field(60130; "Original Profit"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE(Amount);
                VALIDATE("Retail Cost");
                SalesHeader."Original Profit" := Amount - "Retail Cost";
            end;
        }
        field(60131; "Original Profit %"; Decimal)
        {
        }
        field(60132; "HOD Logistics Signature"; MediaSet)
        {
        }
        field(60133; "HOD Finance Signature"; MediaSet)
        {
        }
        field(60134; "HOD Marketing Signature"; MediaSet)
        {
        }
        field(60135; "Logistics Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Logistics Send for Approval" = TRUE THEN
                    IF UserSetup.GET("Finance Send to") THEN BEGIN  //why finance send to?
                        "Logistics Sender" := USERID;
                        "Logistics Sent Time" := CURRENTDATETIME;


                        TESTFIELD("Finance Apprv Status", 0);

                        IF UserSetup2.GET(USERID) THEN
                            SenderEmail := UserSetup2."E-Mail";

                        ToName := UserSetup."E-Mail";
                        Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                        MESSAGE('Mail Sent Successfully!');
                    END;
            end;
        }
        field(60136; "Customer Preferred Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60137; "Salesperson Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60138; "Custom Doc. Availability"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TESTFIELD("Marketing Apprv Status", "Marketing Apprv Status"::Approved);
                IF "Custom Doc. Availability" THEN
                    "Document Sent" := TRUE
                ELSE
                    "Document Sent" := FALSE;
            end;
        }
        field(60139; "Acknowledged Doc Link"; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(60140; "Audit Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TESTFIELD("Custom Doc. Availability", TRUE);
                IF UserSetup2.GET(USERID) THEN
                    SenderEmail := UserSetup2."E-Mail";
                IF "Audit Confirmation" = TRUE THEN
                    IF not confirm('Are you sure you want to confirm this Sales Order?', FALSE) THEN
                        "Audit Confirmation" := FALSE
                    ELSE BEGIN
                        Sender := USERID;
                        //UserSetup.GET("Send to");
                        "Sent Time" := CURRENTDATETIME;
                        ToName := 'ojo@toyotanigeria.com';   //why Ojo?

                        "Mail Body" := STRSUBSTNO(ApprovedText, "No.");
                        Subject := STRSUBSTNO(ApprovedText, "No.");

                        //UserSetup2.GET("1st Approval to");
                        //SenderInitial := UserSetup2.Initials;
                        //Initials := UserSetup.Initials;


                        ReceiverEmail := UserSetup."E-Mail";
                        ReceiverInitials := UserSetup.Initials;

                        Subject := STRSUBSTNO(ApprovedText, "No.");
                        "Mail Body" := STRSUBSTNO(ApprovedText, "No.");
                        CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                        SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail);


                        "Approved Time" := CURRENTDATETIME;
                        "Approved By" := USERID;
                    END
            end;

        }
        field(60141; test; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin


            end;
        }
        field(60142; "Security Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Security Confirmation" THEN
                    "Security Confirmation by" := USERID
                ELSE
                    "Security Confirmation by" := '';
            end;
        }
        field(60143; "Security Confirmation by"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60144; "Document Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60145; "Security No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                IF Employee.GET("Security No.") THEN
                    "Security Name" := Employee.FullName
                ELSE
                    "Security Name" := '';
            end;
        }
        field(60146; "Security Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60147; "Send for Approval2"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TESTFIELD("Logistics Send to");

                DesignatedApprovers.Get();
                UserSetup2.GET(USERID);
                SenderEmail := UserSetup2."E-Mail";
                Sender := USERID;
                "Sent Time" := CURRENTDATETIME;
                "Current pending Person" := "Logistics Send to";

                UserSetup.GET("Logistics Send to");
                ReceiverEmail := UserSetup."E-Mail";
                ReceiverInitials := UserSetup.Initials;

                CcAddresses := DesignatedApprovers."Logistics Notifications";
                //CcAddresses := 'olukoya@toyotanigeria.com;sunday@toyotanigeria.com;tola@toyotanigeria.com;smo@toyotanigeria.com;gbenga@toyotanigeria.com;James@toyotanigeria.com;johnson@toyotanigeria.com;komolafe@toyotanigeria.com';

                Subject := STRSUBSTNO(WaitingforApprovalText, "No.");
                "Mail Body" := STRSUBSTNO(WaitingforApprovalText, "No.");
                CreateEmailBody("No.", ReceiverInitials, "Mail Body");
                SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderEmail);

            end;
        }
        field(60148; "Audit Confirmation by"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60149; "Audit Summary"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Satisfactory,Non-Satisfactory';
            OptionMembers = " ",Satisfactory,"Non-Satisfactory";
        }
        field(60150; "Audit Confirmation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60151; Locked; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        mailsent: Boolean;
        ToName: Text[100];
        CCName: Text[200];
        Subject: Text[100];
        Body: Text[100];
        attachement: Text[260];
        Opendialog: Boolean;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        CustRec: Record Customer;
        WaitingforApprovalText: Label 'Document %1 is waiting for your approval.';
        ApprovedText: Label 'Document %1 has been approved.';
        RejectedText: Label 'Document %1 has been rejected.';
        OnholdText: Label 'Document %1 is on hold.';
        SenderEmail: Text[40];
        UserRec: Record "User Setup";
        EmailBody: Text[1024];
        ReceiverEmail: Text;
        Addressee: Text;
        Salutation: Label 'Dear %1,';
        CcAddresses: Text[100];
        SenderAddress: Text[100];
        ReceiverInitials: Text[10];
        VehicleOrderOnline: Record "Vehicle Online Order";
        DesignatedApprovers: Record "Designated Approvers";
        CallAPI: Codeunit "Call API";
        SenderInitial: Text[30];
        Initials: Text[10];
        Text073: Label 'Document %1 is waiting for delivery confirmation';
        Text074: Label 'Document %1 has been approved';
        Text075: Label 'Document %1 has been rejected';
        Text076: Label 'Document %1 is on hold';


    procedure CreateEmailBody(DocNo: Code[20]; RecipientInitials: Text; BodyMsg: Text);

    begin

        UserSetup.Get(UserId);

        EmailBody := STRSUBSTNO(Salutation, RecipientInitials);
        EmailBody += '<br><br>';
        EmailBody += STRSUBSTNO(BodyMsg, DocNo);
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;

    end;

    procedure SendEmail(ReceiverEmail: Text; Subject: Text; Body: Text; CCRecipients: Text; BCCRecipients: Text)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ReceiverEmail, Subject, EmailBody, true);
        EmailMessage.AddRecipient(enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;

    procedure LinkedAcctControl();

    var

        CustLedgEntry: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        Cust2: Record Customer;
        CustRec2: Record Customer;
        FirstDate: Date;
        Diff: Integer;
        DealerVerifNo: Code[10];

    Begin
        IF (COPYSTR(Rec."Sell-to Customer No.", 1, 3) = 'TDP') THEN
            EXIT ELSE BEGIN

            Cust.GET(Rec."Sell-to Customer No.");
            DealerVerifNo := Cust."Dealer Verification No.";

            IF DealerVerifNo <> '' THEN
                CustRec2.RESET;
            Cust2.SETCURRENTKEY("Dealer Verification No.");
            Cust2.SETRANGE("Dealer Verification No.", DealerVerifNo);
            IF Cust2.FINDFIRST THEN
                REPEAT
                    CustLedgEntry.SETCURRENTKEY("Customer No.", "Document Type", Open);
                    CustLedgEntry.SETRANGE("Customer No.", Cust2."No.");
                    CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
                    CustLedgEntry.SETRANGE(Open, TRUE);
                    IF CustLedgEntry.FINDFIRST THEN BEGIN
                        FirstDate := CustLedgEntry."Posting Date";
                        IF FirstDate <> 0D THEN
                            Diff := TODAY - FirstDate;
                        IF (Diff > 60) THEN
                            ERROR('Overdue invoices need to be cleared!')
                    END;
                UNTIL Cust2.NEXT = 0;
        END;
    end;


    procedure IncludeAccessory();

    var

        SalesLine: Record "Sales Line";
        SalesLine2: Record "Sales Line";
        SalesLine3: Record "Sales Line";
        SalesLine4: Record "Sales Line";
        LineNo: Integer;
        ItemRec2: Record Item;

    Begin
        //TotalWithAccessory := 0;
        SalesLine3.SETCURRENTKEY("Document No.");
        SalesLine3.SETRANGE("Document No.", Rec."No.");
        IF SalesLine3.FINDLAST THEN
            LineNo := SalesLine3."Line No.";

        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document No.", Accessory);
        SalesLine.SETRANGE("Document No.", Rec."No.");
        SalesLine.SETRANGE(Accessory, TRUE);
        IF SalesLine.FINDFIRST THEN BEGIN
            REPEAT
                LineNo += 10000;
                IF SalesLine."Location Code" IN ['BLORE1', 'BLEXHIBTN', 'BLCONSGNMT'] THEN BEGIN
                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine.Type;
                    IF SalesLine.Degree = '45' THEN
                        //SalesLine2.VALIDATE("No.",'XS242-TOD01'); JA
                        SalesLine2.VALIDATE("No.", 'F2440-TOD72');
                    IF SalesLine.Degree = '180' THEN
                        SalesLine2.VALIDATE("No.", 'XS242-TOD02');
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    //SalesLine2.VALIDATE("No.",'S4201-TOD00');      JA
                    SalesLine2.VALIDATE("No.", 'S3736-TD218');
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    ItemRec2.SETCURRENTKEY(Degree, "Item Color");
                    ItemRec2.SETRANGE(Degree, SalesLine.Degree);
                    ItemRec2.SETRANGE("Item Color", SalesLine.Colour);
                    IF ItemRec2.FINDFIRST THEN
                        SalesLine2.VALIDATE("No.", ItemRec2."No.");
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                END;

                IF SalesLine."Location Code" IN ['ACC-ORE1', 'ACC-CONSG', 'ACC-EXHBT'] THEN BEGIN
                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    IF SalesLine.Degree = '45' THEN
                        // SalesLine2.VALIDATE("No.",'XS242-TOD01'); JA
                        SalesLine2.VALIDATE("No.", 'F2440-TOD72');
                    IF SalesLine.Degree = '180' THEN
                        SalesLine2.VALIDATE("No.", 'XS242-TOD02');
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    SalesLine2.VALIDATE("No.", 'S3736-TD218');
                    // SalesLine2.VALIDATE("No.",'S4201-TOD00');  JA
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                    //Degree and color
                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    ItemRec2.SETCURRENTKEY(Degree, "Item Color");
                    ItemRec2.SETRANGE(Degree, SalesLine.Degree);
                    ItemRec2.SETRANGE("Item Color", SalesLine.Colour);
                    IF ItemRec2.FINDFIRST THEN
                        SalesLine2.VALIDATE("No.", ItemRec2."No.");
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;
                END;
            UNTIL SalesLine.NEXT = 0;
        END;

        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document No.", Accessory);
        SalesLine.SETRANGE("Document No.", Rec."No.");
        SalesLine.SETRANGE(Accessory, TRUE);
        IF SalesLine.FINDFIRST THEN BEGIN
            REPEAT
                LineNo += 10000;
                IF SalesLine."Location Code" IN ['CWORE1', 'CWEXHIBTN', 'CPORE1'] THEN BEGIN
                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine.Type;
                    SalesLine2.VALIDATE("No.", 'S47B0-TOD2K');
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;

                    SalesLine2.INIT;
                    SalesLine2."Document Type" := SalesLine."Document Type";
                    SalesLine2."Document No." := SalesLine."Document No.";
                    SalesLine2."Line No." := LineNo;
                    SalesLine2.Type := SalesLine2.Type::Item;
                    SalesLine2.VALIDATE("No.", 'S35B0-TOD2K');
                    SalesLine2."Location Code" := 'BLORE1';
                    SalesLine2.VALIDATE(Quantity, SalesLine.Quantity);
                    SalesLine2.INSERT(TRUE);
                    LineNo += 10000;
                END;
            UNTIL SalesLine.NEXT = 0;

        END;

        IF Rec."Include Accessory" = FALSE THEN BEGIN
            SalesLine4.SETRANGE("No.", 'XS242-TOD01');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS242-TOD02');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;


            SalesLine4.SETRANGE("No.", 'S4201-TOD00');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'F3712-TOD02');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'S35B0-TOD2K');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'S47B0-TOD2K');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS371-TOD76');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS371-TOD24');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS371-TOD75');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS371-TOD57');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS374-TODW1');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS374-TOD31');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS374-TOD11');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS374-TODM1');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

            SalesLine4.SETRANGE("No.", 'XS374-TOD04');
            IF SalesLine4.FINDFIRST THEN
                SalesLine4.DELETEALL;

        END;

    End;


    procedure PostingControl()

    var
        Cust: Record Customer;
        Cust2: Record Customer;
        CustRec: Record Customer;
        CustRec2: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        FirstDate: Date;
        Diff: Integer;
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        Customer: Record Customer;
        LocRec: Record Location;
        SalesOrderAmount: Decimal;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        SenderEmail: Text;
        ToName: Text;
        Subject: Text;
        mailbody: Text;
        GPC: Codeunit "General Purpose Codeunit-1";

    Begin

        Rec.TESTFIELD("Salesperson Code");
        Rec.TESTFIELD("Shortcut Dimension 1 Code");

        UserSetup.get(UserId);

        SalesLine.SETCURRENTKEY("Document Type", "Document No.", Type, "No.");
        SalesLine.SETRANGE("Document Type", Rec."Document Type");
        SalesLine.SETRANGE("Document No.", Rec."No.");
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        IF SalesLine.FINDFIRST THEN BEGIN
            REPEAT
                IF (SalesLine."Line Discount %" > Rec."Customer Line Discount") THEN
                    ERROR('The line discount is not the same with the approved discount !')
            UNTIL SalesLine.NEXT = 0;
        END;

        if UserSetup."Allow Access" then
            exit else begin


            IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') THEN BEGIN
                Cust.GET(Rec."Sell-to Customer No.");
                IF (Cust."Dealer Verification No." = 'GLC100')// OR (Cust."Dealer Verification No." = 'GLB100')// OR (Cust."Dealer Verification No." = 'RTB100')//
                                                              //OR (Cust."Dealer Verification No." = 'GER100')
                 THEN BEGIN
                    CustRec2.RESET;
                    Cust2.SETCURRENTKEY("Dealer Verification No.");
                    Cust2.SETRANGE("Dealer Verification No.", Cust."Dealer Verification No.");
                    IF Cust2.FINDFIRST THEN
                        REPEAT
                            CustLedgEntry.SETCURRENTKEY("Customer No.", "Document Type", Open);
                            CustLedgEntry.SETRANGE("Customer No.", Cust2."No.");
                            CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
                            CustLedgEntry.SETRANGE(Open, TRUE);
                            IF CustLedgEntry.FINDFIRST THEN BEGIN
                                FirstDate := CustLedgEntry."Posting Date";
                                IF FirstDate <> 0D THEN
                                    Diff := TODAY - FirstDate;
                                IF (Diff > 30) THEN
                                    ERROR('Overdue invoices need to be cleared!')
                            END;
                        UNTIL Cust2.NEXT = 0;
                END;
            END;

            IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') THEN BEGIN
                SalesLine.SETCURRENTKEY("Document Type", "Document No.", Type, "No.");
                SalesLine.SETRANGE("Document Type", Rec."Document Type");
                SalesLine.SETRANGE("Document No.", Rec."No.");
                SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                SalesLine.SETRANGE("Variant Code", 'SEA');
                IF SalesLine.FINDFIRST THEN BEGIN
                    REPEAT
                        IF (SalesLine."Line Discount %" > Rec."Customer Line discount") THEN
                            ERROR('The line discount is not the same with the approved discount !')
                    UNTIL SalesLine.NEXT = 0;
                END;
            END;


            IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') THEN BEGIN
                SalesLine.SETCURRENTKEY("Document Type", "Document No.", Type, "No.");
                SalesLine.SETRANGE("Document Type", Rec."Document Type");
                SalesLine.SETRANGE("Document No.", Rec."No.");
                SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        IF SalesLine."Quantity Demanded" = 0 THEN
                            ERROR('Input the quantity demanded')
                    UNTIL SalesLine.NEXT = 0;
            END;
            IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') THEN BEGIN
                SalesLine.SETCURRENTKEY("Document Type", "Document No.", Type, "No.");
                SalesLine.SETRANGE("Document Type", Rec."Document Type");
                SalesLine.SETRANGE("Document No.", Rec."No.");
                SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        SalesLine.TESTFIELD("VAT Prod. Posting Group");

                    UNTIL SalesLine.NEXT = 0;
            END;

            Rec.TESTFIELD("Shortcut Dimension 1 Code");
            Rec.TESTFIELD("Salesperson Code");
            Rec.TESTFIELD("Posting Description");
            IF Rec."Shortcut Dimension 1 Code" = '05PARTS' THEN
                Rec.TESTFIELD("Order Type");

            IF (ItemRec."Fixed Cost" - ItemRec."Unit Cost") < 0 THEN
                IF ItemRec."Inventory Posting Group" <> 'N_CARS' THEN
                    ERROR('Sorry, you can not sell this item. Contact your manager to review the Fixed Cost!');

            IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec.Approved = FALSE) THEN
                ERROR('This transaction needs to be approved before posting!');

            Customer.Get(Rec."Sell-to Customer No.");
            IF NOT Customer."Remove Account Link" THEN
                Rec.LinkedAcctControl;


            SalesLine.SETCURRENTKEY("Document No.");
            SalesLine.SETRANGE("Document No.", Rec."No.");
            IF SalesLine.FINDFIRST THEN BEGIN
                REPEAT
                    IF LocRec.GET(SalesLine."Location Code") THEN
                        IF LocRec."VRI Location" THEN
                            IF NOT Rec.Approved THEN
                                ERROR('This transaction needs the MDs Approval!');
                UNTIL SalesLine.NEXT = 0;
            END;

            IF Rec."Sell-to Customer No." = '940000' THEN BEGIN
                IF Rec."Your Reference" = '' THEN
                    ERROR('Please enter the TCOF number!');
            END;

            CustRec.GET(Rec."Sell-to Customer No.");
            IF NOT CustRec."Remove Credit Limit" THEN begin
                IF Rec."Sell-to Customer No." <> '' then begin
                    SalesLine.SETCURRENTKEY("Document No.", "Sell-to Customer No.");
                    SalesLine.SETRANGE(SalesLine."Document No.", Rec."No.");
                    SalesLine.SETRANGE(SalesLine."Sell-to Customer No.", Rec."Sell-to Customer No.");
                    IF SalesLine.FINDFIRST THEN
                        SalesLine.CALCSUMS("Amount Including VAT");
                    SalesOrderAmount := SalesLine."Amount Including VAT";

                    CustRec.GET(Rec."Sell-to Customer No.");
                    IF (CustRec."Credit Limit (LCY)" <> 0) THEN BEGIN
                        //IF ("Customer Posting Group" <> 'STAFF') THEN BEGIN
                        CustRec.CALCFIELDS("Balance (LCY)");
                        IF (CustRec."Balance (LCY)" + SalesOrderAmount) > CustRec."Credit Limit (LCY)" THEN
                            ERROR('Credit limit has been reached. So, you can not sell to this customer!');
                        Message('Balance (LCY): %1, Order Amount: %2', CustRec."Balance (LCY)", SalesOrderAmount);
                    END;
                END;
            end;

            SalesLine.SETCURRENTKEY("Document No.");
            SalesLine.SETRANGE("Document No.", Rec."No.");
            IF SalesLine.FINDFIRST THEN BEGIN
                REPEAT
                    IF SalesLine.Accessory THEN
                        IF NOT Rec."Include Accessory" THEN
                            ERROR('Some vehicles have accessories. Click on Include Accessory!');
                UNTIL SalesLine.NEXT = 0;
            END;

            IF UserSetup2.GET(USERID) THEN
                SenderEmail := UserSetup2."E-Mail";

            SalesLine.SETCURRENTKEY("Document No.");
            SalesLine.SETRANGE("Document No.", Rec."No.");
            IF SalesLine.FINDFIRST THEN
                IF LocRec.GET(SalesLine."Location Code") THEN
                    Rec.Sender := USERID;
            ToName := LocRec."E-Mail";

            GPC.UseTodaysDate("Posting Date");

            Cust.Get(Rec."Sell-to Customer No.");
            if not Cust.SkipCostCheck then begin
                GPC.CheckItemCostToPost("No.");
                GPC.CheckMargin("No.");
            end;
        end;
    end;


    procedure PostSalesCreditMemoControl()

    var
    begin
        Rec.TESTFIELD("External Document No.");
        IF (Rec."Shortcut Dimension 1 Code" = '09MARKET') THEN BEGIN
            IF Rec."2nd Apprv. Status" <> Rec."2nd Apprv. Status"::Approved THEN
                ERROR('This transaction needs to be approved before posting!');
        End;
        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'NDEFECTIVE') THEN BEGIN
            IF Rec."2nd Apprv. Status" <> Rec."2nd Apprv. Status"::Approved THEN
                ERROR('This transaction needs to be approved before posting!');
        END;
        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'ERROR') THEN BEGIN
            IF Rec."2nd Apprv. Status" <> Rec."2nd Apprv. Status"::Approved THEN
                ERROR('This transaction needs to be approved before posting!');
        END;
        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'DEFECTIVE') THEN BEGIN
            IF Rec."Final Apprv. Status" <> Rec."Final Apprv. Status"::Approved THEN
                ERROR('This transaction needs to be approved before posting!');
        END;

    end;

    trigger OnDelete()
    var
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."System Admin" THEN
            ERROR('You can not delete this entry. Contact your System Administrator!');
    end;

}


