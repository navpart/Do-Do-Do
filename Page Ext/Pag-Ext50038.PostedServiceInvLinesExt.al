namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

pageextension 50038 "Posted Service Inv. Lines Ext" extends "Posted Service Invoice Lines"
{
    layout
    {
        addafter(Description)
        {
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = All;
                Caption = 'Location Code';
                Editable = false;
            }
        }
    }
}
