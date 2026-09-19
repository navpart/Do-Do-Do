tableextension 50060 "Item Variant Ext" extends "Item Variant"
{
    fields
    {
         field(50001; "Item Group Code"; Code[10])
        {
        }
        field(50005; Colour; Code[30])
        {
            //TableRelation = "Colour Codes"."Colour Code" WHERE (Product Group Code=FIELD(Item Group Code));

            trigger OnValidate()
            begin

              /*   IF SKU.GET(Loc,"Item No.",Code) THEN
                  BEGIN
                      SKU."Colour Group" := "Colour Group";
                      SKU.Colour := Colour;
                      SKU.MODIFY;
                  END; */
            end;
        }
        field(50006;"A/C";Boolean)
        {
        }
        field(50007;"Colour Group";Option)
        {
            OptionMembers = Colour,Black,Mettallic,Standard,Mica;

            trigger OnValidate()
            begin

               /*  IF SKU.GET(Loc,"Item No.",Code) THEN
                  BEGIN
                      SKU."Colour Group" := "Colour Group";
                      SKU.Colour := Colour;
                      SKU.MODIFY;
                  END; */
            end;
        }
        field(50008;"Item Category";Code[10])
        {
        }
        field(50009;"Genereated From MVO";Boolean)
        {
        }
        field(50010;"MVO Period";Date)
        {
        }
        field(50011;"MVO PO Number";Code[20])
        {
        }
        field(50012;"MVO Line No";Integer)
        {
        }
        field(50013;"Engine No.";Code[20])
        {
           /*  CalcFormula = Lookup("Stockkeeping Unit"."Engine Number" WHERE (Variant Code=FIELD(Code),
                                                                            Item No.=FIELD(Item No.)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50014;"Chassis No.";Code[20])
        {
            /* CalcFormula = Lookup("Stockkeeping Unit"."Chassis Number" WHERE (Variant Code=FIELD(Code),
                                                                             Item No.=FIELD(Item No.)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50015;"Colour Description";Text[30])
        {
            /* CalcFormula = Lookup("Colour Codes".Description WHERE (Product Group Code=FIELD(Item Group Code),
                                                                   Colour Code=FIELD(Colour)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50016;"Key No.";Code[20])
        {
            /* CalcFormula = Lookup("Stockkeeping Unit"."Key Number" WHERE (Variant Code=FIELD(Code),
                                                                         Item No.=FIELD(Item No.)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50020;Inventory;Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE ("Item No."=FIELD("Item No."),
                                                                  "Variant Code"=FIELD(Code)));
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021;"Is Product ok";Boolean)
        {
            InitValue = true;
        }
        field(50022;Dented;Boolean)
        {
        }
        field(50023;Reserved;Boolean)
        {
        }
        field(50024;Allocated;Boolean)
        {
           /*  CalcFormula = Exist("Vehicle Mth. Allocation Line" WHERE (Item No.=FIELD(Item No.),
                                                                      Variant=FIELD(Code)));
            Editable = false;
            FieldClass = FlowField; */
        }
    }
}
