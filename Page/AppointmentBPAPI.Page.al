page 80052 AppointmentBPAPI
{
    CardPageID = "Next Job";
    PageType = List;
    SourceTable = "EARQ Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field(VIN; Rec.VIN)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Body Color"; Rec."Body Color")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Scheduled Visit Date"; Rec."Scheduled Visit Date")
                {
                }
                field("Scheduled Visit Time"; Rec."Scheduled Visit Time")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Tow Truck Required"; Rec."Tow Truck Required")
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
                field("General Repair Details"; Rec."General Repair Details")
                {
                }
                field(Odometer; Rec.Odometer)
                {
                }
                field("Booking Date"; Rec."Booking Date")
                {
                }
                field("Booking Time"; Rec."Booking Time")
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
                field("Body Work Details"; Rec."Body Work Details")
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field("BP Amount"; Rec."BP Amount")
                {
                }
                field("GR Amount"; Rec."GR Amount")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field("Total Estimate"; Rec."Total Estimate")
                {
                }
                field("Expected Completion Date"; Rec."Expected Completion Date")
                {
                }
                field("Towing Address"; Rec."Towing Address")
                {
                }
                field("Approve Estimate"; Rec."Approve Estimate")
                {
                }
                field("Estimate Approved"; Rec."Estimate Approved")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Payment Ref."; Rec."Payment Ref.")
                {
                }
                field("RO No."; Rec."RO No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

