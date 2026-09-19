tableextension 50001 "Salesperson/Purchaser Ext." extends "Salesperson/Purchaser"
{
    fields
    {
        field(50151; "Sales/Purchase"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Sales,Purchase;
        }
        field(50152; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
    }
}
