page 80044 "Diagnostic Questionnaire Card"
{
    SourceTable = "Diagnostic QuestionnaireX";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group("Diagnostic Appointment")
            {
                group("1. Reception")
                {
                    field("Reception Date"; Rec."Reception Date")
                    {
                        Caption = 'Date';
                    }
                    field("Reception Time"; Rec."Reception Time")
                    {
                        Caption = 'Time';
                    }
                    field("Reception Type"; Rec."Reception Type")
                    {
                    }
                    field("Courtesy Vehicle"; Rec."Courtesy Vehicle")
                    {
                    }
                }
                group("2. Delivery")
                {
                    field("Delivery Type"; Rec."Delivery Type")
                    {
                    }
                    field("Delivery Date"; Rec."Delivery Date")
                    {
                    }
                    field("Delivery Time"; Rec."Delivery Time")
                    {
                    }
                }
                group("3. Customer Information")
                {
                    field("Customer No."; Rec."Customer No.")
                    {
                    }
                    field("Customer Name"; Rec."Customer Name")
                    {
                    }
                    field(Address; Rec.Address)
                    {
                    }
                    field(Telephone; Rec.Telephone)
                    {
                    }
                    field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                    {
                    }
                    field("Registered Date"; Rec."Registered Date")
                    {
                    }
                    field("Model Name"; Rec."Model Name")
                    {
                    }
                    field("Model Code"; Rec."Model Code")
                    {
                    }
                    field("Engine No."; Rec."Engine No.")
                    {
                    }
                    field("Model Year"; Rec."Model Year")
                    {
                    }
                    field("Chassis No."; Rec."Chassis No.")
                    {
                    }
                }
                group("4. Phenomena")
                {
                    field(Phenomena; Rec.Phenomena)
                    {
                        MultiLine = true;
                    }
                }
                group("5. Condition During Occurrence")
                {
                    field("From When"; Rec."From When")
                    {
                    }
                    field("State if Other"; Rec."State if Other")
                    {
                    }
                    field(Frequency; Rec.Frequency)
                    {
                    }
                    field("State Other Frequency"; Rec."State Other Frequency")
                    {
                    }
                    field(Place; Rec.Place)
                    {
                    }
                    field("Warning Lamp"; Rec."Warning Lamp")
                    {
                    }
                    field("If Starting"; Rec."If Starting")
                    {
                    }
                    field("If Moving"; Rec."If Moving")
                    {
                    }
                    field("If Stopped"; Rec."If Stopped")
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
                    field("Shifting Gear"; Rec."Shifting Gear")
                    {
                    }
                    field("Backing Up"; Rec."Backing Up")
                    {
                    }
                    field(Bracking; Rec.Bracking)
                    {
                    }
                    field("Number of Occupants"; Rec."Number of Occupants")
                    {
                    }
                    field("Vehicle Load"; Rec."Vehicle Load")
                    {
                    }
                    field("Towing Load"; Rec."Towing Load")
                    {
                    }
                    field(Surface; Rec.Surface)
                    {
                    }
                    field("If Other Surface (State)"; Rec."If Other Surface (State)")
                    {
                    }
                    field(Weather; Rec.Weather)
                    {
                    }
                    field("Outside Tempt."; Rec."Outside Tempt.")
                    {
                    }
                    field("A/C Temp Setting"; Rec."A/C Temp Setting")
                    {
                    }
                    field("Fan Speed Setting"; Rec."Fan Speed Setting")
                    {
                    }
                    field("Recir. Position"; Rec."Recir. Position")
                    {
                    }
                    field("Air Flow Mode"; Rec."Air Flow Mode")
                    {
                    }
                    field("Condition Staff Name"; Rec."Condition Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                    field("Condition Date"; Rec."Condition Date")
                    {
                        Caption = 'Date';
                    }
                    field("Condition Time"; Rec."Condition Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("6. Contact Information")
                {
                    field("Contact Telephone"; Rec."Contact Telephone")
                    {
                        Caption = 'Telephone No.';
                    }
                    field("Contact Available Time to"; Rec."Contact Available Time to")
                    {
                        Caption = 'Available Time to';
                    }
                    field("Contact Staff Name"; Rec."Contact Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                    field("Contact Date"; Rec."Contact Date")
                    {
                        Caption = 'Date';
                    }
                    field("Contact Time"; Rec."Contact Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("7. Walk-around Check")
                {
                    field("Confirmed with Customer"; Rec."Confirmed with Customer")
                    {
                    }
                    field("Additional Job Confirmation"; Rec."Additional Job Confirmation")
                    {
                    }
                    field(Valuable; Rec.Valuable)
                    {
                    }
                    field("Seat Cover"; Rec."Seat Cover")
                    {
                    }
                    field("Floor Mat"; Rec."Floor Mat")
                    {
                    }
                    field("Walk-Arround Check"; Rec."Walk-Arround Check")
                    {
                    }
                    field("Odometer Reading at Reception"; Rec."Odometer Reading at Reception")
                    {
                    }
                    field("Confirmation Staff Name"; Rec."Confirmation Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                    field("Confirmation Date"; Rec."Confirmation Date")
                    {
                        Caption = 'Date';
                    }
                    field("Vehicle Driven By"; Rec."Vehicle Driven By")
                    {
                    }
                    field("Vehicle Driven by Name"; Rec."Vehicle Driven by Name")
                    {
                    }
                }
            }
            group(Diagnosis)
            {
                field("Inspection Details/Result"; Rec."Inspection Details/Result")
                {
                    MultiLine = true;
                }
                field("Result Discovered/Prediction"; Rec."Result Discovered/Prediction")
                {
                    MultiLine = true;
                }
                field("Main Cause"; Rec."Main Cause")
                {
                    MultiLine = true;
                }
                field("Key Assined No."; Rec."Key Assined No.")
                {
                }
                field("Stall No."; Rec."Stall No.")
                {
                }
                field(Reappearance; Rec.Reappearance)
                {
                }
                group("1.")
                {
                    field(DTC1; Rec.DTC1)
                    {
                    }
                    field(Status1; Rec.Status1)
                    {
                    }
                    field("Freeze Frame Data Saved1"; Rec."Freeze Frame Data Saved1")
                    {
                    }
                }
                group("2.")
                {
                    field(DTC2; Rec.DTC2)
                    {
                    }
                    field(Status2; Rec.Status2)
                    {
                    }
                    field("Freeze Frame Data Saved2"; Rec."Freeze Frame Data Saved2")
                    {
                    }
                }
                group("3.")
                {
                    field(DTC3; Rec.DTC3)
                    {
                    }
                    field(Status3; Rec.Status3)
                    {
                    }
                    field("Freeze Frame Data Saved3"; Rec."Freeze Frame Data Saved3")
                    {
                    }
                }
                group("4.")
                {
                    field(DTC4; Rec.DTC4)
                    {
                    }
                    field(Status4; Rec.Status4)
                    {
                    }
                    field("Freeze Frame Data Saved4"; Rec."Freeze Frame Data Saved4")
                    {
                    }
                }
            }
            group("Job Instruction Info")
            {
                field("Job Instruction"; Rec."Job Instruction")
                {
                    MultiLine = true;
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("Start Time"; Rec."Start Time")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("End Time"; Rec."End Time")
                {
                }
                field("Time Required"; Rec."Time Required")
                {
                }
                field(DTR; Rec.DTR)
                {
                }
                field("Job Instruction Staff Name"; Rec."Job Instruction Staff Name")
                {
                    Caption = 'Staff Name';
                }
                field("Confirmed By"; Rec."Confirmed By")
                {
                }
                field("Confirmed Date"; Rec."Confirmed Date")
                {
                }
                field("Confirmed Time"; Rec."Confirmed Time")
                {
                }
            }
            group("Dist. Support")
            {
                field(Destination; Rec.Destination)
                {
                }
                field("In Charge"; Rec."In Charge")
                {
                }
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                }
                field(Requests; Rec.Requests)
                {
                }
                field("If Requests is Other Pls State"; Rec."If Requests is Other Pls State")
                {
                }
                field("Receiving Status"; Rec."Receiving Status")
                {
                }
                field("Receiving Status Date"; Rec."Receiving Status Date")
                {
                }
                field("Receiving Status Time"; Rec."Receiving Status Time")
                {
                }
                field("Support Request Date"; Rec."Support Request Date")
                {
                }
                field("Support Request Time"; Rec."Support Request Time")
                {
                }
                field("Support Staff Name"; Rec."Support Staff Name")
                {
                    Caption = 'Staff Name';
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
                    DiagRec.SETRANGE(DiagRec."DQ No.", Rec."DQ No.");
                    IF DiagRec.FINDFIRST THEN
                        REPORT.RUNMODAL(50329, TRUE, TRUE, DiagRec);
                end;
            }
            action("Job Clocking")
            {
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80013;
                RunPageLink = "Job No." = FIELD("Customer Order No.");
            }
        }
    }

    var
        DiagRec: Record 70035;
}

