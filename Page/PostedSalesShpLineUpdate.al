namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

page 50070 "Posted Sales ShpLine - Update"
{
    ApplicationArea = All;
    Caption = 'Security Information- Update';
    PageType = Card;
    SourceTable = "Sales Shipment Line";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    ShowFilter = false;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the number of the related document.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies either the name of or the description of the item, general ledger account or item charge.';
                }
                field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
                {
                    ToolTip = 'Specifies the value of the Qty. Invoiced (Base) field.', Comment = '%';
                }
                field("Security Confirmation"; Rec."Security Confirmation")
                {
                    ToolTip = 'Specifies the value of the Security Confirmation field.', Comment = '%';
                }
                field("Security No."; Rec."Security No.")
                {
                    ToolTip = 'Specifies the value of the Security No. field.', Comment = '%';
                }
                field("Security Name"; Rec."Security Name")
                {
                    ToolTip = 'Specifies the value of the Security Name field.', Comment = '%';
                }
                field("Security Confirmation by"; Rec."Security Confirmation by")
                {
                    ToolTip = 'Specifies the value of the Security Confirmation by field.', Comment = '%';
                }
            }
        }
    }


    actions
    {

    }
    trigger OnOpenPage()
    begin
        xSalesShptLine := Rec;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = ACTION::LookupOK then
            if RecordChanged() then
                CODEUNIT.Run(CODEUNIT::"Shipment Line - Edit", Rec);
    end;

    var
        xSalesShptLine: Record "Sales Shipment Line";

    local procedure RecordChanged() IsChanged: Boolean
    begin
        IsChanged :=
          (Rec."Security Confirmation" <> xSalesShptLine."Security Confirmation") or
          (Rec."Security Confirmation by" <> xSalesShptLine."Security Confirmation by");

    end;

    procedure SetRec(SalesShipmentLine: Record "Sales Shipment Line")
    begin
        Rec := SalesShipmentLine;
        Rec.Insert();
    end;


}
