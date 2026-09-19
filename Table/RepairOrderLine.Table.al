table 90041 "Repair Order Line"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Item,Resource,Cost,G/L Account';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";
        }
        field(4; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Type = FILTER(Item)) Item."No."
            ELSE IF (Type = FILTER(Resource)) Resource."No."
            ELSE IF (Type = FILTER(Cost)) "Service Cost".Code;

            trigger OnValidate()
            begin
                CASE Type OF
                    Type::Item:
                        BEGIN
                            item.GET("No.");
                            Description := item.Description;
                            "Unit Price" := item."Unit Price";
                            "Line Amount" := Quantity * item."Unit Price";
                            VAT := "Line Amount" * 0.075;
                            "Amount Inc. VAT" := "Line Amount" + VAT;
                        END;
                    Type::Resource:
                        BEGIN
                            Res.GET("No.");
                            Description := Res.Name;
                            "Unit Price" := Res."Unit Price";
                        END;
                    Type::Cost:
                        BEGIN
                            ServCost.GET("No.");
                            Description := ServCost.Description;
                            "Unit Price" := ServCost."Default Unit Price";
                        END;
                END;
            end;
        }
        field(5; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                VALIDATE("Line Amount", "Unit Price" * Quantity);
                VAT := "Line Amount" * 0.075;
                "Amount Inc. VAT" := "Line Amount" + VAT;
            end;
        }
        field(7; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Line Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; VAT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Amount Inc. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Job Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'BP,GR';
            OptionMembers = BP,GR;
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
        ServCost: Record 5905;
        Res: Record 156;
        item: Record 27;
}

