tableextension 50033 "Gen. Prod. Posting Group Ext" extends "Gen. Product Posting Group"
{
    fields
    {
        field(50003; "Show In Inventory Summary"; Boolean)
        {
        }
        field(50004; Quantity; Decimal)
        {
        }
        field(50005; "Item Ledg. Entry Type Filter"; Option)
        {
            //FieldClass = FlowFilter;
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ";
        }
        field(50006; "Item Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item."No.";
        }
        field(50007; "Variant Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item Filter"));
        }
    }
}
