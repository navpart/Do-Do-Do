table 50167 "ENL COT"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Engine No."; Code[20])
        {
        }
        field(4; Name; Text[50])
        {
        }
        field(5; "Model No."; Code[30])
        {
        }
        field(6; "Model Year"; Text[30])
        {
        }
        field(7; "Chassis No."; Code[30])
        {
        }
        field(8; "Item No."; Code[30])
        {
        }
        field(9; "Customer No."; Code[30])
        {
        }
        field(10; "Serial Code"; Code[30])
        {
        }
        field(12; "User Person"; Text[100])
        {
        }
        field(13; "User Telephone1"; Text[30])
        {
        }
        field(14; "User Telephone2"; Text[30])
        {
        }
        field(15; "User No."; Text[30])
        {
        }
        field(17; "Item Description"; Text[50])
        {
        }
        field(18; "Ship-to Code"; Code[30])
        {
        }
        field(19; "Warranty Starting Date (Parts)"; Date)
        {
        }
        field(20; "Warranty Ending Date (Parts)"; Date)
        {
        }
        field(21; "Warranty Staring Date (Labour)"; Date)
        {
        }
        field(22; "Warranty Ending Date (Labour)"; Date)
        {
        }
        field(23; "Search Description"; Text[30])
        {
        }
        field(24; "Last Service Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

