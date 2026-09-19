tableextension 50039 "Inventory Setup Ext" extends "Inventory Setup"
{
    fields
    {
        field(50000; "Material Requisition Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50001; "Issues Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Requisition Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50003; "Search Tracker Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50004; "Parts Default Supplier"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(50005; "Cars Default Supplier"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(50006; "Stock Capitalisation No."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50007; "Alloy Rim Requisition Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50008; "Issue Nos Alloy"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50009; "Bulk Issue"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50010; "Exchange Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
