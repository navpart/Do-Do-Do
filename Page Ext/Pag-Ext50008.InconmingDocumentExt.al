pageextension 50008 "Inconming Document Ext" extends "Incoming Document"
{
    layout
    {
        addbefore(URL)
        {
            field(XURL; Rec.XURL)
            {
                ApplicationArea = All;
                Caption = 'Link to Document';
            }
        }

        modify(URL)
        {
            Caption = 'View Document Link';
        }
    }
}
