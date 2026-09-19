namespace AL_TNL.AL_TNL;

using Microsoft.FixedAssets.FixedAsset;

pageextension 60012 "Fixed Asset List Ext" extends "Fixed Asset List"
{
    layout
    {
        addafter(Description)
        {
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("New Registration No."; Rec."New Registration No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
