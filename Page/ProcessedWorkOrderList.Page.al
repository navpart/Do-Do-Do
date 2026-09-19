page 70006 "Processed Work Order List"
{
    CardPageID = "POS Receipt List";
    PageType = List;
    SourceTable = "Admin Work Order";
    SourceTableView = WHERE("Send To W/shop" = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Work Order No."; Rec."Work Order No.")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("KM Reading"; Rec."KM Reading")
                {
                }
                field("Job Description1"; Rec."Job Description1")
                {
                }
                field("Date of Problem Report"; Rec."Date of Problem Report")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("Responsible Driver"; Rec."Responsible Driver")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field("Generate COF"; Rec."Generate COF")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Job Description2"; Rec."Job Description2")
                {
                }
                field("Job Description3"; Rec."Job Description3")
                {
                }
                field("Job Description4"; Rec."Job Description4")
                {
                }
                field("Job Description5"; Rec."Job Description5")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Send To W/shop"; Rec."Send To W/shop")
                {
                }
                field("Sent By UserID"; Rec."Sent By UserID")
                {
                }
            }
        }
    }

    actions
    {
    }
}

