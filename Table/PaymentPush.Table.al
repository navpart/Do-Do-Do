table 70041 "Payment Push"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Temporary Folder"; Text[250])
        {
        }
        field(3; "Webservice Url"; Text[250])
        {
        }
        field(4; "Online Status Url"; Text[250])
        {

        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

