table 50033 "Dealer Mth. Vehicle Request"
{
    DataCaptionFields = "Customer Name", "Model Name";

    fields
    {
        field(1; "Customer Code"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CusRec.GET("Customer Code") THEN
                    "Customer Name" := CusRec.Name;
            end;
        }
        field(2; "Customer Name"; Text[50])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Model No."; Code[50])
        {
            TableRelation = Model."Model No.";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                IF ModRec.GET("Model No.") THEN
                    "Model Name" := ModRec."Model Name";
            end;
        }
        field(5; "Model Name"; Text[50])
        {
        }
        field(6; Colour; Code[20])
        {
            TableRelation = "Colour Codes"."Colour Code";
            ValidateTableRelation = false;
        }
        field(7; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(8; "Production Month"; Code[10])
        {
            TableRelation = "Production Period"."Period Code";
        }
        field(9; Date; Date)
        {
        }
        field(10; "Seat Options"; Text[50])
        {
        }
        field(11; Transmission; Code[20])
        {
        }
        field(12; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                IF Approved THEN
                    "Approved By." := USERID;
            end;
        }
        field(13; "Approved By."; Code[20])
        {
        }
        field(14; Allocated; Boolean)
        {
        }
        field(15; "Chasis No."; Code[20])
        {
        }
        field(16; "Allocated Quantity"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(17; "Available Quantity"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(18; "Item No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_CARS'));
        }
        field(19; "A/C"; Code[10])
        {
        }
        field(20; "Fuel Type"; Code[10])
        {
        }
        field(21; Body; Code[20])
        {
        }
        field(22; "Colour Description"; Text[50])
        {
        }
        field(23; Type; Code[20])
        {
        }
        field(24; Rim; Code[20])
        {
        }
        field(25; "Total By Item"; Decimal)
        {
            CalcFormula = Sum("Dealer Mth. Vehicle Request".Quantity WHERE("Customer Code" = FIELD("Customer Code"),
                                                                            "Production Month" = FIELD("Production Month"),
                                                                            "Item No." = FIELD("Item No.")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Customer Code", "Production Month", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Quantity, "Allocated Quantity";
        }
        key(Key2; "Customer Code", "Item No.", "Production Month")
        {
            SumIndexFields = Quantity, "Allocated Quantity";
        }
    }

    fieldgroups
    {
    }

    var
        CusRec: Record Customer;
        ModRec: Record Model;
        ItemVariant: Record "Item Variant";
        Allcationtablehead: Record "Vehicle Mth. Allocation Header";
        AllcationtableLine: Record "Vehicle Mth. Allocation Line";
}

