table 50144 "Behavioral Attribute"
{

    fields
    {
        field(1; "Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF BehAttr.GET(Code) THEN
                    Attribute := BehAttr.Attribute;
            end;
        }
        field(2; Attribute; Text[250])
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

    var
        BehAttr: Record "Behavioral Attribute";
}

