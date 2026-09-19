namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

pageextension 60017 "Postd Sales Cr. Subform Ext" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
