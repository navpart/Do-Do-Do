page 50223 "Deposit List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Deposit Management";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Deposit No."; Rec."Deposit No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Amount Deposited"; Rec."Amount Deposited")
                {
                }
                field("Balance Amount"; Rec."Balance Amount")
                {
                }
                field("Ref. Order No."; Rec."Ref. Order No.")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Cash Confirmation"; Rec."Cash Confirmation")
                {
                }
            }
        }
    }

    actions
    {
    }
}

