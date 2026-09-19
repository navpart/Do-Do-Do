table 50036 "Dealer Request Process header"
{
    DataCaptionFields = "Customer No.", "Request Period";

    fields
    {
        field(1; "Request Period"; Code[10])
        {
            TableRelation = "Production Period"."Period Code";
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CusRec.GET("Customer No.") THEN
                    "Customer Name" := CusRec.Name;
            end;
        }
        field(3; "Customer Name"; Text[50])
        {
        }
        field(4; "Process Date"; Date)
        {
        }
        field(5; "Process Time"; Time)
        {
        }
        field(6; "Total Quantity Requested"; Decimal)
        {
            CalcFormula = Sum("Dealer Mth. Vehicle Request".Quantity WHERE("Customer Code" = FIELD("Customer No."),
                                                                            "Production Month" = FIELD("Request Period")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(7; "Total Quantity Allocated"; Decimal)
        {
            CalcFormula = Sum("Dealer Mth. Vehicle Request"."Allocated Quantity" WHERE("Customer Code" = FIELD("Customer No."),
                                                                                        "Production Month" = FIELD("Request Period")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Request Period", "Customer No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CusRec: Record Customer;
}

