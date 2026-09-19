page 70067 "Booked Service Appointment"
{
    CardPageID = "Service Appointment Mgt. Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Service Appointment Scheduled";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
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
                field("Next Call Date."; Rec."Next Call Date.")
                {
                }
                field("Expected Reception Date"; Rec."Expected Reception Date")
                {
                }
                field("Service Due Projected Date"; Rec."Service Due Projected Date")
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                }
                field("Call Type"; Rec."Call Type")
                {
                }
                field("Walk-In"; Rec."Walk-In")
                {
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field("Service Date"; Rec."Service Date")
                {
                }
                field("Service Due Kilometer"; Rec."Service Due Kilometer")
                {
                }
                field("Serviced Kilometer"; Rec."Serviced Kilometer")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Appointment Customer List")
            {
                Caption = 'Print Appointment Customer List';
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50323;
            }
            action("Generate Schedule")
            {
                Caption = 'Generate Schedule';
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Genschedu
                end;
            }
        }
    }
}

