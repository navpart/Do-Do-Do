page 50294 "E/D Codes."
{
    DataCaptionFields = "E/D Code", "Payslip Text";
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = Card;
    SourceTable = "Payroll-E/D Codes.";
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
                field("Sequence No";Rec."Sequence No")
                {
                }
                field(Prorate;Rec.Prorate)
                {
                    Visible = false;
                }
                field("Allow Posting Group";Rec."Allow Posting Group")
                {
                }
                field("Monthly Variable";Rec."Monthly Variable")
                {
                }
                field("Variable Unit";Rec."Variable Unit")
                {
                }
                field("Loan (Y/N)";Rec."Loan (Y/N)")
                {
                    Visible = false;
                }
                field(Units;Rec.Units)
                {
                }
                field(Rate;Rec.Rate)
                {
                }
                field(Compute;Rec.Compute)
                {
                    DrillDownPageID = "E/D Survey.";
                    LookupPageID = "E/D Survey.";
                }
                field("Add/Subtract";Rec."Add/Subtract")
                {
                }
                field("Factor Of";Rec."Factor Of")
                {
                    DrillDownPageID = "E/D Survey.";
                    LookupPageID = "E/D Survey.";
                }
                field(Percentage;Rec.Percentage)
                {
                }
                field("Table Look Up";Rec."Table Look Up")
                {
                }
                field("Max. Amount";Rec."Max. Amount")
                {
                }
                field("Min. Amount";Rec."Min. Amount")
                {
                }
                field("Rounding Direction";Rec."Rounding Direction")
                {
                }
                field("Rounding Precision";Rec."Rounding Precision")
                {
                }
                field("Edit Amount";Rec."Edit Amount")
                {
                }
                field("Edit Grp. Amount";Rec."Edit Grp. Amount")
                {
                }
                field("Yes/No Req.";Rec."Yes/No Req.")
                {
                }
                field("Reset Next Period";Rec."Reset Next Period")
                {
                }
                field("Search Name";Rec."Search Name")
                {
                }
                field("Payslip appearance";Rec."Payslip appearance")
                {
                }
                field("Payslip Group ID";Rec."Payslip Group ID")
                {
                }
                field("Pos. In Payslip Grp.";Rec."Pos. In Payslip Grp.")
                {
                }
                field("Payslip Column";Rec."Payslip Column")
                {
                }
                field("Underline Amount";Rec."Underline Amount")
                {
                }
                field("Payslip Print Column";Rec."Payslip Print Column")
                {
                }
                field("ED Type";Rec."ED Type")
                {
                }
                field("Control Type";Rec."Control Type")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Amend Payslip Details")
                {
                    Caption = 'Amend Payslip Details';
                    Ellipsis = true;
                    //RunObject = Report 50057;
                }
            }
        }
    }
}

