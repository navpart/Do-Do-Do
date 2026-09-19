pageextension 50024 "O365 Activities Ext." extends "O365 Activities"
{
    layout
    {
        modify("Document Exchange Service")
        {
            Visible = false;
        }

        modify(Payments)
        {
            Visible = false;
        }
        modify("Incoming Documents")
        {
            Visible = false;
        }
    }
}
