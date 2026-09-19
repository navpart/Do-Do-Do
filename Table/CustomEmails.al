table 50187 "Custom Emails"
{
    Caption = 'Custom Emails';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Finance/Accounts"; Text[100])
        {
            Caption = 'Finance/Accounts';
        }
        field(3; "BNP Email"; Text[100])
        {
            Caption = 'BNP Email';
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
