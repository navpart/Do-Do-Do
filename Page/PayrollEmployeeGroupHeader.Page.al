page 50293 "Payroll-Employee Group Header"
{
    PageType = Card;
    SourceTable = "Payroll-Employee Group Header.";
    ApplicationArea = All;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
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
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                }
                field(Grade; Rec.Grade)
                {
                }
                field(Step; Rec.Step)
                {
                }
                field(Management; Rec.Management)
                {
                }
            }
        }
    }

    actions
    {
    }
}

