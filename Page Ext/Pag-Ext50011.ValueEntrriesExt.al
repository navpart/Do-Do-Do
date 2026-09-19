pageextension 50011 "Value Entrries Ext" extends "Value Entries"
{
    layout
    {
        addafter(Description)
        {
            field(Chassis; Rec.Chassis)
            {
                ApplicationArea = All;
            }

        }
    }
}
