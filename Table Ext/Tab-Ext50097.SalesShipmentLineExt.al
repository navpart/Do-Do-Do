namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

tableextension 50097 "Sales Shipment Line Ext" extends "Sales Shipment Line"
{
    fields
    {
        field(50000; "Search Code"; Code[20])
        {
        }
        field(50001; "Quantity Demand"; Decimal)
        {
        }
        field(50002; "Search Line"; Integer)
        {
        }
        field(50006; Colour; Code[30])
        {
            Editable = true;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(50208; "Chassis Number"; Code[30])
        {
            Editable = false;
        }
        field(50209; "Quantity Demanded"; Decimal)
        {
        }
        field(50211; "Chassis No."; Code[30])
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
        {
        }
        field(60102; "Part Group"; Code[10])
        {
        }
        field(60103; "Job Type"; Option)
        {
            OptionCaption = ' ,B&P,GR';
            OptionMembers = " ","B&P",GR;
        }
        field(60142; "Security Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Security Confirmation" THEN BEGIN
                    "Security Confirmation by" := USERID;
                    "Confirmation Date" := CURRENTDATETIME;
                END ELSE
                    "Security Confirmation by" := '';
                "Confirmation Date" := 0DT;
            end;
        }
        field(60143; "Security Confirmation by"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60144; "Document Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60145; "Security No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(60146; "Security Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60147; "Confirmation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
