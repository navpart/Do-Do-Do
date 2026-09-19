tableextension 50063 "FA Posting Group Ext" extends "FA Posting Group"
{
    fields
    {
        field(50000; Description; Text[30])
        {
        }
        field(50001; "M1, Fuel Internal"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50002; "M2, Fuel External"; Code[20])
        {
            TableRelation = "G/L Account";  
        }
        field(50003; "M3, Fuel Unreceipted"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50004; "M4, Insurance"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50005; "M5, License"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50006; "M6, Service/Repairs"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50007; "M7, Others"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50008; "M1, Rate for Petrol"; Decimal)
        {
            BlankZero = true;
        }
        field(50009; "M2, Rate for Diesel"; Decimal)
        {
            BlankZero = true;
        }
    }
}
