namespace AL_TNL.AL_TNL;

using Microsoft.Purchases.Vendor;

pageextension 60036 "Vendor List Ext" extends "Vendor List"
{
    layout
    {
        addbefore("Balance (LCY)")
        {
            field("Net Change"; Rec."Net Change")
            {
                ApplicationArea = All;
            }
            field("Net Change (LCY)"; Rec."Net Change (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
}
