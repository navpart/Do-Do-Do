namespace AL_TNL.AL_TNL;

using Microsoft.Finance.GeneralLedger.Journal;

pageextension 50037 "General Journal Ext" extends "General Journal"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the line number of the journal line.';
                Caption = 'Line No.';
                Editable = false;
            }

        }
    }
}
