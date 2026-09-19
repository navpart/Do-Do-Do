page 70182 "Confirmation of Warranty"
{
    CardPageID = "Warranty Claim card";
    PageType = List;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Labour Claim Approved" = filter(true),
                            "Material Claim Approved" = filter(true),
                            "Refund Dealer Labour Claim" = filter(false),
                            "Replace Dealer Material Claim" = filter(true),
                            "Claim Refund by TMC" = filter(true),
                            "Warranty Closed" = filter(false));
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
            }
        }
    }

    actions
    {
    }
}

