page 80037 "Open Appointments"
{
    CardPageID = "Appointment Card";
    PageType = List;
    SourceTable = "Service AppointmentsX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appointment No."; Rec."Appointment No.")
                {
                }
                field("Call Type"; Rec."Call Type")
                {
                }
                field("Service Item"; Rec."Service Item")
                {
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Service Due Date"; Rec."Service Due Date")
                {
                }
                field("Agreed Date"; Rec."Agreed Date")
                {
                }
                field("Agreed Time"; Rec."Agreed Time")
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Days Before Due Date"; Rec."Days Before Due Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

