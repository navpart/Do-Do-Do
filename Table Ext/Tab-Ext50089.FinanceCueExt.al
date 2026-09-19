tableextension 50089 "Finance Cue Ext" extends "Finance Cue"
{
    fields
    {
        field(50000; "IOUs Req. Pending Approval"; Integer)
        {
            /* CalcFormula = Count("IOU Register" WHERE("1st Apprv. Status" = CONST("on Hold"),
                                                      "2nd Apprv. Status" = CONST("on Hold"),
                                                      "3rd Apprv.Status" = CONST("on Hold"),
                                                      "Final Apprv. Status" = CONST("on Hold"),
                                                      Treated = CONST(false)));
            FieldClass = FlowField; */
        }
        field(50001; "IOUs Retire. Pending Approval"; Integer)
        {
            /* CalcFormula = Count("IOU Retirement Header" WHERE("1st Apprv. Status" = CONST("on Hold"),
                                                               "2nd Apprv. Status" = CONST("on Hold"),
                                                               "3rd Apprv.Status" = CONST("on Hold"),
                                                               "Final Apprv. Status" = CONST("on Hold"),
                                                               Posted = CONST(false)));
            FieldClass = FlowField; */
        }
        field(50002; "IOUs Pending Retirements"; Integer)
        {
            /* CalcFormula = Count("IOU Register" WHERE(Treated = CONST(true),
                                                      Retired = CONST(false)));
            FieldClass = FlowField; */
        }
        field(50003; "Unposted Cash Receipts"; Integer)
        {
            /* CalcFormula = Count("Payment/Receipt." WHERE("Document Type"=CONST(Receipt),
                                                          "Cash/Cheque"=CONST(Cash),
                                                          Posted=CONST(false)));
            FieldClass = FlowField; */
        }
        field(50004; "Unposted Cheque Receipts"; Integer)
        {
            /* CalcFormula = Count("Payment/Receipt." WHERE("Document Type"=CONST(Receipt),
                                                          "Cash/Cheque"=CONST(Cheque),
                                                          Posted=CONST(false)));
            FieldClass = FlowField; */
        }
        field(50005; "Overdue Service Documents"; Integer)
        {
            CalcFormula = Count("Service Ledger Entry" WHERE("Document Type" = FILTER(Invoice | "Credit Memo"),
                                                              Open = CONST(true)));
            FieldClass = FlowField;
        }
        field(50006; "Customer Payments Due-Today"; Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE("Document Type" = FILTER(Invoice),
                                                            "Due Date" = FIELD("Due Date Filter"),
                                                            Open = FILTER(True)));
            FieldClass = FlowField;
        }
        field(50007; "Credit Customer"; Integer)
        {
            CalcFormula = Count(Customer WHERE("MVO Count" = CONST(1)));
            FieldClass = FlowField;
        }
        field(50008; "Shipped- Not Invoiced"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER(Released),
                                                      "Shipped Not Invoiced" = CONST(true)));
            FieldClass = FlowField;
        }
        field(50009; "Partially Shiped"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER(Released),
                                                      "Completely Shipped" = CONST(false)));
            FieldClass = FlowField;
        }
        field(50010; "Serv.Order Pending Approval"; Integer)
        {
            CalcFormula = Count("Service Header" WHERE("Document Type" = CONST(Order),
                                                        Status = FILTER(Pending)));
            FieldClass = FlowField;
        }
        field(50011; "Responsibility Center Filter"; Code[100])
        {
        }
        /* field(50012; "Date Filter"; Date)
        {
        } */
        field(50013; "Approved Service Orders"; Integer)
        {
            CalcFormula = Count("Service Header" WHERE("Document Type" = CONST(Order),
                                                        "Release Status" = FILTER("Released to Ship")));
            FieldClass = FlowField;
        }
    }
}
