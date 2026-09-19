namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Ledger;

page 50057 "Item Ledger Entry API"
{
    ApplicationArea = All;
    Caption = 'Item Ledger Entry API';
    PageType = List;
    SourceTable = "Item Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ToolTip = 'Specifies the quantity in the Quantity field that remains to be processed.';
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                    ToolTip = 'Specifies the value of the Exterior Colour Code field.', Comment = '%';
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                    ToolTip = 'Specifies the value of the Exterior Colour Name field.', Comment = '%';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field("Purchase Date"; Rec."Purchase Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Date field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Production Year"; Rec."Production Year")
                {

                }
                field("Serial No."; Rec."Serial No.")
                {

                }
                field("Engine No."; Rec."Engine No.")
                {

                }

            }
        }
    }
}
