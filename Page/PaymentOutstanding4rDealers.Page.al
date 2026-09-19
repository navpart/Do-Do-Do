page 70234 "Payment Outstanding 4r Dealers"
{
    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    SourceTableView = WHERE("Customer Posting Group" = FILTER('TNL_A' | 'TNL_B' | 'TNL_C' | 'TNL_D'),
                            "Posting Date" = FILTER('01/01/22..31/12/22'),
                            "Document Type" = FILTER(Invoice),
                            "Global Dimension 1 Code" = FILTER('05PARTS'),
                            "Remaining Amount" = FILTER('<>0'));
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
                field("Posting Date"; Rec."Posting Date")
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
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
            }
        }
        area(factboxes)
        {
            part("Customer Details"; 9084)
            {
            }
        }
    }

    actions
    {
    }
}

