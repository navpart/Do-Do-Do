page 50008 "Payslip Lines List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Payroll-Payslip Lines.";
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
                field(Units; Rec.Units)
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
                field("Loan ID"; Rec."Loan ID")
                {
                }
                field("Debit Account"; Rec."Debit Account")
                {
                }
                field("Credit Account"; Rec."Credit Account")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        REc."Posting Group" := ActivePostingGroup;
    end;

    trigger OnOpenPage()
    begin
        Rec.FILTERGROUP(10);
        ActivePostingGroup := Rec.GETFILTER("Posting Group");
        Rec.FILTERGROUP(0);
    end;

    var
        ActivePostingGroup: Code[20];
}

