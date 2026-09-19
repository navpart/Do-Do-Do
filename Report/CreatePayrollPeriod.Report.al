report 50044 "Create Payroll Period"
{
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        PeriodCode := 'p1';
    end;

    trigger OnPreReport()
    begin
        PayPeriod."Start Date" := FiscalYearStartDate;
        PayPeriod.TESTFIELD("Start Date");

        IF PayPeriod.FIND('-') THEN BEGIN
            FirstPeriodStartDate := PayPeriod."Start Date";
            // FirstPeriodLocked := PayPeriod."Date Locked";
            /* IF (FiscalYearStartDate < FirstPeriodStartDate) AND FirstPeriodLocked THEN
               IF NOT
                  CONFIRM(
                    'The new fiscal year begins before an existing fiscal year, so the new year will be closed automatically.\\' +
                    'Do you want to create and close the fiscal year?')
               THEN
                 EXIT;
             IF PayPeriod.FIND('+') THEN
               LastPeriodStartDate := PayPeriod."Start Date";
           END;
            ELSE
             IF NOT
                CONFIRM(
                  'Once you create the new fiscal year you cannot change its Start Date.\\' +
                  'Do you want to create the fiscal year?')
             THEN
               EXIT;
            */

            FOR i := 1 TO NoOfPeriods + 1 DO BEGIN
                IF (FiscalYearStartDate <= FirstPeriodStartDate) AND (i = NoOfPeriods + 1) THEN
                    EXIT;

                IF (FirstPeriodStartDate <> 0D) THEN
                    IF (FiscalYearStartDate >= FirstPeriodStartDate) AND (FiscalYearStartDate < LastPeriodStartDate) THEN
                        ERROR('It is only possible to create new fiscal years before or after the existing ones.');
                PayPeriod.INIT;
                dd := DATE2DMY(FiscalYearStartDate, 1);
                mm := DATE2DMY(FiscalYearStartDate, 2);
                yy := DATE2DMY(FiscalYearStartDate, 3);
                IF STRPOS(PeriodLength, 'D') <> 0 THEN
                    ww := dd
                ELSE
                    ww := DATE2DWY(FiscalYearStartDate, 2);
                IF STRPOS(PeriodLength, 'M') <> 0 THEN
                    ww := 0;
                IF mm <= 9 THEN
                    PayPeriod."Period Code" := FORMAT(yy) + '-0' + FORMAT(mm)
                ELSE
                    PayPeriod."Period Code" := FORMAT(yy) + '-' + FORMAT(mm);
                IF (ww > 0) AND (ww <= 9) THEN
                    PayPeriod."Period Code" := PayPeriod."Period Code" + '-0' + FORMAT(ww)
                ELSE
                    IF ww > 9 THEN
                        PayPeriod."Period Code" := PayPeriod."Period Code" + '-' + FORMAT(ww);
                PayPeriod."Start Date" := FiscalYearStartDate;
                PayPeriod."End Date" := CALCDATE(PeriodLength, PayPeriod."Start Date") - 1;
                PayPeriod.VALIDATE("Start Date");
                IF NOT PayPeriod.FIND('=') THEN
                    PayPeriod.INSERT;
                FiscalYearStartDate := CALCDATE(PeriodLength, FiscalYearStartDate);
            END;
        END;

    end;

    var
        PayPeriod: Record 50004;
        NoOfPeriods: Integer;
        PeriodLength: Code[20];
        FiscalYearStartDate: Date;
        FirstPeriodStartDate: Date;
        LastPeriodStartDate: Date;
        FirstPeriodLocked: Boolean;
        i: Integer;
        PeriodCode: Code[10];
        PayPeriod2: Record 50004;
        dd: Integer;
        mm: Integer;
        yy: Integer;
        ww: Integer;
}

