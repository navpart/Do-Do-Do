page 70536 "Allocation List"
{
    CardPageID = "Allocation Card";
    PageType = List;
    SourceTable = 70062;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Total Allocated Quantity"; Rec."Total Allocated Quantity")
                {
                }
                field("Total Available Quantity"; Rec."Total Available Quantity")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

