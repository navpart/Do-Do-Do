page 50329 "Competency Form"
{
    PageType = Card;
    SourceTable = Employee;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Set Target/ Task"; Rec."Set Target/ Task")
                {
                }
                field(Exceeds; Rec.Exceeds)
                {
                }
                field(Meets; Rec.Meets)
                {
                }
                field(Average; Rec.Average)
                {
                }
                field(Below; Rec.Below)
                {
                }
                field(Poor; Rec.Poor)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

