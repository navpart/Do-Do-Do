table 50170 Profitability
{

    fields
    {
        field(1; "No."; Integer)
        {
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(3; Description; Text[70])
        {
        }
        field(4; Units; Decimal)
        {
            CalcFormula = - Sum("Value Entry"."Invoiced Quantity" WHERE("Item No." = FIELD("Item No."),
                                                                        "Posting Date" = FIELD("Date Filter"),
                                                                        "Item Ledger Entry Type" = filter('Sale')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(5; Amount; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE("Item No." = FIELD("Item No."),
                                                                        "Posting Date" = FIELD("Date Filter"),
                                                                        "Item Ledger Entry Type" = filter('Sale')));
            FieldClass = FlowField;
        }
        field(6; Cost; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Item No." = FIELD("Item No."),
                                                                        "Posting Date" = FIELD("Date Filter"),
                                                                        "Item Ledger Entry Type" = filter('Sale')));
            FieldClass = FlowField;
        }
        field(7; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(8; Profit; Decimal)
        {
        }
        field(9; "Profit%"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

