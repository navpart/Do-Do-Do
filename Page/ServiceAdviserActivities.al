page 50031 "Service Adviser Activities."
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Service Adviser Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Appointment)
            {
                field("Incoming Appointments"; Rec."Incoming Appointments")
                {
                    DrillDownPageID = "Open Appointments";
                }
                field("Received Appointments"; Rec."Received Appointments")
                {
                    DrillDownPageID = "Booked Appointments";
                }
                field("Confirmed Appointments"; Rec."Confirmed Appointments")
                {
                    DrillDownPageID = "Confirmed Appointments";
                }
            }
            cuegroup("Appointment Preparation")
            {
                field(Tray; Rec.Tray)
                {
                }
                field("10 Days Before"; Rec."10 Days Before")
                {
                }
                field("3 Days Before"; Rec."3 Days Before")
                {
                }
                field("2 Days Before"; Rec."2 Days Before")
                {
                }
                field("1 Day Before"; Rec."1 Day Before")
                {
                }
                field("Parts Ordered"; Rec."Parts Ordered")
                {
                    DrillDownPageID = "Parts Ordered";
                }
                field("Parts Arrival"; Rec."Parts Arrival")
                {
                    DrillDownPageID = "Parts Arrival";
                }
            }
            cuegroup("Job Progress Control Board")
            {
                field("Todays Reception"; Rec."Todays Reception")
                {
                    DrillDownPageID = Today;
                }
                field("Waiting for Service"; Rec."Waiting for Service")
                {
                    DrillDownPageID = "Waiting for Service";
                }
                field("Next Job"; Rec."Next Job")
                {
                    DrillDownPageID = "Next Job";
                }
                field("Being Serviced"; Rec."Being Serviced")
                {
                    DrillDownPageID = "Being Serviced";
                }
                field("Waiting for Inspection"; Rec."Waiting for Inspection")
                {
                    DrillDownPageID = "Waiting for Inspection";
                }
                field("Waiting for Washing"; Rec."Waiting for Washing")
                {
                    DrillDownPageID = "Waiting for Washing";
                }
                field("Waiting for Invoicing"; Rec."Waiting for Invoicing")
                {
                    DrillDownPageID = "Waiting for Invoicing";
                }
                field("Waiting for Settlement"; Rec."Waiting for Settlement")
                {
                    DrillDownPageID = "Waiting for Settlement";
                }
                field("Awaiting Delivery"; Rec."Awaiting Delivery")
                {
                    DrillDownPageID = "Awaiting Delivery";
                }
                field(Delivered; Rec.Delivered)
                {
                    DrillDownPageID = Delivered;
                }
            }
            cuegroup("Job Stoppage.")
            {
                Caption = 'Job Stoppage';
                field("Waiting for Decision"; Rec."Waiting for Decision")
                {
                    DrillDownPageID = "Waiting for Decision";
                }
                field("Waiting for Approval"; Rec."Waiting for Approval")
                {
                    DrillDownPageID = "Waiting for Approval";
                }
                field("Waiting for Parts"; Rec."Waiting for Parts")
                {
                    DrillDownPageID = "Waiting for Parts";
                }
                field("Waiting for Sublet"; Rec."Waiting for Sublet")
                {
                    DrillDownPageID = "Waiting for Sublet";
                }
                field("Awaiting DAD"; Rec."Awaiting DAD")
                {
                    DrillDownPageID = "Awaiting DAD";
                }
                field("Awaiting Estimate"; Rec."Awaiting Estimate")
                {
                    DrillDownPageID = "Awaiting Estimate";
                }
                field("Job Stoppage"; Rec."Job Stoppage")
                {
                    DrillDownPageID = "Job Stoppage";
                }
            }
            cuegroup("Post-Service Follow-up")
            {
                field(Open; Rec."PSFU-Open")
                {
                    Caption = 'PSFU-Open';
                    DrillDownPageID = "PSFU List";
                }
                field("PSFU-List Today"; Rec."PSFU-Open Today")
                {
                    Caption = 'PSFU-List Today';
                    DrillDownPageID = "PSFU List Today";
                }
                field(Treated; Rec."PSFU-Treated")
                {
                    Caption = 'PSFU-Treated';
                    DrillDownPageID = "Service Index List-Treated";
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                    DrillDownPageID = "Repeat Repair";
                }
                field("Customer Complaint List"; Rec."Customer Complaint List")
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
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}

