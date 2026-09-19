tableextension 50037 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "Loss Sales Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Auto Sale Invoice No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50003; "Vehicle Delivery Lapse Period"; DateFormula)
        {
        }
        field(50004; "Warranty Claim No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50005; "Warranty Claim Defaulty Acct."; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(50006; "Customer Order No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007; "Job Instruction No."; Code[20])
        {
        }
        field(50008; "Customer Order No. GN"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50009; "Warranty Materia Refund Acct."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50010; "Warranty Settlement Acct."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50011; "Spare Parts Fixed Cost Markup%"; Decimal)
        {
        }
        field(50012; "SP Fixed Exch. Rate USD"; Decimal)
        {
        }
        field(50013; "SP Fixed Exch. Rate JPY"; Decimal)
        {
        }
        field(50014; "Appointment Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50015; "Estimate Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50016; "SP Fixed Exch. Rate CNY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Repair Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Appointment BP Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "CC Emails"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "SP Fixed Exch. Rate ZAR"; Decimal)
        {
            DataClassification = ToBeClassified;
        }


    }
}
