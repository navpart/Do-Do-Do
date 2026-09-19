table 50111 "Expense Analysis Line Curr. Yr"
{

    fields
    {
        field(1; "G/L Account No."; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; Month; Text[30])
        {
        }
        field(6; Amount; Decimal)
        {

            trigger OnLookup()
            begin
                GLEntry.SETRANGE("G/L Account No.", "G/L Account No.");
                GLEntry.SETFILTER("Posting Date", '%1..%2', "Start Date", "End Date");
                IF PAGE.RUNMODAL(0, GLEntry) = ACTION::LookupOK THEN;
            end;
        }
    }

    keys
    {
        key(Key1; "G/L Account No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLEntry: Record 17;
}

