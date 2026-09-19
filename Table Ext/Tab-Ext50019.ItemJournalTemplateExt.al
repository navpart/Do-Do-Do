tableextension 50019 "Item Journal Template Ext" extends "Item Journal Template"
{
    fields
    {
        field(50000; "Requisition No."; Code[10])
        {
        }
        field(50150; "Transfer Branch"; Boolean)
        {
            BlankZero = true;
        }
    }
}
