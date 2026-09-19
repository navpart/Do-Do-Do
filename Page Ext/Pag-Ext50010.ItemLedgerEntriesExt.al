pageextension 50010 "Item Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {

            field("Engine No."; Rec."Engine No.")
            {
                ApplicationArea = All;

            }
            field("Exterior Colour Code"; Rec."Exterior Colour Code")
            {
                ApplicationArea = All;

            }
            field("Exterior Colour Name"; Rec."Exterior Colour Name")
            {
                ApplicationArea = All;

            }
            field("Interior Colour Code"; Rec."Interior Colour Code")
            {
                ApplicationArea = All;

            }
            field("Interior Colour Name"; Rec."Interior Colour Name")
            {
                ApplicationArea = All;

            }
            field("Key No."; Rec."Key No.")
            {
                ApplicationArea = All;

            }
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = All;
            }
            field("Inventory Posting Group"; Rec."Inventory Posting Group")
            {
                ApplicationArea = All;
            }
            field("Purchase Date"; Rec."Purchase Date")
            {
                ApplicationArea = All;
            }
            field("Model No."; Rec."Model No.")
            {
                ApplicationArea = ALL;
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = ALL;
            }
            field(Engime; Rec.Engine)
            {
                ApplicationArea = ALL;
            }
            field("Shelf No"; Rec."Shelf No")
            {
                ApplicationArea = ALL;
            }
        }

    }
}
