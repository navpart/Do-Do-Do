page 70087 "Diagnostic Questionnaire Card."
{
    SourceTable = "Diagnostic Questionnaire";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Toyota Diagnostic Questionnaire")
            {
                Caption = 'Toyota Diagnostic Questionnaire';
                group("Diagnostic Appointment")
                {
                    Caption = 'Diagnostic Appointment';
                    field("Diagnostic Questionnier No."; rec."Diagnostic Questionnier No.")
                    {
                    }
                    field("Customer Order No."; rec."Customer Order No.")
                    {
                    }
                    field("Reception Date"; rec."Reception Date")
                    {
                    }
                    field("Reception Time"; rec."Reception Time")
                    {
                    }
                    field("Reception Type"; rec."Reception Type")
                    {
                    }
                    field("Courtesy Vehicle"; rec."Courtesy Vehicle")
                    {
                    }
                    field("Delivery Type"; rec."Delivery Type")
                    {
                    }
                    field("Delivery Date"; rec."Delivery Date")
                    {
                    }
                    field("Delivery Time"; rec."Delivery Time")
                    {
                    }
                    field("Customer No."; rec."Customer No.")
                    {
                    }
                    field("Customer Name"; rec."Customer Name")
                    {
                    }
                    field(Address; Rec.Address)
                    {
                    }
                    field(Telephone; Rec.Telephone)
                    {
                    }
                }
                group(Control1)
                {
                    Caption = 'Phenomena';
                    field(Phenomena; Rec.Phenomena)
                    {
                        MultiLine = true;
                    }
                }
                group("Contact Information")
                {
                    Caption = 'Contact Information';
                    field("Contact Telephone"; rec."Contact Telephone")
                    {
                    }
                    field("Contact Available Time to"; rec."Contact Available Time to")
                    {
                    }
                    field("Contact Staff Name"; rec."Contact Staff Name")
                    {
                    }
                    field("Contact Date"; rec."Contact Date")
                    {
                    }
                    field("Contact Time"; rec."Contact Time")
                    {
                    }
                    field("Confirmed with Customer"; rec."Confirmed with Customer")
                    {
                    }
                    field("Additional Job Confirmation"; rec."Additional Job Confirmation")
                    {
                    }
                    field(Valuable; Rec.Valuable)
                    {
                    }
                    field("Seat Cover"; rec."Seat Cover")
                    {
                    }
                    field("Floor Mat"; rec."Floor Mat")
                    {
                    }
                    field("Walk-Arround Check"; rec."Walk-Arround Check")
                    {
                    }
                    field("Odometer Reading at Reception"; rec."Odometer Reading at Reception")
                    {
                    }
                    field(Date; Rec.Date)
                    {
                    }
                    field("SA Code"; rec."SA Code")
                    {
                    }
                    field("SA Name"; rec."SA Name")
                    {
                    }
                    field("Confirmation Date"; rec."Confirmation Date")
                    {
                    }
                    field("Confirmation Staff Name"; rec."Confirmation Staff Name")
                    {
                    }
                    field("Vehicle Driven By"; rec."Vehicle Driven By")
                    {
                    }
                    field("Odometer Reading at Appointmen"; rec."Odometer Reading at Appointmen")
                    {
                    }
                    field("Vehicle Registration No."; rec."Vehicle Registration No.")
                    {
                    }
                    field("Registered Date"; rec."Registered Date")
                    {
                    }
                    field("Model Name"; rec."Model Name")
                    {
                    }
                    field("Model Code"; rec."Model Code")
                    {
                    }
                    field("Engine No."; rec."Engine No.")
                    {
                    }
                    field("Model Year"; rec."Model Year")
                    {
                    }
                    field("Chassis No."; rec."Chassis No.")
                    {
                    }
                }
                group("Condition During Occurrence")
                {
                    Caption = 'Condition During Occurrence';
                    field("From When"; rec."From When")
                    {
                    }
                    field("State if Other"; rec."State if Other")
                    {
                    }
                    field(Frequency; Rec.Frequency)
                    {
                    }
                    field("State Other Frequency"; rec."State Other Frequency")
                    {
                    }
                    field(Place; Rec.Place)
                    {
                    }
                    field("Warning Lamp"; rec."Warning Lamp")
                    {
                    }
                    field(Starting; Rec.Starting)
                    {
                    }
                    field("If Moving"; rec."If Moving")
                    {
                    }
                    field(Stopped; Rec.Stopped)
                    {
                    }
                    field(Speedmeter; Rec.Speedmeter)
                    {
                    }
                    field(Tachometer; Rec.Tachometer)
                    {
                    }
                    field(Advancing; Rec.Advancing)
                    {
                    }
                    field("Shifting Gear"; rec."Shifting Gear")
                    {
                    }
                    field("Backing Up"; rec."Backing Up")
                    {
                    }
                    field(Bracking; Rec.Bracking)
                    {
                    }
                    field("Number of Occupants"; rec."Number of Occupants")
                    {
                    }
                    field("Vehicle Load"; rec."Vehicle Load")
                    {
                    }
                    field("Towing Load"; rec."Towing Load")
                    {
                    }
                    field(Surface; Rec.Surface)
                    {
                    }
                    field("If Other Surface (State)"; rec."If Other Surface (State)")
                    {
                    }
                    field(Weather; Rec.Weather)
                    {
                    }
                    field("A/C Temp Setting"; rec."A/C Temp Setting")
                    {
                    }
                    field("Fan Speed Setting"; rec."Fan Speed Setting")
                    {
                    }
                    field("Recir. Position"; rec."Recir. Position")
                    {
                    }
                    field("Air Flow Mode"; rec."Air Flow Mode")
                    {
                    }
                    field("Condition Staff Name"; rec."Condition Staff Name")
                    {
                    }
                    field("Condition Date"; rec."Condition Date")
                    {
                    }
                    field("Condition Time"; rec."Condition Time")
                    {
                    }
                }
            }
            part(Lines; 50359)
            {
                Caption = 'Lines';
            }
            group(Diagnosis)
            {
                Caption = 'Diagnosis';
                field("Key Assined No."; rec."Key Assined No.")
                {
                }
                field("Stall No."; rec."Stall No.")
                {
                }
                field("Inspection Detaile/Result"; rec."Inspection Detaile/Result")
                {
                }
                field("Result Discovered/Prediction"; rec."Result Discovered/Prediction")
                {
                }
                field("If Prediction"; rec."If Prediction")
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("In Charge"; rec."In Charge")
                {
                }
                field("Receiving Status"; rec."Receiving Status")
                {
                }
                field("Receiving Status Date"; rec."Receiving Status Date")
                {
                }
                field("Receiving Status Time"; rec."Receiving Status Time")
                {
                }
                field(Reappearance; Rec.Reappearance)
                {
                }
                field("Start Date"; rec."Start Date")
                {
                }
                field("Start Time"; rec."Start Time")
                {
                }
                field("End Date"; rec."End Date")
                {
                }
                field("End Time"; rec."End Time")
                {
                }
                field("Time Required"; rec."Time Required")
                {
                }
                field(DTR; Rec.DTR)
                {
                }
                field("Confirmed By"; rec."Confirmed By")
                {
                }
                field("Confirmed Date"; rec."Confirmed Date")
                {
                }
                field("Confirmed Time"; rec."Confirmed Time")
                {
                }
                field("Job Instruction Staff Name"; rec."Job Instruction Staff Name")
                {
                }
                field("Vehicle Status"; rec."Vehicle Status")
                {
                }
                field(Requests; Rec.Requests)
                {
                }
                field("If Requests is Other Pls State"; rec."If Requests is Other Pls State")
                {
                }
                field("Support Request Date"; rec."Support Request Date")
                {
                }
                field("Support Request Time"; rec."Support Request Time")
                {
                }
                field("Support Staff Name"; rec."Support Staff Name")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print Diagnostic Questionaire")
            {
                Caption = 'Print Diagnostic Questionaire';
                Image = "Report";

                trigger OnAction()
                begin
                    DiagRec.SETRANGE(DiagRec."Diagnostic Questionnier No.", Rec."Diagnostic Questionnier No.");
                    IF DiagRec.FIND('-') THEN
                        REPORT.RUNMODAL(50331, TRUE, TRUE, DiagRec);
                end;
            }
        }
    }

    var
        DiagRec: Record 50120;
}

