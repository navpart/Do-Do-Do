pageextension 60039 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Location Code")
        {
            field(IRN; Rec.IRN)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Invoice Reference Number (IRN).';
            }
            field("Sent to NRS"; Rec."Sent to NRS")
            {
                ApplicationArea = All;
                ToolTip = 'Indicates whether the invoice has been sent to NRS.';
            }
        }
    }
}
