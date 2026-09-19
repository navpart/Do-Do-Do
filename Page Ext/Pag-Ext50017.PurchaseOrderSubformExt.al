pageextension 50017 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        modify("Line No.")
        {
            Editable = false;
        }


        addafter("Location Code")
        {
            field("Chassis No."; Rec."Chassis No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Year of Production"; Rec."Year of Production")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Color Group"; Rec."Color Group")
            {
                ApplicationArea = All;
                Visible = true;
            }

            field(Colour; Rec.Colour)
            {
                ApplicationArea = All;
                Visible = true;
            }

            field("Colour Description"; Rec."Colour Description")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Interior Colour Code"; Rec."Interior Colour Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Interior Colour Name"; Rec."Interior Colour Name")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }

        }

    }
}