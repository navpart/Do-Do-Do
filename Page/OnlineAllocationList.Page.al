page 70518 "Online Allocation List"
{
    CardPageID = "Online Allocation Card";
    PageType = List;
    SourceTable = 70059;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Allocated Quantity"; Rec."Allocated Quantity")
                {
                }
                field("Requested Quantity"; Rec."Requested Quantity")
                {
                }
            }
        }
    }

    actions
    {
    }
}

