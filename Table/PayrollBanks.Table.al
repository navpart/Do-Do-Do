table 50012 "Payroll-Banks."
{
    DataPerCompany = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF (1 < CursorPos) AND (CursorPos < MAXSTRLEN("Search Name")) THEN BEGIN
                    "Search Name" := DELCHR(COPYSTR(Code, CursorPos), '<>');
                    "Search Name" := PADSTR("Search Name" + ' ' + DELCHR(COPYSTR(Code, 1, CursorPos - 1), '<>'), MAXSTRLEN("Search Name"));
                END
                ELSE
                    "Search Name" := Code;
                "Search Name" := DELCHR("Search Name", '<');
            end;
        }
        field(2; "Search Name"; Code[20])
        {
        }
        field(3; "Main Bank Code"; Code[10])
        {
            TableRelation = "Payroll-Banks.".Code;
        }
        field(4; Name; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    fieldgroups
    {
    }

    var
        CursorPos: Integer;
}

