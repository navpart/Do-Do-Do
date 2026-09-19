table 50129 "Service Adviser Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "10 Days Before"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('N-10')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "3 Days Before"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('N-3')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "2 Days Before"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('N-2')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "1 Day Before"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('N-1')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Parts Ordered"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Parts Ordered')));
            FieldClass = FlowField;
        }
        field(7; "Parts Arrival"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Parts Arrived')));
            Caption = 'Parts Arrived';
            FieldClass = FlowField;
        }
        field(8; "Todays Reception"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Today')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Waiting for Service"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Service')));
            FieldClass = FlowField;
        }
        field(10; "Next Job"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Next Job')));
            FieldClass = FlowField;
        }
        field(11; "Being Serviced"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Being Serviced')));
            FieldClass = FlowField;
        }
        field(12; "Waiting for Inspection"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Inspection')));
            FieldClass = FlowField;
        }
        field(13; "Waiting for Washing"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Washing')));
            FieldClass = FlowField;
        }
        field(14; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(15; "Date Filter2"; Date)
        {
            Caption = 'Date Filter2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(16; "Waiting for Invoicing"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Invoicing')));
            FieldClass = FlowField;
        }
        field(17; "Waiting for Settlement"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Awaiting Delivery')));
            FieldClass = FlowField;
        }
        field(18; "Waiting for Decision"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Settlement')));
            FieldClass = FlowField;
        }
        field(19; "Waiting for Approval"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Decision')));
            FieldClass = FlowField;
        }
        field(20; "Waiting for Parts"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Approval')));
            FieldClass = FlowField;
        }
        field(21; "Waiting for Sublet"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE(Stage = filter('Waiting for Parts')));
            FieldClass = FlowField;
        }
        field(22; "Incoming Appointments"; Integer)
        {
            CalcFormula = Count("Service AppointmentsX" WHERE("Appointment Status" = FILTER(' ')));
            FieldClass = FlowField;
        }
        field(23; "Received Appointments"; Integer)
        {
            CalcFormula = Count("Service AppointmentsX" WHERE("Appointment Status" = filter('Received Appointment'),
                                                               Closed = filter(false)));
            FieldClass = FlowField;
        }
        field(24; Tray; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX");
            FieldClass = FlowField;
        }
        field(25; "PSFU-Open"; Integer)
        {
            CalcFormula = Count("Service IndexX" WHERE(Done = filter(false)));
            FieldClass = FlowField;
        }
        field(26; "PSFU-Treated"; Integer)
        {
            CalcFormula = Count("Service IndexX" WHERE(Done = filter(true),
                                                        "Call Due Date" = FILTER('01/01/23..')));
            FieldClass = FlowField;
        }
        field(27; "Confirmed Appointments"; Integer)
        {
            CalcFormula = Count("Service AppointmentsX" WHERE("Appointment Status" = filter('Confirmed Appointment'),
                                                               Closed = filter(false)));
            FieldClass = FlowField;
        }
        field(28; Delivered; Integer)
        {
        }
        field(29; "Repeat Repair"; Integer)
        {
            CalcFormula = Count("Customer Order HeaderX" WHERE("Repeat Repair" = filter(true)));
            FieldClass = FlowField;
        }
        field(30; "Job Stoppage"; Integer)
        {
            FieldClass = Normal;
        }
        field(31; "Awaiting DAD"; Integer)
        {
        }
        field(32; "Awaiting Estimate"; Integer)
        {
        }
        field(33; "PSFU-Open Today"; Integer)
        {
        }
        field(34; "PSFU-Treated 2023 Above"; Integer)
        {
        }
        field(35; "Awaiting Delivery"; Integer)
        {
        }
        field(36; "Customer Complaint List"; Integer)
        {
            CalcFormula = Count("Complain TableX" WHERE(Resolved = filter(false)));
            FieldClass = FlowField;
        }
        field(37; "Customers with Username"; Integer)
        {
            Caption = 'Online Customers';
            CalcFormula = Count(Customer WHERE(Username = filter(<> '')));
            Editable = false;
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
}

