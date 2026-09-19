table 50300 "Payment-Receipts Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Posted Cash Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(Yes)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(3; "Posted Cheque Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Posted=CONST(Yes)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(4; "Pending Cash Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(5; "Pending Cheque Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Posted=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(6; "Cancelled Cash Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cash),
                                                          Cancled=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(7; "Cancelled Cheque Requisition"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Requisition),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Cancled=CONST(Yes)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(8; "Pending Cash Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(9; "Pending Cheque Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(No)));
            FieldClass = FlowField; */
        }
        field(10; "Posted Cash Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(Yes),
                                                          Cancled=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(11; "Posted Cheque Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Posted=CONST(Yes),
                                                          Cancled=CONST(No)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(12; "Cancelled Cash Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cash),
                                                          Cancled=CONST(Yes)));
            FieldClass = FlowField; */
        }
        field(13; "Cancelled Cheque Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Cancled=CONST(Yes)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50003; "Unposted Cash Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cash),
                                                          Posted=CONST(No)));
            FieldClass = FlowField; */
        }
        field(50004; "Unposted Cheque Receipts"; Integer)
        {
            /* CalcFormula = Count ("Payment/Receipt." WHERE (Document Type=CONST(Receipt),
                                                          Cash/Cheque=CONST(Cheque),
                                                          Posted=CONST(No)));
            FieldClass = FlowField; */
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

