namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

page 50105 "Sales Invoice Line API"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Line API';
    PageType = List;
    SourceTable = "Sales Invoice Line";
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
                    ToolTip = 'Specifies the name of the item or general ledger account, or some descriptive text.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item specified on the line.';
                }
                field("Tracker No."; Rec."Tracker No.")
                {
                    ToolTip = 'Specifies the value of the Tracker No. field.', Comment = '%';
                }
                field("Qty. Demanded"; Rec."Qty. Demanded")
                {
                    ToolTip = 'Specifies the quantity demanded for the item.';
                }
            }
        }
    }
}
