page 70218 "Awaiting Part to be Issue"
{
    CardPageID = "Warranty Claim card";
    PageType = List;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Labour Claim Approved" = filter('Yes'),
                            "Material Claim Approved" = filter('Yes'),
                            "Claim Refund by TMC" = filter('No'),
                            "Replace Dealer Material Claim" = filter('No'),
                            "Refund Dealer Labour Claim" = filter('No'));
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
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                }
            }
        }
    }

    actions
    {
    }
}

