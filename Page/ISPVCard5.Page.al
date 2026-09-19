page 50464 "ISPV Card 5"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";
    SourceTableView = WHERE("Completed" = FILTER(True),
                            "Estimate Approval" = FILTER(True),
                            "VRI To WShop" = FILTER(True),
                            "O/L Approval" = FILTER(True));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Colour Name"; Rec."Colour Name")
                {
                }
                field("KM Reading"; Rec."KM Reading")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("No. of Keys"; Rec."No. of Keys")
                {
                }
                field("Job Description"; Rec."Job Description")
                {
                }
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Arrival Date"; Rec."Arrival Date")
                {
                }
                field("Date of Problem Report"; Rec."Date of Problem Report")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

