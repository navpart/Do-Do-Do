page 80047 "Repeat Repair"
{
    CardPageID = "Customer Order Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    SourceTableView = WHERE("Repeat Repair" = CONST(true));
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
                field("Parts Ordered Date"; Rec."Parts Ordered Date")
                {
                }
                field("Parts Ordered Time"; Rec."Parts Ordered Time")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field(Brand; Rec.Brand)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Date Delivered"; Rec."Date Delivered")
                {
                }
                field("Time Delivered"; Rec."Time Delivered")
                {
                }
                field("Repeat Repair Reason"; Rec."Repeat Repair Reason")
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

