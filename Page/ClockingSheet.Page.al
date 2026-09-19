page 80013 "Clocking Sheet"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "ClockingX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
               
                field("Start."; Rec."Start.")
                {
                }
                field("End."; Rec."End.")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Clocked Time"; Rec."Clocked Time")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = false;
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        TotalTime: Duration;
        Clocking: Record 70038;
}

