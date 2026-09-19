table 50018 "Payroll Setup."
{

    fields
    {
        field(1; "Loan Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(2; "Employee Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(3; "Overtime Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(4; "OT Rate Ordinary Jnr"; Decimal)
        {
            BlankZero = true;
        }
        field(5; "OT Rate Special Jnr"; Decimal)
        {
            BlankZero = true;
        }
        field(6; "OT Rate Ordinary Grd3"; Decimal)
        {
            BlankZero = true;
        }
        field(7; "OT Rate Special Grd3"; Decimal)
        {
            BlankZero = true;
        }
        field(8; "OT Rate Ordinary Grd2"; Decimal)
        {
            BlankZero = true;
        }
        field(9; "OT Rate Special Grd2"; Decimal)
        {
            BlankZero = true;
        }
        field(10; "OT ED Ordinary Jnr"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(11; "OT ED Special Jnr"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(12; "OT ED Ordinary Grd3"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(13; "OT ED Special Grd3"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(14; "OT ED Ordinary Grd2"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(15; "OT ED Special Grd2"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(16; "Staff Loans Control Account"; Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(17;"Taxfree Pay ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(18;"Night Shift ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(19;"Day Shift ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(20;"Night Shift Rate";Decimal)
        {
            BlankZero = true;
        }
        field(21;"Day Shift Rate";Decimal)
        {
            BlankZero = true;
        }
        field(22;"Lost Hours ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(23;"Lost Hours Rate";Decimal)
        {
            BlankZero = true;
        }
        field(24;"Commission ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(25;"Monthly Working Days";Integer)
        {

            trigger OnValidate()
            begin
                "Monthly Working Hours" := "Monthly Working Days" * 8;
            end;
        }
        field(26;"Productivity Bonus";Decimal)
        {
        }
        field(27;"Productivity Bonus ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(28;"Monthly Working Hours";Integer)
        {
            Editable = false;
        }
        field(29;"Total Taxable ED";Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(100;"Confirm Payslip Deletion";Boolean)
        {
        }
        field(103;"Open Payroll Period";Code[20])
        {
            TableRelation = "Payroll-Periods.";
        }
        field(50000;"Primary Key";Code[10])
        {
            Description = 'This is the primary key';
        }
        field(50001;"Working Days Per Week";Integer)
        {
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
}

