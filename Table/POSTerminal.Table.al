table 70020 "POS Terminal"
{

    fields
    {
        field(1; "Device No."; Text[30])
        {
        }
        field(2; "Bank No."; Code[20])
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
        field(4; "Serial No."; Code[10])
        {
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        key(Key1; "Device No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Device No.", "Bank No.", "Bank Name")
        {
        }
    }

    var
        BankAccount: Record 270;
}

