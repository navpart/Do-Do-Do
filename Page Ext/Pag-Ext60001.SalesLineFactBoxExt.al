namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Document;
using Microsoft.Inventory.Ledger;


pageextension 60001 "Sales Line FactBox Ext" extends "Sales Line FactBox"
{
    layout
    {
        modify(ItemNo)
        {

            Caption = 'FIFO List';

            trigger OnDrillDown()

            var
                GenPurposeCode: Codeunit "General Purpose Codeunit-1";

            begin
                GenPurposeCode.LookupItemLedgerList(Rec);
            end;
        }
    }
}
