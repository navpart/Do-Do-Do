page 50060 "Leave Categories"
{
    PageType = Card;
    SourceTable = "Leave Categories";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Category Type"; Rec."Category Type")
                {
                }
                field(Consuming; Rec.Consuming)
                {
                }
                field("Payment Allowed"; Rec."Payment Allowed")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

