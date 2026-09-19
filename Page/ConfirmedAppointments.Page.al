page 50159 "Confirmed Appointments."
{
    Editable = false;
    PageType = Card;
    SourceTable = "Service Appointment Scheduled";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Item"; Rec."Service Item")
                {
                }
                field("Service Code"; Rec."Service Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Service Due Projected Date"; Rec."Service Due Projected Date")
                {
                }
                field("Service Date"; Rec."Service Date")
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                    LookupPageID = "Awaiting Payment Confirmations";
                }
                field("Customer Order Form Date"; Rec."Customer Order Form Date")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field("Technician Code"; Rec."Technician Code")
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

    trigger OnOpenPage()
    begin
        Rec.SETRANGE("Appointment Status", Rec."Appointment Status"::Approved);
    end;
}

