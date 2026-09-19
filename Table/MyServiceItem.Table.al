table 50543 "My Service Item"
{
    Caption = 'My Service Item';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";

        }
        field(2; "No."; Code[20])
        {
            Caption = 'Service No.';
            NotBlank = true;
            TableRelation = "Service Item";
        }
        field(3; Name; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "User ID", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure AddEntities(FilterStr: Text[250])
    var
        Item: Record Item;
    begin
        Item.SETFILTER("No.", FilterStr);
        IF Item.FINDSET THEN
            REPEAT
                "User ID" := USERID;
                "No." := Item."No.";
                IF NOT INSERT THEN;
            UNTIL Item.NEXT = 0;
    end;
}

