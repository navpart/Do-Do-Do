tableextension 50059 "Human Resources Ext" extends "Human Resources Setup"
{
    fields
    {
        field(50000; "Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50001; "Overtime Register Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50002; "Overtime Rate Normal"; Decimal)
        {
        }
        field(50003; "Overtime Rate Saturday"; Decimal)
        {
        }
        field(50004; "Overtime Rate Sunday"; Decimal)
        {
        }
        field(50005; "Overtime Rate Public Holiday"; Decimal)
        {
        }
        field(50006; "Other Overtimes Rate"; Decimal)
        {
        }
        field(50007; "Security Overtime Normal Val"; Decimal)
        {
            Description = 'This is Hourly Attracted Value For Security Men Only';
        }
        field(50008; "Security Overtime Saturday Val"; Decimal)
        {
            Description = 'This is Hourly Attracted Value For Security Men Only';
        }
        field(50009; "Security Overtime Sunday Val"; Decimal)
        {
            Description = 'This is Hourly Attracted Value For Security Men Only';
        }
        field(50010; "Security Overtime P. H. Val"; Decimal)
        {
            Description = 'This is Hourly Attracted Value For Security Men Only';
        }
        field(50011; "Security Other Overtime  Val"; Decimal)
        {
            Description = 'This is Hourly Attracted Value For Security Men Only';
        }
        field(50012; "Medical Rec Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50013; "General Overtime E/D"; Code[10])
        {
            Description = 'To store Overtime Payroll Related Code';
            TableRelation = "No. Series";
        }
        field(50014; "Security Overtime E/D"; Code[10])
        {
            Description = 'To store Overtime Payroll Related Code for security men ordinary day';
            TableRelation = "No. Series";
        }
        field(50015; "Security O.T. Sun/P.H"; Code[10])
        {
            Description = 'To store Overtime Payroll Related Code for security men SunDay or Public Holidays';
            TableRelation = "No. Series";
        }
        field(50016; "Leave Plan No"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50017; "Course Attendance No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50018; "Hospital Code"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50019; "Training Company Code"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50020; "Casual Employees No."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50021; "Fuel Voucher No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50022; "Pool Car Nos."; Code[10])
        {
        }
        field(50023; "Allocation No."; Code[10])
        {
        }
        field(50024; "Leave Approval No."; Code[10])
        {
        }
        field(50025; "Motor Show Repair No."; Code[10])
        {
        }
        field(50026; "Work Order No."; Code[10])
        {
        }

    }
}
