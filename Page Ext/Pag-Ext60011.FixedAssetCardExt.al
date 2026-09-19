namespace AL_TNL.AL_TNL;

using Microsoft.FixedAssets.FixedAsset;

pageextension 60011 "Fixed Asset Card Ext" extends "Fixed Asset Card"
{
    layout
    {
        addafter(Insured)
        {
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
