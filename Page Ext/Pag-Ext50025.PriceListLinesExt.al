namespace AL_TNL.AL_TNL;

using Microsoft.Pricing.PriceList;

pageextension 50025 "Price List Lines Ext" extends "Price List Lines"
{
    layout
    {
        addafter(VATBusPostingGrPrice)
        {
            field("Inventory Posting Group"; Rec."Inventory Posting Group")
            {
                ApplicationArea = All;
            }

        }
    }
}
