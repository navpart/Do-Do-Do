page 50063 "Employee Actual Leave"
{
    PageType = Card;
    SaveValues = true;
    SourceTable = "Employee";
    ApplicationArea = All;
    layout
    {
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    var
        AccountingPeriod: Record 50;
        //PeriodFormManagement: Codeunit 359;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        LeaveType: Option Plan,Actual;
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

