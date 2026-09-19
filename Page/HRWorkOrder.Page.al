page 50441 "HR Work Order"
{
    PageType = Card;
    SourceTable = "HR Work Order";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {
                }
                field("Issued Date"; Rec."Issued Date")
                {
                }
                field(Approval; Rec.Approval)
                {
                }
                field("COF Ref Code"; Rec."COF Ref Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

