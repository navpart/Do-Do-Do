page 80039 "Maintenance Reminder Today"
{
    CardPageID = "Maintenance Reminder Card";
    PageType = List;
    SourceTable = "Service AppointmentsX";
    SourceTableView = WHERE(Maintenance = CONST(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appointment No."; Rec."Appointment No.")
                {
                }
                field("Service Item"; Rec."Service Item")
                {
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Next Call Date"; Rec."Next Call Date")
                {
                }
                field("Service Due Date"; Rec."Service Due Date")
                {
                }
                field("Agreed Date"; Rec."Agreed Date")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Days Before Due Date"; Rec."Days Before Due Date")
                {
                }
                field(Maintenance; Rec.Maintenance)
                {
                }
                field(Comment; Rec.Comment)
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
        Rec.SETRANGE("Next Call Date", TODAY);
        Rec.SETFILTER("Customer No.", 'TCSC*');
    end;

    var
        COFRec: Record 70034;
}

