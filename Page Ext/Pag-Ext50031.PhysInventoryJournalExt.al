namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Counting.Journal;

pageextension 50031 "Phys. Inventory Journal Ext" extends "Phys. Inventory Journal"
{
    layout
    {
        addbefore("Location Code")
        {
            field("Shelf No."; Rec."Shelf No.")
            {
                ApplicationArea = All;
            }
            field("Item shelf"; Rec."Item shelf")
            {
                ApplicationArea = All;
            }
        }


    }

}
