page 70181 "Request Card"
{
    SourceTable = "CRM Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("User name"; Rec."User name")
                {
                }
                field("Type of Call"; Rec."Type of Call")
                {

                    trigger OnValidate()
                    begin
                        // IF Enquiry = TRUE THEN
                        //    VisbleEnquiry:= TRUE ELSE
                        //    VisbleEnquiry:= FALSE ;

                        //IF Complaint= TRUE THEN
                        //   VisibleComplaint := TRUE ELSE
                        //   VisibleComplaint := FALSE;
                    end;
                }
            }
            group("Dealer's Details")
            {
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Dealer's Location"; Rec."Dealer's Location")
                {
                }
            }
            group("Customer Details")
            {
                field("Mode of Contact"; Rec."Mode of Contact")
                {
                }
                field(Title; Rec.Title)
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                }
                field("Customer Email"; Rec."Customer Email")
                {
                }
                field("Company Name"; Rec."Company Name")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(City; Rec.City)
                {
                }
            }
            group("Vehicle Details")
            {
                field(Vin; Rec.Vin)
                {
                }
                field("Registration No"; Rec."Registration No")
                {
                }
                field("Mode Type"; Rec."Mode Type")
                {
                }
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Date of delivery"; Rec."Date of delivery")
                {
                }
                field("Date of Purchase"; Rec."Date of Purchase")
                {
                }
                field(Milage; Rec.Milage)
                {
                }
            }
            group(Request)
            {
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Action Taken Request"; Rec."Action Taken Request")
                {
                    Caption = 'Action Taken';
                }
                field("Request Detail"; Rec."Request Detail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

