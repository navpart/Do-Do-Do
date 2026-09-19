namespace AL_TNL.AL_TNL;

using Microsoft.Pricing.PriceList;
using Microsoft.Inventory.Item;

report 50016 "Price List Line"
{
    ApplicationArea = All;
    Caption = 'Modify Price List Line';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PriceListLine; "Price List Line")
        {
            column(ProductNo; "Product No.")
            {
            }

            trigger OnAfterGetRecord()
            var
                Item: Record Item;

            Begin

                If Item.Get("Product No.") then begin
                    "Inventory Posting Group" := Item."Inventory Posting Group";
                    Modify();
                end;

            End;
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
