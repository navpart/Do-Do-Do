table 50149 "Attendance Header"
{

    /*  DrillDownPageID = 50305;
     LookupPageID = 50305; */

    fields
    {
        field(1; "Period Code"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Paysetup.GET;
                IF attenHead.FIND('+') THEN BEGIN
                    "Attendance Date" := attenHead."Attendance Date" + 1;
                    daycode := DATE2DWY("Attendance Date", 1);
                    IF daycode > Paysetup."Working Days Per Week" THEN
                        "Attendance Date" := "Attendance Date" + 1;
                    daycode := DATE2DWY("Attendance Date", 1);
                    IF daycode > Paysetup."Working Days Per Week" THEN
                        "Attendance Date" := "Attendance Date" + 1;
                    IF payPeriod.GET("Period Code") THEN BEGIN
                        //IF ("Attendance Date" < payPeriod."End Date") AND ("Attendance Date" > payPeriod."Start Date") THEN
                        //   "Period Code" := attenHead."Period Code" ;
                        IF ("Attendance Date" > payPeriod."Period End") THEN BEGIN
                            payPeriod.NEXT(1);
                            "Period Code" := payPeriod."Payroll Period";
                        END;
                    END;
                END;
            end;
        }
        field(2; "Attendance Date"; Date)
        {
        }
        field(3; "Total Attendance"; Integer)
        {
            CalcFormula = Count("Attendance Register" WHERE("Attendance Period" = FIELD("Period Code"),
                                                             Date = FIELD("Attendance Date"),
                                                             Status = CONST(Present)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Status filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = Present,Late,Absent;
        }
        field(5; "Total  Absent"; Integer)
        {
            CalcFormula = Count("Attendance Register" WHERE("Attendance Period" = FIELD("Period Code"),
                                                             Date = FIELD("Attendance Date"),
                                                             Status = CONST(Absent),
                                                             "Employee No." = FIELD("Employee filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Employee filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(7; "Free Day"; Boolean)
        {
        }
        field(8; "Free Day Type"; Option)
        {
            OptionMembers = " ","Public Holiday","Sanitation Day","Company Day",Others;
        }
        field(9; Remark; Text[50])
        {
        }
        field(10; "Cost Centre Filter"; Code[250])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            ValidateTableRelation = false;
        }
        field(11; "Department filter"; Code[250])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(Key1; "Attendance Date")
        {
            Clustered = true;
        }
        key(Key2; "Period Code", "Attendance Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        AttenLine.SETCURRENTKEY("Attendance Period", Date);
        AttenLine.SETRANGE(AttenLine.Date, "Attendance Date");
        AttenLine.SETRANGE(AttenLine."Attendance Period");
        IF AttenLine.FIND('-') THEN
            AttenLine.DELETEALL;
    end;

    trigger OnInsert()
    begin
        IF Userrec.GET(USERID) THEN
            "Cost Centre Filter" := Userrec."Global Dimension 1 Code";
    end;

    var
        attenHead: Record "Attendance Header";
        payPeriod: Record "Payroll-Payslip Header.";
        AttenLine: Record "Attendance Register";
        daycode: Integer;
        Paysetup: Record "Payroll Setup.";
        weekend: Boolean;
        Userrec: Record "User Setup";
        Genset: Record "General Ledger Setup";
        RepRec: Record "G/L Entry";
}

