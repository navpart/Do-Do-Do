page 70184 "Fully Issued"
{
    CardPageID = "Warranty Claim card";
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Issued Option" = FILTER("Fully Issued"),
                            "Replace Dealer Material Claim" = filter(True));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Claim No."; Rec."Claim No.")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("TWC No."; Rec."TWC No.")
                {
                }
                field("Settlement Report No."; Rec."Settlement Report No.")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("Process Date"; Rec."Process Date")
                {
                }
                field("Total Material Claim cost"; Rec."Total Material Claim cost")
                {
                }
                field("Total Labour Claim"; Rec."Total Labour Claim")
                {
                }
                field("Part Refunded by TMC(LCY)"; Rec."Mat Amt Refunded by TMC(LCY)")
                {
                }
                field("LaborAmt  Refunded by TMC(LCY)"; Rec."LaborAmt  Refunded by TMC(LCY)")
                {
                }
                field("Vehicle Identification No."; Rec."Vehicle Identification No.")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                }
                field("Part Refunded by TMC(FCY)"; Rec."Mat Amt Refunded by TMC(FCY)")
                {
                }
                field("Labor Amt Refunded by TMC(FCY)"; Rec."Labor Amt Refunded by TMC(FCY)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

