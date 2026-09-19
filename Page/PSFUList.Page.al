page 80048 "PSFU List"
{
    ApplicationArea = All;
    Caption = 'Post Service Follow Up';
    AutoSplitKey = true;
    CardPageID = "PSFU Card";
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Service IndexX";
    SourceTableView = WHERE(Done = FILTER(false));
    //"Service Location" = FILTER('120ISO'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Index No."; Rec."Index No.")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Service Location"; Rec."Service Location")
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
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Call Due Date"; Rec."Call Due Date")
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
                field("Make of the Vehicle"; Rec."Make of the Vehicle")
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

    trigger OnAfterGetRecord()
    begin
        IF COFRec.GET(Rec."COF No.") THEN BEGIN
            Rec."Delivery Date" := COFRec."Date Delivered";
            Rec."Vehicle No." := COFRec."Vehicle Registration No.";
            Rec."Delivery Time" := COFRec."Time Delivered";

        END;
    end;

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    trigger OnOpenPage()
    begin
        IF COFRec.GET(Rec."COF No.") THEN BEGIN
            Rec."Delivery Date" := COFRec."Date Delivered";
            Rec."Vehicle No." := COFRec."Vehicle Registration No.";
            Rec."Delivery Time" := COFRec."Time Delivered";

        END;
    end;

    var
        COFRec: Record "Customer Order HeaderX";
}

