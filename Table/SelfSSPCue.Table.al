table 50540 "Self SSP Cue"
{
    Caption = 'Self SSP Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Released Leave Plans"; Integer)
        {
            CalcFormula = Count("Leave Plan Lines Rev 2" WHERE("Employee No." = FILTER('NO.'),
                                                                "Entry Type" = filter('PLAN')));
            Caption = 'Released Leave Plans';
            FieldClass = FlowField;
        }
        field(4; "Leave Due-Today"; Integer)
        {
            CalcFormula = Count("Leave Plan Lines Rev 2" WHERE("Employee No." = filter('NO.'),
                                                                "Total Leaves Due" = filter(10)));
            Caption = ' Leave Due-Today';
            FieldClass = FlowField;
        }
        field(6; "Overdue Resumption"; Integer)
        {
            /*  CalcFormula = Count("Leave Plan Lines Rev 2" WHERE("Employee No." = FILTER('NO.'),
                                                                 "Start Date1" = FILTER(27/08/15),
                                                                 "End Date1"=FILTER(27/08/15)));
             Caption = 'Overdue Resumption';
             FieldClass = FlowField; */
        }
        field(13; "Overdue-Training"; Integer)
        {
            Caption = 'Overdue-Training';
            //FieldClass = FlowField;
        }
        field(14; "Upcoming Leave"; Integer)
        {
            Caption = 'Upcoming Leave';
            //FieldClass = FlowField;
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
        field(30; "Upcoming Trainings"; Integer)
        {
            Caption = 'Upcoming Trainings';
            //FieldClass = FlowField;
        }
        field(31; Hospital; Integer)
        {
            CalcFormula = Sum("Hospital Treatment Costs"."Treatment Cost");
            FieldClass = FlowField;
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

