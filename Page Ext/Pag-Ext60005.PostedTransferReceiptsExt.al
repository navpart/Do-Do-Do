namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Transfer;

pageextension 60005 "Posted Transfer Receipts Ext" extends "Posted Transfer Receipts"
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
}
