page 80020 Delivered
{
    ApplicationArea = All;
    CardPageID = "Customer Order Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    SourceTableView = WHERE(Delivered = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Date Delivered"; Rec."Date Delivered")
                {
                }
                field("Time Delivered"; Rec."Time Delivered")
                {
                }
                field("Expected Delivery Date"; Rec."Expected Delivery Date")
                {
                }
                field("Expected Delivery Time"; Rec."Expected Delivery Time")
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
                field("Parts Ordered Date"; Rec."Parts Ordered Date")
                {
                }
                field("Parts Ordered Time"; Rec."Parts Ordered Time")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                }
                field("Payment for Estimate"; Rec."Payment for Estimate")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

