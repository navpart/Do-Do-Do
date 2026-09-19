table 70038 ClockingX
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Job No."; Code[20])
        {
        }
        field(3; "Start."; Boolean)
        {

            trigger OnValidate()
            begin
                IF xRec."Start." = TRUE THEN
                    ERROR(Text001);

                IF "Start." THEN BEGIN
                    "Start Date" := CURRENTDATETIME;
                    "User ID" := USERID;
                END;
            end;
        }
        field(4; "End."; Boolean)
        {

            trigger OnValidate()
            begin
                IF "End." THEN
                    "End Date" := CURRENTDATETIME;

                "Clocked Time" := "End Date" - "Start Date";
            end;
        }
        field(5; "Start Date"; DateTime)
        {
            Editable = false;
        }
        field(6; "End Date"; DateTime)
        {
            Editable = false;
        }
        field(7; "User ID"; Code[30])
        {
            Editable = false;
        }
        field(8; "Clocked Time"; Duration)
        {
            Editable = false;
        }
        field(9; "Technician Name"; Text[50])
        {
        }
        field(10; Technician; Code[20])
        {
            TableRelation = Resource."No." WHERE(Type = CONST(Person));

            trigger OnValidate()
            begin
                IF Resource.GET(Technician) THEN
                    "Technician Name" := Resource.Name
                ELSE
                    "Technician Name" := '';
            end;
        }
        field(11; "DQ ?"; boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Job No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ERROR(DeleteError);
    end;

    var
        DeleteError: Label 'You cannot delete this record!';
        Text001: Label 'You cannot modifiy time!';
        Resource: Record Resource;
}

