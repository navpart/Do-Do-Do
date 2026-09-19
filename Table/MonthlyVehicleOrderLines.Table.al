table 50027 "Monthly Vehicle Order Lines"
{

    fields
    {
        field(1; "Period Starting"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
        }
        field(2; "PO Number"; Code[20])
        {
        }
        field(3; "Model No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_CARS'));

            trigger OnValidate()
            begin

                IF ItemRec.GET("Model No.") THEN BEGIN
                    VALIDATE("Model Category", ItemRec."Item Category Code");
                    //VALIDATE("Model Group Code", ItemRec."Product Group Code");
                END;

                IF GetItem THEN BEGIN
                    "Unit Cost" := ItemRec."Unit Price";
                    "Indirect Cost%" := ItemRec."Indirect Cost %";
                END;
            end;
        }
        field(4; "Line No."; Integer)
        {
        }
        field(5; "Model Group Code"; Code[10])
        {
            Editable = false;
        }
        field(6; "Model Category"; Code[10])
        {
            Editable = false;
        }
        field(7; "Colour Group"; Option)
        {
            OptionMembers = Colour,Black,Mettallic,Standard,Mica;
        }
        field(8; Colour; Code[30])
        {
            TableRelation = "Colour Codes"."Colour Code" WHERE("Product Group Code" = FIELD("Model Group Code"));

            trigger OnValidate()
            begin
                COMMIT;
                IF ColourRec.GET("Model Group Code", Colour) THEN BEGIN
                    "Colour Description" := ColourRec.Description;
                END
                ELSE BEGIN
                    "Colour Description" := '';
                END
            end;
        }
        field(9; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; "Colour Description"; Text[30])
        {
            Editable = false;
        }
        field(11; Customer; Code[20])
        {
            TableRelation = IF (Purchaser = filter('DLF_A')) Customer."No." WHERE("Gen. Bus. Posting Group" = CONST('DLF_A'))
            ELSE
            IF (Purchaser = filter('DLF_B')) Customer."No." WHERE("Gen. Bus. Posting Group" = CONST('TNL_B'))
            ELSE
            IF (Purchaser = filter('OTHERS')) Customer."No." WHERE("Customer Posting Group" = FILTER('<>STAFF'), "Gen. Bus. Posting Group" = FILTER('<>TNL_A&<>TNL_B'));

            trigger OnValidate()
            begin
                //TESTFIELD(Customer);

                IF CustRec.GET(Customer) THEN "Customer Gen Bus Posting Group" := CustRec."Gen. Bus. Posting Group";
            end;
        }
        field(12; "Customer Gen Bus Posting Group"; Code[10])
        {
            Editable = false;
        }
        field(13; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(14; Purchaser; Option)
        {
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(20; "Variant Exists"; Boolean)
        {
            CalcFormula = Exist("Item Variant" WHERE("MVO Period" = FIELD("Period Starting"),
                                                      "MVO PO Number" = FIELD("PO Number"),
                                                      "Item No." = FIELD("Model No."),
                                                      "MVO Line No" = FIELD("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "SKU Exists"; Boolean)
        {
            CalcFormula = Exist("Stockkeeping Unit" WHERE("PO Number" = FIELD("PO Number"),
                                                           "Item No." = FIELD("Model No."),
                                                           Colour = FIELD(Colour)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; Variants; Code[10])
        {
            CalcFormula = Lookup("Item Variant".Code WHERE("MVO Period" = FIELD("Period Starting"),
                                                            "MVO PO Number" = FIELD("PO Number"),
                                                            "Item No." = FIELD("Model No."),
                                                            "MVO Line No" = FIELD("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; SKUs; Code[20])
        {
            CalcFormula = Lookup("Stockkeeping Unit"."Item No." WHERE("PO Number" = FIELD("PO Number"),
                                                                       "Item No." = FIELD("Model No."),
                                                                       Colour = FIELD(Colour)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Key Nos."; Code[30])
        {
            CalcFormula = Lookup("Stockkeeping Unit"."Key Number" WHERE("PO Number" = FIELD("PO Number"),
                                                                         "Item No." = FIELD("Model No."),
                                                                         Colour = FIELD(Colour)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Item Description"; Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Model No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Unit Cost"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(101; "Indirect Cost%"; Decimal)
        {
            DecimalPlaces = 15 : 15;
        }
        field(102; "Unit Price (LCY)"; Decimal)
        {
        }
        field(103; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Period Starting", "PO Number", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key2; "Customer Gen Bus Posting Group")
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key3; Customer, "Model No.", Colour, "Model Category", "Model Group Code", "PO Number")
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key4; "PO Number", "Period Starting", Customer, "Model No.")
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key5; "PO Number", "Model No.", Colour, Customer)
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key6; "Location Code")
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key7; Purchaser, Customer, "PO Number", "Model No.")
        {
            SumIndexFields = Quantity, "Unit Cost", "Unit Price (LCY)";
        }
        key(Key8; "Period Starting", "PO Number", "Model No.", Colour)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        IF MVOHdr.GET("Period Starting", "PO Number") THEN BEGIN
            MVOHdr.CALCFIELDS(MVOHdr."Posted Invoice No.");
            IF MVOHdr."Posted Invoice No." <> '' THEN ERROR('You CANNOT Delete a Posted MVO!');
        END;
    end;

    trigger OnModify()
    begin

        IF MVOHdr.GET("Period Starting", "PO Number") THEN BEGIN
            MVOHdr.CALCFIELDS(MVOHdr."Posted Invoice No.");
            IF MVOHdr."Posted Invoice No." <> '' THEN ERROR('You CANNOT Modify a Posted MVO!');
        END;
    end;

    var
        MVOLines: Record "Monthly Vehicle Order Lines";
        ColourRec: Record "Colour Codes";
        ItemRec: Record Item;
        CustRec: Record Customer;
        MVOHdr: Record "Monthly Vehicle Order";

    local procedure GetItem(): Boolean
    begin
        TESTFIELD("Model No.");

        IF ItemRec.GET("Model No.") THEN
            EXIT(TRUE)
        ELSE
            EXIT(FALSE);
    end;
}

