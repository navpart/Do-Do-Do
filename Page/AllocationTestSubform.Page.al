page 70534 "Allocation Test Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 70061;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field("Current Available Quantity"; Rec."Current Available Quantity")
                {
                }
                field("Allocation Quantity"; Rec."Allocation Quantity")
                {
                }
                field("Ordered Quantity"; Rec."Ordered Quantity")
                {
                }
                field("Remaining Allocated Quantity"; Rec."Remaining Allocated Quantity")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

