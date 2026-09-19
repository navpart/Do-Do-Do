tableextension 50034 "Bank Account Ext" extends "Bank Account"
{
    fields
    {
        field(50000; "Interest Rate"; Decimal)
        {
        }
        field(50001; "Unconfirmed L/C"; Decimal)
        {
        }
        field(50002; Tenor; DateFormula)
        {
        }
        field(50003; "Old No."; Code[20])
        {
        }
        field(50004; Cashier; Boolean)
        {
        }
        field(50005; "Cashier Account"; Code[20])
        {
            
        }
        field(50006; POS; Boolean)
        {
        }
    }
}
