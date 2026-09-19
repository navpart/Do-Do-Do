page 50027 "Monthly Variables Lines."
{
    CardPageID = "Monthly Var. Header Survey.";
    PageType = List;
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
                field(Quantity; Rec.Quantity)
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Variable Unit"; Rec."Variable Unit")
                {
                }
                field("Payslip Text"; Rec."Payslip Text")
                {
                }
            }
        }
    }

    actions
    {
    }
}

