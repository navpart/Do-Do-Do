page 50004 "E/D Survey."
{
    Editable = true;
    PageType = List;
    SourceTable = "Payroll-E/D Codes.";
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
                field("Payslip Text"; Rec."Payslip Text")
                {
                }
                field("Payslip appearance"; Rec."Payslip appearance")
                {
                }
                field("Payslip Group ID"; Rec."Payslip Group ID")
                {
                }
                field("Pos. In Payslip Grp."; Rec."Pos. In Payslip Grp.")
                {
                }
                field("Payslip Column"; Rec."Payslip Column")
                {
                }
                field(Compute; Rec.Compute)
                {
                }
                field("Add/Subtract"; Rec."Add/Subtract")
                {
                }
                field("Factor Of"; Rec."Factor Of")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field("Table Look Up"; Rec."Table Look Up")
                {
                }
                field("Edit Amount"; Rec."Edit Amount")
                {
                }
                field("Edit Grp. Amount"; Rec."Edit Grp. Amount")
                {
                }
                field("Yes/No Req."; Rec."Yes/No Req.")
                {
                }
                field("Max. Amount"; Rec."Max. Amount")
                {
                    MaxValue = 99990;
                    MinValue = 0;
                    NotBlank = true;
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                }
                field(Rate; Rec.Rate)
                {
                }
            }
        }
    }

    actions
    {
    }
}

