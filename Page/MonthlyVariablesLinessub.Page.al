page 50298 "Monthly Variables Lines sub."
{
    PageType = ListPart;
    SourceTable = "Monthly Variables Lines.";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("E/D Code"; Rec."E/D Code")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Lapse Period"; Rec."Lapse Period")
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

