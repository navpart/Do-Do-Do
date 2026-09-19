tableextension 50041 "Tracking Specification Ext" extends "Tracking Specification"
{
    fields
    {
        field(50001; "Registration No."; Code[20])
        {
        }
        field(50002; "Chasis No."; Code[20])
        {
        }
        field(50003; "Engine No."; Code[20])
        {

        }
        field(50004; "Service Item Registered"; Boolean)
        {

        }
        field(50005; "Warranty Register"; Boolean)
        {
        }
        field(50006; "Production Month"; Code[10])
        {
        }
        field(50008; "Exterior Colour Code"; Code[30])
        {

        }
        field(50009; "Key No."; Text[20])
        {
        }
        field(50010; "Interior Colour Code"; Code[10])
        {
        }
        field(50011; "Interior Colour Name"; Text[30])
        {
        }
        field(50012; Surplus; Code[20])
        {
        }
        field(50013; "Exterior Colour Name"; Code[30])
        {
        }
        field(50014; "Product  Group Code"; Code[20])
        {

        }
        field(50015; "VRI Code"; Code[20])
        {
            //TableRelation = "VRI Table"."VRI Code";
        }
        field(50016; "Color Description"; Text[30])
        {
        }
    }
}
