page 50230 "Retirement Lines List"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "IOU Retirement Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

