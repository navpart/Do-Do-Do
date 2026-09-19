table 50074 "Leave Categories"
{
    /* DrillDownPageID = 50060;
    LookupPageID = 50060;
 */
    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Consuming; Boolean)
        {
        }
        field(4; "Payment Allowed"; Boolean)
        {
        }
        field(5; "Category Type"; Option)
        {
            OptionMembers = " ",Annual,Maternity,Others;
        }
        field(6; "Default Duration"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Consuming)
        {
        }
    }

    fieldgroups
    {
    }
}

