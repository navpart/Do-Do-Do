namespace Toyota.Toyota;
using Microsoft.Assembly.History;

tableextension 50111 "Pstd Assembly HeadExt" extends "Posted Assembly Header"
{
    fields
    {
        field(50100; "Workflow Stage"; Option)
        {
            Caption = 'Workflow Stage';
            DataClassification = ToBeClassified;
            OptionCaption = 'Marketing,Logistics,Warehouse,"Service VRI",PARTS,"Service SA",Completed';
            optionMembers = Marketing,Logistics,Warehouse,"Service VRI",PARTS,"Service SA",Completed;

        }
        field(50103; "Marketing Comment"; Text[250])
        {
            Caption = 'Marketing Comment';
            DataClassification = ToBeClassified;
        }
        field(50104; "Logistics Comment"; Text[250])
        {
            Caption = 'Logistics Comment';
            DataClassification = ToBeClassified;
        }
        field(50105; "Service Comment"; Text[250])
        {
            Caption = 'Service Comment';
            DataClassification = ToBeClassified;
        }
        field(50106; "Part Comment"; Text[250])
        {
            Caption = 'Part Comment';
            DataClassification = ToBeClassified;
        }
        field(50107; "Total Cost Amount"; Decimal)
        {
            Caption = 'Total Cost Amount';
            DataClassification = ToBeClassified;
        }
        field(50108; "Calculated Unit Cost"; Decimal)
        {
            Caption = 'Calculated Unit Cost';
            DataClassification = ToBeClassified;
        }
    }
}
