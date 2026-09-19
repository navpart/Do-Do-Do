pageextension 50012 "Inventory Setup Ext" extends "Inventory Setup"
{
    layout
    {

        addafter("Copy Item Descr. to Entries")
        {
            field("Exchange Rate"; Rec."Exchange Rate")
            {
                ApplicationArea = All;
            }
        }

        addlast(Numbering)
        {
            field("Stock Capitalisation No."; Rec."Stock Capitalisation No.")
            {
                ApplicationArea = All;

            }
            field("Material Requisition Nos"; Rec."Material Requisition Nos")
            {
                ApplicationArea = All;

            }
            field("Search Tracker Nos."; Rec."Search Tracker Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}
