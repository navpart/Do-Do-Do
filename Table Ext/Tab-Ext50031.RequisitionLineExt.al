tableextension 50031 "Requisition Line Ext" extends "Requisition Line"
{
    fields
    {
       field(50000;"Qty. Requested";Decimal)
        {
        }
        field(50001;"Count";Integer)
        {
            CalcFormula = Count("Requisition Line");
            FieldClass = FlowField;
        }
        field(50009;"COF No.";Code[20])
        {
            /*
            TableRelation = "Customer Order Table."."Customer Order Form No.";

            trigger OnValidate()
            begin
                IF COFRec.GET("COF No.") THEN BEGIN
                  "Reg. No." := COFRec."Vehicle Registration No.";
                  "Engine No." := COFRec."(Engine No)";
                  "Chassis No." := COFRec."Frame No./VIN";
                  "Model No." := COFRec."Model No";
                  "Model Year" := COFRec."Model Year";
                END;
            end;
            */
        }
        field(50010;"Reg. No.";Code[20])
        {
        }
        field(50011;EDA;Date)
        {
        }
        field(50012;ETA;Time)
        {
        }
        field(50013;Updated;Boolean)
        {
        }
        field(50014;"Engine No.";Code[20])
        {
        }
        field(50015;"Chassis No.";Code[20])
        {
        }
        field(50016;"Model No.";Code[20])
        {
        }
        field(50017;"Model Year";Integer)
        {
        }
        field(50018;"PR Raised";Boolean)
        {
        }
        field(50019;"Model Name";Text[30])
        {
        }
        field(50020;"For Subcontract";Boolean)
        {
        }
        field(50025;"Customer Class";Option)
        {
            OptionCaption = ' ,Customer Paid,Internal,Warranty';
            OptionMembers = " ","Customer Paid",Internal,Warranty;
        }
    }
    var
    // COFRec: Record ;
}
