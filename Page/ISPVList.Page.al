page 70035 "ISPV List"
{
    ApplicationArea = All;
    CardPageID = "ISPV Folder";
    PageType = List;
    SourceTable = "Logistics Order";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
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

                field("VRI Code"; Rec."VRI Code")
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

                field("Estimate Approval"; Rec."Estimate Approval")
                {
                }
                field("ISPV to VRI"; Rec."ISPV to VRI")
                {
                }
                field("Awaiting Estimate"; Rec."Awaiting Estimate")
                {
                }
                field("Awaiting O/L Apprv."; Rec."Awaiting O/L Apprv.")
                {
                }
                field("Under Repair"; Rec."Under Repair")
                {
                }
                field("Completed Repair"; Rec."Completed Repair")
                {
                }
                field(Completed; Rec.Completed)
                {
                }
                field("Generate COF"; Rec."Generate COF")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

