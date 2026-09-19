namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

pageextension 50019 "Posted Service Shipment Ext" extends "Posted Service Shipments"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the order number associated with the service shipment.';
            }
        }
    }
}
