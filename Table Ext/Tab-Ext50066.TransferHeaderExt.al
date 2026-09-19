tableextension 50066 "Transfer Header Ext" extends "Transfer Header"
{
    fields
    {
        field(50000; "Reference No."; Code[20])
        {
        }
        field(50001; "Variant Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code;

            trigger OnValidate()
            var
                ItemVariant: Record "Item Variant";
            begin
            end;
        }
        field(50002; "Total Quantity To Ship"; Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Qty. to Ship" WHERE("Document No." = FIELD("No."),
                                                                    "Item No." = FIELD("Item Filter"),
                                                                    "Transfer-from Code" = FIELD("Transfer-from Code"),
                                                                    "Variant Code" = FIELD("Variant Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Item Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item;

            trigger OnValidate()
            var
                TempTransferLine: Record "Transfer Line" temporary;
            begin
            end;
        }
        field(50004; "Total Quantity To Receive"; Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Qty. to Receive" WHERE("Document No." = FIELD("No."),
                                                                       "Item No." = FIELD("Item Filter"),
                                                                       "Transfer-from Code" = FILTER('<>TRANSIT'),
                                                                       "Variant Code" = FIELD("Variant Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "GIT Receipt No."; Code[20])
        {
            TableRelation = "Purch. Rcpt. Header"."No.";
        }
        field(50006; "Consignment No."; Code[20])
        {
        }
        field(50007; Reason; Text[200])
        {
        }
        field(50008; Duration; DateFormula)
        {
        }
        field(50009; "Dealer No."; Code[10])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Dealer No.") THEN
                    "Dealer Name" := CustRec.Name ELSE
                    "Dealer Name" := '';
            end;
        }
        field(50010; "Dealer Name"; Text[30])
        {
        }
        field(50011; "Vehicle No."; Code[20])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Vehicle Registration No." WHERE("No." = FIELD("COF No.")));
            FieldClass = FlowField;
        }
        field(50012; "Branch Manager's Name"; Text[50])
        {
        }
        field(50013; "Shipment Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                IF NOT UserSetup."Shipment Approval" THEN
                    ERROR(Text009);
                IF "Shipment Approval" = TRUE THEN BEGIN
                    TESTFIELD("Transfer-from Code");
                    TESTFIELD("Transfer-to Code");

                    IF UserSetup."Branch Confirmation" THEN
                        TESTFIELD("Branch Confirmation", TRUE);


                    //TESTFIELD("Branch Confirmation",TRUE);
                    //UserSetup.GET(USERID);
                    "Approved By" := UserSetup.Name;

                    IF LocRec.GET("Transfer-from Code") THEN
                        TransLine.SETRANGE("Document No.", "No.");
                    IF TransLine.FINDFIRST THEN
                        TransLine.CALCSUMS(Quantity);


                    LocRec.GET("Transfer-to Code");
                    ToName := LocRec."E-Mail";
                    CCName := LocRec."E-Mail";
                    Subject := STRSUBSTNO(MailTitle, "No.", "Transfer-from Code", "Transfer-to Code");
                    SenderEmail := UserSetup."E-Mail";

                    SendEmail(ToName, Subject, Text008, CCName, '');

                    //mailsent := approvalmessage.NewMessage(ToName,CCName,Bcc,Subject,STRSUBSTNO(Text008,TransLine.Quantity),'',TRUE);

                    /* SMTPmail.CreateMessage(USERID,SenderEmail,ToName,Subject,Subject,FALSE);
                    SMTPmail.Send;
                    MESSAGE('Mail Sent'); */


                END ELSE BEGIN
                    "Shipment Approval" := FALSE;
                    "Approved By" := '';
                END;
            end;
        }
        field(50014; "Approved By"; Text[50])
        {
        }
        field(50015; "Branch Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                IF NOT UserSetup."Branch Confirmation" THEN
                    ERROR(Text010);

                TESTFIELD("Transfer-from Code");
                TESTFIELD("Transfer-to Code");

                IF CONFIRM(Confirmtrans) THEN BEGIN
                    UserSetup.GET(USERID);
                    "Branch Manager's Name" := UserSetup.Name;
                    MESSAGE('You hereby agree to this shipment!')
                END
                ELSE BEGIN
                    "Branch Confirmation" := FALSE;
                    "Branch Manager's Name" := '';
                END;
            end;
        }
        /*  field(50016; "COF No"; Code[20])
         {
         } */
        field(50017; "COF No."; Code[20])
        {
        }
        field(50018; "Reception Date"; Date)
        {
            CalcFormula = Lookup("Customer Order HeaderX".Date WHERE("No." = FIELD("COF No.")));
            FieldClass = FlowField;
        }
        field(50019; "Model Name"; Text[40])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Model Name" WHERE("No." = FIELD("COF No.")));
            FieldClass = FlowField;
        }
        field(50020; "Service Advisor Name"; Text[30])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Service Advisor's Name" WHERE("No." = FIELD("COF No.")));
            FieldClass = FlowField;
        }
    }

    Var
        ItemLedgerEntry: Record "Item Ledger Entry";
        CustRec: Record Customer;
        UserSetup: Record "User Setup";
        approvalmessage: Codeunit Mail;
        mailsent: Boolean;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[100];
        Body: Text[100];
        attachement: Text[260];
        LocRec: Record Location;
        Confirmtrans: Label 'Do you want to transfer?';
        Text008: Label 'A transfer shipment of %1 quantities/units has been made to your location. Please confirm receipt.';
        Text009: Label 'You are not authorised to aprove this shipment!';
        Text010: Label 'You are not authorised to confirm this shipment!';
        Bcc: Text[80];
        SenderEmail: Text[50];
        TransHeader: Record "Transfer Header";
        TransLine: Record "Transfer Line";
        MailTitle: Label 'Transfer order %1 from %2 to %3';
        EmailBody: Text[1024];

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

    procedure TransferControl()
    var
        TransferHead: Record "Transfer Header";
        TransShipmtHead: Record "Transfer Shipment Header";
        GLEntry: Record "G/L Entry";

    begin

        UserSetUp.GET(USERID);
        IF UserSetUp."User ID" <> "Assigned User ID" THEN
            ERROR('You need to change Assigned User Id!');

        //IF "Shipment Approval" = FALSE THEN
        //  ERROR('You cannot Ship this Order. It needs to be approved!');

        TransShipmtHead.SETCURRENTKEY("Transfer Order No.");
         TransShipmtHead.SETRANGE("Transfer Order No.", "No.");
         IF TransShipmtHead.FINDFIRST THEN BEGIN
             GLEntry.SETCURRENTKEY("Document No.");
             GLEntry.SETRANGE("Document No.", TransShipmtHead."No.");
             IF GLEntry.FINDFIRST THEN
                 IF GLEntry."User ID" = UserSetUp."User ID" THEN
                     ERROR('You cannot receive these Items because you shipped them!');
        END;

        IF TransferHead.GET("No.") THEN
            IF TransferHead."Transfer-to Code" = 'CONSIGNMEN' THEN
                IF TransferHead."Dealer No." = '' THEN
                    ERROR('You must specify the Dealer/Staff Name');
        IF TransferHead.GET("No.") THEN
            IF TransferHead."Transfer-to Code" = 'EXIBITION' THEN
                IF TransferHead."Dealer No." = '' THEN
                    ERROR('You must specify the Dealer/Staff Name');
        IF TransferHead.GET("No.") THEN
            IF TransferHead."Transfer-to Code" = 'CONSIGNMEN' THEN
                IF FORMAT(TransferHead.Duration) = '' THEN
                    ERROR('You must specify the duration');
        IF TransferHead.GET("No.") THEN
            IF TransferHead."Transfer-to Code" = 'EXIBITION' THEN
                IF FORMAT(TransferHead.Duration) = '' THEN
                    ERROR('You must specify the duration');

    end;

}
