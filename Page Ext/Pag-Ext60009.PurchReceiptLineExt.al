namespace AL_TNL.AL_TNL;

using Microsoft.Purchases.History;

pageextension 60009 "Purch. Receipt Line Ext" extends "Purch. Receipt Lines"
{
    layout
    {
        addafter("Location Code")
        {
            field("Chassis No."; Rec."Chassis No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
