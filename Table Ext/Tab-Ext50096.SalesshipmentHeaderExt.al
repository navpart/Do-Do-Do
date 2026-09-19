namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

tableextension 50096 "Sales shipment Header Ext" extends "Sales Shipment Header"
{
    fields
    {
        field(50003; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(50154; "Address 3"; Text[30])
        {
        }
        field(50155; "P.O. Box"; Text[30])
        {
        }
        field(50156; "Del. Address 3"; Text[30])
        {
        }
        field(50157; "Del. P.O. Box"; Text[30])
        {
        }
        field(50158; "xP.O. Box"; Text[30])
        {
        }
        field(50159; "xDel. Address 3"; Text[30])
        {
        }
        field(50160; "xDel. P.O. Box"; Text[30])
        {
        }
        field(50171; "User Department"; Code[20])
        {

        }
        field(50174; "1st Approver"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50200; "Invoice No."; Code[20])
        {

        }
        field(50259; "Tracker No."; Code[10])
        {
        }
        field(50262; "Sales Time"; Time)
        {
        }
        field(50263; Posting_Time; DateTime)
        {
        }
        field(50264; "Online Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50268; "Vehicle Order No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60111; "Finance Apprv Status"; Enum "Document Status")
        {
            DataClassification = ToBeClassified;
        }
        field(60112; "Finance Send to"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60113; "Marketing Send To"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60114; "Marketing Apprv Status"; Enum "Document Status")
        {
            DataClassification = ToBeClassified;
        }
        field(60115; "Logistics Send to"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60116; "Logistics Apprv Status"; Enum "Document Status")
        {
            DataClassification = ToBeClassified;
        }
        field(60117; "Logistics Sent Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60118; "Logistics Approved Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60119; "Logistics Approved By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60120; "Logistics Sender"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60122; "Logistic Sent Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60123; "Finance Approved By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60124; "Marketing Sender"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60125; "Marketing Sent Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60126; "Finance Approved Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60127; "Marketing Approved By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60128; "Marketing Approved Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60129; "Retail Cost"; Decimal)
        {

        }
        field(60130; "Original Profit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60131; "Original Profit %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60132; "HOD Logistics Signature"; MediaSet)
        {
            DataClassification = ToBeClassified;
        }
        field(60133; "HOD Finance Signature"; MediaSet)
        {
            DataClassification = ToBeClassified;
        }
        field(60134; "HOD Marketing Signature"; MediaSet)
        {
            DataClassification = ToBeClassified;
        }
        field(60135; "Logistics Send for Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60136; "Customer Preferred Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60138; "Custom Doc. Availability"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60139; "Acknowledged Doc Link"; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
            Editable = true;
        }
        field(60140; "Audit Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(60142; "Security Confirmation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60143; "Security Confirmation by"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60144; "Document Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60148; "Audit Confirmation by"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60149; "Audit Summary"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Satisfactory,Non-Satisfactory';
            OptionMembers = " ",Satisfactory,"Non-Satisfactory";
        }
        field(60150; "Audit Confirmation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }
}
