namespace Toyota.Toyota;

using Microsoft.Assembly.Document;
using Microsoft.Inventory.Item;
using Microsoft.Pricing.PriceList;

tableextension 50112 AssemblyLinesTabExt extends "Assembly Line"
{
    fields
    {
        field(50000; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            //CalcFormula = Lookup(Item."Unit Price" WHERE("No." = FIELD("No.")));
            //FieldClass = FlowField;


        }
        field(50001; "Sales Amount"; Decimal)
        {
            Caption = 'Sales Amount';

            //DataClassification = ToBeClassified;
        }
    }
    procedure GetUnitPrice(): Decimal
    var
        ItemRec: Record Item;
        PriceListLineRec: Record "Price List Line";
    begin
        if ItemRec.Get("No.") then begin
            //if ItemRec."Gen. Prod. Posting Group" = 'CAR' then begin
            //if PriceListLineRec.Get(ItemRec."No.", 'A', 0D) then
            PriceListLineRec.Reset();
            PriceListLineRec.SetRange("Product No.", ItemRec."No.");
            //PriceListLineRec.SetRange("Assign-to No.", 'A');
            PriceListLineRec.SetRange("Ending Date", 0D);
            if PriceListLineRec.FindFirst() then
                "Unit Price" := PriceListLineRec."Unit Price"
            else
                "Unit Price" := 0;
        end;
        //else
        //    "Unit Price" := ItemRec."Unit Price";
        "Sales Amount" := "Unit Price" * Quantity;
    end;
    //end;
}




