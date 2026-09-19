namespace AL_TNL.AL_TNL;

using Microsoft.Purchases.Document;

pageextension 60038 "Purchase Invoice Ext" extends "Purchase Invoice"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
        }

    }
}
