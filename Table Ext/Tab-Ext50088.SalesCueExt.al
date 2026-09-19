tableextension 50088 "Sales Cue Ext" extends "Sales Cue"
{
    fields
    {
        field(50000; "Transfer Orders-Open"; Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE(Status = CONST(Open)));
            FieldClass = FlowField;
        }
        field(50001; "Service Orders-Open"; Integer)
        {
            CalcFormula = Count("Service Header" WHERE("Document Type" = CONST(Order),
                                                        Status = CONST(Finished)));
            FieldClass = FlowField;
        }
        field(50002; "Service Quotes-Open"; Integer)
        {
            CalcFormula = Count("Service Header" WHERE("Document Type" = CONST(Quote),
                                                        Status = FILTER(Pending | "On Hold"),
                                                        "Responsibility Center" = FIELD("Responsibility Center Filter")));
            FieldClass = FlowField;
        }
        field(50003; "SOs Pending Approval"; Integer)
        {
            AccessByPermission = TableData 110 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      Status = FILTER("Pending Approval")));
            Caption = 'SOs Pending Approval';
            FieldClass = FlowField;
        }
        field(50004; "Approved Sales Orders"; Integer)
        {
            AccessByPermission = TableData 110 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      Status = FILTER(Released | "Pending Prepayment")));
            Caption = 'Approved Sales Orders';
            FieldClass = FlowField;
        }
        field(50005; "Sales Return Orders - All"; Integer)
        {
            AccessByPermission = TableData 6660 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Return Order")));
            Caption = 'Sales Return Orders - All';
            FieldClass = FlowField;
        }
        field(50006; "Customers - Blocked"; Integer)
        {
            CalcFormula = Count(Customer WHERE(Blocked = FILTER(<> ' ')));
            Caption = 'Customers - Blocked';
            FieldClass = FlowField;
        }
        field(50007; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(50008; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
    }
}
