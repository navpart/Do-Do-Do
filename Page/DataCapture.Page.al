page 50141 "Data Capture"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Data Capture";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(control1)
            {
                field("Terminal ID"; Rec."Terminal ID")
                {
                }
                field("TnA ID"; Rec."TnA ID")
                {
                }
                field("Attendance Time"; Rec."Attendance Time")
                {
                }
                field("Attendance Date"; Rec."Attendance Date")
                {
                }
                field("Attendance Date Time"; Rec."Attendance Date Time")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Processed; Rec.Processed)
                {
                }
            }
        }
    }

    actions
    {
    }
}

