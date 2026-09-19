page 70041 "Payroll Setup List"
{
    CardPageID = "Payroll Setup";
    PageType = List;
    SourceTable = "Payroll Setup.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan Nos."; Rec."Loan Nos.")
                {
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                }
                field("Overtime Nos."; Rec."Overtime Nos.")
                {
                }
                field("Lost Hours Rate"; Rec."Lost Hours Rate")
                {
                }
                field("Commission ED"; Rec."Commission ED")
                {
                }
                field("Monthly Working Days"; Rec."Monthly Working Days")
                {
                }
                field("Productivity Bonus"; Rec."Productivity Bonus")
                {
                }
                field("Productivity Bonus ED"; Rec."Productivity Bonus ED")
                {
                }
                field("Monthly Working Hours"; Rec."Monthly Working Hours")
                {
                }
                field("Total Taxable ED"; Rec."Total Taxable ED")
                {
                }
                field("Confirm Payslip Deletion"; Rec."Confirm Payslip Deletion")
                {
                }
                field("Open Payroll Period"; Rec."Open Payroll Period")
                {
                }
                field("Primary Key"; Rec."Primary Key")
                {
                }
                field("Working Days Per Week"; Rec."Working Days Per Week")
                {
                }
            }
        }
    }

    actions
    {
    }
}

