pageextension 50014 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Dispute Status")
        {
            field(IRN; Rec.IRN)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Invoice Reference Number (IRN).';

            }
            field("Sent to NRS"; Rec."Sent to NRS")
            {
                ApplicationArea = All;
                ToolTip = 'Indicates whether the invoice has been sent to NRS.';
            }
        }

    }

    actions
    {
        addbefore("Update Document")
        {
            action("Invoice-Vehicle")
            {
                ApplicationArea = All;
                ToolTip = 'Print an invoice for transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50285, TRUE, TRUE, SalesInvHeader);
                end;
            }

            action("Invoice-Part")
            {
                ApplicationArea = All;
                ToolTip = 'Print an invoice for transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50040, TRUE, TRUE, SalesInvHeader);
                end;
            }

            action("TCSC Invoice-Part")
            {
                ApplicationArea = All;
                ToolTip = 'Print an invoice for transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50052, TRUE, TRUE, SalesInvHeader);
                end;
            }
            action(Invoice2ndChannel)
            {
                ApplicationArea = All;
                Caption = 'Invoice - 2nd Channel';
                ToolTip = 'Print an invoice for transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50029, TRUE, TRUE, SalesInvHeader);
                end;
            }

        }

        addafter(SendCustom)
        {
            action(SendCustomDocs)
            {
                ApplicationArea = All;
                Caption = 'Email Documents';
                ToolTip = 'Send documents to customer by email.';
                Image = PrintChecklistReport;
                PromotedCategory = Category6;
                Promoted = true;

                trigger OnAction()
                var
                    NewSalesInvHeader: Record "Sales Invoice Header";

                begin
                    NewSalesInvHeader.Get(Rec."No.");
                    Rec.SendToCustomer(NewSalesInvHeader);
                end;
            }

            action(SendInvoiceToNRS)
            {
                ApplicationArea = All;
                Caption = 'Send Invoice to NRS';
                ToolTip = 'Send Invoice to NRS';
                Image = SendAsPDF;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                var
                    ConfirmMsg: Label 'Do you want to send this invoice to NRS?';
                begin
                    if Rec."Sent to NRS" then
                        Error('This invoice has already been sent to NRS.');
                    if Confirm(ConfirmMsg, false) then
                        Rec.SendeInvoiceToFIRS()
                end;
            }

            action(UpdateAllLinesFromCustomer)
            {
                ApplicationArea = All;
                Caption = 'Update All Lines from Customer';
                ToolTip = 'Update all invoice lines with customer information (TIN, Email, Address, etc.)';
                Image = UpdateDescription;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                var
                    UpdateCust: Codeunit "Update Invoice Line Customer";
                begin
                    UpdateCust.UpdateSalesInvoiceLinesByDocument(Rec."No.");
                end;
            }


        }
    }

    var
        SalesInvHeader: Record "Sales Invoice Header";

}
