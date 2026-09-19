table 50100 "Dealer Online Req Sub"
{

    fields
    {
        field(1; "Order No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Item No."; Code[20])
        {

            trigger OnLookup()
            begin
                /*  formrec.LOOKUPMODE := TRUE;
                  IF formrec.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    formrec.GETRECORD(Item);
                    VALIDATE("Item No.",Item."No.");
                  END;
                 */

            end;

            trigger OnValidate()
            begin
                IF Item.GET("Item No.") THEN BEGIN
                    "Item Description" := Item.Description;
                    "Unit Price" := Item."Unit Price";
                END;
            end;
        }
        field(4; "Item Description"; Text[50])
        {
        }
        field(5; Quantity; Decimal)
        {
        }
        field(6; "Unit Price"; Decimal)
        {
        }
        field(7; "Total Price"; Decimal)
        {
        }
        field(8; "Quantity Approved"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record 27;
}

