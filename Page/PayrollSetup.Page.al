page 50030 "Payroll Setup."
{
    PageType = ListPlus;
    SourceTable = "Payroll Setup.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Loan Nos."; Rec."Loan Nos.")
                {
                }
                field("Overtime Nos."; Rec."Overtime Nos.")
                {
                    Caption = 'Overtime Register Nos.';
                }
                field("Staff Loans Control Account"; Rec."Staff Loans Control Account")
                {
                }
                field("Taxfree Pay ED"; Rec."Taxfree Pay ED")
                {
                }
                field("Total Taxable ED"; Rec."Total Taxable ED")
                {
                }
                field("Monthly Working Days"; Rec."Monthly Working Days")
                {
                }
                field("Monthly Working Hours"; Rec."Monthly Working Hours")
                {
                }
                field("Confirm Payslip Deletion"; Rec."Confirm Payslip Deletion")
                {
                }
            }
        }
    }

    actions
    {
    }
}

