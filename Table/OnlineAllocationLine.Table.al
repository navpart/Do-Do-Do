table 70060 "Online Allocation Line"
{

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Item No."; Code[20])
        {
            Editable = false;
            TableRelation = Item."No." WHERE(Allocated = CONST(true));
        }
        field(3; "Line No."; Integer)
        {
            Editable = false;
        }
        field(4; "Requested Qty."; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                OrderingAllocHeader.GET("Customer No.", "Item No.");
                OrderingAllocHeader.CALCFIELDS("Requested Quantity");
                OrderingAllocHeader.MODIFY;
            end;
        }
        field(5; "Order No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Item No.", "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        OrderingAllocHeader: Record "Online Ordering Allocation";
        OrderingAllocHeader2: Record "Online Ordering Allocation";
        LineQty: Decimal;
        OnlineAllocationLine: Record "Online Allocation Line";
}

