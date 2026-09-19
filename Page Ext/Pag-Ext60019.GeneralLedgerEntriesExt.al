namespace AL_TNL.AL_TNL;

using Microsoft.Finance.GeneralLedger.Ledger;

pageextension 60019 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Posting Description"; Rec."Posting Description")
            {
                ApplicationArea = All;
            }
            field("Item ledger entry"; Rec."Item ledger entry")
            {
                ApplicationArea = All;
            }

        }
        modify("Job No.")
        {
            Visible = true;
        }

    }

}
