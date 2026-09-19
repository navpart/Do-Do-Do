page 50462 "ISPV Card 3"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";
    SourceTableView = WHERE(Completed = FILTER(false),
                            "Estimate Approval" = FILTER(True),
                            "VRI To WShop" = FILTER(True),
                            "O/L Approval" = FILTER(false));

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
            group("Control1")
            {
                Caption = 'O/L Approval';
                field("VRI Comment To O/L"; Rec."VRI Comment To O/L")
                {
                }
                field("O/L Comment"; Rec."O/L Comment")
                {
                }
                field("O/L Approval Comment"; Rec."O/L Approval Comment")
                {
                }
                field("O/L Approval"; Rec."O/L Approval")
                {
                }
            }
        }
    }

    actions
    {
    }
}

