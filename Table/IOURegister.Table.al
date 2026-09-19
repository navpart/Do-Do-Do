table 50105 "IOU Register"
{
    DrillDownPageId = 50078;
    fields
    {
        field(1; "IOU No."; Code[20])
        {
            Editable = true;
        }
        field(2; "Entry Date"; Date)
        {
            Editable = true;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Payment Date"; Date)
        {
        }
        field(6; "Collected By"; Code[20])
        {
            TableRelation = Customer WHERE(Type = filter('Staff'));
        }
        field(7; "Staff Name"; Text[30])
        {
        }
        field(8; Retired; Boolean)
        {
        }
        field(9; Void; Boolean)
        {
        }
        field(10; "Voided By"; Code[20])
        {
        }
        field(11; Paid; Boolean)
        {

            trigger OnValidate()
            begin
                IF Paid THEN
                    "Paid By" := USERID
                ELSE
                    "Paid By" := '';
            end;
        }
        field(12; "Paid By"; Code[20])
        {
            Editable = false;
        }
        field(13; "User Id"; Code[25])
        {
        }
        field(14; "Manual Voucher No."; Code[20])
        {
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(16; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(17; "Expected Retirement Date"; Date)
        {
        }
        field(18; Posted; Boolean)
        {
            Editable = false;
        }
        field(19; "Amount Retired"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("IOU Retirement Lines".Amount WHERE("IOU No." = FIELD("IOU No."),
                                                                   Posted = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Account Type"; Enum "Gen. Journal Account Type")
        {


            trigger OnValidate()
            begin
                IF xRec."Account Type" <> "Account Type" THEN
                    "Account No." := '';
            end;
        }
        field(21; "Account No."; Code[20])
        {
            TableRelation = IF ("Account Type" = filter('G/L Account')) "G/L Account"
            ELSE
            IF ("Account Type" = filter('Customer')) Customer WHERE("Gen. Bus. Posting Group" = CONST('OTHERSALES'))
            ELSE
            IF ("Account Type" = filter('Vendor')) Vendor;

            trigger OnValidate()
            begin
                CASE "Account Type" OF
                    "Account Type"::Customer:
                        BEGIN
                            Customer.GET("Account No.");
                            "Account Name" := Customer.Name;
                            Customer.TESTFIELD(Customer.Blocked, 0);
                            Customer.TESTFIELD(Customer."Customer Posting Group");
                            Customer.TESTFIELD(Customer."Gen. Bus. Posting Group");
                            Customer.TESTFIELD(Customer."VAT Bus. Posting Group");
                        END;
                    "Account Type"::"G/L Account":
                        BEGIN
                            GLAcc.GET("Account No.");
                            GLAcc.TESTFIELD(GLAcc."Account Type", GLAcc."Account Type"::Posting);
                            GLAcc.TESTFIELD(GLAcc."Direct Posting");
                            "Account Name" := GLAcc.Name;
                        END;
                    "Account Type"::Vendor:
                        BEGIN
                            VendorRec.GET("Account No.");
                            VendorRec.TESTFIELD(VendorRec.Blocked, 0);
                            VendorRec.TESTFIELD(VendorRec."Vendor Posting Group");
                            VendorRec.TESTFIELD(VendorRec."Gen. Bus. Posting Group");
                            VendorRec.TESTFIELD(VendorRec."VAT Bus. Posting Group");
                            "Account Name" := VendorRec.Name;
                        END;
                    "Account Type"::"Bank Account":
                        BEGIN
                            BankRec.GET("Account No.");
                            BankRec.TESTFIELD(BankRec."Bank Acc. Posting Group");
                            BankRec.TESTFIELD(BankRec.Blocked, FALSE);
                            "Account Name" := BankRec.Name;
                        END;
                    "Account Type"::"Fixed Asset":
                        BEGIN
                            FixedAssetRec.GET("Account No.");
                            FixedAssetRec.TESTFIELD(FixedAssetRec.Blocked, FALSE);
                            FixedAssetRec.TESTFIELD(FixedAssetRec.Inactive, FALSE);
                            FixedAssetRec.TESTFIELD(FixedAssetRec."Budgeted Asset", FALSE);
                            "Account Name" := FixedAssetRec.Description;
                        END;
                END;
            end;
        }
        field(22; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            InitValue = "Bank Account";
            //OptionMembers = "G/L Account","Bank Account";

            trigger OnValidate()
            begin
                IF xRec."Bal. Account Type" <> "Bal. Account Type" THEN
                    "Bal. Account No." := '';
            end;
        }
        field(23; "Bal. Account No."; Code[20])
        {
            TableRelation = IF ("Bal. Account Type" = filter('G/L Account')) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = filter('Bank Account')) "Bank Account";
        }
        field(24; "No. Printed"; Code[20])
        {
        }
        field(25; "Retirement Date"; Date)
        {
        }
        field(26; "Converted to Loan"; Boolean)
        {
        }
        field(27; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                IF Approved THEN
                    "Approved By" := USERID
                ELSE
                    "Approved By" := '';
            end;
        }
        field(28; "Approved By"; Code[25])
        {
            Editable = false;
        }
        field(29; "Account Name"; Text[50])
        {
        }
        field(30; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                IF NOT CONFIRM('Are you sure you want to send for Approval', FALSE) THEN
                    "Send for Approval" := FALSE
                ELSE BEGIN

                    TESTFIELD("Account No.");
                    TESTFIELD("Account Type", 1);
                    IF ("Global Dimension 1 Code" = '') OR ("Global Dimension 2 Code" = '') THEN
                        ERROR('You need to choose your department and branch Code!');

                    IF "1st Approval to" = '' THEN
                        ERROR('You need to choose an approver!');

                    IF "Send for Approval" = TRUE THEN
                        "Staff Name" := "Account Name";
                    Purpose := Description;
                    Amount := Amount;

                    UserSetup.GET(USERID);
                    Sender := UserSetup."User ID";
                    SendersName := UserSetup.Initials;
                    SenderAddress := UserSetup."E-Mail";
                    "Sent Time" := CURRENTDATETIME;

                    UserSetup2.GET("1st Approval to");
                    ToAddresses := UserSetup2."E-Mail";
                    Addressee := UserSetup2.Initials;
                    CcAddresses := '';
                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text001, "IOU No.");
                    CreateEmailBody("IOU No.", Addressee, Text001, "Staff Name", Description, Amount);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;
            end;
        }
        field(31; Sender; Text[50])
        {
            Editable = true;

            trigger OnValidate()
            begin
                //TESTFIELD("Account No.");
            end;
        }
        field(32; "Sent Time"; DateTime)
        {
            Editable = false;
        }
        field(33; "1st Approval to"; Code[25])
        {
            TableRelation = IF (Department = FILTER('02ADMINHR')) "User Setup"."User ID" WHERE("User ID" = FILTER('IBIDAPO-OBE|KOLAWOLE'))
            ELSE
            IF (Department = FILTER('03OPLOGI')) "User Setup"."User ID" WHERE("User ID" = FILTER('SEGUN|TOLA'))
            ELSE
            IF (Department = FILTER('04DDEV')) "User Setup"."User ID" WHERE("User ID" = FILTER('HENRY|OLUFEMI'))
            ELSE
            IF (Department = FILTER('05PARTS')) "User Setup"."User ID" WHERE("User ID" = FILTER('AKINDELE|ISUEKEBHO|RAVINDER|SYLVESTER|IBIDAPO-OBE|BAMIDELE|KOLAWOLE|UZONWANNE'))
            ELSE
            IF (Department = FILTER('06SERVICE')) "User Setup"."User ID" WHERE("User ID" = FILTER('BAMIDELE|SYLVESTER'))
            ELSE
            IF (Department = FILTER('07FINACC')) "User Setup"."User ID" WHERE("User ID" = FILTER('ALBERT|BUNMI|PAA'))
            ELSE
            IF (Department = FILTER('08AUDSYS')) "User Setup"."User ID" WHERE("User ID" = FILTER('ADEWUMI|BRANO|OLAMIDE'))
            ELSE
            IF (Department = FILTER('09MARKET')) "User Setup"."User ID" WHERE("User ID" = FILTER('BAYO|BUKUNOLA'));



            trigger OnValidate()
            begin
                IF "1st Approval to" = USERID THEN
                    ERROR('You cannot select yourself as the first approver!');

                IF UserSetup.GET("1st Approval to") THEN
                    "1st Approver" := UserSetup.Name;
            end;
        }
        field(34; "1st Approver"; Text[50])
        {
        }
        field(35; "1st Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", TRUE);
                TESTFIELD("1st Approval to", USERID);

                IF "1st Apprv. Status" = "1st Apprv. Status"::Approved THEN
                    IF NOT CONFIRM('Are you sure you want to APPROVE', FALSE) THEN
                        "1st Apprv. Status" := IOURec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;

                        TESTFIELD("2nd Approval to");
                        UserSetup.GET("2nd Approval to");
                        "1st Approval Time" := CURRENTDATETIME;
                        "Current pending Person" := "2nd Approval to";
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';


                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text001, "IOU No.");
                        CreateEmailBody("IOU No.", Addressee, Text001, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;


                //"1st Apprv. Status"::Rejected:
                //BEGIN
                IF "1st Apprv. Status" = "1st Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT', FALSE) THEN
                        "1st Apprv. Status" := IOURec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;
                        "1st Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text004, "IOU No.");
                        ;
                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(Text004, "IOU No.");
                        CreateEmailBody("IOU No.", Addressee, Text004, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Reject := TRUE;
                    END;


                IF "1st Apprv. Status" = "1st Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place ON HOLD', FALSE) THEN
                        "1st Apprv. Status" := IOURec."1st Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;
                        "1st Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(text005, "IOU No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        CreateEmailBody("IOU No.", Addressee, Text005, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

            end;
        }
        field(36; "1st Approval Time"; DateTime)
        {

        }
        field(37; "1st Approver's Comment"; Boolean)
        {
            Editable = false;
        }
        field(38; "2nd Approval to"; Code[25])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("2nd Approval to") THEN
                    "2nd Approver" := UserSetup.Name;
            end;
        }
        field(39; "2nd Approver"; Text[50])
        {
        }
        field(40; "2nd Apprv. Status"; Option)
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
                        "2nd Apprv. Status" := IOURec."2nd Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;
                        "2nd Approval Time" := 0DT;
                        TESTFIELD("3rd Approval to");
                        "2nd Approval Time" := CURRENTDATETIME;
                        UserSetup.GET("3rd Approval to");
                        "Current pending Person" := "3rd Approval to";
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(text001, "IOU No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        CreateEmailBody("IOU No.", Addressee, Text001, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "2nd Apprv. Status" = "2nd Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to reject', FALSE) THEN
                        "2nd Apprv. Status" := IOURec."2nd Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;
                        "2nd Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        Subject := STRSUBSTNO(Text004, "IOU No.");

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        CreateEmailBody("IOU No.", Addressee, Text004, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                        Reject := TRUE;
                    END;

                IF "2nd Apprv. Status" = "2nd Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place ON HOLD', FALSE) THEN
                        "2nd Apprv. Status" := IOURec."2nd Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;
                        "2nd Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        Subject := STRSUBSTNO(text005, "IOU No.");
                        UserSetup2.GET(USERID);

                        CreateEmailBody("IOU No.", Addressee, Text005, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(41; "2nd Approval Time"; DateTime)
        {
        }
        field(42; "2nd Approver's Comment"; Boolean)
        {
        }
        field(43; "3rd Approval to"; Code[25])
        {
            TableRelation = "User Setup"."User ID" WHERE("User ID" = FILTER('BUNMI' | 'PAA' | 'ALBERT' | 'ONIMISI'));

            trigger OnValidate()
            begin
                IF UserSetup.GET("3rd Approval to") THEN
                    "3rd Approver" := UserSetup.Name;
            end;
        }
        field(44; "3rd Approver"; Text[50])
        {
        }
        field(45; "3rd Apprv.Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

        }
        field(46; "3rd Approval Time"; DateTime)
        {
        }
        field(47; "3rd Approver's Comment"; Boolean)
        {
        }
        field(48; "Final Approval to"; Code[25])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserSetup.GET("Final Approval to") THEN
                    "Final Approver's Name" := UserSetup.Name;
            end;
        }
        field(49; "Final Approver's Name"; Text[50])
        {
        }
        field(50; "Final Apprv. Status"; Option)
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
                        "Final Apprv. Status" := IOURec."Final Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;

                        TESTFIELD("1st Approval to");
                        "Final Approval Time" := CURRENTDATETIME;

                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(Text003, "IOU No.");
                        CreateEmailBody("IOU No.", Addressee, Text003, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;

                IF "Final Apprv. Status" = "Final Apprv. Status"::Rejected THEN
                    IF NOT CONFIRM('Are you sure you want to REJECT', FALSE) THEN
                        "Final Apprv. Status" := IOURec."Final Apprv. Status"::" "
                    ELSE BEGIN
                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;


                        "Final Approval Time" := CURRENTDATETIME;
                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text004, "IOU No.");
                        CreateEmailBody("IOU No.", Addressee, Text004, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');
                        Reject := TRUE;
                    END;


                IF "Final Apprv. Status" = "Final Apprv. Status"::"on Hold" THEN
                    IF NOT CONFIRM('Are you sure you want to place ON HOLD', FALSE) THEN
                        "Final Apprv. Status" := IOURec."Final Apprv. Status"::" "
                    ELSE BEGIN

                        "Staff Name" := "Account Name";
                        Purpose := Description;
                        Amount := Amount;

                        "Final Approval Time" := CURRENTDATETIME;
                        UserSetup.GET(Sender);
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;

                        CcAddresses := '';
                        BccAddresses := '';

                        UserSetup2.GET(USERID);
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";

                        Subject := STRSUBSTNO(text005, "IOU No.");
                        CreateEmailBody("IOU No.", Addressee, Text005, "Account Name", Description, Amount);
                        SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    END;
            end;
        }
        field(51; "Final Approval Time"; DateTime)
        {
        }
        field(52; "Final Approver's Comment"; Boolean)
        {
        }
        field(53; "General Comment"; Boolean)
        {
        }
        field(54; "Mail Body"; Text[250])
        {
        }
        field(55; "Current pending Person"; Code[25])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(56; Attachment; Text[250])
        {
        }
        field(57; "Send for 2nd Apprv."; Boolean)
        {

        }
        field(58; "Send for 3rd Apprv."; Boolean)
        {


        }
        field(59; Comment; Boolean)
        {

        }
        field(60; Treated; Boolean)
        {
        }
        field(61; "Expected Time of Payment"; Date)
        {
        }
        field(62; "Procurement No."; Code[10])
        {
        }
        field(63; "Procurement Type"; Option)
        {
            OptionCaption = 'Capex,Opex';
            OptionMembers = Capex,Opex;
        }
        field(64; Reject; Boolean)
        {
        }
        field(65; "No."; Code[12])
        {
            TableRelation = "Customer Order HeaderX"."No.";
        }
        field(66; "Customer Approved Amount"; Decimal)
        {
        }
        field(67; "Markup Amount"; Decimal)
        {
        }
        field(68; "Cost Amount"; Decimal)
        {
        }
        field(69; "120Isolo"; Boolean)
        {
        }
        field(70; "Requester Name"; Text[50])
        {
        }
        field(71; Requester; Code[80])
        {
        }
        field(72; Department; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "IOU No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }


    trigger OnInsert()
    begin
        GLSetup.GET;

        IF "IOU No." = '' THEN BEGIN
            // ensure that blank (un-used) IOUs are re-used
            // tie such IOUs to users
            IOURec.COPYFILTERS(Rec);
            IOURec.SETFILTER(IOURec."IOU No.", '<>%1', '');
            IOURec.SETRANGE(IOURec.Amount, 0);
            IOURec.SETRANGE(IOURec."User Id", USERID);
            IF IOURec.FindFirst() THEN
                ERROR('Created IOU No. %1 not used!\New IOU cannot be created', IOURec."IOU No.");

            GLSetup.TESTFIELD("IOU Nos.");
            "IOU No." := NoSeriesMgt.GetNextNo(GLSetup."IOU Nos.");

        END;

        UserSetup.GET(USERID);
        "Requester Name" := UserSetup.Name;
        Requester := UserSetup."User ID";
        Department := UserSetup.Department;

        "User Id" := USERID;
        "Entry Date" := WORKDATE;
        "Payment Date" := TODAY;
    end;

    trigger OnDelete()
    Begin

        UserSetup.GET(USERID);
        IF NOT UserSetup."System Admin" THEN
            ERROR('You can not delete this entry. Contact your System Administrator!');

    End;


    trigger OnRename()
    begin
        //ERROR('Kindly contact your System Administrator');
    end;

    var
        GLSetup: Record "General Ledger Setup";
        IOURec: Record "IOU Register";
        CustRec: Record Customer;
        Customer: Record Customer;
        GLAcc: Record "G/L Account";
        VendorRec: Record Vendor;
        BankRec: Record "Bank Account";
        FixedAssetRec: Record "Fixed Asset";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        //approvalmessage: Codeunit Mail;
        mailsent: Boolean;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[500];
        attachement: Text[260];
        Opendialog: Boolean;
        Text001: Label 'IOU Document %1 requires your approval';
        Text003: Label 'IOU Document %1 has been approved';
        Text004: Label 'IOU Document %1 has been rejected';
        Text005: Label 'Document %1 is on hold';
        Bcc: Text[80];
        Text006: Label 'Dear %1,';
        CRLF: Text;
        SendersName: Text;
        Addressee: Text;
        UserSetup2: Record "User Setup";
        //Mail: Codeunit Mail;
        CcAddresses: Text;
        BccAddresses: Text;
        SenderAddress: Text;
        ToAddresses: Text;
        "Staff Name": Text;
        Purpose: Text;
        //Amount: Decimal;
        text007: Label 'IOU  Document ''%1''  requires your approval';
        Text008: Label 'Regards,';
        Text009: Label 'Mail sent successfully.';
        Text010: Label 'Staff Name :';
        Text011: Label 'Purpose :';
        Text012: Label 'Amount :';
        TempEmailItem: Record "Email Item" temporary;
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;
        EmailBody: Text[1024];


    procedure CreateEmailBody(DocNo: Code[20]; RecipientInitials: Text; BodyMsg: Text; StaffName: Text; IOUPurpose: Text; IOUAmount: Decimal);

    begin

        UserSetup.Get(UserId);

        EmailBody := STRSUBSTNO(Text006, RecipientInitials);
        EmailBody += '<br><br>';
        EmailBody += STRSUBSTNO(BodyMsg, DocNo);
        EmailBody += '<br><br>';
        EmailBody += Text010 + FORMAT(StaffName);
        EmailBody += '<br>';
        EmailBody += Text011 + Format(IOUPurpose);
        EmailBody += '<br>';
        EmailBody += Text012 + Format(IOUAmount);
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

