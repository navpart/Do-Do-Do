table 50188 "Interior Colour Codes"
{
    Caption = 'Interior Colour Codes';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Product Group Code"; Code[10])
        {
            TableRelation = "Product Grp".Code WHERE("Item Category Code" = CONST('CARS'));
        }
        field(2; "Interior Colour Code"; Code[10])
        {
        }
        field(3; "Interior Colour Name"; Text[30])
        {
        }
    }
    keys
    {
        key(Key1; "Product Group Code", "Interior Colour Code")
        {
            Clustered = true;
        }
    }
}
