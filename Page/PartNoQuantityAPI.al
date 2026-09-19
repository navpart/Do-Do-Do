page 50056 "PartNo Quantity API"
{
    ApplicationArea = All;
    Caption = 'PartNo Quantity';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the description of the item.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the Unit Price of the item.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the Inventory Posting Group of the item.';
                }

            }
        }
    }
}
