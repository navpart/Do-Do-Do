namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

pageextension 60008 "Posted Service Invoice" extends "Posted Service Invoice"
{
    actions
    {
        addafter("&Print")
        {
            action(PrintVehicle)
            {
                ApplicationArea = All;
                Caption = 'TCSC Invoice';
                ToolTip = 'Print invoice.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    ServiceInvHeader.SETRANGE("No.", Rec."No.");
                    IF ServiceInvHeader.FindFirst() THEN
                        REPORT.RUNMODAL(50616, TRUE, TRUE, ServiceInvHeader);
                end;
            }
            action(SendServiceInvoiceToNRS)
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
        }

    }
    var
        ServiceInvHeader: Record "Service Invoice Header";
}
