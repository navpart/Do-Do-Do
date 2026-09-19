namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

pageextension 60010 "Posted Serv. Inv. Subform Ext" extends "Posted Service Invoice Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Job Type"; Rec."Job Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
