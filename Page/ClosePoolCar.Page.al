page 50599 "Close Pool Car"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Pool Car Allocation";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Allocation No."; Rec."Allocation No.")
                {
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
                    Editable = false;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    Editable = false;
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                    Editable = false;
                }
                field("Take-off Location"; Rec."Take-off Location")
                {
                    Editable = false;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Editable = false;
                }
                field(Remark; Rec.Remark)
                {
                }
                field("Actual Return Date"; Rec."Actual Return Date")
                {
                    Caption = 'Actual Return Date';
                    Editable = true;
                }
                field("Actual Return Time"; Rec."Actual Return Time")
                {
                }
            }
            group(Return)
            {
                field("Return Location1"; Rec."Return Location1")
                {
                    Caption = 'Return Location';
                }
                field("Initial Mileage"; Rec."Initial Mileage")
                {
                }
                field("Mileage on Return"; Rec."Mileage on Return")
                {
                }
                field("Mileage Covered"; Rec."Mileage Covered")
                {
                    Editable = false;
                }
                field("Security Officer"; Rec."Security Officer")
                {
                }
                field("Return Location2"; Rec."Return Location2")
                {
                    Caption = 'Return Location';
                    Editable = ReturnLocation2;
                }
                field("Mileage on Return2"; Rec."Mileage on Return2")
                {
                    Caption = 'Mileage on Return';
                    Editable = MileageOnReturn2;
                }
                field("Mileage in Transit"; Rec."Mileage in Transit")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    POOLAREC.SETRANGE(POOLAREC."Allocation No.", Rec."Allocation No.");
                    IF POOLAREC.FINDFIRST THEN
                        REPORT.RUNMODAL(50440, TRUE, TRUE, POOLAREC);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Take-off Location" <> Rec."Return Location1" THEN BEGIN
            ReturnLocation2 := TRUE;
            MileageOnReturn2 := TRUE;
        END;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Take-off Location" <> Rec."Return Location1" THEN BEGIN
            ReturnLocation2 := TRUE;
            MileageOnReturn2 := TRUE;
        END;
    end;

    var
        POOLAREC: Record 70003;
        ReturnLocation2: Boolean;
        MileageOnReturn2: Boolean;
}

