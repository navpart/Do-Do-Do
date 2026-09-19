page 50370 "Appointment Scheduling List"
{
    PageType = Card;
    SourceTable = "Appointment Scheduling";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Scheduling Code"; Rec."Scheduling Code")
                {
                }
                field("Schedule Date"; Rec."Schedule Date")
                {
                }
                field("Technician Code"; Rec."Technician Code")
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field("Daily Man Hour"; Rec."Daily Man Hour")
                {
                }
                field("Time Bucket"; Rec."Time Bucket")
                {
                }
                field("Total Hours"; Rec."Total Hours")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Hours Left"; Rec."Hours Left")
                {
                }
                field("No of Jobs"; Rec."No of Jobs")
                {
                }
                field("Job Category"; Rec."Job Category")
                {
                }
                field("Carry Over"; Rec."Carry Over")
                {
                }
                field("Other Info"; Rec."Other Info")
                {
                }
            }
        }
    }

    actions
    {
    }
}

