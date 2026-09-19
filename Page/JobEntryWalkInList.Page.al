page 70083 "Job Entry Walk In List"
{
    ApplicationArea = All;
    CardPageID = "Job Entry Walk In Card";
    PageType = List;
    SourceTable = "Service Appointment Scheduled";
    SourceTableView = WHERE("Next Call Date." = FILTER(<> ''),
                            "Walk-In" = CONST(true),
                            "Customer's Requests" = filter('Walk-In'),
                            "For Appt Confirmation" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Service Item"; Rec."Service Item")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field("Service Code"; Rec."Service Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Job Details"; Rec."Job Details")
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
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50323;
            }
            action("Generate Schedule")
            {
                Caption = 'Generate Schedule';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Genschedu
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SETRANGE("Next Call Date.", TODAY);
        Rec."Customer's Requests" := 1;
    end;
}

