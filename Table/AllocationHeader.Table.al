table 70062 "Allocation Header"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No." WHERE(Allocated = CONST(true));

            trigger OnValidate()
            begin
                IF Item.GET("Item No.") THEN
                    "Item Description" := Item.Description
                ELSE
                    "Item Description" := '';
            end;
        }
        field(3; "Total Allocated Quantity"; Decimal)
        {
            CalcFormula = Sum("Allocation Test Line"."Allocation Quantity" WHERE("Item No." = FIELD("Item No."),
                                                                                  "Document No." = FIELD(Code)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                IF "Total Allocated Quantity" >= "Total Available Quantity" THEN
                    MESSAGE('Wrong allocation quantity, please review!');
            end;
        }
        field(4; "Total Available Quantity"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."), "Location Code" = FILTER('123ORE|129IKO|113LEK|CONSIGNMEN|EXIBITION')));
            FieldClass = FlowField;
        }
        field(5; "Item Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
}

