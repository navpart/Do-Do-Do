page 70532 "Dealer Credit Limit"
{
    PageType = List;
    SourceTable = 18;
    SourceTableView = WHERE("Responsibility Center" = CONST('LA_VEH001'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

