table 50024 "Online Dealer Order"
{

    fields
    {
        field(1; "Refrence No."; Code[20])
        {
        }
        field(2; "Dealer Code"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Dealer Name"; Text[50])
        {
        }
        field(4; "Part No."; Code[20])
        {
            TableRelation = Item."No.";
            ValidateTableRelation = false;
        }
        field(5; "Part Description"; Text[50])
        {
        }
        field(6; "Required Q'ty"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(7; "Q'ty Supply"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(8; "Supply Category"; Option)
        {
            OptionCaption = 'A,B,C,D,E';
            OptionMembers = A,B,C,D,E;
        }
        field(9; Branch; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(10; Remarks; Text[50])
        {
        }
        field(11; "Order No."; Code[20])
        {
        }
        field(12; Process; Boolean)
        {
        }
        field(13; "Tracker No."; Code[20])
        {
        }
        field(14; "Request Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Refrence No.", "Part No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SearchRec: Record "Parts Enquiry";
        OnLineRec: Record "Online Dealer Order";
        RefCode: Code[20];
        "EntryNo.": Integer;
        seachcode: Code[20];

    procedure GenTrack()
    begin
        OnLineRec.SETRANGE(OnLineRec."Refrence No.", "Refrence No.");
        OnLineRec.SETRANGE(OnLineRec.Process, TRUE);
        OnLineRec.SETRANGE(OnLineRec."Tracker No.", '');
        IF OnLineRec.FIND('-') THEN
            REPEAT
                SearchRec.INIT;
                SearchRec."Request Date" := "Request Date";
                SearchRec.VALIDATE(SearchRec."Part No", OnLineRec."Part No.");
                SearchRec.VALIDATE(SearchRec."Request by", OnLineRec."Dealer Code");
                SearchRec.VALIDATE(SearchRec."Quantity Demanded", OnLineRec."Required Q'ty");
                SearchRec.VALIDATE(SearchRec."Quantity Supplied", OnLineRec."Q'ty Supply");
                SearchRec."Reference No." := OnLineRec."Refrence No.";
                IF RefCode <> OnLineRec."Refrence No." THEN
                    SearchRec.INSERT(TRUE)
                ELSE BEGIN
                    SearchRec."Entry No" := "EntryNo." + 1000;
                    SearchRec."Search Code" := seachcode;
                    SearchRec.INSERT;
                END;
                OnLineRec."Tracker No." := SearchRec."Search Code";
                RefCode := OnLineRec."Refrence No.";
                "EntryNo." := SearchRec."Entry No";
                seachcode := SearchRec."Search Code";
                OnLineRec.MODIFY;
            UNTIL OnLineRec.NEXT = 0;
    end;
}

