page 50380 "Vehicles Delivered"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Vehicle Delivery Monitor";
    SourceTableView = SORTING("Serial No.")
                      WHERE(Open = FILTER(false),
                            Delivered = FILTER(True));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Invoice No"; Rec."Invoice No")
                {
                }
                field("Customer Code"; Rec."Customer Code")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Inventory Group"; Rec."Inventory Group")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field(Delivered; Rec.Delivered)
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
            }
            field(COUNT; Rec.COUNT)
            {
                Caption = 'Line Count';
            }
            label(Control1)
            {
                CaptionClass = Text19042010;
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SETFILTER(Delivered, '%1', TRUE);
        Rec.SETFILTER(Open, '%1', FALSE);
    end;

    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemLedgEntry2: Record "Item Ledger Entry";
        CustRec: Record 18;
        VehMonitor: Record "Vehicle Delivery Monitor";
        Text19042010: Label 'Vehicle Delivery Monitoring System';
}

