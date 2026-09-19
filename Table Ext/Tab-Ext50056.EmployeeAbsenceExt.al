tableextension 50056 "Employee Absence Ext" extends "Employee Absence"
{
    fields
    {
        field(50000;"Region Code";Code[10])
        {
        }
        field(50001;"Deduct from Payroll";Boolean)
        {

            trigger OnValidate()
            begin

                //fieldval := FORMAT((FIELDNO("Deduct from Payroll")));
                //Autority(fieldval);
            end;
        }
        field(50002;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(50003;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(60001;Days;Decimal)
        {
            DecimalPlaces = 0:0;
            MinValue = 0;

            trigger OnValidate()
            begin

                UpdateQuantity
            end;
        }
        field(60002;Hours;Decimal)
        {
            DecimalPlaces = 0:0;
            MaxValue = 8;
            MinValue = 0;

            trigger OnValidate()
            begin

                UpdateQuantity
            end;
        }
        field(60003;Minutes;Decimal)
        {
            DecimalPlaces = 0:0;
            MaxValue = 59;
            MinValue = 0;

            trigger OnValidate()
            begin

                UpdateQuantity
            end;
        }
        field(70000;"Log Date";Date)
        {
        }
        field(70001;"Log Time";Time)
        {
        }
    }
    procedure UpdateQuantity()
    begin

        Quantity := Days * 8 + Hours + Minutes/60;
    end;
}
