table 50183 "Vat Input Template Line"
{

    fields
    {
        field(1; "Document No."; Code[50])
        {
            TableRelation = "Vat Input Template"."No.";

            trigger OnValidate()
            begin
                SETFILTER("Document No.",VATOutputTemplate."No.");
                IF VATOutputTemplate.GET(VATOutputTempLine."Document No.") THEN
                  BEGIN
                  IF VATOutputTempLine.FIND('-') THEN
                   REPEAT
                    Linecount := VATOutputTempLine.COUNT;
                    "Input VAT Amount" := (VATOutputTemplate."Sum VAT Amount"/(Linecount)) ;
                    AMOUNT :=  VATOutputTemplate."Sum VAT Amount";
                    VATOutputTempLine.VALIDATE(VATOutputTempLine.AMOUNT);
                   UNTIL VATOutputTempLine.NEXT = 0;

                  END;
            end;
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Chasis No.";Code[50])
        {

            trigger OnValidate()
            begin
                SETFILTER("Document No.",VATOutputTemplate."No.");
                IF VATOutputTemplate.GET(VATOutputTempLine."Document No.") THEN
                  BEGIN
                  IF VATOutputTempLine.FIND('-') THEN
                   REPEAT
                    Linecount := VATOutputTempLine.COUNT;
                    "Input VAT Amount" := (VATOutputTemplate."Sum VAT Amount"/(Linecount)) ;
                    AMOUNT :=  VATOutputTemplate."Sum VAT Amount";

                   UNTIL VATOutputTempLine.NEXT = 0;

                  END;
            end;
        }
        field(4;"Input VAT Amount";Decimal)
        {
        }
        field(5;AMOUNT;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
        key(Key2;"Line No.","Document No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        VATOutputTempLine: Record 50201;
        "LineNo.": Integer;
        VATOutputTemplate: Record 50200;
        Linecount: Decimal;
}

