namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

pageextension 60015 "Pst. Sales Shpmt - Update Ext" extends "Posted Sales Shipment - Update"
{
    layout
    {
        addafter("Package Tracking No.")
        {

            field("Acknowledged Doc Link"; Rec."Acknowledged Doc Link")
            {
                ApplicationArea = All;
            }
            field("Audit Summary"; Rec."Audit Summary")
            {
                ApplicationArea = All;
            }

        }

    }

    trigger OnOpenPage()
    begin
        xSalesShipmentHeader := Rec;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = ACTION::LookupOK then
            if NewRecordChanged() then
                CODEUNIT.Run(CODEUNIT::"Shipment Header - Edit", Rec);
    end;

    var
        xSalesShipmentHeader: Record "Sales Shipment Header";

    local procedure NewRecordChanged() IsChanged: Boolean
    begin
        IsChanged :=
        (Rec."Acknowledged Doc Link" <> xSalesShipmentHeader."Acknowledged Doc Link") or
        (Rec."Audit Summary" <> xSalesShipmentHeader."Audit Summary");

    end;

}
