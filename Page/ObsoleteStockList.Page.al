page 50035 "Obsolete Stock List"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Poss Data";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                }
                field("Order Type - A"; Rec."Order Type - A")
                {
                }
                field("Distribution Code"; Rec."Distribution Code")
                {
                }
                field("Package Type"; Rec."Package Type")
                {
                }
                field(Urgent; Rec.Urgent)
                {
                }
                field("Part No. Ordered"; Rec."Part No. Ordered")
                {
                }
                field(Tarriff; Rec.Tarriff)
                {
                }
                field(TKB; Rec.TKB)
                {
                }
            }
        }
    }

    actions
    {
    }
}

