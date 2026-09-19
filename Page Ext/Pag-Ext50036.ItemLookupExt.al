namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Item;

pageextension 50036 "Item Lookup Ext" extends "Item Lookup"
{

    layout
    {
        addafter(Description)
        {
            field("Substitutes Exist"; Rec."Substitutes Exist")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether a substitute item exists for the current item.';
                Caption = 'Substitute Exists';
                Editable = false;
            }
        }
    }

}
