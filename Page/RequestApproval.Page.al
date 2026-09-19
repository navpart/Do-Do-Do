page 50214 "Request Approval."
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
                field("Current Pending Person"; Rec."Current Pending Person")
                {
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
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
                field(Reason; Rec.Reason)
                {
                    ShowMandatory = true;
                }
                field("Request Type"; Rec."Request Type")
                {
                    Visible = false;
                }
                field("Auto Show Location"; Rec."Auto Show Location")
                {
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                    Visible = false;
                }
                field("KM Covered"; Rec."KM Covered")
                {
                }
                field("Reference No."; Rec."Reference No.")
                {
                }
                field("Responsible Dealer"; Rec."Responsible Dealer")
                {
                }
            }
            group("Event Manager's Action")
            {
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
                field("Related Job"; Rec."Related Job")
                {
                }
                field("2nd Approval"; Rec."2nd Approval")
                {
                    Caption = 'Send To Event Mngr.';
                    Visible = true;
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                    Visible = true;
                }
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                    Caption = 'Action';
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("Event Mngr's Action on Repair")
            {
                Visible = true;
                field("Job Done"; Rec."Job Done")
                {
                    Caption = 'Job Done';
                }
                field("Job Done Time"; Rec."Job Done Time")
                {
                }
                field("Job Done Id"; Rec."Job Done Id")
                {
                }
                field("Job Done Name"; Rec."Job Done Name")
                {
                }
            }
            group("Payment Confirmation")
            {
                Caption = 'Payment Confirmation';
                field("Send for Payment Approval"; Rec."Send for Payment Approval")
                {
                    Caption = 'Payment Approved';
                }
                field("Payment Approval"; Rec."Payment Approval")
                {
                    Caption = 'Payment Approver';
                    Editable = false;
                }
                field("Payment Approval Time"; Rec."Payment Approval Time")
                {
                    Caption = 'Payment Approval Date';
                    Editable = false;
                }
            }
            group("`")
            {
                Caption = 'Job Closure';
                field(Close; Rec.Close)
                {
                }
                field("Job Closing Officer"; Rec."Job Closing Officer")
                {
                }
                field("Close Date"; Rec."Close Date")
                {
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
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // IF CONFIRM('Do you want to raise Payment Requisition')THEN BEGIN
                        //    PaymentReq.INIT;
                        //    PaymentReq."Document Type" := PaymentReq."Document Type"::Requisition;
                        //    //PaymentReq."Work Order No" := "Request No.";
                        //    PaymentReq.INSERT(TRUE);
                        //    COMMIT;
                        //    //PaymentReq.SETRANGE("OpexNo.","Request No.");
                        //    PAGE.RUNMODAL(70126,PaymentReq);
                        // END;



                        IF CONFIRM('Do you want to raise Payment Requisition') THEN BEGIN
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

    var
        Edit1: Boolean;
        Edit2: Boolean;
        Edit3: Boolean;
        PaymentReq: Record 70008;
        EnablePayment: Boolean;
}

