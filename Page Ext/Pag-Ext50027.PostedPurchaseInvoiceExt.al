namespace AL_TNL.AL_TNL;

using Microsoft.Purchases.History;

pageextension 50027 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                Visible = true;
                ApplicationArea = All;
            }

        }
    }
}
