namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Item;

pageextension 60007 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Model No."; Rec."Model No.")
            {
                ApplicationArea = All;
            }
            field("Model Name"; Rec."Model Name")
            {
                ApplicationArea = All;
            }
            field("Last Purchase Date"; Rec."Last Purchase Date")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("BNPA"; Rec.BNPA)
            {
                ApplicationArea = All;
                Visible = True;
            }
            field("DealerA"; Rec.DealerA)
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("DealerB"; Rec.DealerB)
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("BNPB"; Rec.BNPB)
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("BNPC"; Rec."BNPC")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("ISOLO-PRIC"; Rec."ISOLO-PRIC")
            {
                ApplicationArea = All;
                Visible = true;
            }

            field("Last Date Sold"; Rec."Last Date Sold")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = all;
            }
            field(Engine; Rec.Engine)
            {
                ApplicationArea = all;
            }
        }

        addafter("Unit Price")
        {

            field("FOB (FIXED)"; Rec."FOB (FIXED)")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Fixed Cost"; Rec."Fixed Cost")
            {
                ApplicationArea = Basic, Suite;
            }


            field("Net Change"; Rec."Net Change")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Stockvalue."; Rec."Stockvalue.")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Item Price Group"; Rec."Item Price Group")
            {
                ApplicationArea = Basic, Suite;
                ShowMandatory = true;
            }
            field("Lekki Inventory"; Rec."Lekki Inventory")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Dojo Inventory"; Rec."Dojo Inventory")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Dojo Oregun  Inventory"; Rec."Dojo Oregun  Inventory")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Abuja Inventory"; Rec."Abuja Inventory")
            {
                ApplicationArea = Basic, Suite;
            }
            field("PortHarcourt Inventory"; Rec."PortHarcourt Inventory")
            {
                ApplicationArea = Basic, Suite;
            }
        }

    }
}
