page 50437 "Other Customers"
{
    PageType = Card;
    SourceTable = Customer;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

