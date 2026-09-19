page 80051 "PSFU Card"
{
    Editable = true;
    SourceTable = "Service IndexX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Index No."; Rec."Index No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Contact Phone No."; Rec."Contact Phone No.")
                {
                }
                field("Contact Mobile Phone"; Rec."Contact Mobile Phone")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Driver's Name"; Rec."Driver's Name")
                {
                }
                field("Driver's Phone (Mobile)"; Rec."Driver's Phone (Mobile)")
                {
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Service Location"; Rec."Service Location")
                {

                }
                field("Responsible Supervisor"; Rec."Responsible Supervisor")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Additional Job Details"; Rec."Additional Job Details")
                {
                }
                field("Other Findings/Advice"; Rec."Other Findings/Advice")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Delivery Time"; Rec."Delivery Time")
                {
                }
                field("Call Due Date"; Rec."Call Due Date")
                {
                }
            }
            group("Post Service Follow Up")
            {
                field("Work Completed the First Time"; Rec."Work Completed the First Time")
                {
                    Caption = 'Was the works req''d completed correctly the first time?';
                    ExtendedDatatype = Masked;
                    MultiLine = true;
                }
                field("Treatment Reception/Delivery"; Rec."Treatment Reception/Delivery")
                {
                    Caption = 'How were you treated during the reception and  delivery  process?';
                }
                field("Waitting Time at Reception"; Rec."Waitting Time at Reception")
                {
                    Caption = 'Describe the waiting time at the reception';
                    Description = '<Describe the waiting time at the reception>';
                }
                field("Work/Est. Explanation Recept"; Rec."Work/Est. Explanation Recept")
                {
                    Caption = 'Was the work required and estimate charges explained at the reception ?';
                }
                field("Was the Veh. Finished On Time"; Rec."Was the Veh. Finished On Time")
                {
                    Caption = 'Was the vehicle ready at the promised  time?';
                }
                field("Service Accuracy"; Rec."Service Accuracy")
                {
                }
                field("Standard Expectations"; Rec."Standard Expectations")
                {
                    Caption = 'Did the standard of work  meet your expectations and satisfaction?';
                }
                field("Will you Recomend Us to Other"; Rec."Will you Recomend Us to Other")
                {
                    Caption = 'Will you Recomend Us to Other?';
                }
                field("Reason for Failed Finishd Time"; Rec."Reason for Failed Finishd Time")
                {
                    Caption = 'If Not Finished on Time what was the reason?';
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Fix it right"; Rec."Fix it right")
                {
                }
                field(Done; Rec.Done)
                {
                }
                field(Score; Rec.Score)
                {
                }
                field(Called; Rec.Called)
                {
                }
                field("Call Response"; Rec."Call Response")
                {
                }
                field(Action; Rec.Action)
                {
                }
                field("PSFU Actual Date"; Rec."PSFU Actual Date")
                {
                }
                field("PSFU Actual Time"; Rec."PSFU Actual Time")
                {
                }
                field("PSFU Staff Code"; Rec."PSFU Staff Code")
                {
                }
                field("PSFU Staff Name"; Rec."PSFU Staff Name")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Done THEN
            CurrPage.EDITABLE := FALSE;

        IF COFRec.GET(Rec."COF No.") THEN BEGIN
            Rec."Delivery Date" := COFRec."Date Delivered";
            Rec."Vehicle No." := COFRec."Vehicle Registration No.";
            Rec.Model := COFRec."Model Name";
            Rec."Delivery Time" := COFRec."Time Delivered";

        END;
    end;

    trigger OnOpenPage()
    begin
        IF Rec.Done THEN
            CurrPage.EDITABLE := FALSE;

        IF COFRec.GET(Rec."COF No.") THEN BEGIN
            Rec."Delivery Date" := COFRec."Date Delivered";
            Rec."Vehicle No." := COFRec."Vehicle Registration No.";
            Rec.Model := COFRec."Model Name";
            Rec."Delivery Time" := COFRec."Time Delivered";

        END;
    end;

    var
        COFRec: Record "Customer Order HeaderX";
}

