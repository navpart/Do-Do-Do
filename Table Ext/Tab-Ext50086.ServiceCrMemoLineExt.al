tableextension 50086 "Service Cr.Memo Line Ext" extends "Service Cr.Memo Line"
{
    fields
    {
        field(50000; "WSR No."; Code[20])
        {
        }
        field(50001; "Duration in Hrs"; Decimal)
        {
        }
        field(50002; "Dealer Hourly Rate"; Decimal)
        {
        }
        field(50003; "Flat Rate"; Decimal)
        {
        }
        field(50004; "Start Date"; Date)
        {
        }
        field(50005; "End Date"; Date)
        {
        }
        field(50006; "Start Time"; Time)
        {
        }
        field(50007; "End Time"; Time)
        {
        }
        field(50008; Confirmed; Boolean)
        {

            trigger OnValidate()
            begin
                IF Confirmed THEN
                    "Confirmed by" := USERID;
            end;
        }
        field(50009; "Confirmed by"; Text[30])
        {
        }
        field(50010; "Bin/Shelf No."; Code[20])
        {
        }
        field(50018; "PR Raised"; Boolean)
        {
        }
        field(50152; Department; Code[20])
        {
        }
        field(50153; Remarks; Text[50])
        {
        }
        field(50154; "Model Description"; Text[30])
        {
        }
        field(50155; "Duration in Days"; Decimal)
        {
        }
        field(50156; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(50180; "Customer Class"; Option)
        {
            OptionCaption = ' ,Customer Paid,Internal,Warranty';
            OptionMembers = " ","Customer Paid",Internal,Warranty;
        }
        field(50302; "Customer Order No."; Code[20])
        {
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
        field(90001; "TIN"; Text[150])
        {
            Caption = 'TIN';
        }
        field(90002; "Email"; Text[150])
        {
            Caption = 'Email';
        }
        field(90003; "Postal Address"; Text[250])
        {
            Caption = 'Postal Address';
        }
        field(90004; "Street Name"; Text[100])
        {
            Caption = 'Street Name';
        }
        field(90005; "City Name"; Text[50])
        {
            Caption = 'City Name';
        }
        field(90006; "Postal Zone"; Text[50])
        {
            Caption = 'Postal Zone';
        }
        field(90008; "Original Document No."; Code[20])
        {

        }
        field(90009; "Original IRN"; Text[150])
        {

        }
        field(90010; "Original Posting Date"; Date)
        {

        }
        field(90011; "Sell-to Customer Name"; text[150])
        {

        }
        field(90012; "Tax Category"; Code[10])
        {

        }
    }
}
