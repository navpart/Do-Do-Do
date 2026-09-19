tableextension 50057 "Employment Contract Ext" extends "Employment Contract"
{
    fields
    {
        field(50000; "Maximum Approved No."; Integer)
        {
        }
        field(50001; Category; Code[10])
        {
            //TableRelation = "Payroll-Employee Group Header.".Code;

            trigger OnValidate()
            begin

                //IF EmpGrp.GET(Category) THEN
                    //"Category Cost" := EmpGrp."Gross Pay";
            end;
        }
        field(50002; "Category Cost"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                //Sum("Payroll-Employee Group Lines."."Default Amount" WHERE (Employee Group=FIELD(Code)))
            end;
        }
        field(50003; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
        }
        field(50004; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(2));
        }
        field(50005; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50006; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
        }
        field(50007; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(2));
        }
        field(50008; "Budgeted Count"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            /* CalcFormula = Sum("MP Budget Entry"."Employee Count" WHERE(Employee Grp=FIELD(Code),
                                                                        Budget Name=FIELD(Budget Filter),
                                                                        Date=FIELD(Date Filter)));
            DecimalPlaces = 0:0;
            FieldClass = FlowField; */
        }
        field(50010;"Budget Filter";Code[10])
        {
            FieldClass = FlowFilter;
            //TableRelation = "MP Budget Name";
        }
        field(50011;"Business Unit Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(50012;Amount;Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            DecimalPlaces = 0:0;
        }
        field(50013;"Gross Pay";Decimal)
        {
           /*  CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE (Employee Group=FIELD(Category),
                                                                                      ED Category=CONST(Pension Employer)));
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField; */
        }
    }
}
