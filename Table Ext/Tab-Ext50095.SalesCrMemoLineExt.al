tableextension 50095 "Sales Cr.Memo Line Ext" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50006; Colour; Code[30])
        {
            Editable = true;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(50024; "xVAT Code"; Code[10])
        {
        }
        field(50208; "Chassis Number"; Code[30])
        {
            Editable = false;
        }
        field(50209; "Quantity Demanded"; Decimal)
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
        field(60104; "Inventory Posting Grp."; Code[20])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60105; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Sell-to Customer No.")));
            FieldClass = FlowField;
        }
        field(60115; "Cancellation Reason"; Option)
        {
            OptionCaption = ' ,Invoice Cancellation,Purchase Reversal,Price Difference,Order Duplication,Defective Supply,Technical Issues, Delayed ETA, Others';
            OptionMembers = " ",InvoiceCancellation,PurchaseReversal,PriceDifference,OrderDuplication,DefectiveSupply,TechnicalIssues,DelayedETA,Others;
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
    }
}
