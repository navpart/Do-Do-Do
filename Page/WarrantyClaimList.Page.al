page 50163 "Warranty Claim List"
{
    ApplicationArea = All;
    CardPageID = "Warranty Claim card";
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Warranty Closed" = FILTER(False),
                            "Claim Materials Posted" = FILTER(false),
                            "Claim Charges Posted" = FILTER(false));

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
                field("Line Item Count"; Rec."Line Item Count")
                {
                }
                field("Process Date"; Rec."Process Date")
                {
                }
                field("Warranty Claim Exist"; Rec."Warranty Claim Exist")
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
                field("Material Claim Approved"; Rec."Material Claim Approved")
                {
                }
                field("Labour Claim Approved"; Rec."Labour Claim Approved")
                {
                }
                label("Warranty Claims")
                {
                }
            }
        }
    }

    actions
    {
    }
}

