table 50099 "Dealer Online Order Header"
{

    fields
    {
        field(1; "Order No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Order No." <> xRec."Order No." THEN BEGIN
                    GenSetup.GET;
                    NoseriesMgt.TestManual(GenSetup."Dealer Order Request");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Dealer No."; Code[20])
        {

            trigger OnValidate()
            begin

                IF CustRec.GET("Dealer No.") THEN BEGIN
                    "Dealer Name" := CustRec.Name;
                    "Dealer Address" := CustRec.Address;
                END;
            end;
        }
        field(3; "Dealer Name"; Text[50])
        {
        }
        field(4; "Dealer Address"; Text[50])
        {
        }
        field(5; "Transaction Date"; Date)
        {
        }
        field(6; Description; Text[50])
        {
        }
        field(7; "User Id"; Code[20])
        {
        }
        field(8; "No. Series"; Code[10])
        {
        }
        field(9; "Process date"; Date)
        {
        }
        field(10; Processed; Boolean)
        {
        }
        field(11; Submit; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF "Order No." = '' THEN BEGIN
            GenSetup.GET;
            GenSetup.TESTFIELD("Dealer Order Request");
            "No. Series" := GenSetup."Dealer Order Request";
            if NoseriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Order No." := NoseriesMgt.GetNextNo("No. Series");
        END;

        IF UserRec.GET(USERID) THEN BEGIN
            VALIDATE("Dealer No.", UserRec."Dealer Code");
            "Transaction Date" := TODAY;
            "User Id" := USERID;
        END;
    end;

    var
        GenSetup: Record "General Ledger Setup";
        NoseriesMgt: Codeunit "No. Series";
        DealOrd: Record "Dealer Online Order Header";
        CustRec: Record Customer;
        UserRec: Record "User Setup";


    procedure AssistEdit(OldOrd: Record "Dealer Online Order Header"): Boolean
    begin
        /*  WITH DealOrd DO BEGIN
             DealOrd := Rec;
             GenSetup.GET;
             GenSetup.TESTFIELD(GenSetup."Dealer Order Request");
             IF NoseriesMgt.SelectSeries(GenSetup."Dealer Order Request", OldOrd."Order No.", "No. Series") THEN BEGIN
                 GenSetup.GET;
                 GenSetup.TESTFIELD(GenSetup."Dealer Order Request");
                 NoseriesMgt.SetSeries("Order No.");
                 Rec := DealOrd;
                 EXIT(TRUE);
             END;
         END; */
    end;
}

