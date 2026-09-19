tableextension 50061 "Fixed Assets Ext" extends "Fixed Asset"
{
    fields
    {
        field(50001;"Number of years";Integer)
        {
            BlankZero = true;
        }
        field(50002;"User 2";Code[30])
        {
            TableRelation = "User Setup";
        }
        field(50003;"Registration No.";Code[20])
        {
        }
        field(50004;"Fuel type";Option)
        {
            BlankZero = true;
            OptionMembers = Petrol,Diesel,"None";
        }
        field(50005;Place;Text[30])
        {
        }
        field(50006;Vendor;Text[30])
        {
        }
        field(50007;Location;Code[30])
        {
        }
        field(50008;"New Registration No.";Code[20])
        {
        }
        field(50009;"Acquisition Date";Date)
        {
            CalcFormula = Lookup("FA Depreciation Book"."Acquisition Date" WHERE ("FA No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50010;"Pool Car";Boolean)
        {
        }
        field(50011;Disposed;Boolean)
        {
        }
        field(50012;"Disposed date";Date)
        {
        }
    }
}
