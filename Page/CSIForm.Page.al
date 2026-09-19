page 70094 "CSI Form"
{
    SourceTable = "CSI Table";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group("CSI Card Page")
            {
                Caption = 'CSI Card Page';
                group("CSI Code1")
                {
                    Caption = 'CSI Code';
                    field("CSI Code"; Rec."CSI Code")
                    {
                    }
                }
                group("Dealer Details")
                {
                    Caption = 'Dealer Details';
                    field("Dealer Code"; Rec."Dealer Code")
                    {
                    }
                    field("Dealer Name"; Rec."Dealer Name")
                    {
                    }
                }
                group("Customer Details")
                {
                    Caption = 'Customer Details';
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
                }
                group("Vehicle Details")
                {
                    Caption = 'Vehicle Details';
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
                }
                group(Summary)
                {
                    Caption = 'Summary';
                    field("Interviewer Name"; Rec."Interviewer Name")
                    {
                    }
                    field("Date Of Interview"; Rec."Date Of Interview")
                    {
                    }
                    field(Score; Rec.Score)
                    {
                    }
                    field("Total Values"; Rec."Total Values")
                    {
                    }
                    field("Customer Care Skill by SA"; Rec."Customer Care Skill by SA")
                    {
                    }
                    field("Fix it Right"; Rec."Fix it Right")
                    {
                    }
                }
                group("Maintenance Reminder and Appointment")
                {
                    Caption = 'Maintenance Reminder and Appointment';
                    field("Dealer Reminded you of Service"; Rec."Dealer Reminded you of Service")
                    {
                        Caption = '1. Did the Dealer contact you to remind you of your vehicle''s maintenance service or repairs ?';
                    }
                    field("Apptmt Date your Desired Date"; Rec."Apptmt Date your Desired Date")
                    {
                        Caption = '2. Were you able to get an appointment on the day you desired ?';
                    }
                }
                group("Dealer Location")
                {
                    Caption = 'Dealer Location';
                    field("Workshop easy to Locate"; Rec."Workshop easy to Locate")
                    {
                        Caption = '3. Was the Dealer location convenient for you ?';
                    }
                }
                group("Appearance of Service Department")
                {
                    Caption = 'Appearance of Service Department';
                    field("Was the Sevice Facility Clean"; Rec."Was the Sevice Facility Clean")
                    {
                        Caption = '4. Was the Sevice Facility Clean?';
                    }
                }
                group(Reception)
                {
                    Caption = 'Reception';
                    field("SA Treat u wt Courtesy/Respect"; Rec."SA Treat u wt Courtesy/Respect")
                    {
                        Caption = '5. Did the Service Advisor treat you with courtesy and respect ?';
                    }
                    field("SA aware of Service History"; Rec."SA aware of Service History")
                    {
                        Caption = '6. Was the Service Advisor aware of your vehicle''s service history ?';
                    }
                    field("Estimate provided b4 service"; Rec."Estimate provided b4 service")
                    {
                        Caption = '7. Were you provided with/told about the estimated charges (even where the service was free) before the work was performed ?';
                    }
                }
                group("Production (Fix It Right)")
                {
                    Caption = 'Production (Fix It Right)';
                    field("Work Completed first Time"; Rec."Work Completed first Time")
                    {
                        Caption = '8. Was the work requested completed correctly first time?';
                    }
                }
                group(Delivery)
                {
                    Caption = 'Delivery';
                    field("Vehicle Ready at Promised Time"; Rec."Vehicle Ready at Promised Time")
                    {
                        Caption = '9. Was your vehicle ready when promised ?';
                    }
                    field("Service/Repair Cost Reasonable"; Rec."Service/Repair Cost Reasonable")
                    {
                        Caption = '10. Do you feel the costs charged for servicing or repairing the vehicle were reasonable ?';
                    }
                    field("SA explained work done at  Del"; Rec."SA explained work done at  Del")
                    {
                        Caption = '11. When you picked up your vehicle, did the Service Advisor explain to you the actual work that was performed ?';
                    }
                    field("SA Advised  Preventive Measure"; Rec."SA Advised  Preventive Measure")
                    {
                        Caption = '12. Did the Service Advisor advise you of any issues that may require attention in future or give and indication of the next service interval ?';
                    }
                }
                group("Post Service Follow-up")
                {
                    Caption = 'Post Service Follow-up';
                    field("PSF Satisfaction Confirmation"; Rec."PSF Satisfaction Confirmation")
                    {
                        Caption = '13. Were you contacted after the service was complete to see if the work was performed to your satisfaction ?';
                    }
                }
            }
        }
    }

    actions
    {
    }
}

