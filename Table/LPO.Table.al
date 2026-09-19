table 70010 LPO
{

    fields
    {
        field(2; "LPO No."; Code[10])
        {
        }
        field(4; "Vendor Name"; Text[30])
        {
        }
        field(5; Address; Text[50])
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "Vat amount"; Decimal)
        {
        }
        field(8; Vatable; Boolean)
        {

            trigger OnValidate()
            begin
                // IF Vatable = TRUE THEN
                // "Vat amount":= Amount* 0.075;
            end;
        }
        field(10; Description; Text[100])
        {
        }
        field(11; "Purch.Requisition No"; Code[10])
        {
        }
        field(12; "Payment Terms"; Option)
        {
            OptionCaption = ' ,100% after delivery,100% before delivery,90% before delivery,80% before delivery,75% before delivery,70% before delivery,60% before delivery,50% before delivery,40% before delivery,30% before delivery,20% before delivery,10% before delivery';
            OptionMembers = " ","100% after delivery","100% before delivery","90% before delivery","80% before delivery","75% before delivery","70% before delivery","60% before delivery","50% before delivery","40% before delivery","30% before delivery","20% before delivery","10% before delivery";
        }
        field(13; "Vendor No."; Code[10])
        {
        }
        field(14; "Purch.Requisition Date"; Date)
        {
            Editable = false;
        }
        field(30; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(31; "Capex-Opex No."; Code[10])
        {
        }
        field(32; "Voucher Raised"; Boolean)
        {
        }
        field(33; Quantity; Decimal)
        {
        }
        field(34; "Payment term detail"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "LPO No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "LPO No." = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("LPO Nos.");
            "No. Series" := PurchSetup."LPO Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "LPO No." := NoSeriesMgt.GetNextNo("No. Series");
        END;

        "Purch.Requisition Date" := TODAY;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LPO: Record LPO;
}

