table 50145 "Payment Approval Comment Line"
{
    Caption = 'Approval Comment Line';

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = ' ,General,1st App,2nd App,3rd App,Cashier,Account,Service,Spare Parts,HR,Marketing,Logistics,Audit,Dealer Dev,Dealers';
            OptionMembers = " ",General,"1st App","2nd App","3rd App",Cashier,Account,Service,"Spare Parts",HR,Marketing,Logistics,Audit,"Dealer Dev",Dealers;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Table Name", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    
    procedure SetUpNewLine()
    var
        CommentLine: Record 50145;
    begin
        CommentLine.SETRANGE("Table Name", "Table Name");
        CommentLine.SETRANGE("No.", "No.");
        CommentLine.SETRANGE(Date, WORKDATE);
        IF NOT CommentLine.FIND('-') THEN
            Date := WORKDATE;
    end;
}

