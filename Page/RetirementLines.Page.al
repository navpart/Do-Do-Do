page 50221 "Retirement Lines"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "IOU Retirement Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {

                    trigger OnValidate()
                    begin
                        AccountNoOnAfterValidate;
                    end;
                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = AmountEditable;

                    trigger OnValidate()
                    begin
                        Rec.VALIDATE(Amount);
                        AmountOnAfterValidate;
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("IOU No."; Rec."IOU No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IOURetire.GET(Rec."Retirement No.");
        IF (IOURetire."2nd Apprv. Status" = IOURetire."2nd Apprv. Status"::Approved) OR
          (IOURetire."1st Approval to" = 'ADEWUMI') AND (IOURetire."1st Apprv. Status" = IOURetire."1st Apprv. Status"::Approved)
           THEN
            AmountEditable := FALSE;

        IF (IOURetire."2nd Apprv. Status" = IOURetire."2nd Apprv. Status"::Approved) OR
         (IOURetire."1st Approval to" = 'AGBESUA') AND (IOURetire."1st Apprv. Status" = IOURetire."1st Apprv. Status"::Approved)
           THEN
            AmountEditable := FALSE;
    end;

    trigger OnInit()
    begin
        AmountEditable := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        IF IOURetire.GET(Rec."Retirement No.") THEN
            IF IOURetire."IOU No." <> '' THEN BEGIN
                Rec."IOU No." := IOURetire."IOU No.";
            END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IF IOURetire.GET(Rec."Retirement No.") THEN
            IF IOURetire."IOU No." <> '' THEN BEGIN
                Rec."IOU No." := IOURetire."IOU No.";
            END;
    end;

    var
        IOURetire: Record 50107;
        AmountEditable: Boolean;

    local procedure AccountNoOnAfterValidate()
    begin
        CurrPage.UPDATE;
    end;

    local procedure AmountOnAfterValidate()
    begin
        Rec.VALIDATE(Amount);
    end;
}

