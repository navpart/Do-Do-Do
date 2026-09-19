page 50014 "Posting Group Lines."
{
    PageType = List;
    SourceTable = "Payroll-Posting Group Line.";
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
                field("Debit Acc. Type"; Rec."Debit Acc. Type")
                {
                }
                field("Debit Account No."; Rec."Debit Account No.")
                {
                }
                field("Credit Acc. Type"; Rec."Credit Acc. Type")
                {
                }
                field("Credit Account No."; Rec."Credit Account No.")
                {
                }
                field("Transfer Department Code"; Rec."Transfer Department Code")
                {
                }
                field("Transfer Project Code"; Rec."Transfer Project Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

