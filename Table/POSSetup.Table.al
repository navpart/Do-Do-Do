table 70044 "POS Setup"
{

    fields
    {
        field(1; "Terminal ID"; Code[20])
        {
        }
        field(2; "Bank No."; Code[10])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                IF BankAccount.GET("Bank No.") THEN
                    "Bank Name" := BankAccount.Name
                ELSE
                    "Bank Name" := '';
            end;
        }
        field(3; "Bank Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Terminal ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount: Record "Bank Account";
}

