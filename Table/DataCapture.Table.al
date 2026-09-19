table 50123 "Data Capture"
{

    fields
    {
        field(2; "Terminal ID"; Code[20])
        {
            TableRelation = "Terminal Informations";
        }
        field(3; "TnA ID"; Integer)
        {
        }
        field(4; "Attendance Time"; Time)
        {
            Caption = 'Time';
            Editable = false;
        }
        field(5; "Attendance Date"; Date)
        {
            Caption = 'Date';
            Editable = false;
        }
        field(7; "Attendance Date Time"; DateTime)
        {
            Caption = 'Date Time';
            Editable = false;

            trigger OnValidate()
            begin
                "Attendance Date" := DT2DATE("Attendance Date Time");
                "Attendance Time" := DT2TIME("Attendance Date Time");
            end;
        }
        field(8; Name; Text[120])
        {
            CalcFormula = Lookup ("Employee Mapping".Name WHERE ("TnA ID"=FIELD("TnA ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;Processed;Option)
        {
            BlankNumbers = BlankZero;
            OptionMembers = " ",Processed,"Not Used";
        }
    }

    keys
    {
        key(Key1;"Terminal ID","Attendance Date Time","TnA ID")
        {
            Clustered = true;
        }
        key(Key2;"TnA ID")
        {
        }
        key(Key3;"TnA ID","Attendance Date Time")
        {
        }
        key(Key4;"TnA ID","Attendance Time")
        {
        }
        key(Key5;"Attendance Time")
        {
        }
        key(Key6;"TnA ID","Attendance Date")
        {
        }
        key(Key7;"Attendance Date")
        {
        }
        key(Key8;"TnA ID","Attendance Date","Attendance Time")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EntryNo: Integer;
        DataCapture: Record "Data Capture";
}

