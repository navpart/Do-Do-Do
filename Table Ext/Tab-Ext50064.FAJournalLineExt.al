tableextension 50064 "FA Journal Line Ext" extends "FA Journal Line"
{
    fields
    {
        field(50005; "Transaction Type"; Option)
        {
            OptionMembers = " ",Cash,Cheque,"Bank Transfer",Others,"Credit Note","Debit Note";

            trigger OnValidate()
            begin


                IF "Transaction Type" = 0 THEN BEGIN
                    Description := '';
                    EXIT;
                END;
            end;
        }
        field(50011; "Account Type Filter"; Code[10])
        {
           
        }
        field(50164; CardType; Code[2])
        {
        }
        field(50207; Initials; Code[3])
        {
        }
        field(50208; Bank; Code[10])
        {
        }
        field(50209; "User typed"; Code[3])
        {
        }
        field(50210; "Control No."; Code[6])
        {
        }
        field(50220; Printed; Boolean)
        {
        }
        field(50221; Temp; Code[10])
        {
        }
    }
}
