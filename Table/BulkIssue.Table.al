table 50173 "Bulk Issue"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    InvtSetup.GET;
                    NoSeriesMgt.TestManual(InvtSetup."Bulk Issue");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Item; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                IF ItemRec.GET(Item) THEN
                    Description := ItemRec.Description ELSE
                    Description := '';
            end;
        }
        field(3; Description; Text[50])
        {
            Editable = false;
        }
        field(4; Quantity; Decimal)
        {
        }
        field(5; "Consignment No."; Code[10])
        {
        }
        field(6; "Collected By"; Text[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(7; "Date/Time"; DateTime)
        {
            Editable = false;
        }
        field(8; "No. Series"; Code[10])
        {
        }
        field(9; Issued; Boolean)
        {

            trigger OnValidate()
            begin
                "Date/Time" := CURRENTDATETIME;
            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            InvtSetup.GET;
            InvtSetup.TESTFIELD("Bulk Issue");
            "No. Series" := InvtSetup."Bulk Issue";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
    end;

    var
        ItemRec: Record Item;
        InvtSetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit "No. Series";
}

