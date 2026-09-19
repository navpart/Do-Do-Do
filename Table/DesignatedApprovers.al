table 50156 "Designated Approvers"
{
    Caption = 'Designated Approvers';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; Audit; Code[20])
        {
            Caption = 'Audit';
            TableRelation = "User Setup"."User ID";
        }
        field(3; Finance; Code[20])
        {
            Caption = 'Finance';
            TableRelation = "User Setup"."User ID";
        }
        field(4; Logistics; Code[20])
        {
            Caption = 'Logistics';
            TableRelation = "User Setup"."User ID";
        }
        field(5; IT; Code[20])
        {
            Caption = 'IT';
            TableRelation = "User Setup"."User ID";
        }
        field(6; Marketing; Code[20])
        {
            Caption = 'Marketing';
            TableRelation = "User Setup"."User ID";
        }
        field(20; "Payment Notifications"; text[1024])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Logistics Notifications"; text[1024])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
