tableextension 50042 "Reservation Entry Ext" extends "Reservation Entry"
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
        field(50016; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(50017; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50018; "Model No."; Code[20])
        {
        }
        field(50019; "Vendor Shipment No."; Code[20])
        {
        }
        field(50020; "Picked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Picked By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}
