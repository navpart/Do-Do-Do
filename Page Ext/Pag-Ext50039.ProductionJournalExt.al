namespace AL_TNL.AL_TNL;

using Microsoft.Manufacturing.Journal;

pageextension 50039 "Production Journal Ext" extends "Production Journal"
{
    layout
    {
        addafter(Quantity)
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field(Amount; Rec.Amount)
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
