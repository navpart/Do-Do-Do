page 90049 CustomerOrderPMGRAPI
{
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Reception Type"; Rec."Reception Type")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field(Stage; Rec.Stage)
                {
                }
                field("Walk Around Reception Date"; Rec."Walk Around Reception Date")
                {
                }
                field("PM Amount"; Rec."PM Amount")
                {
                }
                field("GR Amount"; Rec."GR Amount")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field(Job_Type; Rec."Job Type2")
                {

                }
                field("App. No."; Rec."App. No.")
                {

                }
            }
        }
    }

    actions
    {
    }
}

