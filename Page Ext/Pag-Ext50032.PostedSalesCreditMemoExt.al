namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

pageextension 50032 "Posted Sales Credit Memo Ext" extends "Posted Sales Credit Memo"
{
    actions
    {
        addafter(Print)
        {
            action(PrintGRN)
            {
                ApplicationArea = All;
                Caption = 'GRN';
                ToolTip = 'Print goods receipt note for this transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesCreditMemo.SETRANGE("No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50032, TRUE, TRUE, SalesCreditMemo);
                end;
            }

            action(PrintWaybill)
            {
                ApplicationArea = All;
                Caption = 'Waybill';
                ToolTip = 'Print waybill for this transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesCreditMemo.SETRANGE("No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50210, TRUE, TRUE, SalesCreditMemo);
                end;
            }
        }
    }

    var
        SalesCreditMemo: Record "Sales Cr.Memo Header";

}