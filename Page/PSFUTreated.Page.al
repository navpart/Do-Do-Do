page 80049 "PSFU Treated"
{
    AutoSplitKey = true;
    CardPageID = "PSFU Card";
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Service IndexX";
    SourceTableView = WHERE(Done = FILTER(true),
                            "Service Location" = FILTER('120ISO'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Index No."; Rec."Index No.")
                {
                }
                field("Call Due Date"; Rec."Call Due Date")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                }
                field(Brand; Rec.Brand)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Make of the Vehicle"; Rec."Make of the Vehicle")
                {
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                }
                field("PSFU Actual Date"; Rec."PSFU Actual Date")
                {
                }
                field("PSFU Actual Time"; Rec."PSFU Actual Time")
                {
                }
                field("PSFU Staff Name"; Rec."PSFU Staff Name")
                {
                }
                field("Contact Person"; Rec."Contact Person")
                {
                }
                field("Contact Position"; Rec."Contact Position")
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
                field("Responsible Supervisor"; Rec."Responsible Supervisor")
                {
                }
                field(Called; Rec.Called)
                {
                }
                field("Call Response"; Rec."Call Response")
                {
                }
                field("Repeat Call 1"; Rec."Repeat Call 1")
                {
                }
                field("Repeat Call 2"; Rec."Repeat Call 2")
                {
                }
                field("Repeat Call 3"; Rec."Repeat Call 3")
                {
                }
                field("Repeat Call 1 Date"; Rec."Repeat Call 1 Date")
                {
                }
                field("Repeat Call 2 Date"; Rec."Repeat Call 2 Date")
                {
                }
                field("Repeat Call 3 Date"; Rec."Repeat Call 3 Date")
                {
                }
                field("Call 1 Response"; Rec."Call 1 Response")
                {
                }
                field("Call 2 Response"; Rec."Call 2 Response")
                {
                }
                field("Call 3 Response"; Rec."Call 3 Response")
                {
                }
                field(Action; Rec.Action)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    trigger OnOpenPage()
    begin
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

