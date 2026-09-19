table 70031 "Fault Setup HeaderX"
{
    LookupPageID = "Fault Material Setup Lookup";
    DrillDownPageId = "Fault Material Setup List";

    fields
    {
        field(1; "Operation Code"; Code[20])
        {

        }
        field(2; Description; Text[50])
        {
        }
        field(3; Symptoms; Code[20])
        {
            TableRelation = "Symptom Code".Code;
        }
        field(4; "Faulty Area"; Code[20])
        {
            TableRelation = "Fault Area".Code;
        }
        field(5; "Model No."; Code[20])
        {
        }
        field(6; "Model Name"; Code[30])
        {
        }
        field(7; "Material Cost"; Decimal)
        {
        }
        field(8; "Labor Cost"; Decimal)
        {
        }
        field(9; Price; Decimal)
        {
        }
        field(10; Labour; Decimal)
        {
        }
        field(11; "Other Services Cost"; Decimal)
        {
        }
        field(12; "Other Services Price"; Decimal)
        {
        }
        field(13; "Duration In Days"; DateFormula)
        {
        }
        field(14; "Duration In Hours"; Decimal)
        {
        }
        field(15; "No. Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(16; "Service KM"; Integer)
        {
        }
        field(17; Estimate; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Total Price" WHERE("Operation code" = FIELD("Operation Code"), "Model No." = FIELD("Model No.")));
            FieldClass = FlowField;
        }
        field(18; VAT; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."VAT Amount" WHERE("Operation code" = FIELD("Operation Code"), "Model No." = FIELD("Model No.")));
            FieldClass = FlowField;
        }
        field(19; "Estimate Incl. VAT"; Decimal)
        {
            CalcFormula = Sum("Fault Setup Line"."Price Incl VAT" WHERE("Operation code" = FIELD("Operation Code"), "Model No." = FIELD("Model No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Operation Code", "Model No.")
        {
            Clustered = true;
        }
        key(Key2; Symptoms, "Faulty Area")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        faultmaterial.SETRANGE(faultmaterial."Operation code", "Operation Code");
        IF faultmaterial.FIND('-') THEN
            faultmaterial.DELETEALL;
    end;

    trigger OnInsert()
    begin
        /* IF "Operation Code" = '' THEN BEGIN
            SerSetup.GET;
            SerSetup.TESTFIELD(SerSetup."Fault Code No.s");
            NoSeriesMgt.InitSeries(SerSetup."Fault Code No.s", xRec."No. Series", 0D, "Operation Code", "No. Series");
        END; */
    end;

    var
        faultmaterial: Record "Fault Setup LineX";
        SerSetup: Record "Service Mgt. Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Faultrec: Record "Fault Setup HeaderX";

    procedure AssistEdit(Oldfault: Record "Fault Setup Header"): Boolean
    begin
        /*  WITH Faultrec DO BEGIN
             Faultrec := Rec;
             SerSetup.GET;
             SerSetup.TESTFIELD("Fault Code No.s");
             IF NoSeriesMgt.SelectSeries(SerSetup."Fault Code No.s", Oldfault."No. Series", "No. Series") THEN BEGIN
                 SerSetup.GET;
                 SerSetup.TESTFIELD("Fault Code No.s");
                 NoSeriesMgt.SetSeries("Operation Code");
                 Rec := Faultrec;
                 EXIT(TRUE);
             END;
         END; */
    end;
}

