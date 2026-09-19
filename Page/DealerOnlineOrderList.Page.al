page 50158 "Dealer Online Order List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Dealer Online Order Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(control2)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Dealer No."; Rec."Dealer No.")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("Dealer Address"; Rec."Dealer Address")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field("Process date"; Rec."Process date")
                {
                }
                field(Processed; Rec.Processed)
                {
                }
                field(Submit; Rec.Submit)
                {
                }
            }
        }
    }

    actions
    {
    }
}

