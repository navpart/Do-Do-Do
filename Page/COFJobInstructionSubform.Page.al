page 50333 "COF Job Instruction Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order Line";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                }
                field("Job Details / Replaced Parts"; Rec."Job Details / Replaced Parts")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field(Variant; Rec.Variant)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Results; Rec.Results)
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field(Discount; Rec.Discount)
                {
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                }
            }
        }
    }

    actions
    {
    }
}

