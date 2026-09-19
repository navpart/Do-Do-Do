page 50247 "TNL-Work Order M_S Card"
{
    PageType = Card;
    SourceTable = "TNL Work Order";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = "General toEditable";
                field("Current Pending Person"; Rec."Current Pending Person")
                {
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
                    Caption = 'Work Order No.';

                    trigger OnAssistEdit()
                    begin
                        IF rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Editable = false;
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                    Caption = 'Department';
                    Editable = false;
                }
                field("TNL Service Centre"; Rec."TNL Service Centre")
                {
                    Caption = 'Dealer Service Centre';
                }
                field("Request Location"; Rec."Request Location")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Related Job"; Rec."Related Job")
                {
                }
                field(Reason; Rec.Reason)
                {
                    ShowMandatory = true;
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("KM Covered"; Rec."KM Covered")
                {
                }
                field("Responsible Driver"; Rec."Responsible Driver")
                {
                }
            }
            group("Requester's Action")
            {
                Editable = Requester_toEditable;
                field("1st Approval"; Rec."1st Approval")
                {
                }
                field("1st Approver"; Rec."1st Approver")
                {
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
            group("ADMIN's Action")
            {
                Editable = "ADMIN's Action toEditable";
                Visible = "ADMIN's Action";
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                    Caption = 'Action';
                }
                field("2nd Approval"; Rec."2nd Approval")
                {
                    Caption = 'Approval Id';
                    Editable = false;
                    Visible = true;
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                    Visible = true;
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
                field("Admin Comment"; Rec."Admin Comment")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
            }
            group("Send Dealer Estimate ")
            {
                Editable = SendealerEst_toEditable;
                Visible = SendealerEstimate;
                field("Send Estimate"; Rec."Send Estimate")
                {
                }
                field("Part not Avaiilable in TNL Inventoy"; Rec."Items Value")
                {
                    Caption = 'Part not Avaiilable in TNL Inventoy';
                }
                field("Labour Value"; Rec."Labour Value")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {
                    Caption = 'Document Link';

                    trigger OnAssistEdit()
                    begin
                        IF rec."Incoming Document Entry No." > 0 THEN
                            HYPERLINK(rec.GetIncomingDocumentURL);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IncomingDocument.SETRANGE("Entry No.", rec."Incoming Document Entry No.");
                        IF PAGE.RUNMODAL(0, IncomingDocument) = ACTION::LookupOK THEN
                            rec."Incoming Document Entry No." := IncomingDocument."Entry No.";
                    end;
                }
                field("Estimate Sender Time"; Rec."Estimate Sender Time")
                {
                }
                field("Estimate Sender Name"; Rec."Estimate Sender Name")
                {
                }
                field("Estimate Sender ID"; Rec."Estimate Sender ID")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
            group("Estimate Comformation")
            {
                Editable = Estimate_toEditable;
                Visible = Estimate_Visible;
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                }
            }
            group("Job Satisfactory")
            {
                Editable = "Job Done toEditable";
                Visible = "Job Satisfactory";
                field("Job Done"; Rec."Job Done")
                {
                    Caption = 'Job Done';
                }
                field("Job Done Id"; Rec."Job Done Id")
                {
                    Caption = 'User Id';
                    Editable = false;
                }
                field("Job Done Name"; Rec."Job Done Name")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Job Done Time"; Rec."Job Done Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("Send Invoice for Confirmation")
            {
                Editable = InvoiceCollected_toEditable;
                Visible = "Invoice Confirmation";
                field("Incoming Document Entry No.1"; Rec."Incoming Document Entry No.1")
                {

                    trigger OnAssistEdit()
                    begin
                        IF rec."Incoming Document Entry No.1" > 0 THEN
                            HYPERLINK(rec.GetIncomingDocumentURL1);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IncomingDocument2.SETRANGE("Entry No.", rec."Incoming Document Entry No.1");
                        IF PAGE.RUNMODAL(0, IncomingDocument2) = ACTION::LookupOK THEN
                            rec."Incoming Document Entry No.1" := IncomingDocument2."Entry No.";
                    end;
                }
                field(Description; Rec.Description)
                {
                    Visible = false;
                }
                field("Send Invoice File"; Rec."Send Invoice File")
                {
                }
                field("Send Invoice ID"; Rec."Send Invoice ID")
                {
                }
                field("Send Invoice Name"; Rec."Send Invoice Name")
                {
                }
                field("Send Invoice Time"; Rec."Send Invoice Time")
                {
                }
            }
            group("Invoice Receive Confirmation")
            {
                Editable = InvColl_toEditable;
                Visible = InvColl_Visible;
                field("Invoice Received"; Rec."Invoice Received")
                {
                }
                field("Collector Id"; Rec."Collector Id")
                {
                }
                field("Collector Name"; Rec."Collector Name")
                {
                }
                field("Collection Time"; Rec."Collection Time")
                {
                }
            }
            group("Payment Confirmation")
            {
                Editable = PaymentConfir_toEditable;
                Visible = "Payment Confirmation";
                field("Payment Confirmed"; Rec."Payment Confirmed")
                {
                    Caption = 'Payment Confirmed ?';
                }
                field("Payment Approval"; Rec."Payment Approval")
                {
                    Caption = 'User Id';
                    Editable = false;
                }
                field("Payment Approver"; Rec."Payment Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Payment Approval Time"; Rec."Payment Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("Transaction Closure")
            {
                Editable = TransactionClose_toEditable;
                Visible = "Transaction Close_Visible";
                field("Transaction Close"; Rec."Transaction Close")
                {
                    Caption = 'Transaction Close ?';
                }
                field("Close User Id"; Rec."Close User Id")
                {
                    Caption = 'User Id';
                    Editable = false;
                }
                field("Closer Name"; Rec."Closer Name")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Close Time"; Rec."Close Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Control1)
            {
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
                        IF CONFIRM('Do you want to raise Payment Requisition') THEN BEGIN

                            rec."Payment Confirmed" := TRUE;
                            UserSetup2.GET(USERID);
                            rec."Payment Approval" := UserSetup2."User ID";
                            rec."Payment Approver" := UserSetup2.Name;
                            rec."Payment Approval Time" := CURRENTDATETIME;


                            PaymentReq.INIT;
                            PaymentReq."Document Type" := PaymentReq."Document Type"::Opex;
                            //PaymentReq.MDpaymentApproval := "Request No.";
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
        IF rec."Invoice Received" = TRUE THEN
            EnablePayment := TRUE;


        IF rec."Send for Approval" = TRUE THEN
            Requester_toEditable := FALSE

        ELSE
            Requester_toEditable := TRUE;


        IF rec."Send for Approval" = TRUE THEN
            "General toEditable" := FALSE
        ELSE
            "General toEditable" := TRUE;

        IF rec."Send for Approval" = TRUE THEN BEGIN
            "ADMIN's Action" := TRUE;
            "ADMIN's Action toEditable" := TRUE;

        END;


        IF rec."1st Approval Status" = rec."1st Approval Status"::Approved THEN
            "ADMIN's Action toEditable" := FALSE

        ELSE
            "ADMIN's Action toEditable" := TRUE;

        IF rec."1st Approval Status" = rec."1st Approval Status"::Approved THEN BEGIN
            Requester_toEditable := FALSE;
            SendealerEstimate := TRUE;
            SendealerEst_toEditable := TRUE;

        END;

        IF rec."Send Estimate" = TRUE THEN BEGIN
            Estimate_Visible := TRUE;
            SendealerEst_toEditable := FALSE;
        END;


        IF rec."2nd Approval Status" = rec."2nd Approval Status"::Approved THEN
            Estimate_toEditable := FALSE

        ELSE
            Estimate_toEditable := TRUE;





        IF rec."2nd Approval Status" = rec."2nd Approval Status"::Approved THEN BEGIN

            "Job Satisfactory" := TRUE;
            "Job Done toEditable" := TRUE;

        END;


        IF rec."Job Done" = rec."Job Done"::Satisfactory THEN BEGIN
            "Job Done toEditable" := FALSE;
            "Invoice Confirmation" := TRUE;
            InvoiceCollected_toEditable := TRUE;
        END;

        IF rec."Send Invoice File" = TRUE THEN BEGIN
            InvoiceCollected_toEditable := FALSE;
            InvColl_Visible := TRUE;

        END;

        IF rec."Invoice Received" = TRUE THEN BEGIN
            InvColl_toEditable := FALSE;
            "Payment Confirmation" := TRUE;
            PaymentConfir_toEditable := TRUE;
        END;

        IF rec."Payment Confirmed" = TRUE THEN BEGIN
            PaymentConfir_toEditable := FALSE;
            "Transaction Close_Visible" := TRUE;
            TransactionClose_toEditable := TRUE;
        END;



        IF rec."Transaction Close" = TRUE THEN
            TransactionClose_toEditable := FALSE;



    end;

    var
        Edit1: Boolean;
        Edit2: Boolean;
        Edit3: Boolean;
        PaymentReq: Record 70008;
        EnablePayment: Boolean;
        "Requester's Action": Boolean;
        "ADMIN's Action": Boolean;
        "Job Satisfactory": Boolean;
        "Invoice Confirmation": Boolean;
        "Payment Confirmation": Boolean;
        "Transaction Closure": Boolean;

        "1st Approval toEditable": Boolean;

        "2nd Approval toEditable": Boolean;

        "Send for ApprovalEditable": Boolean;
        "1st Approval StatusEditable": Boolean;
        "2nd Approval StatusEditable": Boolean;
        "Job Done toEditable": Boolean;
        "1st Approval_Visible": Integer;
        "1st Approv Status_Visible": Boolean;
        "Job Done_Visible": Boolean;
        InvoiceCollected_toEditable: Boolean;
        "Payment Confirmed_Visible": Boolean;
        "Transaction Close_Visible": Boolean;
        "General toEditable": Boolean;
        "ADMIN's Action toEditable": Boolean;
        UserSetup2: Record 91;
        IncomingDocument: Record 130;
        IncomingDocument2: Record 130;
        Estimate_Visible: Boolean;
        Estimate_toEditable: Boolean;
        PaymentConfir_toEditable: Boolean;
        Requester_toEditable: Boolean;
        TransactionClose_toEditable: Boolean;
        SendealerEstimate: Boolean;
        SendealerEst_toEditable: Boolean;
        InvColl_Visible: Boolean;
        InvColl_toEditable: Boolean;
}

