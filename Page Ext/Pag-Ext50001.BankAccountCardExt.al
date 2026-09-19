pageextension 50001 "Bank Account Card Ext" extends "Bank Account Card"
{
    layout
    {
        addlast(Posting)
        {
            field(Cashier; Rec.Cashier)
            {
                ApplicationArea = All;
            }
            field("Cashier Account"; Rec."Cashier Account")
            {
                ApplicationArea = All;
            }
            field(POS; Rec.POS)
            {
                ApplicationArea = All;
            }
        }
    }
}

