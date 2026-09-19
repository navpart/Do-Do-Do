table 50067 "Colour Codes"
{

    fields
    {
        field(1; "Product Group Code"; Code[10])
        {
            TableRelation = "Product Grp".Code WHERE("Item Category Code" = CONST('CARS'));
        }
        field(2; "Colour Code"; Code[10])
        {
        }
        field(3; Description; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Product Group Code", "Colour Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure GetColour(Grp: Code[10]; Cl: Code[10]): Text[30]
    var
        ColourRec: Record "Colour Codes";
    begin
        IF ColourRec.GET(Grp, Cl) THEN
            EXIT(ColourRec.Description)
        ELSE
            EXIT('');
    end;
}

