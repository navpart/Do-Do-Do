table 70059 "Online Ordering Allocation"
{
    LinkedObject = false;

    fields
    {
        field(1; "Customer No."; Code[10])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF Customer.GET("Customer No.") THEN
                    "Customer Name" := Customer.Name
                ELSE
                    "Customer Name" := '';
            end;
        }
        field(2; "Item No."; Code[30])
        {
            TableRelation = Item."No." WHERE(Allocated = CONST(true));

            trigger OnValidate()
            begin
                IF Item.GET("Item No.") THEN BEGIN
                    Description := Item.Description;
                    "Unit Price" := Item."Unit Price";
                    "Unit of Measure" := Item."Base Unit of Measure";
                END;

                TESTFIELD("Customer No.");
                Item.SETCURRENTKEY("No.");
                Item.SETRANGE("No.", "Item No.");
                Item.SETFILTER("Location Filter", '%1', "Customer No.");
                IF Item.FINDFIRST THEN BEGIN
                    Item.CALCFIELDS(Item."Net Change");
                    "Allocated Quantity" := Item."Net Change";
                END;
            end;
        }
        field(3; "Discount Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "After Discount Price" := "Unit Price" - "Discount Amount";
            end;
        }
        field(4; "Unit Price"; Decimal)
        {
        }
        field(5; "After Discount Price"; Decimal)
        {
        }
        field(6; "Allocated Quantity"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = true;
        }
        field(7; Description; Text[60])
        {
            Editable = false;
        }
        field(8; "Start Date"; Date)
        {
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; "Unit of Measure"; Code[10])
        {
        }
        field(11; "Customer Name"; Text[50])
        {
            Editable = false;
        }
        field(13; "Requested Quantity"; Decimal)
        {
            CalcFormula = Sum("Online Allocation Line"."Requested Qty." WHERE("Customer No." = FIELD("Customer No."),
                                                                               "Item No." = FIELD("Item No.")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        TESTFIELD("Customer No.");
        Item.SETCURRENTKEY("No.");
        Item.SETRANGE("No.", "Item No.");
        Item.SETFILTER("Location Filter", '%1', "Customer No.");
        IF Item.FINDFIRST THEN BEGIN
            Item.CALCFIELDS(Item."Net Change");
            "Allocated Quantity" := Item."Net Change";
        END;
    end;

    var
        Item: Record 27;
        Customer: Record 18;
}

