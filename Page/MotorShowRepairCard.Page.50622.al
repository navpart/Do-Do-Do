page 50622 "Motor Show Repair Card"
{
    PageType = Card;
    SourceTable = "Motor Show Repair";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = GeneralEdit;
                field("Current Pending Person"; Rec."Current Pending Person")
                {
                    Caption = 'Current Pending Person';
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
                    Caption = 'Work Order No.';
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    Caption = 'Entry Date';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Caption = 'Requester Name';
                    Editable = false;
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                    Caption = 'Department';
                    Editable = false;
                }
                field(Reason; Rec.Reason)
                {
                    Caption = 'Reason';
                    ShowMandatory = true;
                }
                field("Request Type"; Rec."Request Type")
                {
                    Caption = 'Request Type';
                    Visible = false;
                }
                field("Auto Show Location"; Rec."Auto Show Location")
                {
                    Caption = 'Auto Show Location';
                }
                field(Make; Rec.Make)
                {
                    Caption = 'Make';
                }
                field(Model; Rec.Model)
                {
                    Caption = 'Model';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    Caption = 'Registration No.';
                    Visible = false;
                }
                field("KM Covered"; Rec."KM Covered")
                {
                    Caption = 'KM Covered';
                }
                field("Responsible Dealer"; Rec."Responsible Dealer")
                {
                    Caption = 'Responsible Dealer';
                }
            }
            group("Event Manager's Action")
            {
                Editable = EventMrgEdit;
                field("1st Approval"; Rec."1st Approval")
                {
                    Caption = 'Send To PDI';
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("PDI Section Action")
            {
                Caption = 'Send Estimate';
                Editable = SendEstEdit;
                Visible = SendEstVisible;
                field("Related Job"; Rec."Related Job")
                {
                    Caption = 'Related Job';
                }
                field("Items Value"; Rec."Items Value")
                {
                    Caption = 'Part not Avaiilable in TNL Inventoy';
                }
                field("Labour Value"; Rec."Labour Value")
                {
                    Caption = 'Labour Value';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Caption = 'VAT Amount';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                }
                field("Document Link"; Rec."Incoming Document Entry No.1")
                {
                    Caption = 'Document Link';

                    trigger OnAssistEdit()
                    begin
                        IF Rec."Incoming Document Entry No.1" > 0 THEN
                            HYPERLINK(Rec.GetIncomingDocumentURL1);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin

                        IncomingDocument2.SETRANGE("Entry No.", Rec."Incoming Document Entry No.1");
                        IF PAGE.RUNMODAL(0, IncomingDocument2) = ACTION::LookupOK THEN
                            Rec."Incoming Document Entry No.1" := IncomingDocument2."Entry No.";
                    end;
                }
                field(Comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field("Send Attach File"; Rec."Send Attach File")
                {
                    Caption = 'Send Attach File';
                }
                field("Send Attach Name"; Rec."Send Attach Name")
                {
                    Caption = 'Send Attach Name';
                }
            }
            group("Estimate Confirmation")
            {
                Editable = EstimConfEdit;
                Visible = EstimConfVisible;
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                    Caption = 'Estimate Status';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Estimate Approver';
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Estimate Approval Time';
                }
            }
            group("Send Invoice")
            {
                Editable = SendInvEdit;
                Visible = SendInvVisible;
                field("Job Done"; Rec."Job Done")
                {
                    Caption = 'Job Done';
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec."Incoming Document Entry No." > 0 THEN
                            HYPERLINK(Rec.GetIncomingDocumentURL);
                    end;

                    trigger OnValidate()
                    begin
                        IncomingDocument.SETRANGE("Entry No.", Rec."Incoming Document Entry No.");
                        IF PAGE.RUNMODAL(0, IncomingDocument) = ACTION::LookupOK THEN
                            Rec."Incoming Document Entry No." := IncomingDocument."Entry No.";
                    end;
                }
                field("Send Estimate"; Rec."Send Estimate")
                {
                    Caption = 'Send Invoice';
                }
                field("Estimate Sender Time"; Rec."Estimate Sender Time")
                {
                    Caption = 'Invoice Sender Time';
                }
                field("Estimate Sender Name"; Rec."Estimate Sender Name")
                {
                    Caption = 'Invoice Sender Name';
                }
                field("Estimate Sender ID"; Rec."Estimate Sender ID")
                {
                    Caption = 'Invoice Sender ID';
                }
            }
            group("Confirm invoce")
            {
                Caption = 'Invoice Confirmation';
                Editable = InvConfEdit;
                Visible = InvConfVisible;
                field("Invoice Received"; Rec."Invoice Received")
                {
                    Caption = 'Invoice Collected';
                }
                field("Collector Id"; Rec."Collector Id")
                {
                    Caption = 'Collector Id';
                }
                field("Collector Name"; Rec."Collector Name")
                {
                    Caption = 'Collector Name';
                }
                field("Collection Time"; Rec."Collection Time")
                {
                    Caption = 'Collection Time';
                }
            }
            group("Job Closure")
            {
                Caption = 'Job Closure';
                Editable = JobCloseEdit;
                Visible = JobCloseVisible;
                field(Close; Rec.Close)
                {
                    Caption = 'Close';
                }
                field("Job Closing Officer"; Rec."Job Closing Officer")
                {
                    Caption = 'Job Closing Officer';
                }
                field("Close Date"; Rec."Close Date")
                {
                    Caption = 'Close Date';
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group(Print)
            {
                action(Printing)
                {
                    Caption = 'P&rint';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                }
                action("Payment Requisition")
                {
                    Caption = 'Payment Requisition';
                    Enabled = EnablePayment;
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        /*// IF CONFIRM('Do you want to raise Payment Requisition')THEN BEGIN
                        //    PaymentReq.INIT;
                        //    PaymentReq."Document Type" := PaymentReq."Document Type"::Requisition;
                        //    //PaymentReq."Work Order No" := "Request No.";
                        //    PaymentReq.INSERT(TRUE);
                        //    COMMIT;
                        //    //PaymentReq.SETRANGE("OpexNo.","Request No.");
                        //    PAGE.RUNMODAL(70126,PaymentReq);
                        // END;
                        
                        
                        
                        IF CONFIRM('Do you want to raise Payment Requisition')THEN BEGIN
                            PaymentReq.INIT;
                            PaymentReq."Document Type" := PaymentReq."Document Type"::Opex;
                            //PaymentReq.MDpaymentApproval := "Request No.";
                            PaymentReq.INSERT(TRUE);
                            COMMIT;
                            //PaymentReq.SETRANGE("OpexNo.","Request No.");
                            PAGE.RUNMODAL(70126,PaymentReq);
                        END;
                        */
                        IF CONFIRM('Do you want to raise Payment Requisition') THEN BEGIN

                            Rec."Payment Confirmed" := TRUE;
                            UserSetup2.GET(USERID);
                            Rec."Payment Approval" := UserSetup2."User ID";
                            Rec."Payment Approver" := UserSetup2.Name;
                            Rec."Payment Approval Time" := CURRENTDATETIME;


                            PaymentReq.INIT;
                            PaymentReq."Document Type" := PaymentReq."Document Type"::Opex;
                            PaymentReq."TCOF No." := Rec."Request No.";
                            PaymentReq.INSERT(TRUE);
                            COMMIT;
                            //PaymentReq.SETRANGE("OpexNo.","Request No.");
                            PAGE.RUNMODAL(70126, PaymentReq);
                        END;

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        EnablePayment := FALSE;
        IF Rec."Invoice Received" = TRUE THEN
            EnablePayment := TRUE;

        IF Rec."Send for Approval" = FALSE THEN BEGIN
            GeneralEdit := TRUE;
            EventMrgEdit := TRUE;

        END;


        IF Rec."Send for Approval" = TRUE THEN BEGIN
            GeneralEdit := FALSE;
            SendEstVisible := TRUE;
            SendEstEdit := TRUE;
        END;




        IF Rec."Send Attach File" = TRUE THEN BEGIN

            EstimConfVisible := TRUE;
            EstimConfEdit := TRUE;
        END;


        IF Rec."2nd Approval Status" = Rec."2nd Approval Status"::Approved THEN BEGIN

            SendEstEdit := FALSE;
            SendInvVisible := TRUE;
            SendInvEdit := TRUE;
            EstimConfEdit := FALSE;
        END

        ELSE
            SendEstEdit := TRUE;


        IF Rec."2nd Approval Status" = Rec."2nd Approval Status"::" " THEN BEGIN

            SendInvVisible := FALSE;
            SendEstEdit := TRUE

        END;


        //IF "Job Done" = "Job Done"::Satisfactory THEN BEGIN
        //  "Job Done toEditable" := FALSE;
        //   "Invoice Confirmation" := TRUE;
        //   InvoiceCollected_toEditable := TRUE;
        //END;

        IF Rec."Send Estimate" = TRUE THEN BEGIN
            EstimConfEdit := FALSE;
            InvConfVisible := TRUE;
            InvConfEdit := TRUE;
            SendInvEdit := FALSE
        END;



        IF Rec."Invoice Received" = TRUE THEN BEGIN
            SendInvEdit := FALSE;
            InvConfEdit := FALSE;
            JobCloseVisible := TRUE;
            JobCloseEdit := TRUE;
        END;

        //IF "Payment Confirmed" = TRUE THEN BEGIN
        //  PaymentConfir_toEditable := FALSE;
        //  "Transaction Close_Visible" := TRUE;
        //  TransactionClose_toEditable := TRUE;
        //END;



        IF Rec.Close = TRUE THEN
            JobCloseEdit := FALSE;



    end;

    var
        Edit1: Boolean;
        Edit2: Boolean;
        Edit3: Boolean;
        PaymentReq: Record 70008;
        EnablePayment: Boolean;
        IncomingDocument: Record 130;
        GeneralEdit: Boolean;
        EventMrgEdit: Boolean;
        SendEstVisible: Boolean;
        SendEstEdit: Boolean;
        EstimConfVisible: Boolean;
        EstimConfEdit: Boolean;
        SendInvVisible: Boolean;
        SendInvEdit: Boolean;
        InvConfVisible: Boolean;
        InvConfEdit: Boolean;
        JobCloseVisible: Boolean;
        JobCloseEdit: Boolean;
        UserSetup2: Record 91;
        IncomingDocument2: Record 130;
}

