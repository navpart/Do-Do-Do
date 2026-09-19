tableextension 50047 "Det. Vendor Ledg. Entry Ext" extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(50002; "Loan ID"; Code[10])
        {
            Editable = false;
            TableRelation = "Tax Jurisdiction";
        }
        field(50003; "Requisition No."; Code[10])
        {
        }
        field(50004; Rate; Decimal)
        {
        }
    }
}
