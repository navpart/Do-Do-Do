table 50063 "Appraisal Codes"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Next Step Formular"; Option)
        {
            OptionMembers = "0","1","2","3","4",P,M,T;
        }
        field(4; "Percent Increase"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

