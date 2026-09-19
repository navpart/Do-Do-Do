page 50061 "Leave Codes"
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
                field(Consuming; Rec.Consuming)
                {
                }
                field("Payment Allowed"; Rec."Payment Allowed")
                {
                }
                field("Category Type"; Rec."Category Type")
                {
                }
                field("Default Duration"; Rec."Default Duration")
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

