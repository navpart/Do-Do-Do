tableextension 50092 "Sales Invoice Header Ext." extends "Sales Invoice Header"
{
    fields
    {
        field(50001; Quantity; Decimal)
        {
            BlankZero = true;
            CalcFormula = - Sum("Value Entry"."Invoiced Quantity" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Line Item Count"; Integer)
        {
            CalcFormula = Count("Sales Invoice Line" WHERE("Document No." = FIELD("No."), Type = CONST(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Order Type"; Option)
        {
            Editable = true;
            OptionMembers = " ",Sea,Air,Land;
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
        field(50167; "Sent Time"; DateTime)
        {

        }
        field(50171; "User Department"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'User Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(50200; "Cost Value"; Decimal)
        {
            CalcFormula = - Sum("Value Entry"."Cost Posted to G/L" WHERE("Item Ledger Entry Type" = CONST(Sale),
                                                                         "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50201; BG; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                   "Part Group" = CONST('BG')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50202; EG; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                   "Part Group" = CONST('EG')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50203; PTC; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                   "Part Group" = CONST('PTC')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50204; TEF; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                   "Part Group" = CONST('TEF')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50259; "Tracker No."; Code[10])
        {
        }
        field(50260; OrderType2; Code[10])
        {
            CalcFormula = Lookup("Sales Invoice Line"."Variant Code" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
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
        field(50265; "S/N"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50266; "Quantity(ies)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50267; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50268; "Vehicle Order No."; Code[30])
        {

        }
        field(60108; "Customer Line discount"; Decimal)
        {
        }
        field(60109; "Serial No"; Code[20])
        {
        }
        field(60110; "Inventory Group"; Code[10])
        {
        }
        field(60111; "Finance Apprv Status"; Enum "Document Status")
        {

        }
        field(60112; "Finance Send to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(60113; "Marketing Send To"; Code[30])
        {
            TableRelation = "User Setup"."User ID";

        }
        field(60114; "Marketing Apprv Status"; Enum "Document Status")
        {

        }
        field(60115; "Logistics Send to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(60116; "Logistics Apprv Status"; Enum "Document Status")
        {

        }
        field(60117; "Logistics Sent Time"; DateTime)
        {
        }
        field(60118; "Logistics Approved Time"; DateTime)
        {
        }
        field(60119; "Logistics Approved By"; Code[30])
        {
        }
        field(60120; "Logistics Sender"; Code[30])
        {
        }
        field(60122; "Logistic Sent Time"; DateTime)
        {
        }
        field(60123; "Finance Approved By"; Text[30])
        {
        }
        field(60124; "Marketing Sender"; Text[30])
        {
        }
        field(60125; "Marketing Sent Time"; DateTime)
        {
        }
        field(60126; "Finance Approved Time"; DateTime)
        {
        }
        field(60127; "Marketing Approved By"; Text[30])
        {
        }
        field(60128; "Marketing Approved Time"; DateTime)
        {
        }
        field(60129; "Retail Cost"; Decimal)
        {

        }
        field(60130; "Original Profit"; Decimal)
        {

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

        }
        field(60139; "Acknowledged Doc Link"; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(60140; "Audit Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60142; "Security Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(60143; "Security Confirmation by"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60144; "Document Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60145; "Security No."; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(60146; "Security Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60147; "Send for Approval2"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60148; "Audit Confirmation by"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60149; "Audit Summary"; Option)
        {
            OptionCaption = ' ,Satisfactory,Non-Satisfactory';
            OptionMembers = " ",Satisfactory,"Non-Satisfactory";
        }
        field(60150; "Audit Confirmation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Location Code (B&P)"; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Line"."Location Code" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(70001; "Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
        field(90001; "Sent to NRS"; Boolean)
        {
            Caption = 'Sent to NRS';
        }
        field(90002; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }



    }

    var
        UserSetup: Record "User Setup";
        Customer: Record Customer;
        CustEmail: Text[150];
        TextApproval: Label 'Your Order %1 has been approved.';
        SenderName: Text[30];
        Subject: Text[100];
        RecipientAll: Text;
        EmailBody: Text[1024];
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesSetup: Record "Sales & Receivables Setup";
        CCEmails: List of [Text];


    procedure SendToCustomer(var Rec: Record "Sales Invoice Header")

    begin
        Customer.get(Rec."Bill-to Customer No.");
        RecipientAll := Customer."Dealer Emails";

        SalesSetup.Get();
        CCEmails := SalesSetup."CC Emails".Split(';');

        SalesInvoiceHeader.Get(Rec."No.");

        Subject := StrSubstNo(TextApproval, SalesInvoiceHeader."No.");
        CreateEmailBody();
        SendEmailAttachments(SalesInvoiceHeader, RecipientAll, CCEmails);
    end;


    procedure CreateEmailBody()
    begin
        EmailBody := 'Dear Customer,';
        EmailBody += '<br><br>';
        EmailBody += FORMAT(STRSUBSTNO(TextApproval, "Vehicle Order No."));
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br><br>';
        EmailBody += SenderName;
    end;

    procedure SendEmailAttachments(var Rec: Record "Sales Invoice Header"; ToRecipients: Text[250]; CCRecipients: list of [Text])
    var
        EmailAccount: Record "Email Account";
        EmailMessage: Codeunit "Email Message";
        BodyMessage: Text;
        AddBodyMessage: Text;
        Email: Codeunit Email;
        //Recipients: List of [Text];

        DocAttachment: Record "Document Attachment";

        PickingList: Report "TNL Sales Picking List Cars3";
        WayBill: Report "TNL Sales Waybill3";
        SalesInvoice: Report "TNL Sales Invoice3";

        SalesInvHeader: Record "Sales Invoice Header";

        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;

        PickingListName: Text[250];
        WayBillName: Text[250];
        SalesInvoiceName: Text[250];

    begin
        SalesInvHeader.Reset();
        SalesInvHeader.SetFilter("No.", Rec."No.");
        SalesInvHeader.FindFirst();

        Clear(OutS);
        Clear(InS);
        Clear(TempBlob);
        Clear(PickingList);
        Clear(EmailMessage);

        PickingListName := 'Pickinglist-' + SalesInvHeader."No." + '.pdf';
        WayBillName := 'Waybill-' + SalesInvHeader."No." + '.pdf';
        SalesInvoiceName := 'Invoice-' + SalesInvHeader."No." + '.pdf';

        EmailAccount.Reset();
        EmailAccount.SetFilter(Connector, 'SMTP');
        IF EmailAccount.FindLast() then;

        EmailMessage.Create(ToRecipients, Subject, EmailBody, true);

        TempBlob.CreateOutStream(OutS);

        //create pickinglist file
        PickingList.SetTableView(SalesInvHeader);
        PickingList.SaveAs('', ReportFormat::Pdf, OutS);
        TempBlob.CreateInStream(InS);
        EmailMessage.AddAttachment(PickingListName, 'PDF', InS);

        Clear(OutS);
        Clear(InS);
        Clear(TempBlob);
        TempBlob.CreateOutStream(OutS);

        //create waybill file
        WayBill.SetTableView(SalesInvHeader);
        WayBill.SaveAs('', ReportFormat::Pdf, OutS);
        TempBlob.CreateInStream(InS);
        EmailMessage.AddAttachment(WayBillName, 'PDF', InS);

        Clear(OutS);
        Clear(InS);
        Clear(TempBlob);
        TempBlob.CreateOutStream(OutS);

        //create invoice file
        SalesInvoice.SetTableView(SalesInvHeader);
        SalesInvoice.SaveAs('', ReportFormat::Pdf, OutS);
        TempBlob.CreateInStream(InS);
        EmailMessage.AddAttachment(SalesInvoiceName, 'PDF', InS);

        EmailMessage.SetRecipients(Enum::"Email Recipient Type"::Cc, CCRecipients);

        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);

    end;

    Procedure SendeInvoiceToFIRS()
    var
        eInvoiceNRSMgt: Codeunit "eInvoice NRS Mgt.";
    begin
        eInvoiceNRSMgt.SendInvoiceToNRS(Rec);
    end;


}
