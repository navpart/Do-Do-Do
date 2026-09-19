page 90063 "Parts Order Header"
{
    PageType = List;
    SourceTable = "Parts Order Header";
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
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Order Time"; Rec."Order Time")
                {
                }
            }
        }
    }

    actions
    {
    }
}

