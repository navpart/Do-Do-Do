table 70045 "BP Worksheet Line"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "No."; Code[20])
        {
            TableRelation = IF (Type = FILTER(Item)) Item."No."
            ELSE
            IF (Type = FILTER(Cost)) "Service Cost".Code;

            trigger OnValidate()
            begin
                CASE Type OF
                    Type::Item:
                        BEGIN
                            IF Item.GET("No.") THEN BEGIN
                                Description := Item.Description;
                                "Unit of Measure" := Item."Base Unit of Measure";
                                "Unit Amount" := Item."Unit Price";

                            END

                            ELSE
                                Description := '';
                        END;
                    Type::Cost:
                        BEGIN
                            IF ServiceCost.GET("No.") THEN
                                Description := ServiceCost.Description
                            ELSE
                                Description := '';
                        END;
                    Type::Resource:
                        BEGIN
                            IF ServiceCost.GET("No.") THEN
                                Description := ServiceCost.Description
                            ELSE
                                Description := '';
                        END;





                END;
            end;
        }
        field(4; Description; Text[70])
        {
        }
        field(5; "Unit of Measure"; Text[10])
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; Type; Option)
        {
            OptionCaption = ' ,Item,Resource,Cost,G/L Account';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";

            trigger OnValidate()
            begin
                VALIDATE(Amount, "Unit Amount" * Quantity);
                "VAT Amount" := Amount * 0.075;
                "Amount Incl.VAT" := Amount + "VAT Amount";

                IF Servrec.Operations = TRUE THEN
                    //"FR Amount" := "Unit Price" * "Duration in Hrs";
                    //"FR VAT Amount" := "FR Amount" * 0.075;
                    //"FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";

                    CASE Type OF
                    Type::Item:
                        BEGIN
                            IF Quantity > 1 THEN BEGIN
                                Amount := Quantity * "Unit Amount";
                                Amount := Quantity * "Unit Amount";
                                //Difference := "Quantity Available" - "Quantity Received";
                                //"Stock Status" := "Stock Status"::Insufficient;
                                "VAT Amount" := Amount * 0.075;
                                "Amount Incl.VAT" := Amount + "VAT Amount";
                            END
                            ELSE
                                IF Quantity < 1 THEN BEGIN
                                    Amount := Quantity * "Unit Amount";
                                    //"Cost Amount" := "Quantity Received" * "Unit Cost";
                                    //Difference := "Quantity Available" - "Quantity Received";
                                    //"Stock Status" := "Stock Status"::Available;
                                    "VAT Amount" := Amount * 0.075;
                                    "Amount Incl.VAT" := Amount + "VAT Amount";
                                END
                                ELSE
                                    IF (Quantity <= 0) AND (Type = Type::Item) THEN BEGIN
                                        Amount := Quantity * "Unit Amount";
                                        //"Cost Amount" := "Quantity Received" * "Unit Cost";
                                        "VAT Amount" := Amount * 0.075;
                                        "Amount Incl.VAT" := Amount + "VAT Amount";
                                        // Difference := "Quantity Available" - "Quantity Received";
                                        //"Stock Status" := "Stock Status"::Insufficient;
                                    END;
                        END;
                    END;

                //"Quantity Outstanding" := "Quantity Requested" - "Quantity Received";
            end;
        }
        field(8; "Unit Amount"; Decimal)
        {
            Editable = false;
        }
        field(9; Amount; Decimal)
        {
            Editable = false;
        }
        field(10; "Amount Incl.VAT"; Decimal)
        {
            Editable = false;
        }
        field(11; "VAT Amount"; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
        ServiceCost: Record "Service Cost";
        Servrec: Record "Service Cost";
}

