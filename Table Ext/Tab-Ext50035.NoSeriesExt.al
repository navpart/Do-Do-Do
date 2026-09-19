tableextension 50035 "No. Series Ext" extends "No. Series"
{
    fields
    {
         field(50000; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE ("Use As In-Transit"=CONST(false));
        }
        field(50001; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(50002; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
    }
}
