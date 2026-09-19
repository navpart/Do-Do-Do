table 50073 "Email Users"
{
    Caption = 'Email Users';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; User; Code[20])
        {
            Caption = 'User';
        }
        field(2; "Email"; Text[70])
        {
            Caption = 'Email ';
        }
        field(3; Select; Boolean)
        {
            Caption = 'Select';
        }
    }
    keys
    {
        key(PK; User)
        {
            Clustered = true;
        }
    }
}
