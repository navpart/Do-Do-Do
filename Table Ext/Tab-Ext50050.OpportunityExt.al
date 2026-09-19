tableextension 50050 "Opportunity Ext" extends Opportunity
{
    fields
    {
        field(50001; "Loss Sales No."; Code[20])
        {
            TableRelation = "Sales Header"."No.";
        }
        field(50002; "Sales Order No."; Code[20])
        {
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order),
                                                      "Sell-to Contact No." = FIELD("Contact No."));
        }
    }
}
