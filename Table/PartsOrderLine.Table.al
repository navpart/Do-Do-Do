table 70063 "Parts Order Line"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Line; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Part Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", Line)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

