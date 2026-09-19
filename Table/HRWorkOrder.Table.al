table 50169 "HR Work Order"
{

    fields
    {
        field(1; "Order No."; Code[10])
        {
        }
        field(2; "Issued Date"; Date)
        {
        }
        field(3; Approval; Code[10])
        {
        }
        field(4; "COF Ref Code"; Code[10])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
    }

    keys
    {
        key(Key1; "Order No.")
        {
            Clustered = true;
        }
        key(Key2; "COF Ref Code")
        {
        }
    }

    fieldgroups
    {
    }
}

