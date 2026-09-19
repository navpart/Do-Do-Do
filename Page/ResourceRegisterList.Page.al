page 50193 "Resource Register List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Resource Job Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("COF No."; Rec."COF No.")
                {
                }
                field("Job Date"; Rec."Job Date")
                {
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field("Start Time"; Rec."Start Time")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("End Time"; Rec."End Time")
                {
                }
                field("Daily Man Hour"; Rec."Daily Man Hour")
                {
                }
                field("Walk-In"; Rec."Walk-In")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Technician Filter"; Rec."Technician Filter")
                {
                }
                field("Veh Reg No."; Rec."Veh Reg No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

