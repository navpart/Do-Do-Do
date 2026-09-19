page 90058 "CustomerStatement API"
{
    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

