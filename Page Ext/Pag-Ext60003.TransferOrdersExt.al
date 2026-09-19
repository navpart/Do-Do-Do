namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Transfer;

pageextension 60003 "Transfer Orders Ext" extends "Transfer Orders"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("COF No."; Rec."COF No.")
            {
                ApplicationArea = All;
            }
        }
    }

    /* actions
    {
        addafter("&Print")
        {
            action(PrintPickingList)
            {
                Caption = 'Print';
                ApplicationArea = All;
                ToolTip = 'Print transfer order for this transaction.';
                Image = Print;
                PromotedCategory = Category8;
                Promoted = true;
                trigger OnAction()
                var
                    TransferOrderList: Report Transfer2;
                    TransferOrder: Record "Transfer Header";
                begin
                    Clear(TransferOrderList);
                    TransferOrder.SetRange("No.", Rec."No.");
                    if TransferOrder.FindFirst() then begin
                        TransferOrderList.SetTableView(TransferOrder);
                        TransferOrderList.UseRequestPage();
                        TransferOrderList.RunModal();
                    end
                end;
            }
        }
    } */
}
