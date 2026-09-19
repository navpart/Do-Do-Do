namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Item;

report 51019 "Update Phys. Inventory Jnl"
{
    ApplicationArea = All;
    Caption = 'Update Phys. Inventory Jnl';
    UsageCategory = Lists;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ItemJournalLine; "Item Journal Line")
        {


            trigger OnAfterGetRecord()

            var

                Item: Record Item;

            begin
                If Item.get("Item No.") then begin
                    "Shelf No." := item."Shelf No.";
                    Modify();
                end;

            end;

        }


    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
