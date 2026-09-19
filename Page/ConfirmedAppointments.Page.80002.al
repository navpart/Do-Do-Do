page 80002 "Confirmed Appointments"
{
    CardPageID = "Appointment Booking Card";
    Editable = false;
    PageType = List;
    SourceTable = "Service AppointmentsX";
    SourceTableView = WHERE("Appointment Status" = CONST("Confirmed Appointment"));
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
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field("Days Before Due Date"; Rec."Days Before Due Date")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field(Appointment; Rec.Appointment)
                {
                }
                field("Walk-In"; Rec."Walk-In")
                {
                }
            }
        }
    }

    actions
    {
    }
}

