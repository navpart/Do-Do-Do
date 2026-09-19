table 50137 "Payment Comment Line"
{
    Caption = 'Approval Comment Line';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = false;
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Initial,1st Approval,2nd Approval,3rd Approval,Final Approval,Cashier';
            OptionMembers = Initial,"1st Approval","2nd Approval","3rd Approval","Final Approval",Cashier;
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(5; "User ID"; Code[20])
        {
            Caption = 'User ID';
            Editable = false;
        }
        field(6; "Date and Time"; DateTime)
        {
            Caption = 'Date and Time';
            Editable = false;
        }
        field(7; Comment; Text[100])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Table ID", "Document Type", "Document No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID" := USERID;
        "Date and Time" := CREATEDATETIME(TODAY, TIME);
        IF "Entry No." = 0 THEN
            "Entry No." := GetNextEntryNo;
    end;

    local procedure GetNextEntryNo(): Integer
    var
        ApprovalCommentLine: Record 455;
    begin
        ApprovalCommentLine.SETCURRENTKEY("Entry No.");
        IF ApprovalCommentLine.FIND('+') THEN
            EXIT(ApprovalCommentLine."Entry No." + 1)
        ELSE
            EXIT(1);
    end;
}

