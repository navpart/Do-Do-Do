table 50520 "SB Owner Cue2"
{
    Caption = 'SB Owner Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Released Sales Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = filter('Quote'),
                                                      Status = FILTER('Released')));
            Caption = 'Released Sales Quotes';
            FieldClass = FlowField;
        }
        field(3; "Open Sales Orders"; Integer)
        {
            AccessByPermission = TableData 6660 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = filter('Order'),
                                                      Status = FILTER('Open')));
            Caption = 'Open Sales Orders';
            FieldClass = FlowField;
        }
        field(4; "Released Sales Orders"; Integer)
        {
            AccessByPermission = TableData 6660 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = filter('Order'),
                                                      Status = FILTER(Released)));
            Caption = 'Released Sales Orders';
            FieldClass = FlowField;
        }
        field(5; "Released Purchase Orders"; Integer)
        {
            AccessByPermission = TableData 120 = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = filter('Order'),
                                                         Status = FILTER(Released)));
            Caption = 'Released Purchase Orders';
            FieldClass = FlowField;
        }
        field(6; "Overdue Sales Documents"; Integer)
        {
            /* CalcFormula = Count("Cust. Ledger Entry" WHERE ("Document Type"=FILTER('Invoice|Credit Memo'),
                                                            "Due Date"=FIELD("Overdue Date Filter"),
                                                            Open=filter(true)));
            Caption = 'Overdue Sales Documents';
            FieldClass = FlowField; */
        }
        field(7; "SOs Shipped Not Invoiced"; Integer)
        {
            /* AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Completely Shipped=CONST(Yes),
                                                      Invoice=CONST(No)));
            Caption = 'SOs Shipped Not Invoiced';
            FieldClass = FlowField; */
        }
        field(8; "Customers - Blocked"; Integer)
        {
            CalcFormula = Count(Customer WHERE(Blocked = FILTER(<> ' ')));
            Caption = 'Customers - Blocked';
            FieldClass = FlowField;
        }
        field(9; "Purchase Invoices Due Today"; Integer)
        {
            /* CalcFormula = Count("Vendor Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                             Due Date=FIELD(Due Date Filter),
                                                             Open=CONST(Yes)));
            Caption = 'Purchase Invoices Due Today';
            FieldClass = FlowField; */
        }
        field(10; "Vendors - Payment on Hold"; Integer)
        {
            CalcFormula = Count(Vendor WHERE(Blocked = FILTER(Payment)));
            Caption = 'Vendors - Payment on Hold';
            FieldClass = FlowField;
        }
        field(11; "Sales Invoices"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER('Invoice')));
            Caption = 'Sales Invoices';
            FieldClass = FlowField;
        }
        field(12; "Unpaid Sales Invoices"; Integer)
        {
            Caption = 'Unpaid Sales Invoices';
        }
        field(13; "Overdue Sales Invoices"; Integer)
        {
            Caption = 'Overdue Sales Invoices';
        }
        field(14; "Sales Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER('Quote')));
            Caption = 'Sales Quotes';
            FieldClass = FlowField;
        }
        field(20; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(30; "Purchase Invoices"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER('Invoice')));
            Caption = 'Purchase Invoices';
            FieldClass = FlowField;
        }
        field(31; "Unpaid Purchase Invoices"; Integer)
        {
            Caption = 'Unpaid Purchase Invoices';
        }
        field(32; "Overdue Purchase Invoices"; Integer)
        {
            Caption = 'Overdue Purchase Invoices';
        }
        field(50000; "Released Service Quotes"; Integer)
        {
            /* CalcFormula = Count("Service Header" WHERE ("Document Type"=filter('Quote'),
                                                        "Release Status"=FILTER(2)));
            FieldClass = FlowField; */
        }
        field(50001; "Open Service Order"; Integer)
        {
            /* CalcFormula = Count("Service Header" WHERE (Document Type=CONST(Order),
                                                        Release Status=FILTER(Open)));
            FieldClass = FlowField; */
        }
        field(50002; "Overdue Service Documents"; Integer)
        {
            /* CalcFormula = Count("Cust. Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                            Due Date=FIELD(Overdue Date Filter),
                                                            Open=CONST(Yes)));
            Caption = 'Overdue Sales Documents';
            FieldClass = FlowField; */
        }
        field(50003; "SerOs Shipped Not Invoiced"; Integer)
        {
            /* CalcFormula = Count("Service Header" WHERE (Document Type=CONST(Order),
                                                        Completely Shipped=CONST(Yes),
                                                        Job Posting Group=CONST(NO)));
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


    procedure CountSalesOrdersShippedNotInvoiced(): Integer
    var
        CountSalesOrders: Query 9060;
    begin
        CountSalesOrders.SETRANGE(Completely_Shipped, TRUE);
        //CountSalesOrders.SETRANGE(Invoice,FALSE);
        CountSalesOrders.OPEN;
        CountSalesOrders.READ;
        EXIT(CountSalesOrders.Count_Orders);
    end;


    procedure ShowSalesOrdersShippedNotInvoiced()
    var
        SalesHeader: Record 36;
    begin
        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SETRANGE("Completely Shipped", TRUE);
        SalesHeader.SETRANGE(Invoice, FALSE);
        PAGE.RUN(PAGE::"Sales Order List", SalesHeader);
    end;
}

