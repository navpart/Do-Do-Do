page 70071 "CSI Card"
{
    PageType = Card;
    SourceTable = "CSI Table";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group("CSI Card")
            {
                field("CSI Code"; Rec."CSI Code")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Customer Code"; Rec."Customer Code")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Tel. No."; Rec."Customer Tel. No.")
                {
                }
                field("Service / Repair Date"; Rec."Service / Repair Date")
                {
                }
                field("Vehicle Registeration"; Rec."Vehicle Registeration")
                {
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                }
                field("Contact Person Name"; Rec."Contact Person Name")
                {
                }
                field("Contact Person Tel. No."; Rec."Contact Person Tel. No.")
                {
                }
                field("Impresion of the Service"; Rec."Impresion of the Service")
                {
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                }
                field(Score; Rec.Score)
                {
                }
                field("Total Values Obt"; Rec."Total Values Obt")
                {
                }
                field("Cust. Serv Skill by SA Obt"; Rec."Cust. Serv Skill by SA Obt")
                {
                }
                field("Fix it Right Obt"; Rec."Fix it Right Obt")
                {
                }
                field("Fix it Right Average"; Rec."Fix it Right Average")
                {
                }
            }
            group("Maintenance R. and Appointment")
            {
                field("Dealer Reminded you of Service"; Rec."Dealer Reminded you of Service")
                {
                    Caption = 'Did the Dealer contact you to remind you of your vehicle''s maintenance service or repairs?';
                }
                field("Apptmt Date your Desired Date"; Rec."Apptmt Date your Desired Date")
                {
                    Caption = 'Were you able to get an appointment on the day you desired?';
                }
            }
            group("Dealer Location")
            {
                field("Workshop easy to Locate"; Rec."Workshop easy to Locate")
                {
                    Caption = 'Was the Dealer location convenient for you?';
                }
            }
            group("Appearance of Service Department")
            {
                field("Was the Sevice Facility Clean"; Rec."Was the Sevice Facility Clean")
                {
                    Caption = 'Was the service facility clean?';
                }
            }
            group(Reception)
            {
                field("SA Treat u wt Courtesy/Respect"; Rec."SA Treat u wt Courtesy/Respect")
                {
                    Caption = 'Did the Service Advisor treat you with courtesy and respect ?';
                }
                field("SA aware of Service History"; Rec."SA aware of Service History")
                {
                    Caption = 'Was the Service Advisor aware of your vehicle''s service history ?';
                }
                field("Estimate provided b4 service"; Rec."Estimate provided b4 service")
                {
                    Caption = 'Were you provided with/told about the estimated charges (even where the service was free) before the work was performed ?';
                }
            }
            group("Production (Fix it Right)")
            {
                field("Work Completed correctly 1st T"; Rec."Work Completed correctly 1st T")
                {
                    Caption = 'Was the work requested completed correctly the first time ?';
                }
            }
            group(Delivery)
            {
                field("Vehicle Ready at Promised Time"; Rec."Vehicle Ready at Promised Time")
                {
                    Caption = 'Was your vehicle ready when promised ?';
                }
                field("Service/Repair Cost Reasonable"; Rec."Service/Repair Cost Reasonable")
                {
                    Caption = 'Do you feel the costs charged for servicing or repairing the vehicle were reasonable?';
                }
                field("SA explained work done at  Del"; Rec."SA explained work done at  Del")
                {
                    Caption = 'When you picked up your vehicle, did the Service Advisor explain to you the actual work that was performed ?';
                }
                field("SA Advised  Preventive Measure"; Rec."SA Advised  Preventive Measure")
                {
                    Caption = 'Did the Service Advisor advise you of any issues that may require attention in future or give and indication of the next service interval ?';
                }
            }
            group("Post Service Follow-up")
            {
                field("PSF Satisfaction Confirmation"; Rec."PSF Satisfaction Confirmation")
                {
                    Caption = 'Were you contacted after the service was complete to see if the work was performed to your satisfaction ?';
                }
            }
        }
    }

    actions
    {
    }
}

