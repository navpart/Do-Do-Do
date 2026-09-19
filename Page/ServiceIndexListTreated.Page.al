page 80008 "Service Index List-Treated"
{
    ApplicationArea = All;
    Caption = 'Post Service Follow Up - Treated';
    AutoSplitKey = true;
    CardPageID = "PSFU Card";
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Service IndexX";
    SourceTableView = WHERE(Done = FILTER(true),
                            "Call Due Date" = FILTER('01/01/23..'));

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
                field(Model; Rec.Model)
                {
                }
                field("Make of the Vehicle"; Rec."Make of the Vehicle")
                {
                }
                field(Completed; Rec.Completed)
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
                field(Done; Rec.Done)
                {
                }
                field("Fix it right"; Rec."Fix it right")
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
                field("Job Card No."; Rec."Job Card No.")
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
}

