page 50002 "Payroll-Employee Group List"
{
    CardPageID = "Employee Group Header.";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payroll-Employee Group Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                }
                field(Code; Rec.Code)
                {
                }
                field(EmpName; Rec.GetEmpName(Rec.Code))
                {
                    Caption = 'Employee Name';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                }
                field("Tax Charged"; Rec."Tax Charged")
                {
                }
                field("Tax Deducted"; Rec."Tax Deducted")
                {
                }
                field("Taxable Pay"; Rec."Taxable Pay")
                {
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                }
                field("Net Pay Due"; Rec."Net Pay Due")
                {
                }
            }
        }
    }

    actions
    {
    }
}

