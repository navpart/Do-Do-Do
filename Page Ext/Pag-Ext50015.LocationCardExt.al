pageextension 50015 "Location Card Ext." extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("Monitored Location"; Rec."Monitored Location")
            {
                ApplicationArea = All;
            }

            field("Main Location"; Rec."Main Location")
            {
                ApplicationArea = All;
            }

            field("VRI Location"; Rec."VRI Location")
            {
                ApplicationArea = All;
            }
            field("With Accessory"; Rec."With Accessory")
            {
                ApplicationArea = All;
            }
        }
    }
}
