tableextension 50038 "Purchases & Payables Setup Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; BeingPaymentText; Text[250])
        {
        }
        field(50001; PayToText; Text[80])
        {
        }
        field(50002; "Cheque No"; Text[30])
        {
        }
        field(50003; Bank; Text[30])
        {
        }
        field(50004; "Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50005; "Emergency Req. Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50006; "Default Parts Vendor"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50007; "Sublet Order No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50008; "Opex Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50009; "Requisition No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50010; "Audit Dept. Approvers"; Text[100])
        {
        }
        field(50011; "CC Audit Dept. Approvers"; Text[100])
        {
            
        }
        field(50012; "Account Dept. Approvers"; Text[100])
        {
        }
        field(50013; "CC Account Dept. Approvers"; Text[100])
        {
        }
        field(50014; "MD's e-mail"; Text[100])
        {
        }
        field(50015; "GM's e-mail"; Text[100])
        {
        }
        field(50016; "Capex Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50017; "LPO Nos."; Code[10])
        {
        }
        field(50018; "Complaint No"; Code[10])
        {
        }
        field(50019; "LPP Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50020; "Change Mangment No"; Code[10])
        {
        }
        field(50021; "Takata Customer"; Code[10])
        {
        }
        field(50022; "FM Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
    }
}
