namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Tracking;

page 50094 "Reservation Entry"
{
    ApplicationArea = All;
    Caption = 'Reservation Entry';
    PageType = List;
    SourceTable = "Reservation Entry";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item that has been reserved in this entry.';
                }
                field("Source ID"; Rec."Source ID")
                {

                }
                field("Serial No."; Rec."Serial No.")
                {

                }
            }
        }
    }
}
