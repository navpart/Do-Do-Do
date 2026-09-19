table 50523 "HRPAY Cue"
{
    Caption = 'SB Owner Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Employees-Active"; Integer)
        {
            CalcFormula = Count(Employee WHERE("No." = filter('CODE'),
                                                Status = filter('Active')));
            Caption = 'Employees-Active';
            FieldClass = FlowField;
        }
        field(4; "Employees- Inactive"; Integer)
        {
            CalcFormula = Count(Employee WHERE("No."=FILTER('CODE'),
                                                Status=filter('Inactive')));
            Caption = ' Employees- Inactive';
            FieldClass = FlowField;
        }
        field(6;"Employees-Termination";Integer)
        {
            CalcFormula = Count(Employee WHERE (Status=CONST(Terminated)));
            Caption = 'Employees-Termination';
            FieldClass = FlowField;
        }
        field(14;"Upcoming Leave";Integer)
        {
            Caption = 'Upcoming Leave';
            FieldClass = Normal;
        }
        field(20;"Payroll Dimension";Integer)
        {
            Caption = ' Payroll Dimension';
            Editable = false;
            FieldClass = Normal;
            TableRelation = "Payroll-E/D Codes.";
        }
        field(21;"Paye Setup";Integer)
        {
            Caption = 'Paye Setup';
            FieldClass = Normal;
        }
        field(31;"Transaction Setup";Integer)
        {
            FieldClass = Normal;
        }
        field(32;"Salary Grades";Integer)
        {
            TableRelation = "Payroll-Employee Group Header.";
        }
        field(33;"Bank Structure";Integer)
        {
        }
        field(34;"Payroll Type";Integer)
        {
        }
        field(35;"Posting Group";Integer)
        {
            TableRelation = "Payroll-Employee Group Header.";
        }
        field(36;"Payroll Period";Integer)
        {
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    
    procedure CountSalesOrdersShippedNotInvoiced(): Integer
    var
        CountSalesOrders: Query "Count Sales Orders";
    begin
        CountSalesOrders.SETRANGE(Completely_Shipped,TRUE);
        //CountSalesOrders.SETRANGE(Invoice,FALSE);
        CountSalesOrders.OPEN;
        CountSalesOrders.READ;
        EXIT(CountSalesOrders.Count_Orders);
    end;

    
    procedure ShowSalesOrdersShippedNotInvoiced()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
        SalesHeader.SETRANGE("Completely Shipped",TRUE);
        SalesHeader.SETRANGE(Invoice,FALSE);
        PAGE.RUN(PAGE::"Sales Order List",SalesHeader);
    end;
}

