table 50065 "JPM List"
{

    fields
    {
        field(1; "Part No."; Code[50])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; Registered; Boolean)
        {
            CalcFormula = Exist(Item WHERE("No." = FIELD("Part No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; Substitute; Code[50])
        {
        }
        field(5; "Registered Date"; Date)
        {
        }
        field(6; "Substitute Exist"; Boolean)
        {
            CalcFormula = Exist("Item Substitution" WHERE("Substitute No." = FIELD("Part No.")));
            FieldClass = FlowField;
        }
        field(7; "Unit Price(FOB)"; Decimal)
        {
        }
        field(8; "Prod Start"; Code[10])
        {
        }
        field(9; "Prod End"; Code[10])
        {
        }
        field(10; "Dim _Length"; Code[10])
        {
        }
        field(11; "Dim _Width"; Code[10])
        {
        }
        field(12; "Dim _Hieght"; Code[10])
        {
        }
        field(13; "Cubic Volume(CM3)"; Code[10])
        {
        }
        field(14; "Net Wt"; Code[10])
        {
        }
        field(15; "PNC 1"; Code[10])
        {
        }
        field(16; "PNC 2"; Code[10])
        {
        }
        field(17; "Prod Code"; Text[30])
        {
        }
        field(18; "Min Order Units"; Code[10])
        {
        }
        field(19; "Currency Code"; Code[10])
        {
        }
        field(20; "Online Order"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Part No.")
        {
            Clustered = true;
        }
        key(Key2; Substitute)
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemSubst: Record "Item Substitution";
        ItemRec: Record Item;


    procedure CreateSubst()
    begin
        SETCURRENTKEY(Substitute);
        SETRANGE(Registered, TRUE);
        SETFILTER(Substitute, '<>%1', '');
        SETRANGE("Substitute Exist", FALSE);
        IF FIND('-') THEN
            REPEAT
                ItemSubst.INIT;
                ItemSubst.Type := ItemSubst.Type::Item;
                ItemSubst."No." := Substitute;
                ItemSubst."Substitute No." := "Part No.";
                IF ItemSubst.INSERT THEN;
            UNTIL NEXT = 0;
        RESET;
        MESSAGE('Function Completed');
    end;
}

