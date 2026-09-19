page 90051 "AppointmentPMGRAPI"
{
    PageType = List;
    SourceTable = "Service AppointmentsX";
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
                field(VIN; Rec.VIN)
                {
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Service Due Kilometer"; Rec."Service Due Kilometer")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Call Type"; Rec."Call Type")
                {
                }
                field("Agreed Date"; Rec."Agreed Date")
                {
                }
                field("Agreed Time"; Rec."Agreed Time")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Odometer At Appointment"; Rec."Odometer At Appointment")
                {
                }
                field("Booking Date"; Rec."Booking Date")
                {
                }
                field("Booking Time"; Rec."Booking Time")
                {
                }
                field("Nature of Repair"; Rec."Nature of Repair")
                {
                }
                field("Towing Service Required"; Rec."Towing Service Required")
                {
                }
                field("Other Requests"; Rec."Other Requests")
                {
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                }
                field("Pickup Time"; Rec."Pickup Time")
                {
                }
                field(Picture1; Rec.Picture1)
                {
                }
                field(Picture2; Rec.Picture2)
                {
                }
                field(Picture3; Rec.Picture3)
                {
                }
                field(Picture4; Rec.Picture4)
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Towing Address"; Rec."Towing Address")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Payment Ref."; Rec."Payment Ref.")
                {
                }
                field("Estimate Incl. VAT"; Rec."Estimate Incl. VAT")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Estimate Approved"; Rec."Estimate Approved")
                {
                }
            }
        }
    }

    actions
    {
    }
}

