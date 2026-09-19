table 50127 "Holiday Calendar"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Date; Date)
        {

            trigger OnValidate()
            begin
                "Start Date" := Date;
                IF ("End Date" = 0D) OR ("End Date" < Date) THEN
                    "End Date" := Date;

                Duration := FORMAT("End Date" - "Start Date" + 1) + 'D';
            end;
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "End Date" < "Start Date" THEN
                    ERROR('Date not correct!');

                Duration := FORMAT("End Date" - "Start Date" + 1) + 'D';
            end;
        }
        field(6; Duration; Code[10])
        {
            DateFormula = true;

            trigger OnValidate()
            begin
                IF Duration <> '' THEN
                    "End Date" := CALCDATE(Duration + '- 1D', "Start Date");
            end;
        }
        field(7; "User ID"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; Date)
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
        key(Key3; "Start Date")
        {
        }
    }

    fieldgroups
    {
    }

    var
        HolidayCalendar: Record "Holiday Calendar";
}

