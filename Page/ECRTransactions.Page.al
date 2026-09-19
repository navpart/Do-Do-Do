page 50171 "ECR Transactions"
{
    PageType = List;
    SourceTable = "ECR Transactions";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Terminal ID"; Rec."Terminal ID")
                {
                }
                field("Response Description"; Rec."Response Description")
                {
                }
                field("Response Code"; Rec."Response Code")
                {
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                }
                field("Masked PAN"; Rec."Masked PAN")
                {
                }
                field("Holder Name"; Rec."Holder Name")
                {
                }
                field("ECR ID"; Rec."ECR ID")
                {
                }
                field("Card Type"; Rec."Card Type")
                {
                }
                field("Card Expiry Date"; Rec."Card Expiry Date")
                {
                }
                field("Approval Code"; Rec."Approval Code")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

