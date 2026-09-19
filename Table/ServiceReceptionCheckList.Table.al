table 50132 "Service Reception Check List"
{

    fields
    {
        field(1; "Reception No."; Code[20])
        {
            TableRelation = "Holiday Calendar"."Entry No.";
        }
        field(2; "Service No."; Code[20])
        {
            TableRelation = "Service Header"."No.";
        }
        field(3; "Service Checking Code"; Code[20])
        {
            TableRelation = "Service Checking List"."Prev Code";

            trigger OnValidate()
            begin
                IF ServCheck.GET("Service Checking Code") THEN BEGIN
                    "Service Checking Description" := ServCheck.Description;
                    "Service Checking Type" := ServCheck."Service Type";
                END;
            end;
        }
        field(4; "Service Checking Description"; Text[50])
        {
        }
        field(5; "Service Checking Type"; Option)
        {
            OptionCaption = ' ,Inspection,Replacement,Adjustment,Repack,Repair';
            OptionMembers = " ",Inspection,Replacement,Adjustment,Repack,Repair;
        }
        field(6; "Service Checking Condition"; Option)
        {
            OptionCaption = ' ,Good,Need Adjustment,Bad';
            OptionMembers = " ",Good,"Need Adjustment",Bad;
        }
        field(7; "Service Checking Remark"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Reception No.", "Service Checking Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ServCheck: Record 50131;
}

