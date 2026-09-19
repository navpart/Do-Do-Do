namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

pageextension 50028 "Posted Sales Shipment Ext" extends "Posted Sales Shipment"
{

    actions
    {

        addafter("&Shipment")
        {
            action(WaybillVehicle)
            {
                ApplicationArea = All;
                Caption = 'Waybill -Vehicle';
                ToolTip = 'Print vehicle waybill for this transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesShipmHeader.SETRANGE("No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50352, TRUE, TRUE, SalesShipmHeader);
                end;
            }

            action(WaybillPart)
            {
                ApplicationArea = All;
                Caption = 'Waybill -Part';
                ToolTip = 'Print part waybill for this transaction.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    SalesShipmHeader.SETRANGE("No.", Rec."No.");
                    IF Rec.FindFirst() THEN
                        REPORT.RUNMODAL(50606, TRUE, TRUE, SalesShipmHeader);
                end;
            }

        }


    }



    var

        SalesShipmHeader: Record "Sales Shipment Header";
}
