page 50352 "Hour Slot"
{
    PageType = Card;
    SourceTable = "Hour Slot";
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
                field("Slot Duration"; Rec."Slot Duration")
                {
                }
                field("Hour Map"; Rec."Hour Map")
                {
                }
                field("Duration Units"; Rec."Duration Units")
                {
                }
            }
        }
    }

    actions
    {
    }
}

