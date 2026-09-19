tableextension 50087 "Warehouse Basic Cue Ext" extends "Warehouse Basic Cue"
{
    fields
    {
         field(50000;"Rel.Transfer Orders- Today";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Status=CONST(Released),
                                                         "Shipment Date"=FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(50001;"Posted Transfer Shpmt- Today";Integer)
        {
            CalcFormula = Count("Transfer Shipment Header" WHERE ("Posting Date"=FIELD("Date Filter2")));
            FieldClass = FlowField;
        }
        field(50002;"Exp. Transfer Orders - Today";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Status=CONST(Released),
                                                         "Receipt Date"=FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(50003;"Posted Transfer Rcpt. - Today";Integer)
        {
            CalcFormula = Count("Transfer Receipt Header" WHERE ("Posting Date"=FIELD("Date Filter2")));
            FieldClass = FlowField;
        }
        field(50004;"Vehicle Delivered";Integer)
        {
            /* CalcFormula = Count("Vehicle Delivery Monitor" WHERE (Delivered=CONST(true)));
            FieldClass = FlowField; */
        }
        field(50005;"Vehicle Pending";Integer)
        {
            /* CalcFormula = Count("Vehicle Delivery Monitor" WHERE ("Transaction Type"=CONST(Pending),
                                                                  Delivered=CONST(false),
                                                                  Open=CONST(true)));
            FieldClass = FlowField; */
        }
        field(50006;"Vehicle Delivery-Overdue";Integer)
        {
            /* CalcFormula = Count("Vehicle Delivery Monitor" WHERE (Overdue=CONST(true)));
            FieldClass = FlowField; */
        }
        field(50007;"Partially  Received";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE ("Shipping Advice"=CONST(Partial),
                                                         "Completely Received"=FILTER(false|true)));
            FieldClass = FlowField;
        }
        field(50008;"Partially Shipped";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE ("Shipping Advice"=CONST(Complete),
                                                         "Completely Shipped"=FILTER(false|true)));
            FieldClass = FlowField;
        }
    }
}
