table 50138 "Sublet Service"
{
    DataCaptionFields = "Sublet Code", "Sublet Descriptions";
    /*  DrillDownPageID = 50385;
     LookupPageID = 50385;
  */
    fields
    {
        field(1; "Sublet Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Sublet Code" <> xRec."Sublet Code" THEN BEGIN
                    ServiceSetup.GET;
                    NoseriesMgt.TestManual(ServiceSetup."Sublet Code");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Sublet Descriptions"; Text[100])
        {
        }
        field(3; "Standard Duration"; Duration)
        {
        }
        field(4; "Standard Cost"; Decimal)
        {
        }
        field(5; "Standard Price"; Decimal)
        {
        }
        field(6; "Debit Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Account Type" = filter('Posting'),
                                                     "Direct Posting" = filter(true));
        }
        field(7; "No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1; "Sublet Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Sublet Code", "Sublet Descriptions")
        {
        }
    }

    trigger OnInsert()
    begin
        IF "Sublet Code" = '' THEN BEGIN
            ServiceSetup.GET;
            ServiceSetup.TESTFIELD("Sublet Code");
            "No. Series" := ServiceSetup."Sublet Code";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Sublet Code" := NoSeriesMgt.GetNextNo("No. Series");
            // NoseriesMgt.InitSeries(ServiceSetup."Sublet Code", xRec."No. Series", 0D, "Sublet Code", "No. Series");
        END;
    end;

    var
        ServiceSetup: Record 5911;
        NoseriesMgt: Codeunit "No. Series";
        Subletrec: Record 50138;

    procedure AssistEdit(OldSublet: Record 50138): Boolean
    begin
        /* WITH Subletrec DO BEGIN
            Subletrec := Rec;
            ServiceSetup.GET;
            ServiceSetup.TESTFIELD("Sublet Code");
            IF NoseriesMgt.SelectSeries(OldSublet."Sublet Code", OldSublet."No. Series", "No. Series") THEN BEGIN
                ServiceSetup.GET;
                ServiceSetup.TESTFIELD("Sublet Code");
                NoseriesMgt.SetSeries("Sublet Code");
                Rec := Subletrec;
                EXIT(TRUE);
            END;
        END; */
    end;
}

