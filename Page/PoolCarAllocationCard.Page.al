page 50597 "Pool Car Allocation Card"
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
                }
                field("Allocator Name"; Rec."Allocator Name")
                {
                    Editable = false;
                }
                field("Request No."; Rec."Request No.")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    Editable = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    Caption = 'Request Type';
                    Editable = false;
                }
                field(Reason; Rec.Reason)
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
                field("Pickup Date"; Rec."Pickup Date")
                {
                    Editable = false;
                }
                field("Return Date"; Rec."Return Date")
                {
                    Editable = false;
                }
                field("Expected Hours"; Rec."Expected Hours")
                {
                    Editable = false;
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Security Officer"; Rec."Security Officer")
                {
                }
                field("Return Time"; Rec."Return Time")
                {
                }
                field("Actual Hours"; Rec."Actual Hours")
                {
                }
                field("Pickup Time"; Rec."Pickup Time")
                {
                }
                field("Actual Return Date"; Rec."Actual Return Date")
                {
                }
                field("Actual Return Time"; Rec."Actual Return Time")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field(Allocate; Rec.Allocate)
                {
                }
                field("Allocation Date"; Rec."Allocation Date")
                {
                    Editable = false;
                }
            }
            part(Lines; 50598)
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = FIELD("Allocation No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    POOLAREC.SETRANGE("Allocation No.", Rec."Allocation No.");
                    IF POOLAREC.FINDFIRST THEN
                        REPORT.RUNMODAL(50434, TRUE, TRUE, POOLAREC);
                end;
            }
        }
    }

    var
        POOLAREC: Record 70003;
}

