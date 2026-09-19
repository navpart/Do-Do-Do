page 50465 "Logistics List 1"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No.";Rec."Order No.")
                {
                    Editable = false;
                }
                field("Chassis No.";Rec. "Chassis No.")
                {
                    Editable = false;
                    Lookup = true;
                }
                field("Item No.";Rec. "Item No.")
                {
                    Editable = false;
                }
                field(Description;Rec. Description)
                {
                    Editable = false;
                }
                field(Model;Rec. Model)
                {
                    Editable = false;
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                }
                field("Engine No.";Rec. "Engine No.")
                {
                }
                field("Colour Name";Rec. "Colour Name")
                {
                }
                
                field("VRI Code";Rec. "VRI Code")
                {
                }
                field("Notify VRI"; Rec."Notify VRI")
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
                field("Job Description";Rec. "Job Description")
                {
                }
                field("Date of Problem Report";Rec. "Date of Problem Report")
                {
                }
                field("Arrival Date";Rec. "Arrival Date")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Fuel Level";Rec. "Fuel Level")
                {
                }
                field("No. of Keys";Rec. "No. of Keys")
                {
                }
                field("Responsible Customer"; Rec."Responsible Customer")
                {
                }
                field("Customer Name";Rec. "Customer Name")
                {
                }
                field("O/L Comment";Rec. "O/L Comment")
                {
                }
                field("O/L Approval Comment";Rec. "O/L Approval Comment")
                {
                }
                field("O/L Approval";Rec. "O/L Approval")
                {
                }
                field("VRI Comment To O/L";Rec. "VRI Comment To O/L")
                {
                }
                field("VRI To WShop";Rec. "VRI To WShop")
                {
                }
                field(Estimate;Rec. Estimate)
                {
                }
                field("Claim No.";Rec."Claim No.")
                {
                }
                field("Estimate Approval";Rec."Estimate Approval")
                {
                }
                field("ISPV to VRI";Rec. "ISPV to VRI")
                {
                }
                field("Awaiting Estimate";Rec. "Awaiting Estimate")
                {
                }
                field("Awaiting O/L Apprv.";Rec. "Awaiting O/L Apprv.")
                {
                }
                field("Under Repair";Rec. "Under Repair")
                {
                }
                field("Completed Repair";Rec. "Completed Repair")
                {
                }
                field(Completed;Rec. Completed)
                {
                }
                field("Generate COF";Rec. "Generate COF")
                {
                }
                field("COF No.";Rec."COF No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Card)
            {
                Caption = 'Card';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50460;
                RunPageOnRec = true;
            }
        }
    }
}

