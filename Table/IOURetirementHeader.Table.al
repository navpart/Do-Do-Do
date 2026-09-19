table 50107 "IOU Retirement Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Entry Date"; Date)
        {
        }
        field(4; "Original IOU Amount"; Decimal)
        {
            Editable = false;
        }
        field(5; "Amount To Retire"; Decimal)
        {
            CalcFormula = Sum("IOU Retirement Lines".Amount WHERE("Retirement No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Balance := "Original IOU Amount" - "Amount To Retire";
            end;
        }
        field(6; "Audit Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Audit Approval" THEN
                    "Audit Approval By" := USERID
                ELSE
                    "Audit Approval By" := '';
            end;
        }
        field(7; "Audit Approval By"; Code[25])
        {
            Editable = false;

        }
        field(8; "Account Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Audit Approval");
                IF "Account Approval" THEN
                    "Account Approval By" := USERID
                ELSE
                    "Account Approval By" := '';
            end;
        }
        field(9; "Account Approval By"; Code[25])
        {
            Editable = false;

        }
        field(10; "IOU No."; Code[20])
        {
            TableRelation = "IOU Register" WHERE(Treated = const(true),
                                                  Retired = const(false),
                                                  "Converted to Loan" = const(false));

            trigger OnValidate()
            var
                RetireHdr: Record "IOU Retirement Header";
                Cust: Record Customer;
            begin
                IF "IOU No." <> '' THEN BEGIN
                    //cannot create new retirement until previous one is posted
                    RetireHdr.SETRANGE(RetireHdr."IOU No.", "IOU No.");
                    RetireHdr.SETRANGE(RetireHdr.Posted, FALSE);
                    IF RetireHdr.FINDFIRST THEN
                        ERROR(Text006);

                    IOURec.GET("IOU No.");
                    "Original IOU Amount" := IOURec.Amount;
                    Description := IOURec.Description;
                    "Staff No." := IOURec."Account No.";
                    "Staff Name" := IOURec."Account Name";
                    "Global Dimension 1 Code" := IOURec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := IOURec."Global Dimension 2 Code";
                END ELSE BEGIN
                    "Original IOU Amount" := 0;
                    Description := '';
                    "Staff No." := '';
                    "Staff Name" := '';
                    "Global Dimension 1 Code" := '';
                    "Global Dimension 2 Code" := '';
                END;
            end;
        }
        field(11; "User ID"; Code[25])
        {
        }
        field(12; "Retirement Options"; Option)
        {
            OptionMembers = "Full Retirement","Partial Retirement";
        }
        field(13; Posted; Boolean)
        {
        }
        field(14; "Prev. Amount Retired"; Decimal)
        {
        }
        field(15; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                IF NOT CONFIRM('Are you sure you want to send for Approval', FALSE) THEN
                    "Send for Approval" := FALSE
                ELSE BEGIN
                    "Staff Name" := "Staff Name";
                    Purpose := Description;
                    "IOU Amount" := "Original IOU Amount";
                    CALCFIELDS("Amount To Retire");
                    "Retire Amount" := "Amount To Retire";
                    Balance := "IOU Amount" - "Retire Amount";


                    TESTFIELD("1st Approval to");
                    TESTFIELD("1st Apprv. Status", 0);

                    UserSetup.GET(USERID);
                    Sender := USERID;
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    Sender := UserSetup."User ID";
                    SendersName := UserSetup.Initials;
                    SenderAddress := UserSetup."E-Mail";
                    UserSetup2.GET("1st Approval to");
                    ToAddresses := UserSetup2."E-Mail";
                    Addressee := UserSetup2.Initials;
                    CcAddresses := '';
                    BccAddresses := '';

                    Subject := STRSUBSTNO(text001, "No.");
                    CreateEmailBody("No.", Addressee, text001, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;
            end;
        }
        field(16; Sender; Text[50])
        {
            Editable = true;

            trigger OnValidate()
            begin
                TESTFIELD("Staff No.");
            end;
        }
        field(17; "Sent Time"; DateTime)
        {
            Editable = false;
        }
        field(18; "1st Approval to"; Code[25])
        {
            TableRelation = IF ("Global Dimension 1 Code" = FILTER('02ADMINHR')) "User Setup"."User ID" WHERE("User ID" = FILTER('IBIDAPO-OBE|KOLAWOLE'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('03OPLOGIC')) "User Setup"."User ID" WHERE("User ID" = FILTER('SEGUN|TOLA'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('04DDEV')) "User Setup"."User ID" WHERE("User ID" = FILTER('HENRY|OLUFEMI'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('05PARTS')) "User Setup"."User ID" WHERE("User ID" = FILTER('AKINDELE|ISUEKEBHO|RAVINDER|SYLVESTER|IBIDAPO-OBE'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('06SERVICE')) "User Setup"."User ID" WHERE("User ID" = FILTER('BAMIDELE|SYLVESTER'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('07FINACC')) "User Setup"."User ID" WHERE("User ID" = FILTER('ALBERT|BUNMI|PAA'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('08AUDSYS')) "User Setup"."User ID" WHERE("User ID" = FILTER('ADEWUMI|BRANO|JOSHUA'))
            ELSE
            IF ("Global Dimension 1 Code" = FILTER('09MARKET')) "User Setup"."User ID" WHERE("User ID" = FILTER('AJUYAH|BAYO|BUKUNOLA'));

            trigger OnValidate()
            begin
                IF "1st Approval to" = USERID THEN
                    ERROR('You cannot select yourself as the 1st APPROVER');

                IF UserSetup.GET("1st Approval to") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(19; "1st Approver"; Text[50])
        {
        }
        field(20; "1st Apprv. Status"; Option)
        {
            BlankZero = false;
            NotBlank = false;
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", TRUE);
                TESTFIELD("1st Approval to", USERID);

                IF "1st Apprv. Status" = "1st Apprv. Status"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to APPROVE', FALSE) THEN
                        "1st Apprv. Status" := RetireRec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";

                        UserSetup.GET("2nd Approval to");
                        TESTFIELD("2nd Approval to");
                        "1st Approval Time" := CURRENTDATETIME;
                        "Current pending Person" := "2nd Approval to";

                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        TESTFIELD("1st Approval to");
                        UserSetup.GET(Sender);
                        CcAddresses := UserSetup."E-Mail";
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text003, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text003, "No.");
                        CreateEmailBody("No.", Addressee, text003, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                // // "1st Apprv. Status"::Rejected:
                IF "1st Apprv. Status" = "1st Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT', FALSE) THEN
                        "1st Apprv. Status" := RetireRec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "1st Approval Time" := CURRENTDATETIME;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text004, "IOU No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text004, "No.");
                        CreateEmailBody("No.", Addressee, text004, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Reject := TRUE;
                    END;

                //"1st Apprv. Status"::"on Hold":
                IF "1st Apprv. Status" = "1st Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place ON HOLD', FALSE) THEN
                        "1st Apprv. Status" := RetireRec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "1st Approval Time" := CURRENTDATETIME;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text005, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text005, "No.");
                        CreateEmailBody("No.", Addressee, text005, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(21; "1st Approval Time"; DateTime)
        {
        }
        field(22; "1st Approver's Comment"; Boolean)
        {
            CalcFormula = Exist("Payment Approval Comment Line" WHERE("Table Name" = filter('1st App'),
                                                                       "No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "2nd Approval to"; Code[25])
        {
            Editable = true;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval to") THEN
                    "2nd Approver" := UserSetup.Name;
            end;
        }
        field(24; "2nd Approver"; Text[50])
        {
        }
        field(25; "2nd Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin

                TESTFIELD("Send for Approval", TRUE);
                TESTFIELD("1st Apprv. Status", 2);
                TESTFIELD("2nd Approval to", USERID);

                IF "2nd Apprv. Status" = "2nd Apprv. Status"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to APPROVE', FALSE) THEN
                        "2nd Apprv. Status" := RetireRec."2nd Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";
                        "2nd Approval Time" := 0DT;
                        TESTFIELD("3rd Approval to");
                        "2nd Approval Time" := CURRENTDATETIME;
                        UserSetup.GET("3rd Approval to");
                        "Current pending Person" := "3rd Approval to";
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;

                        TESTFIELD("1st Approval to");
                        UserSetup.GET(Sender);
                        CcAddresses := UserSetup."E-Mail";
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text003, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text003, "No.");
                        CreateEmailBody("No.", Addressee, text003, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                    END;

                IF "2nd Apprv. Status" = "2nd Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT', FALSE) THEN
                        "2nd Apprv. Status" := RetireRec."2nd Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";
                        "2nd Approval Time" := CURRENTDATETIME;
                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;

                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text004, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text004, "No.");
                        CreateEmailBody("No.", Addressee, text004, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Reject := TRUE;
                    END;

                IF "2nd Apprv. Status" = "2nd Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place ON HOLD', FALSE) THEN
                        "2nd Apprv. Status" := RetireRec."2nd Apprv. Status"::" "
                    ELSE BEGIN

                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";
                        "2nd Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text005, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text005, "No.");
                        CreateEmailBody("No.", Addressee, text005, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(26; "2nd Approval Time"; DateTime)
        {
        }
        field(27; "2nd Approver's Comment"; Boolean)
        {
        }
        field(28; "3rd Approval to"; Code[25])
        {
            TableRelation = "User Setup"."User ID" WHERE("User ID" = FILTER('BUNMI|PAA|ALBERT|ONIMISI'));

            trigger OnValidate()
            begin
                IF UserSetup.GET("3rd Approval to") THEN
                    "3rd Approver" := UserSetup.Name;
            end;
        }
        field(29; "3rd Approver"; Text[50])
        {
        }
        field(30; "3rd Apprv.Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin

                TESTFIELD("Send for Approval", TRUE);
                TESTFIELD("2nd Apprv. Status", 2);
                TESTFIELD("3rd Approval to", USERID);
                "3rd Approval Time" := 0DT;


                IF "3rd Apprv.Status" = "3rd Apprv.Status"::Approved THEN BEGIN
                    "Staff Name" := "Staff Name";
                    Purpose := Description;
                    "IOU Amount" := "Original IOU Amount";
                    CALCFIELDS("Amount To Retire");
                    "Retire Amount" := "Amount To Retire";
                    Balance := "IOU Amount" - "Retire Amount";

                    TESTFIELD("Final Approval to");
                    "3rd Approval Time" := CURRENTDATETIME;
                    UserSetup.GET("Final Approval to");
                    "Current pending Person" := "Final Approval to";
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(text001, "IOU No.");

                    UserSetup2.GET(USERID);
                    SendersName := UserSetup2.Initials;
                    SenderAddress := UserSetup2."E-Mail";

                    Subject := STRSUBSTNO(text001, "No.");
                    CreateEmailBody("No.", Addressee, text001, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "3rd Apprv.Status" = "3rd Apprv.Status"::Rejected THEN BEGIN

                    "Staff Name" := "Staff Name";
                    Purpose := Description;
                    "IOU Amount" := "Original IOU Amount";
                    CALCFIELDS("Amount To Retire");
                    "Retire Amount" := "Amount To Retire";
                    Balance := "IOU Amount" - "Retire Amount";

                    "3rd Approval Time" := CURRENTDATETIME;
                    UserSetup.GET(Sender);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';
                    Subject := STRSUBSTNO(text004, "IOU No.");

                    UserSetup2.GET(USERID);
                    SendersName := UserSetup2.Initials;
                    SenderAddress := UserSetup2."E-Mail";

                    Subject := STRSUBSTNO(text004, "No.");
                    CreateEmailBody("No.", Addressee, text004, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');



                END;

                IF "3rd Apprv.Status" = "3rd Apprv.Status"::"on Hold" THEN BEGIN
                    "Staff Name" := "Staff Name";
                    Purpose := Description;
                    "IOU Amount" := "Original IOU Amount";
                    CALCFIELDS("Amount To Retire");
                    "Retire Amount" := "Amount To Retire";
                    Balance := "IOU Amount" - "Retire Amount";

                    "3rd Approval Time" := CURRENTDATETIME;

                    UserSetup.GET(Sender);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    CcAddresses := '';
                    BccAddresses := '';

                    Subject := STRSUBSTNO(text005, "No.");

                    UserSetup2.GET(USERID);
                    SendersName := UserSetup2.Initials;
                    SenderAddress := UserSetup2."E-Mail";

                    Subject := STRSUBSTNO(text005, "No.");
                    CreateEmailBody("No.", Addressee, text005, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;
            end;
        }
        field(31; "3rd Approval Time"; DateTime)
        {
        }
        field(32; "3rd Approver's Comment"; Boolean)
        {
        }
        field(33; "Final Approval to"; Code[25])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("Final Approval to") THEN
                    "Final Approver's Name" := UserSetup.Name;
            end;
        }
        field(34; "Final Approver's Name"; Text[50])
        {
        }
        field(35; "Final Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", TRUE);
                //TESTFIELD("3rd Apprv.Status",2);
                TESTFIELD("3rd Approval to", USERID);
                "Final Approval Time" := 0DT;


                IF "Final Apprv. Status" = "Final Apprv. Status"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to APPROVE', FALSE) THEN
                        "Final Apprv. Status" := RetireRec."Final Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";

                        TESTFIELD("1st Approval to");
                        "Final Approval Time" := CURRENTDATETIME;
                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text003, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text003, "No.");
                        CreateEmailBody("No.", Addressee, text003, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "Final Apprv. Status" = "Final Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT', FALSE) THEN
                        "Final Apprv. Status" := RetireRec."Final Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";

                        "Final Approval Time" := CURRENTDATETIME;
                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text004, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text004, "No.");
                        CreateEmailBody("No.", Addressee, text004, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Reject := TRUE;
                    END;

                IF "Final Apprv. Status" = "Final Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place this on hold?', FALSE) THEN
                        "Final Apprv. Status" := RetireRec."Final Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Staff Name";
                        Purpose := Description;
                        "IOU Amount" := "Original IOU Amount";
                        CALCFIELDS("Amount To Retire");
                        "Retire Amount" := "Amount To Retire";
                        Balance := "IOU Amount" - "Retire Amount";
                        "Final Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text005, "No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text005, "No.");
                        CreateEmailBody("No.", Addressee, text005, "Staff Name", Purpose, "IOU Amount", Balance);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(36; "Final Approval Time"; DateTime)
        {
        }
        field(37; "Final Approver's Comment"; Boolean)
        {
        }
        field(38; "General Comment"; Boolean)
        {
        }
        field(39; "Mail Body"; Text[250])
        {
        }
        field(40; "Current pending Person"; Code[25])
        {
        }
        field(41; Attachment; Text[250])
        {
        }
        field(42; "Send for 2nd Apprv."; Boolean)
        {

            trigger OnValidate()
            begin
                IF UserSetup.GET(USERID) THEN BEGIN
                    Sender := UserSetup.Name;
                    SenderAddress := UserSetup."E-Mail";
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    TESTFIELD("1st Approval to");
                    TESTFIELD("1st Apprv. Status", 0);
                    TESTFIELD("2nd Approval to");
                    TESTFIELD("2nd Apprv. Status", 0);

                    UserSetup2.GET("1st Approval to");
                    "Current pending Person" := "1st Approval to";
                    ToName := UserSetup2."E-Mail";

                    Subject := STRSUBSTNO(text001, "No.");
                    CreateEmailBody("No.", Addressee, text001, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;
            end;
        }
        field(43; "Send for 3rd Apprv."; Boolean)
        {

            trigger OnValidate()
            begin
                IF UserSetup.GET(USERID) THEN BEGIN
                    Sender := UserSetup.Name;
                    SenderAddress := UserSetup."E-Mail";
                    "Sent Time" := CURRENTDATETIME;
                    "User ID" := USERID;
                    TESTFIELD("1st Approval to");
                    TESTFIELD("1st Apprv. Status", 0);

                    UserSetup2.GET("1st Approval to");
                    SenderAddress := UserSetup."E-Mail";
                    "Current pending Person" := "1st Approval to";
                    ToName := UserSetup2."E-Mail";

                    Subject := STRSUBSTNO(text001, "No.");
                    CreateEmailBody("No.", Addressee, text001, "Staff Name", Purpose, "IOU Amount", Balance);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;
            end;
        }
        field(44; Comment; Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE("Table Name" = filter(15),
                                                      "No." = FIELD("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Staff No."; Code[20])
        {
        }
        field(46; "Staff Name"; Text[50])
        {
        }
        field(47; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(48; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(49; Balance; Decimal)
        {
        }
        field(50; "Test Report"; Boolean)
        {
        }
        field(51; "Applies-to Doc. Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Applies-to Doc. Type';
            Editable = false;
        }
        field(52; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            Editable = false;

            trigger OnLookup()
            var
                GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
            begin
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                TempGenJnlLine: Record "Gen. Journal Line" temporary;
            begin
            end;
        }
        field(53; "Apply Entry"; Integer)
        {
            TableRelation = "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("Staff No."),
                                                                    Open = filter(true),
                                                                    Positive = filter(true));

            trigger OnValidate()
            begin
                IF "Staff No." <> '' THEN BEGIN
                    IF CustLedgEntry.GET("Apply Entry") THEN BEGIN
                        //"Applies-to Doc. Type" := cus;

                        "Applies-to Doc. No." := CustLedgEntry."Document No.";
                    END ELSE BEGIN
                        //"Applies-to Doc. Type" := 0;
                        "Applies-to Doc. No." := '';
                    END;
                END;
            end;
        }
        field(54; Reject; Boolean)
        {
        }
        field(55; Department; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
            SumIndexFields = "Original IOU Amount";
        }
        key(Key2; Posted)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."System Admin" THEN
            ERROR('You can not delete this entry. Contact your System Administrator!');
    end;

    trigger OnInsert()
    begin
        GLSetup.GET;
        IF "No." = '' THEN BEGIN
            // ensure that blank (unused) Retirements are re-used
            // tie such Retirements to users
            RetireRec.COPYFILTERS(Rec);
            RetireRec.SETFILTER(RetireRec."No.", '<>%1', '');
            RetireRec.SETRANGE(RetireRec."IOU No.", '');
            RetireRec.SETRANGE("Send for Approval", FALSE);
            //RetireRec.SETRANGE(RetireRec."User ID",USERID);
            IF RetireRec.FindFirst() THEN
                ERROR('Created IOU Retirement No. %1 not used!\New Retirement cannot be created', RetireRec."No.");

            GLSetup.TESTFIELD(GLSetup."Retirement Nos.");
            "No." := NoSeriesMgt.GetNextNo(GLSetup."Retirement Nos.");
        END;

        "User ID" := USERID;
        "Entry Date" := WORKDATE;
        UserSetup.GET(USERID);
        Department := UserSetup.Department;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RetireRec: Record "IOU Retirement Header";
        IOURec: Record "IOU Register";
        Text006: Label 'Previous Retirement for this IOU must first be posted';
        UserSetup: Record "User Setup";
        mailsent: Boolean;
        ToName: Text[80];
        Bcc: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[500];
        attachement: Text[260];
        Opendialog: Boolean;
        text003: Label 'Document %1 has been approved.';
        text004: Label 'Document %1 has been rejected.';
        text005: Label 'Document %1 is on hold.';
        text001: Label 'Document %1 requires your approval.';
        CustLedgEntry: Record "Cust. Ledger Entry";
        CRLF: Text[2];
        SendersName: Text;
        Addressee: Text;
        UserSetup2: Record "User Setup";
        CcAddresses: Text;
        BccAddresses: Text;
        SenderAddress: Text;
        ToAddresses: Text;
        Purpose: Text;
        Amount: Decimal;
        "IOU Amount": Decimal;
        "Retire Amount": Decimal;
        Text007: Label 'Regards,';
        Text008: Label 'Mail sent successfully.';
        Text009: Label 'Staff Name :';
        Text010: Label 'Purpose :';
        Text011: Label 'Dear %1,';
        Text012: Label 'IOU Amount :#';
        Text013: Label 'Balance :#';
        Text014: Label 'Amount Retired :#';
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlLine2: Record "Gen. Journal Line";
        AmtFactor: Decimal;
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
        Customer: Record Customer;
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemLedgEntryNo: Integer;
        ValueEntry: Record "Value Entry";
        ReservEntry: Record "Reservation Entry";
        SerialNo: Code[20];
        SalesLine: Record "Sales Line";
        ItemNo: Code[20];
        UnitPrice: Decimal;
        Margin: Decimal;
        RetLines: Record "IOU Retirement Lines";
        RetLines2: Record "IOU Retirement Lines";
        PayRecpt: Record "Payment/Receipt.";
        LineNo: Integer;
        DocNo: Code[20];
        AcctType: array[3] of Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        AcctNo: array[3] of Code[20];
        Descr: array[3] of Text[30];
        RemAmt: Decimal;
        Claim: Decimal;
        Refund: Decimal;
        LineCount: Integer;
        i: Integer;
        Reportprint: Codeunit "Test Report-Print";
        TempEmailItem: Record "Email Item" temporary;
        EmailBody: Text[1024];
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;


    procedure Navigate()
    begin
    end;


    procedure Testgl(RetireRec: Record "IOU Retirement Header")
    var
        GlJour: Record "Gen. Journal Line";
        "GlJou 2": Record "Gen. Journal Line";
        GLENTRY: Record "G/L Entry";
        GenJnlLine: Record "Gen. Journal Line";
    begin
        GlJour.LOCKTABLE;

        //DelResidualJnl(RetireRec."Document Type",RetireRec."Cash/Cheque");
        //ValidateMultipleAcc(RetireRec);

        GlJour.INIT;
        GlJour."Journal Template Name" := 'GENERAL';
        GlJour."Journal Batch Name" := 'RETIRE';

        //added by Baslam - begin
        IF NOT GenJnlBatch.GET('GENERAL', 'RETIRE') THEN BEGIN
            GenJnlBatch.INIT;
            GenJnlBatch."Journal Template Name" := 'GENERAL';
            GenJnlBatch.Name := 'RETIRE';
            GenJnlBatch.Description := 'IOU Retirement';
            GenJnlBatch.INSERT;
        END ELSE BEGIN
            GenJnlBatch.Description := 'IOU Retirement';
            GenJnlBatch.MODIFY;
        END;

        //clear journal lines
        GenJnlLine2.SETRANGE("Journal Template Name", 'GENERAL');
        GenJnlLine2.SETRANGE("Journal Batch Name", 'RETIRE');
        IF GenJnlLine2.FINDSET THEN
            GenJnlLine2.DELETEALL;

        RemAmt := 0;
        //Claim := 0;
        //Refund := 0;
        LineNo := 10000;


        //.....Dada: The option is removed from the form as requested by Audit.
        IOURec.GET(Rec."IOU No.");
        IOURec.CALCFIELDS(IOURec."Amount Retired");
        Rec.CALCFIELDS(Rec."Amount To Retire");
        RemAmt := IOURec.Amount - (IOURec."Amount Retired" + Rec."Amount To Retire");
        IF (RemAmt = 0) OR (RemAmt < 0) THEN
            Rec."Retirement Options" := Rec."Retirement Options"::"Full Retirement"
        ELSE
            Rec."Retirement Options" := Rec."Retirement Options"::"Partial Retirement";

        //.....Dada


        CASE Rec."Retirement Options" OF
            0:
                BEGIN  //full retirement
                    IOURec.GET(Rec."IOU No.");
                    IOURec.CALCFIELDS(IOURec."Amount Retired");
                    Rec.CALCFIELDS(Rec."Amount To Retire");
                    RemAmt := IOURec.Amount - (IOURec."Amount Retired" + Rec."Amount To Retire");
                    IF RemAmt < 0 THEN
                        Claim := ABS(RemAmt)
                    ELSE
                        IF RemAmt > 0 THEN
                            Refund := ABS(RemAmt)
                        ELSE BEGIN
                            Claim := 0;
                            Refund := 0;
                        END;
                    //create journal by baslam
                    RetLines.SETFILTER(RetLines."Retirement No.", Rec."No.");
                    RetLines.FINDSET;
                    REPEAT
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'RETIRE';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Rec."Entry Date";
                        GenJnlLine."Account Type" := RetLines."Account Type";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.", RetLines."Account No.");
                        GenJnlLine."Document No." := Rec."No.";
                        GenJnlLine.Description := RetLines.Description;
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code", RetLines."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code", RetLines."Shortcut Dimension 2 Code");
                        GenJnlLine.VALIDATE(GenJnlLine.Amount, RetLines.Amount);
                        GenJnlLine."Reason Code" := 'RETIRE';
                        GenJnlLine."System-Created Entry" := TRUE;
                        //GenJnlLine."Gen. Posting Type" := 0;
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::"Fixed Asset" THEN BEGIN
                            GenJnlLine."Depreciation Book Code" := '';
                            GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::" ";
                            GenJnlLine."Maintenance Code" := '';
                        END ELSE BEGIN
                            GenJnlLine.VALIDATE("FA Posting Type", RetLines."FA Posting Type");
                            GenJnlLine.VALIDATE("Maintenance Code", RetLines."Maintenance Code");
                        END;
                        GenJnlLine.INSERT;
                        COMMIT;
                        LineNo := LineNo + 10000;
                    UNTIL RetLines.NEXT = 0;
                    //insert bal acc
                    GenJnlLine."Journal Template Name" := 'GENERAL';
                    GenJnlLine."Journal Batch Name" := 'RETIRE';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Rec."Entry Date";
                    GenJnlLine."Account Type" := IOURec."Account Type";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.", IOURec."Account No.");
                    GenJnlLine."Document No." := Rec."No.";
                    GenJnlLine.Description := 'IOU Retirement' + ' ' + 'of' + ' ' + Rec."IOU No.";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount, (-1) * Rec."Amount To Retire");
                    GenJnlLine."Reason Code" := 'RETIRE';
                    GenJnlLine."System-Created Entry" := TRUE;
                    GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", IOURec."Global Dimension 1 Code");
                    GenJnlLine.VALIDATE("Shortcut Dimension 2 Code", IOURec."Global Dimension 2 Code");
                    //GenJnlLine."Gen. Posting Type" := 0;
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine."Applies-to Doc. Type" := Rec."Applies-to Doc. Type";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.", Rec."Applies-to Doc. No.");
                    IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::"Fixed Asset" THEN BEGIN
                        GenJnlLine."Depreciation Book Code" := '';
                        GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::" ";
                        GenJnlLine."Maintenance Code" := '';
                    END ELSE BEGIN
                        GenJnlLine.VALIDATE("FA Posting Type", RetLines."FA Posting Type");
                        GenJnlLine.VALIDATE("Maintenance Code", RetLines."Maintenance Code");
                    END;
                    GenJnlLine.INSERT;
                    COMMIT;
                    // GenJnlPost.RUN(GenJnlLine);
                    //in case of refund create cash receipt
                    /*IF Refund <>  0 THEN BEGIN
                      PayRecpt."Document Type" := PayRecpt."Document Type"::Receipt;
                      PayRecpt."Cash/Cheque" := PayRecpt."Cash/Cheque"::Cash;
                      PayRecpt."Account Type" := IOURec."Account Type";
                      PayRecpt.VALIDATE(PayRecpt."Account No.",IOURec."Account No.");
                      PayRecpt."Transaction Description" := 'Refund on IOU ' + IOURec."IOU No.";
                      PayRecpt.VALIDATE("Global Dimension 1 Code",IOURec."Global Dimension 1 Code");
                      PayRecpt.VALIDATE("Global Dimension 2 Code",IOURec."Global Dimension 2 Code");
                      PayRecpt."Posting Date" := TODAY;
                      PayRecpt.VALIDATE(PayRecpt."Credit Amount",Refund);
                      PayRecpt.INSERT(TRUE);
                    END;
                    //in case of claim create cash requisition
                    IF Claim <> 0 THEN BEGIN
                      PayRecpt."Document Type" := PayRecpt."Document Type"::Requisition;
                      PayRecpt."Cash/Cheque" := PayRecpt."Cash/Cheque"::Cash;
                      PayRecpt."Account Type" := IOURec."Account Type";
                      PayRecpt.VALIDATE(PayRecpt."Account No.",IOURec."Account No.");
                      PayRecpt."Transaction Description" := 'Claim on IOU ' + IOURec."IOU No.";
                      PayRecpt.VALIDATE("Global Dimension 1 Code",IOURec."Global Dimension 1 Code");
                      PayRecpt.VALIDATE("Global Dimension 2 Code",IOURec."Global Dimension 2 Code");
                      PayRecpt."Posting Date" := TODAY;
                      PayRecpt.VALIDATE(PayRecpt."Debit Amount",Claim);
                      PayRecpt.INSERT(TRUE);
                    END;*/ //suspended

                    // Rec.Posted := TRUE;
                    Rec.MODIFY;
                    RetLines2.SETFILTER(RetLines2."Retirement No.", Rec."No.");
                    RetLines2.FINDSET;
                    // RetLines2.MODIFYALL(RetLines2.Posted,TRUE);
                    // IOURec.Retired := TRUE;
                    IOURec.MODIFY;
                END;
            1:
                BEGIN //partial retirement
                    IOURec.GET(Rec."IOU No.");
                    IOURec.CALCFIELDS(IOURec."Amount Retired");
                    Rec.CALCFIELDS(Rec."Amount To Retire");
                    RemAmt := IOURec.Amount - (IOURec."Amount Retired" + Rec."Amount To Retire");
                    IF RemAmt < 0 THEN
                        ERROR('Retirement amount cannot be greater than IOU amount for partial retirement!');

                    IF RemAmt = 0 THEN
                        ERROR('Change retirement option to full retirement!');

                    //create journal by baslam
                    RetLines.SETFILTER(RetLines."Retirement No.", Rec."No.");
                    RetLines.FINDSET;
                    REPEAT
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'RETIRE';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Rec."Entry Date";
                        GenJnlLine."Account Type" := RetLines."Account Type";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.", RetLines."Account No.");
                        GenJnlLine."Document No." := Rec."No.";
                        GenJnlLine.Description := RetLines.Description;
                        GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", RetLines."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE("Shortcut Dimension 2 Code", RetLines."Shortcut Dimension 2 Code");
                        GenJnlLine.VALIDATE(GenJnlLine.Amount, RetLines.Amount);
                        GenJnlLine."Reason Code" := 'RETIRE';
                        GenJnlLine."System-Created Entry" := TRUE;
                        //GenJnlLine."Gen. Posting Type" := 0;
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::"Fixed Asset" THEN BEGIN
                            GenJnlLine."Depreciation Book Code" := '';
                            GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::" ";
                            GenJnlLine."Maintenance Code" := '';
                        END ELSE BEGIN
                            GenJnlLine.VALIDATE("FA Posting Type", RetLines."FA Posting Type");
                            GenJnlLine.VALIDATE("Maintenance Code", RetLines."Maintenance Code");
                        END;
                        GenJnlLine.INSERT;
                        COMMIT;
                        LineNo := LineNo + 10000;
                    UNTIL RetLines.NEXT = 0;
                    //insert bal acc
                    GenJnlLine."Journal Template Name" := 'GENERAL';
                    GenJnlLine."Journal Batch Name" := 'RETIRE';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Rec."Entry Date";
                    GenJnlLine."Account Type" := IOURec."Account Type";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.", IOURec."Account No.");
                    GenJnlLine."Document No." := Rec."No.";
                    GenJnlLine.Description := 'IOU Retirement' + ' ' + 'of' + ' ' + Rec."IOU No.";
                    GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", IOURec."Global Dimension 1 Code");
                    GenJnlLine.VALIDATE("Shortcut Dimension 2 Code", IOURec."Global Dimension 2 Code");
                    GenJnlLine.VALIDATE(GenJnlLine.Amount, (-1) * Rec."Amount To Retire");
                    GenJnlLine."Reason Code" := 'RETIRE';
                    GenJnlLine."System-Created Entry" := TRUE;
                    //GenJnlLine."Gen. Posting Type" := 0;
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine."Applies-to Doc. Type" := Rec."Applies-to Doc. Type";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.", Rec."Applies-to Doc. No.");
                    IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::"Fixed Asset" THEN BEGIN
                        GenJnlLine."Depreciation Book Code" := '';
                        GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::" ";
                        GenJnlLine."Maintenance Code" := '';
                    END ELSE BEGIN
                        GenJnlLine.VALIDATE("FA Posting Type", RetLines."FA Posting Type");
                        GenJnlLine.VALIDATE("Maintenance Code", RetLines."Maintenance Code");
                    END;
                    GenJnlLine.INSERT;
                    COMMIT;
                    // GenJnlPost.RUN(GenJnlLine);


                END;
        END;
        //check and delete existing entries on the journal line
        COMMIT;

        IF "Test Report" THEN
            Reportprint.PrintGenJnlLine(GlJour);

    end;


    procedure CreateEmailBody(DocNo: Code[20]; RecipientInitials: Text; BodyMsg: Text; StaffName: Text; RetPurpose: Text; RetireAmount: Decimal; BalAmount: Decimal);

    begin

        UserSetup.Get(UserId);

        EmailBody := STRSUBSTNO(Text011, RecipientInitials);
        EmailBody += '<br><br>';
        EmailBody += STRSUBSTNO(BodyMsg, DocNo);
        EmailBody += '<br>';
        EmailBody += Text009 + FORMAT("Staff Name");
        EmailBody += '<br>';
        EmailBody += Text010 + FORMAT(Purpose);
        EmailBody += '<br>';
        EmailBody += Text012 + FORMAT("IOU Amount");
        EmailBody += '<br>';
        EmailBody += Text014 + FORMAT("Retire Amount");
        EmailBody += '<br>';
        EmailBody += Text013 + FORMAT(Balance);
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;
    end;

    procedure SendEmail(ToRecipients: Text; Subject: Text; Body: Text; CCRecipients: Text; BCCRecipients: Text)
    var

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";


    begin

        EmailMessage.Create(ToRecipients, Subject, EmailBody, true);
        EmailMessage.AddRecipient(enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;
}

