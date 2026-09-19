page 50436 Dealers
{
    PageType = Card;
    SourceTable = Customer;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(group)
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

