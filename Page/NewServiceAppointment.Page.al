page 50238 "New Service Appointment"
{
    CardPageID = "Service Appointment Mgt. Card";
    PageType = List;
    SourceTable = "Service Appointment Scheduled";
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

    trigger OnOpenPage()
    begin
        Rec.SETRANGE("Next Call Date.", TODAY);
    end;
}

