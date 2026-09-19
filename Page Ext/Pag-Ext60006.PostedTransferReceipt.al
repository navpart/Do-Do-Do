namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Transfer;

pageextension 60006 "Posted Transfer Receipt Ext" extends "Posted Transfer Receipt"
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
