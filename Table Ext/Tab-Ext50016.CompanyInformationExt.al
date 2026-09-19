tableextension 50016 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(50200; Companycode; Code[2])
        {
        }
        field(50201; Accounts; Text[30])
        {
            TableRelation = Company;
        }
        field(50202; "VAT Reg. No."; Code[20])
        {
        }
        field(50204; "Internation phone"; Text[20])
        {
        }
        field(50206; Alternates; Text[50])
        {
        }
        field(50207; "Associated with"; Text[60])
        {
        }
        field(50208; "Directors 1"; Text[50])
        {
        }
        field(50209; "Directors 2"; Text[50])
        {
        }
        field(50210; "Directors 3"; Text[50])
        {
        }
        field(50211; "Directors 4"; Text[50])
        {
        }
        field(50212; "Directors 5"; Text[30])
        {
        }
        field(50213; "Directors 6"; Text[30])
        {
        }
        field(50214; "Directors 7"; Text[30])
        {
        }
        field(50215; "Directors 8"; Text[30])
        {
        }
        field(50216; "Directors 9"; Text[30])
        {
        }
        field(50217; "Address 4"; Text[30])
        {
        }
        field(50300; "NSITF Number"; Code[20])
        {
        }
        field(50301; "TIN No."; Code[20])
        {
        }
        field(50302; "VAT No."; Code[20])
        {
        }
        field(50303; Condition; Text[150])
        {
        }
        field(50304; "Alt Comp. Name"; Text[60])
        {
        }
    }
}
