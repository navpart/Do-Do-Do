namespace AL_TNL.AL_TNL;

using Microsoft.Pricing.PriceList;

pageextension 50026 "Price List Line Review Ext" extends "Price List Line Review"
{
    layout
    {
        addafter("Ending Date")
        {
            field("Inventory Posting Group"; Rec."Inventory Posting Group")
            {
                ApplicationArea = All;
            }

        }
    }
}
