page 50351 "Appointment Scheduling Card"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Appointment Scheduling";
    ApplicationArea = All;

    layout
    {
    }

    actions
    {
    }

    var
        "Job Time": Boolean;
        HourSlotInfo: Record 50049;
        RESFILTER: Text[50];
        DATEFILTER: Text[50];
        sas: Record 50114;
        ServiceSetRec: Record 5911;

    local procedure CalcManHour(SetColumnFilter: Boolean): Decimal
    begin
    end;
}

