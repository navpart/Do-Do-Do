tableextension 50018 "Gen. Journal Line Ext" extends "Gen. Journal Line"
{
    fields
    {
       field(50001;"Loan Type";Code[10])
        {
            //TableRelation = "Loan Types".Code;
        }
        field(50002;"Loan ID";Code[10])
        {
            //TableRelation = "Loan."."Loan ID" WHERE (Staff No.=FIELD(Account No.),
                                                     //Acct. Type=FIELD(Account Type));
        }
        field(50003;"Interest Element";Boolean)
        {
        }
        field(50004;"Payer/Collector Name";Text[50])
        {
        }
        field(50005;"Transaction Type";Option)
        {
            OptionMembers = " ",Cash,Cheque,"Bank Transfer",Others,"Credit Note","Debit Note";

            trigger OnValidate()
            begin

                IF "Transaction Type"=0 THEN
                  BEGIN
                //    Description := '';
                    EXIT;
                  END;
            end;
        }
        field(50006;"Claim/Refund";Boolean)
        {
        }
        field(50011;"Account Type Filter";Code[10])
        {
            //FieldClass = FlowFilter;
            //TableRelation = Table0;
        }
        field(50090;"Value Entry No.";Integer)
        {
        }
        field(50164;CardType;Code[2])
        {
        }
        field(50165;PaymentID;Code[19])
        {
        }
        field(50166;xPaymentID;Code[19])
        {
        }
        field(50200;"Statistical Code";Code[10])
        {
        }
        field(50201;BankAccount;Boolean)
        {
        }
        field(50202;CountryCode;Code[10])
        {
        }
        field(50203;"Original Currency";Code[10])
        {
        }
        field(50204;"Orig. Curr. Amount";Decimal)
        {
        }
        field(50205;"Customer/supplierNo.";Code[20])
        {
        }
        field(50206;"CurrencyAdj. Amount";Decimal)
        {
        }
        field(50207;Initials;Code[20])
        {
            Editable = false;
        }
        field(50208;Bank;Code[10])
        {
        }
        field(50209;"User typed";Code[20])
        {
        }
        field(50210;"Control No.";Code[6])
        {
        }
        field(50220;Printed;Boolean)
        {
        }
        field(50221;Temp;Code[10])
        {
        }
        field(50222;"Reuse Posted Document No";Boolean)
        {
        }
        field(50223;"Procurement No.";Code[10])
        {
        }
        field(60109;"Serial No";Code[20])
        {
        }
    }
}
