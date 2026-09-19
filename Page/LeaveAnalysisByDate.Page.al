page 50059 "Leave Analysis By Date"
{
    Editable = true;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Employee";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field("Region Filter"; Rec."Region Filter")
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

    actions
    {
    }

    var
        AccountingPeriod: Record 50;
        //PeriodFormManagement: Codeunit 359;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        LeaveType: Option ACTUAL,PLAN;
        ClosingEntryFilter: Option Include,Exclude;
        RoundingFactor: Option "None","1","1000","1000000";
        AmountType: Option "Net Change","Balance At Date";

    local procedure SetDateFilter()
    begin
    end;

    local procedure FormatAmount(var Text: Text[250])
    var
        Amount: Decimal;
    begin
    end;
}

