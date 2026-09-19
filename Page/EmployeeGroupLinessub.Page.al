page 50300 "Employee Group Lines sub."
{
    PageType = Card;
    SourceTable = "Payroll-Employee Group Lines.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("E/D Code";Rec."E/D Code")
                {
                }
                field("Payslip Text";Rec."Payslip Text")
                {
                }
                field(Quantity;Rec.Quantity)
                {
                }
                field(Rate;Rec.Rate)
                {
                }
                field(Units;Rec.Units)
                {
                }
                field("Default Amount";Rec."Default Amount")
                {
                }
                field("Payment Interval";Rec."Payment Interval")
                {
                }
                field("Monthly Variables";Rec."Monthly Variables")
                {
                }
            }
        }
    }

    actions
    {
    }
}

