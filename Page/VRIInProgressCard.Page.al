page 50397 "VRI In Progress Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "VRI Table";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("VRI Supervisor No"; Rec."VRI Supervisor No")
                {
                }
                field("VRI Supervisor Name"; Rec."VRI Supervisor Name")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Total VRI"; Rec."Total VRI")
                {
                    Caption = 'Total Vehicle Arrived';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("VRI Form Arrived count"; Rec."VRI Form Arrived count")
                {
                    Caption = 'Awaiting VRI';
                    DrillDown = true;
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    Lookup = true;
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Problem Vehicle COUNT"; Rec."Problem Vehicle COUNT")
                {
                    Caption = 'Problem Vehicle';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Send For Approval 2"; Rec."Send For Approval 2")
                {
                    Caption = 'VRI Request';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Pending VRI Approval COUNT"; Rec."Pending VRI Approval COUNT")
                {
                    Caption = 'Logistics Action To VRI';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("PENDING LOG  Approval COUNT"; Rec."PENDING LOG  Approval COUNT")
                {
                    Caption = 'VRI Action To Workshop';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Send to Workshop"; Rec."Send to Workshop")
                {
                    Caption = 'Send to Workshop';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Open COF  Approval"; Rec."Open COF  Approval")
                {
                    Caption = 'Generate Workshop Estimate';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Open COF  Aprroval2"; Rec."Open COF Aprroval2")
                {
                    Caption = 'Verify Estimate';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Estimate Approval"; Rec."Estimate Approval")
                {
                    Caption = 'Estimate Approval';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Under Repairs"; Rec."Under Repairs")
                {
                    Caption = 'Under Repairs';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Completion of Service Delivrd"; Rec."Completion of Service Delivrd")
                {
                    Caption = 'Completed Jobs';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Available for Transfer"; Rec."Available for Transfer")
                {
                    Caption = 'Available for Transfer';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("PV Sales & Marketing"; Rec."PV Sales & Marketing")
                {
                    Caption = 'PV Available for Transfer';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Pass to Sales/MarketingCOUNT"; Rec."Pass to Sales/Marketing COUNT")
                {
                    Caption = 'Sales and Marketing';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("In-Stock Count"; Rec."In-Stock Count")
                {
                    Caption = 'ISPV';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
                field("Vehicles Sold"; Rec."Vehicles Sold")
                {
                    Caption = 'Sold Vehicles';
                    DrillDownPageID = "Vehicle Receipt Inspection";
                    LookupPageID = "Vehicle Receipt Inspection";
                }
            }
        }
    }

    actions
    {
    }
}

