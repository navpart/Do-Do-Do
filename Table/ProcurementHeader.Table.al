table 70008 "Procurement Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Capex,Opex';
            OptionMembers = Capex,Opex;
        }
        field(2; "No."; Code[10])
        {
            Editable = false;
        }
        field(3; "LPO No."; Code[20])
        {
            CalcFormula = Lookup("Purchase Header"."No." WHERE("Requsition No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(4; "Requester Code"; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                IF Employee.GET("Requester Code") THEN BEGIN
                    "Requester Name" := Employee."First Name" + ' ' + Employee."Last Name";
                    "Department Code" := Employee."Global Dimension 1 Code";
                END;
            end;
        }
        field(5; "Requester Name"; Text[50])
        {
            Editable = true;
        }
        field(6; "Department Code"; Code[10])
        {
            Editable = false;
        }
        field(7; "Requester Department"; Text[30])
        {
            Editable = false;
        }
        field(8; Date; Date)
        {
        }
        field(9; "Asset User Code"; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                IF Employee.GET("Asset User Code") THEN BEGIN
                    "Asset User Name" := Employee."First Name" + ' ' + Employee."Last Name";
                    "User Department Code" := Employee."Global Dimension 1 Code";
                END;
            end;
        }
        field(10; "Asset User Name"; Text[50])
        {
            Editable = false;
        }
        field(11; "User Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; "User Department Name"; Text[50])
        {
        }
        field(13; "Asset Class Code"; Code[10])
        {
            TableRelation = "FA Class";
        }
        field(14; "Asset Sub-class Code"; Code[10])
        {
            //TableRelation = "FA Subclass" WHERE (Field50000=FIELD(Asset Class Code));
        }
        field(15; "Asset Description"; Text[70])
        {
        }
        field(16; "Purchase Justification"; Text[100])
        {
        }
        field(17; "Budget Amount"; Decimal)
        {
        }
        field(18; "Proposed Purchase Amount"; Decimal)
        {
        }
        field(19; "HOD Code"; Code[20])
        {
        }
        field(20; "HOD Name"; Text[30])
        {
            Editable = false;
        }
        field(21; Approved1; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Proposed Purchase Amount" >= 100000 THEN;
                //mail should go to MD else mail should go to GM
            end;
        }
        field(22; Approved2; Boolean)
        {

            trigger OnValidate()
            begin
                //Mail sent to HOD and requester
            end;
        }
        field(23; "On-Hold1"; Boolean)
        {
        }
        field(24; "On-Hold2"; Boolean)
        {
        }
        field(25; Rejected1; Boolean)
        {

            trigger OnValidate()
            begin
                //Mail sent to requester;
            end;
        }
        field(26; Rejected2; Boolean)
        {

            trigger OnValidate()
            begin
                //Mail sent to HOD and requester;
            end;
        }
        field(27; Comment1; Text[70])
        {
        }
        field(28; Comment2; Text[70])
        {
        }
        field(29; Value; Decimal)
        {
        }
        field(30; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(31; "User ID"; Code[50])
        {
        }
        field(32; "Request Entry No."; Code[10])
        {
        }
        field(33; "Send To"; Code[30])
        {
            TableRelation = "Head of Department"."Head of Department" WHERE("Department Code" = FIELD("Department Code"));
        }
        field(34; Send; Boolean)
        {

            trigger OnValidate()
            begin

                TESTFIELD("Send To");
                TESTFIELD("Purchase Justification");
                IF "Document Type" = "Document Type"::Opex THEN BEGIN
                    IF ("Opex Type" = "Opex Type"::SLA) OR ("Opex Type" = "Opex Type"::SE) OR ("Opex Type" = "Opex Type"::"Recurrent Service") THEN
                        TESTFIELD("Payment Approval Only", TRUE);
                END;

                ProcurementLine.SETRANGE("Document Type", "Document Type");
                ProcurementLine.SETRANGE("Document No.", "No.");
                IF ProcurementLine.FINDFIRST THEN BEGIN
                    REPEAT
                        ProcurementLine.CALCFIELDS(Amount);
                        IF (ProcurementLine.Amount) <> (ProcurementLine."Advance Payment" + ProcurementLine.Balance) THEN
                            ERROR('Kindly check the amount.');
                    UNTIL ProcurementLine.NEXT = 0;
                END;

                ProcurementLine.SETRANGE("Document Type", "Document Type");
                ProcurementLine.SETRANGE("Document No.", "No.");
                IF ProcurementLine.FINDFIRST THEN BEGIN
                    REPEAT
                        ProcurementLine.CALCFIELDS(Amount);
                        ProcurementLine.TESTFIELD(Amount);
                        ProcurementLine.TESTFIELD(Description);
                        ProcurementLine.TESTFIELD("Payment Terms");
                    UNTIL ProcurementLine.NEXT = 0;
                END;

                TESTFIELD("Proposed Purchase Amount");
                IF "Document Type" = "Document Type"::Opex THEN
                    TESTFIELD("Opex Type");
                IF "Document Type" = "Document Type"::Capex THEN
                    TESTFIELD("Capex Type");
                IF "Document Type" = "Document Type"::Opex THEN
                    TESTFIELD("Purchase Type");

                TESTFIELD("Purchase Justification");


                IF Send = TRUE THEN BEGIN
                    ProcurementLine.SETRANGE("Document Type", "Document Type");
                    ProcurementLine.SETRANGE("Document No.", "No.");
                    IF "Count skip" = FALSE THEN BEGIN
                        IF ProcurementLine.COUNT < 3 THEN
                            IF "Proposed Purchase Amount" >= 50000 THEN
                                IF ("Opex Type" IN ["Opex Type"::"New Service", "Opex Type"::Consumable]) OR ("Capex Type" IN ["Capex Type"::"Fixed Asset"]) THEN
                                    ERROR(Text002);
                    END;

                    //sender
                    IF UserSetup2.GET(USERID) THEN BEGIN
                        "Sent By" := UserSetup2."User ID";
                        SendersName := UserSetup2.Initials;
                        SenderAddress := UserSetup2."E-Mail";
                    END;

                    IF UserSetup.GET("Send To") THEN BEGIN
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;  //target
                    END;

                    Subject := STRSUBSTNO(Text007, "Document Type", "No.");

                    CreateEmailBody("Document Type", "No.", Text026, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                END;

            end;
        }
        field(35; "Sent By"; Code[50])
        {
        }
        field(36; Approved3; Boolean)
        {
        }
        field(37; Rejected3; Boolean)
        {
        }
        field(38; "On-Hold3"; Boolean)
        {
        }
        field(39; Comment3; Text[70])
        {
        }
        field(40; "Opex Type"; Option)
        {
            OptionCaption = ' ,SLA,SE,Recurrent Service,Consumable,New Service,Entertainment';
            OptionMembers = " ",SLA,SE,"Recurrent Service",Consumable,"New Service",Entertainment;
        }
        field(41; "Capex Type"; Option)
        {
            OptionCaption = ' ,Fixed Asset,Sundry Asset';
            OptionMembers = " ","Fixed Asset","Sundry Asset";
        }
        field(42; "Purchase Type"; Option)
        {
            OptionCaption = ' ,Direct Purchase,3rd Party';
            OptionMembers = " ","Direct Purchase","3rd Party";

            trigger OnValidate()
            begin
                IF "Purchase Type" = "Purchase Type"::"Direct Purchase" THEN
                    MESSAGE(Text021);
            end;
        }
        field(43; "Posted Invoice"; Decimal)
        {
            CalcFormula = Sum("Detailed Vendor Ledg. Entry"."Credit Amount (LCY)" WHERE("Requisition No." = FIELD("No."),
                                                                                         "Document Type" = CONST(Invoice)));
            FieldClass = FlowField;
        }
        field(44; "Posted Payments"; Decimal)
        {
            CalcFormula = Sum("G/L Entry"."Debit Amount" WHERE("Procument No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(45; "Advance Payment"; Boolean)
        {
        }
        field(46; "Invoice Received"; Boolean)
        {
        }
        field(47; "Adv. Paymt. HOD"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                IF "Head of Department" <> "Head of Department"::Approved THEN
                    ERROR(Text040);
                IF "Head of Audit" <> "Head of Audit"::Approved THEN
                    ERROR(Text041);
                IF ("General Manager" <> "General Manager"::Approved) AND
                  ("Managing Director" <> "Managing Director"::Approved) THEN
                    ERROR(Text042);


                UserSetup4.GET(USERID);
                IF UserSetup4."User ID" <> "Send To" THEN
                    ERROR(Text040);

                IF "Adv. Paymt. HOD" = "Adv. Paymt. HOD"::Approved THEN BEGIN

                    /* CapexOpexLine.SETRANGE("Document Type", "Document Type");
                    CapexOpexLine.SETRANGE("Document No.", "No.");
                    CapexOpexLine.SETRANGE(Preferred, TRUE);
                    IF CapexOpexLine.FINDFIRST THEN BEGIN
                        CapexOpexLine.CALCFIELDS(Amount);
                          VendAmt := CapexOpexLine.Amount;
                          Advance := CapexOpexLine."Advance Payment";
                          Balance := CapexOpexLine.Balance;
                          VendName := CapexOpexLine."Vendor Name";
                          VendAddr := CapexOpexLine.Address;
                          PurJus := CapexOpexLine.Description;

                    END; */

                    CreateEmailBody("Document Type", "No.", Text037, 'STA');

                    UserSetup.GET("Send To");
                    IF UserSetup."User ID" <> "Send To" THEN
                        ERROR(Text040);

                    PurchSetup.GET;
                    ToAddresses := 'adewumi@toyotanigeria.com';
                    //CcAddresses := ;
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text013, "Document Type", "No.");

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate5 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text047, "Document Type", "No.");
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Adv. Paymt. HOD" = "Adv. Paymt. HOD"::"On-hold" THEN BEGIN


                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Name;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate5 := CURRENTDATETIME;

                    AdvHODonHold5 := UserSetup4.Name;
                    OnholdTimeDate5 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;

                IF "Adv. Paymt. HOD" = "Adv. Paymt. HOD"::Rejected THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Name;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate5 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;
            end;
        }
        field(48; "Authorized by HOD"; Text[50])
        {
            Editable = false;
        }
        field(49; "Adv. Paymt. Audit"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                //mail to be sent to Accounts for payment


                IF "Adv. Paymt. HOD" <> "Adv. Paymt. HOD"::Approved THEN
                    ERROR(Text059);

                IF "Adv. Paymt. Audit" = "Adv. Paymt. Audit"::Approved THEN BEGIN

                    UserSetup.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := PurchSetup."Account Dept. Approvers";
                    CcAddresses := PurchSetup."CC Account Dept. Approvers".Split(';');
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate6 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text013, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text038, 'PAA');
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Move to LPO" := TRUE;
                END;

                IF "Adv. Paymt. Audit" = "Adv. Paymt. Audit"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';


                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate6 := CURRENTDATETIME;

                    AdvHOAonHold6 := UserSetup4.Name;
                    OnholdTimeDate6 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Adv. Paymt. Audit" = "Adv. Paymt. Audit"::Rejected THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Authorized by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate6 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Adv. Paymt. Audit" = "Adv. Paymt. Audit"::Approved THEN BEGIN
                    UserSetup.GET(USERID);
                    "Authorized by Audit" := UserSetup.Name;
                END ELSE BEGIN
                    "Authorized by Audit" := '';
                    MODIFY;
                END;
            end;
        }
        field(50; "Authorized by Audit"; Text[50])
        {
            Editable = false;
        }
        field(51; "Service Delivery1"; Option)
        {
            OptionCaption = ' ,Satisfactory,Not Satisfactory';
            OptionMembers = " ",Satisfactory,"Not Satisfactory";
            trigger OnValidate()
            begin
                IF (Compliance = FALSE) AND ("Advance Voucher" = FALSE) THEN
                    ERROR('Compliance check is not allowed at this stage');

                ProcurementLine.SETRANGE("Document Type", "Document Type");
                ProcurementLine.SETRANGE("Document No.", "No.");

                IF ProcurementLine.FINDFIRST THEN BEGIN
                    REPEAT
                        ProcurementLine.CALCFIELDS(Amount);
                    //IF  (ProcurementLine.Amount ) <> (ProcurementLine."Advance Payment" + ProcurementLine.Balance)THEN
                    //ERROR('Kindly check the amount.');

                    UNTIL ProcurementLine.NEXT = 0;
                END;

                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);

                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);

                IF "Payment Approval Only" = FALSE THEN BEGIN
                    IF ("Head of Department" <> "Head of Department"::Approved) THEN
                        ERROR(Text040);
                    IF ("Head of Audit" <> "Head of Audit"::Approved) THEN
                        ERROR(Text041);
                    IF (("General Manager" <> "General Manager"::Approved) AND
                    ("Managing Director" <> "Managing Director"::Approved)) OR ("Payment Approval Only" = TRUE) THEN
                        ERROR(Text042);
                    UserSetup4.GET(USERID);
                    IF UserSetup4."User ID" <> "User ID" THEN
                        ERROR(Text039);
                END;

                IF "Service Delivery1" <> "Service Delivery1"::" " THEN BEGIN


                    CreateEmailBody("Document Type", "No.", Text049, 'Team');

                    UserSetup4.GET(USERID);
                    IF UserSetup4."User ID" <> "User ID" THEN
                        ERROR(Text039);
                    SendersName := UserSetup4.Initials;
                    "Confirmed By1" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate7 := CURRENTDATETIME;

                    ToAddresses := 'brano@toyotanigeria.com' + ';' + 'olamide@toyotanigeria.com' + ';' + 'grace@toyotanigeria.com' + ';' + 'aderonke@toyotanigeria.com';
                    // CcAddresses := +  ';' +PurchSetup."Audit Dept. Approvers";
                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text020, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text049, 'Team');
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                ServDeliveryOwner := USERID;

            end;
        }
        field(52; "Service Delivery2"; Option)
        {
            OptionCaption = ' ,Satisfactory,Not Satisfactory';
            OptionMembers = " ",Satisfactory,"Not Satisfactory";

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                IF "Service Delivery1" <> "Service Delivery1"::Satisfactory THEN
                    ERROR(Text043);

                IF "Service Delivery2" = "Service Delivery2"::Satisfactory THEN BEGIN

                    UserSetup4.GET(USERID);
                    IF NOT UserSetup4."Audit Service Approval" THEN
                        ERROR(Text044);
                    SendersName := UserSetup4.Initials;
                    "Confirmed By2" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate9 := CURRENTDATETIME;

                    //to HOD for Bal. Payment.
                    UserSetup.GET("Send To");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("User ID");
                    CcAddresses := UserSetup2."E-Mail".Split(';');
                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text047, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text056, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Balance Paymt. Appr." := TRUE;
                END;

                IF "Service Delivery2" = "Service Delivery2"::"Not Satisfactory" THEN BEGIN

                    CreateEmailBody("Document Type", "No.", Text053, Addressee);

                    UserSetup4.GET(USERID);
                    IF NOT UserSetup4."Audit Service Approval" THEN
                        ERROR(Text044);
                    SendersName := UserSetup4.Initials;
                    "Confirmed By2" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate9 := CURRENTDATETIME;

                    ComAuditonHold9 := UserSetup4.Name;
                    OnholdTimeDate9 := CURRENTDATETIME;


                    //to HOD for Bal. Payment.
                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail2";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text052, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text053, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');
                END;

                ServDeliveryComp := USERID;

            end;
        }
        field(53; "Confirmed By1"; Text[50])
        {
            Editable = true;
        }
        field(54; "Confirmed By2"; Text[50])
        {
            Editable = false;
        }
        field(58; "Bal. Paymt. HOD"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                TESTFIELD("Send To", USERID);

                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);

                IF "Service Delivery2" <> "Service Delivery2"::Satisfactory THEN
                    ERROR(Text045);

                IF "Bal. Paymt. HOD" = "Bal. Paymt. HOD"::Approved THEN BEGIN

                    //UserSetup.GET();
                    ToAddresses := 'adewumi@toyotanigeria.com';
                    Addressee := 'STA';
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate8 := CURRENTDATETIME;

                    BalpayHODonHold8 := UserSetup4.Name;
                    OnholdTimeDate8 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text047, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text063, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;

                IF "Bal. Paymt. HOD" = "Bal. Paymt. HOD"::"On-hold" THEN BEGIN


                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate8 := CURRENTDATETIME;

                    BalpayHODonHold8 := UserSetup4.Name;
                    OnholdTimeDate8 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;


                IF "Bal. Paymt. HOD" = "Bal. Paymt. HOD"::Rejected THEN BEGIN


                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate8 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                    Reject := TRUE;
                END;

                BalPymtHOD := USERID;

            end;
        }
        field(59; "Bal. Paymt. by HOD"; Text[50])
        {
            Editable = false;
        }
        field(60; "Bal. Paymt. Audit"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                TESTFIELD("Bal. Paymt. HOD", "Bal. Paymt. HOD"::Approved);
                UserSetup4.GET(USERID);
                if NOT (UserSetup4."User ID" IN ['ADEWUMI', 'BRANO', 'JOSHUA']) THEN
                    ERROR(Text039);

                IF "Bal. Paymt. HOD" <> "Bal. Paymt. HOD"::Approved THEN
                    ERROR(Text046);

                IF "Bal. Paymt. Audit" = "Bal. Paymt. Audit"::Approved THEN BEGIN
                    UserSetup4.GET(USERID);
                    IF NOT UserSetup4."Audit Service Approval" = TRUE THEN
                        ERROR(Text044);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate10 := CURRENTDATETIME;

                    IF UserSetup5.GET(USERID) THEN
                        SenderEmail := UserSetup5."E-Mail";

                    IF "Document Type" = "Document Type"::Opex THEN BEGIN
                        PurchSetup.GET;


                        IF NOT ("Opex Type" = "Opex Type"::Entertainment) THEN BEGIN
                            IF ("Proposed Purchase Amount" <= 500000) THEN BEGIN
                                ToAddresses := PurchSetup."GM's e-mail";
                                Addressee := 'OAO'
                            END ELSE BEGIN
                                ToAddresses := PurchSetup."MD's e-mail";
                                Addressee := 'MD'
                            END;
                        END ELSE BEGIN
                            IF ("Proposed Purchase Amount" <= 50000) THEN BEGIN
                                ToAddresses := PurchSetup."GM's e-mail";
                                Addressee := 'OAO'
                            END ELSE BEGIN
                                ToAddresses := PurchSetup."MD's e-mail";
                                Addressee := 'MD'
                            END;
                        END;
                    END;


                    IF "Document Type" = "Document Type"::Capex THEN BEGIN
                        PurchSetup.GET;
                        IF "Capex Type" = "Capex Type"::"Fixed Asset" THEN BEGIN
                            ToAddresses := PurchSetup."MD's e-mail";
                            Addressee := 'MD'
                        END
                        ELSE BEGIN
                            ToAddresses := PurchSetup."GM's e-mail";
                            Addressee := 'OAO'
                        END;
                    END;

                    BccAddresses := '';
                    TimeDate10 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text047, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text060, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Bal. Paymt. Audit" = "Bal. Paymt. Audit"::"On-hold" THEN BEGIN

                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate10 := CURRENTDATETIME;

                    BalpayHOAuditonHold10 := UserSetup4.Name;
                    OnholdTimeDate10 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Bal. Paymt. Audit" = "Bal. Paymt. Audit"::Rejected THEN BEGIN

                    UserSetup.GET("User ID");
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate10 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    Reject := TRUE;
                END;

                BalPymtAudit := USERID;

            end;
        }
        field(61; "Bal. Paymt. by Audit"; Text[50])
        {
            Editable = false;
        }
        field(62; "Head of Department"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);

                UserSetup4.GET(USERID);
                IF UserSetup4."User ID" <> "Send To" THEN
                    ERROR(Text040);

                IF "Head of Department" = "Head of Department"::Approved THEN BEGIN

                    IF UserSetup2.GET(USERID) THEN
                        SenderEmail := UserSetup2."E-Mail";

                    UserSetup.GET(InitiatorN);
                    PurchSetup.GET;
                    ToAddresses := 'adewumi@toyotanigeria.com';
                    Addressee := 'STA';
                    //CcAddresses := 'agbesua@toyotanigeria.com';
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate1 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text007, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text026, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');


                END;


                IF "Head of Department" = "Head of Department"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate1 := CURRENTDATETIME;

                    HODonHold1 := UserSetup4.Name;
                    OnholdTimeDate1 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Head of Department" = "Head of Department"::Rejected THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name HOD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate1 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    Reject := TRUE;
                END;

                HeadDept := USERID;

            end;
        }
        field(63; "Head of Audit"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);

                TESTFIELD("Head of Department", "Head of Department"::Approved);

                UserSetup4.GET(USERID);
                if NOT (UserSetup4."User ID" IN ['ADEWUMI', 'BRANO', 'JOSHUA']) THEN
                    ERROR(Text039);

                IF "Head of Audit" = "Head of Audit"::Approved THEN BEGIN

                    IF "Document Type" = "Document Type"::Opex THEN BEGIN
                        PurchSetup.GET;

                        IF NOT ("Opex Type" = "Opex Type"::Entertainment) THEN BEGIN
                            IF ("Proposed Purchase Amount" <= 500000) THEN BEGIN
                                ToAddresses := PurchSetup."GM's e-mail";
                                Addressee := '0A0,'
                            END ELSE BEGIN
                                ToAddresses := PurchSetup."MD's e-mail";
                                Addressee := 'MD,'
                            END;
                        END ELSE BEGIN
                            IF ("Proposed Purchase Amount" <= 50000) THEN BEGIN
                                ToAddresses := PurchSetup."GM's e-mail";
                                Addressee := '0A0,'
                            END ELSE BEGIN
                                ToAddresses := PurchSetup."MD's e-mail";
                                Addressee := 'MD,'
                            END;
                        END;
                    END;

                    IF "Document Type" = "Document Type"::Capex THEN BEGIN
                        PurchSetup.GET;
                        IF "Capex Type" = "Capex Type"::"Fixed Asset" THEN BEGIN
                            ToAddresses := PurchSetup."MD's e-mail";
                            Addressee := 'MD,'
                        END
                        ELSE BEGIN
                            ToAddresses := PurchSetup."GM's e-mail";
                            Addressee := '0A0,'
                        END;
                    END;

                    UserSetup.GET(InitiatorN);
                    CcAddresses := UserSetup."E-Mail".Split(';');
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name Head of Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate2 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text007, "Document Type", "No.");

                    //To GM or MD
                    CreateEmailBody("Document Type", "No.", Text026, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;


                IF "Head of Audit" = "Head of Audit"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name Head of Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate2 := CURRENTDATETIME;

                    HOAonHold2 := UserSetup4.Name;
                    OnholdTimeDate2 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Head of Audit" = "Head of Audit"::Rejected THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;
                    BccAddresses := '';
                    Subject := STRSUBSTNO(Text018, "No.");
                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;

                    "Name Head of Audit" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate2 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    Reject := TRUE;
                END;

                HeadAudit := USERID;
            end;
        }
        field(64; "General Manager"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                // TESTFIELD("Head of Audit", "Head of Audit"::Approved); restore

                UserSetup4.GET(USERID);
                IF not UserSetup4."GM/MD" THEN
                    ERROR(Text039);

                IF "General Manager" = "General Manager"::Approved THEN BEGIN

                    PurchSetup.GET;
                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("Send To");
                    CcAddresses.Add(UserSetup2."E-Mail");
                    CcAddresses.Add('adewumi@toyotanigeria.com');

                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";

                    TimeDate3 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text010, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text035, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Move to LPO" := TRUE;

                    ProcurementLine.SETRANGE("Document No.", "No.");
                    ProcurementLine.SETRANGE(Preferred, TRUE);
                    IF ProcurementLine.FINDFIRST THEN
                        IF (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% after delivery") AND
                           (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% before delivery") THEN
                            IF "General Manager" = "General Manager"::Approved THEN BEGIN
                                "Adv. Pymt. Required" := TRUE;
                                "Move to LPO" := FALSE;
                            END;
                END;

                IF "General Manager" = "General Manager"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    Addressee := UserSetup.Initials;

                    PurchSetup.GET;

                    ToAddresses := UserSetup."E-Mail";
                    UserSetup2.GET("Send To");

                    CcAddresses := PurchSetup2."Audit Dept. Approvers".Split(';');

                    BccAddresses := UserSetup2."E-Mail";

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate3 := CURRENTDATETIME;

                    GMonHold3 := UserSetup4.Name;
                    OnholdTimeDate3 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "General Manager" = "General Manager"::Rejected THEN BEGIN

                    PurchSetup.GET;
                    UserSetup.GET(InitiatorN);
                    Addressee := UserSetup.Initials;
                    ToAddresses := UserSetup."E-Mail";

                    UserSetup2.GET("Send To");

                    CcAddresses := PurchSetup2."Audit Dept. Approvers".Split(';');
                    BccAddresses := UserSetup2."E-Mail";

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate3 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                    Reject := TRUE;
                END;
            end;
        }
        field(65; "Managing Director"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                TESTFIELD("Head of Audit", "Head of Audit"::Approved);
                UserSetup4.GET(USERID);
                if not UserSetup4."GM/MD" then
                    ERROR(Text039);

                IF "Managing Director" = "Managing Director"::Approved THEN BEGIN

                    UserSetup.GET("User ID");
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";

                    CCAddresses.Add('adewumi@toyotanigeria.com');
                    CcAddresses.Add('brano@toyotanigeria.com');
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate4 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text010, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text036, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Move to LPO" := TRUE;

                    ProcurementLine.SETRANGE("Document No.", "No.");
                    ProcurementLine.SETRANGE(Preferred, TRUE);
                    IF ProcurementLine.FINDFIRST THEN
                        IF (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% after delivery") AND
                          (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% before delivery") THEN
                            IF "Managing Director" = "Managing Director"::Approved THEN BEGIN
                                "Adv. Pymt. Required" := TRUE;
                                "Move to LPO" := FALSE;
                            END;
                END;

                IF "Managing Director" = "Managing Director"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := GetCCProcureApproval.Split(';');
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate4 := CURRENTDATETIME;

                    MDonHold4 := UserSetup4.Name;
                    OnholdTimeDate4 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                END;

                IF "Managing Director" = "Managing Director"::Rejected THEN BEGIN

                    UserSetup.GET("User ID");
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := GetCCProcureApproval.Split(';');
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Name MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate4 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    Reject := TRUE;
                END;
            end;
        }
        field(66; Comment; Boolean)
        {

        }
        field(67; "Bal. Paymt. MD"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin
                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                IF "Bal. Paymt. Audit" <> "Bal. Paymt. Audit"::Approved THEN
                    ERROR(Text054);
                UserSetup4.GET(USERID);
                if not UserSetup4."GM/MD" then
                    ERROR(Text039);

                IF "Bal. Paymt. MD" = "Bal. Paymt. MD"::Approved THEN BEGIN

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate12 := CURRENTDATETIME;

                    UserSetup.GET("Send To");
                    ToAddresses := 'paa@toyotanigeria.com';
                    CcAddresses.Add('albert@toyotanigeria.com');
                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text013, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text048, 'PAA');
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Balance Paymt." := TRUE;
                END;


                IF "Bal. Paymt. MD" = "Bal. Paymt. MD"::"On-hold" THEN BEGIN

                    UserSetup.GET(InitiatorN);
                    Addressee := UserSetup.Initials;
                    ToAddresses := UserSetup."E-Mail";
                    Addressee := UserSetup.Initials;

                    CcAddresses := GetCCBalancePayment.Split(';'); //here

                    UserSetup2.GET("Send To");
                    BccAddresses := '';

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate12 := CURRENTDATETIME;

                    BalpayMDonHold12 := UserSetup4.Name;
                    OnholdTimeDate12 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Balance Paymt." := FALSE;
                END;

                IF "Bal. Paymt. MD" = "Bal. Paymt. MD"::Rejected THEN BEGIN

                    UserSetup.GET("User ID");
                    Addressee := UserSetup.Initials;

                    UserSetup2.GET("Send To");
                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    BccAddresses := '';

                    //CcAddresses := PurchSetup."Audit Dept. Approvers".Split(';');
                    CcAddresses := GetCCBalancePayment.Split(';'); //here

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by MD" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate12 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    Reject := TRUE;
                END;
            end;
        }
        field(68; "Bal. Paymt. by MD"; Text[50])
        {
            Editable = true;
        }
        field(69; "Total Amount"; Decimal)
        {
        }
        field(70; "Balance Amount"; Decimal)
        {
        }
        field(71; "Bal. Paymt. GM"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;

            trigger OnValidate()
            begin

                CapexOpexLine2.SETRANGE("Document Type", "Document Type");
                CapexOpexLine2.SETRANGE("Document No.", "No.");
                CapexOpexLine2.SETRANGE(Preferred, TRUE);
                IF NOT CapexOpexLine2.FINDFIRST THEN
                    ERROR(Text028);


                IF "Bal. Paymt. Audit" <> "Bal. Paymt. Audit"::Approved THEN
                    ERROR(Text054);

                IF "Bal. Paymt. GM" = "Bal. Paymt. GM"::Approved THEN BEGIN


                    IF UserSetup2.GET(USERID) THEN
                        SenderEmail := UserSetup2."E-Mail";

                    UserSetup4.GET(USERID);
                    IF not UserSetup4."GM/MD" THEN
                        ERROR(Text039);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate11 := CURRENTDATETIME;

                    UserSetup.GET("Send To");
                    ToAddresses := 'paa@toyotanigeria.com';
                    CcAddresses.Add('albert@toyotanigeria.com');
                    CcAddresses.Add('adewumi@toyotanigeria.com');

                    BccAddresses := '';

                    Subject := STRSUBSTNO(Text047, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text048, 'PAA');
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, '');

                    "Balance Paymt." := TRUE;
                END;

                IF "Bal. Paymt. GM" = "Bal. Paymt. GM"::"On-hold" THEN BEGIN

                    UserSetup.GET("User ID");
                    Addressee := UserSetup.Initials;

                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := PurchSetup."Audit Dept. Approvers".Split(';');

                    UserSetup2.GET("Send To");
                    BccAddresses := UserSetup2."E-Mail";

                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate11 := CURRENTDATETIME;

                    BalpayGMonHold11 := UserSetup4.Name;
                    OnholdTimeDate11 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text017, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text033, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                END;

                IF "Bal. Paymt. GM" = "Bal. Paymt. GM"::Rejected THEN BEGIN

                    UserSetup.GET("User ID");
                    Addressee := UserSetup.Initials;

                    PurchSetup.GET;
                    ToAddresses := UserSetup."E-Mail";
                    CcAddresses := PurchSetup."Audit Dept. Approvers".Split(';');

                    UserSetup2.GET("Send To");
                    BccAddresses := UserSetup2."E-Mail";


                    UserSetup4.GET(USERID);
                    SendersName := UserSetup4.Initials;
                    "Bal. Paymt. by GM" := UserSetup4.Name;
                    SenderAddress := UserSetup4."E-Mail";
                    TimeDate11 := CURRENTDATETIME;

                    Subject := STRSUBSTNO(Text018, "Document Type", "No.");
                    CreateEmailBody("Document Type", "No.", Text034, Addressee);
                    SendEmail(ToAddresses, Subject, EmailBody, CcAddresses, BccAddresses);

                    Reject := TRUE;
                END;

            end;
        }
        field(72; "Bal. Paymt. by GM"; Text[50])
        {
            Editable = false;
        }
        field(73; "Name HOD"; Text[50])
        {
            Editable = false;
        }
        field(74; "Name Head of Audit"; Text[50])
        {
            Editable = false;
        }
        field(75; "Name GM"; Text[50])
        {
            Editable = false;
        }
        field(76; "Name MD"; Text[50])
        {
            Editable = true;
        }
        field(77; "Voucher Raised"; Boolean)
        {
        }
        field(78; "Move to LPO"; Boolean)
        {
        }
        field(79; "Adv. Pymt. Required"; Boolean)
        {
        }
        field(80; DateTime; DateTime)
        {
            Description = 'Sender';
            Editable = false;
        }
        field(81; TimeDate1; DateTime)
        {
            Description = 'HOD';
            Editable = false;
        }
        field(82; TimeDate2; DateTime)
        {
            Description = 'Head of Audit';
            Editable = false;
        }
        field(83; TimeDate3; DateTime)
        {
            Description = 'GM';
            Editable = true;
        }
        field(84; TimeDate4; DateTime)
        {
            Description = 'MD';
            Editable = false;
        }
        field(85; TimeDate5; DateTime)
        {
            Description = 'Adv. Paymt. HOD';
            Editable = false;
        }
        field(86; TimeDate6; DateTime)
        {
            Description = 'Adv. Paymt. Head of Audit';
            Editable = false;
        }
        field(87; TimeDate7; DateTime)
        {
            Description = 'Compliance Request';
            Editable = false;
        }
        field(88; TimeDate8; DateTime)
        {
            Description = 'Bal. Paymt. HOD';
            Editable = false;
        }
        field(89; TimeDate9; DateTime)
        {
            Description = 'Compliance Audit';
            Editable = false;
        }
        field(90; TimeDate10; DateTime)
        {
            Description = 'Bal. Paymt. Head of Audit';
            Editable = false;
        }
        field(91; TimeDate11; DateTime)
        {
            Description = 'Bal. Paymt. GM';
            Editable = false;
        }
        field(92; TimeDate12; DateTime)
        {
            Description = 'Bal. Paymt. MD';
            Editable = true;
        }
        field(93; Compliance; Boolean)
        {
        }
        field(94; "Balance Paymt. Appr."; Boolean)
        {
        }
        field(95; "Balance Paymt."; Boolean)
        {
        }
        field(96; Closed; Boolean)
        {
        }
        field(97; Vendor; Text[50])
        {
            CalcFormula = Lookup("Procurement Line"."Vendor Name" WHERE("Document No." = FIELD("No."),
                                                                         Preferred = CONST(true)));
            FieldClass = FlowField;
        }
        field(98; "Advance Voucher"; Boolean)
        {
        }
        field(99; Reject; Boolean)
        {
        }
        field(100; "Posted Advance Payment"; Decimal)
        {
        }
        field(101; "Payment Approval Only"; Boolean)
        {
        }
        field(102; "Mode of Payment"; Option)
        {
            OptionCaption = ',Cheque,E-Payment,Journal Voucher';
            OptionMembers = ,Cheque,"E-Payment","Journal Voucher";
        }
        field(103; ListMD; Boolean)
        {
        }
        field(104; ListGM; Boolean)
        {
        }
        field(105; OnholdTimeDate1; DateTime)
        {
            Description = 'HOD';
            Editable = false;
        }
        field(106; OnholdTimeDate2; DateTime)
        {
            Description = 'Head of Audit';
            Editable = false;
        }
        field(107; OnholdTimeDate3; DateTime)
        {
            Description = 'GM';
            Editable = false;
        }
        field(108; OnholdTimeDate4; DateTime)
        {
            Description = 'MD';
            Editable = false;
        }
        field(109; OnholdTimeDate5; DateTime)
        {
            Description = 'Adv. Paymt. HOD';
            Editable = false;
        }
        field(110; OnholdTimeDate6; DateTime)
        {
            Description = 'Adv. Paymt. Head of Audit';
            Editable = false;
        }
        field(111; OnholdTimeDate7; DateTime)
        {
            Description = 'Compliance Request';
            Editable = false;
        }
        field(112; OnholdTimeDate8; DateTime)
        {
            Description = 'Bal. Paymt. HOD';
            Editable = false;
        }
        field(113; OnholdTimeDate9; DateTime)
        {
            Description = 'Compliance Audit';
            Editable = false;
        }
        field(114; OnholdTimeDate10; DateTime)
        {
            Description = 'Bal. Paymt. Head of Audit';
            Editable = false;
        }
        field(115; OnholdTimeDate11; DateTime)
        {
            Description = 'Bal. Paymt. GM';
            Editable = false;
        }
        field(116; OnholdTimeDate12; DateTime)
        {
            Description = 'Bal. Paymt. MD';
            Editable = true;
        }
        field(117; HODonHold1; Text[30])
        {
            Description = 'HODOnHold';
            Editable = false;
        }
        field(118; HOAonHold2; Text[30])
        {
            Description = 'Head of Audit OnHold';
            Editable = false;
        }
        field(119; GMonHold3; Text[30])
        {
            Description = 'GMOnHold';
            Editable = false;
        }
        field(120; MDonHold4; Text[30])
        {
            Description = 'MDOnHold';
            Editable = false;
        }
        field(121; AdvHODonHold5; Text[30])
        {
            Description = 'Adv. Paymt. HODOnHold';
            Editable = false;
        }
        field(122; AdvHOAonHold6; Text[30])
        {
            Description = 'Adv. Paymt. Head of Audit OnHold';
            Editable = false;
        }
        field(123; ComReqonHold7; Text[30])
        {
            Description = 'Compliance Request OnHold';
            Editable = false;
        }
        field(124; BalpayHODonHold8; Text[30])
        {
            Description = 'Bal. Paymt. HODOnHold';
            Editable = false;
        }
        field(125; ComAuditonHold9; Text[30])
        {
            Description = 'Compliance AuditOnHold';
            Editable = false;
        }
        field(126; BalpayHOAuditonHold10; Text[30])
        {
            Description = 'Bal. Paymt. Head of AuditOnHold';
            Editable = false;
        }
        field(127; BalpayGMonHold11; Text[30])
        {
            Description = 'Bal. Paymt. GMOnHold';
            Editable = false;
        }
        field(128; BalpayMDonHold12; Text[30])
        {
            Description = 'Bal. Paymt. MDOnHold';
            Editable = true;
        }
        field(129; "Count skip"; Boolean)
        {
            Description = 'To skip count';
        }
        field(130; "Payment No."; Integer)
        {
            /* FieldClass = Normal;
            TableRelation = "Payment/Receipt."."Procurement No." WHERE("Procurement No." = FIELD("No.")); */
        }
        field(131; MDpaymentApproval; Boolean)
        {
        }
        field(132; "TCOF No."; Code[20])
        {
        }
        field(133; "LPP Created"; Boolean)
        {
        }
        field(134; ApproverN; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.GET(ApproverN);
                "ApproverN Email" := UserSetup."E-Mail";
            end;
        }
        field(135; "ApproverN Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(136; InitiatorN; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(137; "InitiatorN Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(138; SenderN; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(139; "SenderN Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(145; ServDeliveryOwner; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(146; ServDeliveryComp; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(147; BalPymtHOD; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(148; BalPymtAudit; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(149; HeadDept; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(150; HeadAudit; code[30])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Document Type", "No.")
        {
            Clustered = true;
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

        CapexOpexLine.SETRANGE("Document Type", "Document Type");
        CapexOpexLine.SETRANGE("Document No.", "No.");
        CapexOpexLine.DELETEALL;

    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            ProcurementReg.COPYFILTERS(Rec);
            ProcurementReg.SETFILTER(ProcurementReg."No.", '<>%1', '');
            ProcurementReg.SETRANGE(ProcurementReg.Send, FALSE);
            ProcurementReg.SETRANGE(ProcurementReg."User ID", USERID);
            IF ProcurementReg.FindFirst() THEN
                ERROR('Created Procurement  No. %1 not used!\New  Request cannot be created', ProcurementReg."No.");
        END;

        CASE "Document Type" OF
            "Document Type"::Opex:
                BEGIN
                    IF "No." = '' THEN BEGIN
                        PurchSetup.GET;
                        PurchSetup.TESTFIELD("Opex Nos.");
                        "No. Series" := PurchSetup."Opex Nos.";
                        if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                            "No. Series" := xRec."No. Series";
                        "No." := NoSeriesMgt.GetNextNo("No. Series");
                    END;
                END;
            "Document Type"::Capex:
                BEGIN
                    IF "No." = '' THEN BEGIN
                        PurchSetup.GET;
                        PurchSetup.TESTFIELD("Capex Nos.");
                        "No. Series" := PurchSetup."Capex Nos.";
                        if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                            "No. Series" := xRec."No. Series";
                        "No." := NoSeriesMgt.GetNextNo("No. Series");
                    END;
                END;
        END;

        UserSetup.GET(USERID);
        Date := TODAY;
        "Requester Name" := UserSetup.Name;
        "User ID" := UserSetup."User ID";
        "Department Code" := UserSetup."Global Dimension 1 Filter";


        DimValue.GET('DEPARTMENT', UserSetup."Global Dimension 1 Filter");
        "Requester Department" := DimValue.Name;

        InitiatorN := UserSetup."User ID";
        "InitiatorN Email" := UserSetup."E-Mail";


    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Employee: Record Employee;
        DimValue: Record "Dimension Value";
        Mail: Codeunit Mail;
        ToAddresses: Text;
        //CcAddresses: Text;
        CcAddresses: List of [Text];
        CCEmails: Text;
        BccAddresses: Text;
        Subject: Text[70];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        CapexLine: Record "Procurement Line";
        IOUReg: Record "IOU Register";
        OpexRec: Record "Procurement Header";
        PaymentRec: Record "Payment/Receipt.";
        PaymentRec2: Record "Payment/Receipt.";
        AdvancePayment: Boolean;
        BalancePayment: Boolean;
        ApprovalGrp: Boolean;
        EditHOD: Boolean;
        EditAudit: Boolean;
        EditGM: Boolean;
        EditMD: Boolean;
        VisibleGM: Boolean;
        VisibleMD: Boolean;
        CapexOpexLine: Record "Procurement Line";
        CapexOpexLine2: Record "Procurement Line";
        CRLF: Text[2];
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        SendersName: Text[200];
        Addressee: Text[50];
        Text000: Label '3 quotes from 3 vendors will be required for this transaction!';
        Text001: Label 'The above Capex Requisition requires your approval.';
        Text002: Label 'This transaction requires 3 quotes!';
        Text003: Label 'adewumi@toyotanigeria.com';
        Text004: Label 'bunmi@toyotanigeria.com';
        Text005: Label 'This capital expenditure has been approved. Prepare an online LPO and send it to your Head of department for necessary approvals.';
        Text006: Label 'This transaction has been approved. Prepare an IOU and send it for necessary approvals.';
        Text007: Label '%1 %2 requires your approval for procurement.';
        //Text008: Label 'agbesua@toyotanigeria.com';
        Text009: Label 'dynamics@toyotanigeria.com';
        Text010: Label '%1 %2 has been approved.';
        Text011: Label 'A request for payment has been made. Kindly approve.';
        Text012: Label 'This document requires a compliance check and approval for payment.';
        Text013: Label ' Payment Request: %1 %2';
        Text014: Label 'Kindly prepare payment for this procurement.';
        Text015: Label 'A payment voucher has been raised.';
        Text016: Label 'The supplier has been fully paid.';
        Text017: Label '%1 %2 is on hold.';
        Text018: Label '%1 %2 has been rejected.';
        Text020: Label 'Compliance Check: %1 %2';
        Text021: Label 'Please create an IOU and send it for necessary approvals.';
        Text022: Label 'Kindly approve this 3rd party operationg expense.';
        Text023: Label 'This transaction requires 3 quotes!';
        Text024: Label 'Opex %1 requires your approval.';
        ProcurementLine: Record "Procurement Line";
        ProcurementLine2: Record "Procurement Line";
        Text025: Label 'Dear %1,';
        Text026: Label 'The above %1 with document number %2 requires your approval.';
        Text027: Label 'Regards,';
        SenderAddress: Text[200];
        Text028: Label 'A prefered quote has not been selected!';
        Text029: Label 'Vendor: ';
        Text030: Label 'Address: ';
        Text031: Label 'Amount: ';
        Text032: Label 'Mail sent successfully.';
        Text033: Label 'The above %1 with document number %2 has been placed on hold.';
        Text034: Label 'The above %1 with document number %2 has been rejected.';
        Text035: Label 'Your %1 with document number %2 has been approved. You can proceed.';
        Text036: Label 'Your %1 with document number %2 has been approved. Proceed to generate an LPO.';
        Text037: Label 'Kindly approve %1 with document number %2 for advance payment.';
        Text038: Label 'Kindly make advance payment for %1 %2.';
        Text039: Label 'You do not have permission to perform this function. Contact your system administrator.';
        Text040: Label 'Requester''s head of department needs to approve this transaction before you can proceed.';
        Text041: Label 'Head of audit needs to approve this transaction before you can proceed.';
        Text042: Label 'General manager or managing director needs to approve this transaction before you can proceed.';
        Text043: Label 'Requester needs to confirm the service delivery before you can proceed.';
        Text044: Label 'You are not an auditor. Please contact your system administrator.';
        Text045: Label 'Audit needs to confirm the service delivery before you can proceed.';
        Text046: Label 'Requester''s head of department needs to confirm service delivery before you can proceed.';
        Text047: Label ' Payment Approval Request: %1 %2';
        Text048: Label '%1 %2 has been approved for payment. Please check  and proceed for Payment.';
        Text049: Label '%1 %2 requires compliance check.';
        Text050: Label '%1 %2 has been approved for payment. Please proceed with the  payment. ';
        EditSend: Boolean;
        Text051: Label 'Compliance Check: %1 %2 not Satisfactory';
        Text052: Label 'Audit check: %1 %2';
        Text053: Label '%1 %2 Audit  check Not Satisfactory.';
        Text054: Label 'Head of Audit Approval is needed';
        PurJus: Text[500];
        Text055: Label 'Purchase Justification :';
        Text056: Label 'Compliance Check %1 %2 is Satisfactory.Kindly approve the Payment';
        Text057: Label 'Advance Payment :';
        Text058: Label 'Balance :';
        //Advance: Decimal;
        //Balance: Decimal;
        ProcurementReg: Record 70008;
        Text059: Label 'Requester''s head of department needs to approve the transaction for advance payment';
        Text060: Label 'The above %1 with document number %2 requires your approval for Balance Payment.';
        Text061: Label 'The above %1 with document number %2 requires your approval for Procurement.';
        PurchSetup2: Record "Purchases & Payables Setup";
        LocalPartPurchaseRegister: Record "Local Part Purchase Register";
        NewLPPNo: Code[10];
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
        Customer: Record Customer;
        BodyTxt: Text;
        BodyStream: OutStream;
        SenderInitial: Text;
        Text063: Label 'The above %1 with document number %2 requires your approval.';
        EmailBody: Text[1024];
        CopiedReceivers: Text;
        CopiedReceiversApprval: Text;

    procedure CreateLPP()
    begin
        PurchSetup.GET;
        NewLPPNo := NoSeriesMgt.GetNextNo(PurchSetup."LPP Nos.", 0D, TRUE);

        LocalPartPurchaseRegister.INIT;
        LocalPartPurchaseRegister."LPP No." := NewLPPNo;
        LocalPartPurchaseRegister."TCOF No." := "TCOF No.";
        LocalPartPurchaseRegister."RFQ No." := "No.";
        LocalPartPurchaseRegister.Date := TODAY;
        LocalPartPurchaseRegister."Order Type" := LocalPartPurchaseRegister."Order Type"::"Isolo Store";

        ProcurementLine2.SETRANGE("Document No.", "No.");
        //ProcurementLine2.SETRANGE(ProcurementLine2."Vendor No.",'<>%1','');
        ProcurementLine2.SETRANGE(Preferred, TRUE);
        IF ProcurementLine2.FINDFIRST THEN
            LocalPartPurchaseRegister."Suppliers Code" := ProcurementLine2."Vendor No.";
        LocalPartPurchaseRegister."Supplier's Name" := ProcurementLine2."Vendor Name";


        LocalPartPurchaseRegister.INSERT;

        "LPP Created" := TRUE;
        MODIFY;
    end;

    procedure CreateEmailBody(DocType: Option; DocNo: Code[20]; BodyMsg: Text; RecipientInitials: Text);

    var
        VendName: Text;
        VendAddr: Text;
        VendAmt: Decimal;
        Advance: Decimal;
        Balance: Decimal;
        PurJus: Text;

    begin

        UserSetup.get(USERID);

        CapexOpexLine.SETRANGE("Document Type", DocType);
        CapexOpexLine.SETRANGE("Document No.", DocNo);
        CapexOpexLine.SETRANGE(Preferred, TRUE);
        IF CapexOpexLine.FINDFIRST THEN BEGIN
            CapexOpexLine.CALCFIELDS(Amount);
            VendAmt := CapexOpexLine.Amount;
            VendName := CapexOpexLine."Vendor Name";
            VendAddr := CapexOpexLine.Address;
            Advance := CapexOpexLine."Advance Payment";
            Balance := CapexOpexLine.Balance;
            PurJus := CapexOpexLine.Description;
        END;

        if Advance <> 0 then begin

            EmailBody := Format(StrSubstNo(Text025, RecipientInitials));
            EmailBody += '<br><br>';
            EmailBody += FORMAT(STRSUBSTNO(BodyMsg, "Document Type", "No."));
            EmailBody += '<br><br>';
            EmailBody += Text029 + FORMAT(VendName);
            EmailBody += '<br>';
            EmailBody += Text030 + FORMAT(VendAddr);
            EmailBody += '<br>';
            EmailBody += Text031 + FORMAT(VendAmt);
            EmailBody += '<br>';
            EmailBody += Text057 + FORMAT(Advance);
            EmailBody += '<br>';
            EmailBody += Text058 + FORMAT(Balance);
            EmailBody += '<br>';
            EmailBody += Text055 + FORMAT(PurJus);
            EmailBody += '<br><br>';
            EmailBody += 'Regards,';
            EmailBody += '<br>';
            EmailBody += UserSetup.Initials;

        end else begin

            EmailBody := Format(StrSubstNo(Text025, RecipientInitials));
            EmailBody += '<br><br>';
            EmailBody += FORMAT(STRSUBSTNO(BodyMsg, "Document Type", "No."));
            EmailBody += '<br><br>';
            EmailBody += Text029 + FORMAT(VendName);
            EmailBody += '<br>';
            EmailBody += Text030 + FORMAT(VendAddr);
            EmailBody += '<br>';
            EmailBody += Text031 + FORMAT(VendAmt);
            EmailBody += '<br>';
            EmailBody += Text055 + FORMAT(PurJus);
            EmailBody += '<br><br>';
            EmailBody += 'Yours sincerely,';
            EmailBody += '<br>';
            EmailBody += UserSetup.Initials;

        end;

    end;

    procedure SendEmail(ToRecipients: Text; Subject: Text; Body: Text; CCRecipients: list of [Text]; BCCRecipients: Text)
    var

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ToRecipients, Subject, EmailBody, true);
        //EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, CCRecipients);

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

    Begin
        IF UserSetup.GET(ServDeliveryComp) THEN
            RC2 := UserSetup."E-Mail";

        IF UserSetup.GET(BalPymtHOD) THEN
            RC3 := UserSetup."E-Mail";

        IF UserSetup.GET(BalPymtAudit) THEN
            RC4 := UserSetup."E-Mail";

        CopiedReceivers := RC2 + ';' + RC3 + ';' + RC4;

        EXIT(CopiedReceivers);
    End;

    procedure GetCCProcureApproval() CCEmailsApprv: Text

    var
        UserSetup: Record "User Setup";
        RC2: Text;
        RC3: Text;
        RC4: Text;

    begin

        IF UserSetup.GET(HeadDept) THEN
            RC2 := UserSetup."E-Mail";

        IF UserSetup.GET(HeadAudit) THEN
            RC3 := UserSetup."E-Mail";

        CopiedReceiversApprval := RC2 + ';' + RC3;

        EXIT(CopiedReceiversApprval);

    end;

}

