page 50389 "Time & Attendance Setup"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Time & Attendance  Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Temporary File Dir."; Rec."Temporary File Dir.")
                {
                }
                field("Default Terminal ID"; Rec."Default Terminal ID")
                {
                }
                field("Last Date Processed"; Rec."Last Date Processed")
                {
                    Editable = false;
                }
                field("Start Time"; Rec."Start Time")
                {
                }
                field("End Time"; Rec."End Time")
                {
                }
                field("Break Time Start"; Rec."Break Time Start")
                {
                }
                field("Break Time End"; Rec."Break Time End")
                {
                }
            }
        }
    }

    actions
    {
    }
}

