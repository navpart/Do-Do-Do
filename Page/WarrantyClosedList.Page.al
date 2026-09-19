page 70051 "Warranty Closed List"
{
    ApplicationArea = All;
    CardPageID = "Closed Warranty Claim card";
    PageType = List;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Warranty Closed" = FILTER(True));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Claim No."; Rec."Claim No.")
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
                field("Vehicle Identification No."; Rec."Vehicle Identification No.")
                {
                }
                field("Vehicle Engine No."; Rec."Vehicle Engine No.")
                {
                }
                field("Vehicle Model"; Rec."Vehicle Model")
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
                field("Owners Name"; Rec."Owners Name")
                {
                }
                field("Warranty Claim Exist"; Rec."Warranty Claim Exist")
                {
                }
                field("Under Warranty"; Rec."Under Warranty")
                {
                }
                field("Warranty Expired"; Rec."Warranty Expired")
                {
                }
                field("Warranty Expired Date"; Rec."Warranty Expired Date")
                {
                }
                field("Claim Approved by TNL"; Rec."Claim Approved by TNL")
                {
                }
                field("Total Material Claim cost"; Rec."Total Material Claim cost")
                {
                }
                field("Total Labour Claim"; Rec."Total Labour Claim")
                {
                }
                field("Date Approved by TNL"; Rec."Date Approved by TNL")
                {
                }
                field("TWC No."; Rec."TWC No.")
                {
                }
                field("Claim Refund by TMC"; Rec."Claim Refund by TMC")
                {
                }
                field("Labour Charge accepted by TMC"; Rec."Labour Charge accepted by TMC")
                {
                }
                field("Replace Dealer Material Claim"; Rec."Replace Dealer Material Claim")
                {
                }
                field("Refund Dealer Labour Claim"; Rec."Refund Dealer Labour Claim")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Material Claim Approved"; Rec."Material Claim Approved")
                {
                }
                field("Labour Claim Approved"; Rec."Labour Claim Approved")
                {
                }
                field("Warranty Closed"; Rec."Warranty Closed")
                {
                }
                field("Claim Charges Posted"; Rec."Claim Charges Posted")
                {
                }
                field("Claim Materials Posted"; Rec."Claim Materials Posted")
                {
                }
                field("Mat Amt Refunded by TMC(FCY)"; Rec."Mat Amt Refunded by TMC(FCY)")
                {
                }
                field("Warranty Refund Account"; Rec."Warranty Refund Account")
                {
                }
                field("Labor Amt Refunded by TMC(FCY)"; Rec."Labor Amt Refunded by TMC(FCY)")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Settlement Report No."; Rec."Settlement Report No.")
                {
                }
                field("SRN Date"; Rec."SRN Date")
                {
                }
                field("Batch No."; Rec."Batch No.")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Material Posting Date"; Rec."Material Posting Date")
                {
                }
                field("Labour Posting Date"; Rec."Labour Posting Date")
                {
                }
                field("Line Item Count"; Rec."Line Item Count")
                {
                }
                field("Claim Settled by TMC"; Rec."Claim Settled by TMC")
                {
                }
                field("CLaim Refunded By TMC Date"; Rec."CLaim Refunded By TMC Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

