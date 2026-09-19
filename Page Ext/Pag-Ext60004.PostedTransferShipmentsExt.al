namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Transfer;

pageextension 60004 "Posted Transfer Shipments Ext" extends "Posted Transfer Shipments"
{
    layout
    {
        addafter("Posting Date")
        {
            field("COF No."; Rec."COF No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addbefore("&Print")
        {
            action(PrintVehicle)
            {
                ApplicationArea = All;
                Caption = 'Print -Vehicle';
                ToolTip = 'Print vehicle transfer shipment.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    TransferShipHeader.SETRANGE("No.", Rec."No.");
                    IF TransferShipHeader.FindFirst() THEN
                        REPORT.RUNMODAL(50019, TRUE, TRUE, TransferShipHeader);
                end;
            }
        }

    }
    var
        TransferShipHeader: Record "Transfer Shipment Header";
}
