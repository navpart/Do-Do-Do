namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Item.Substitution;

page 50103 "Item Substitution API"
{
    ApplicationArea = All;
    Caption = 'Item Substitution API';
    PageType = List;
    SourceTable = "Item Substitution";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the description of the substitute item.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies how many units (such as pieces, boxes, or cans) of the item are available.';
                }
                field("Quantity Avail. on Shpt. Date"; Rec."Quantity Avail. on Shpt. Date")
                {
                    ToolTip = 'Specifies the substitute item quantity available on the shipment date.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Sub. Item No."; Rec."Sub. Item No.")
                {
                    ToolTip = 'Specifies the item number of the catalog substitute item.';
                }
                field("Substitute No."; Rec."Substitute No.")
                {
                    ToolTip = 'Specifies the number of the item that can be used as a substitute in case the original item is unavailable.';
                }
                field("Substitute Type"; Rec."Substitute Type")
                {
                    ToolTip = 'Specifies the type of the item that can be used as a substitute.';
                }
                field("Substitute Variant Code"; Rec."Substitute Variant Code")
                {
                    ToolTip = 'Specifies the code of the variant that can be used as a substitute.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
            }
        }
    }
}
