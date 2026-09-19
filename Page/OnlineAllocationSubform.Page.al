page 70520 "Online Allocation Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 70060;
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
                field("Line No."; Rec."Line No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Requested Qty."; Rec."Requested Qty.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

