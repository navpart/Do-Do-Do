table 50068 "MP Budget Name"
{

    fields
    {
        field(1; Name; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        MPBudgetEntry.SETCURRENTKEY("Budget Name");
        MPBudgetEntry.SETRANGE("Budget Name", Name);
        MPBudgetEntry.DELETEALL;
    end;

    var
        MPBudgetEntry: Record "MP Budget Entry";
}

