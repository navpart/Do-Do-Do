page 50471 "Logistics List"
{
    ApplicationArea = All;
    CardPageID = "Logistics/VRI Card";
    PageType = List;
    SourceTable = "Logistics Order";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Chassis No.";Rec. "Chassis No.")
                {
                }
                field("Item No.";Rec. "Item No.")
                {
                }
                field(Description;Rec. Description)
                {
                }
                field(Model;Rec. Model)
                {
                }
                field("Model Name";Rec. "Model Name")
                {
                }
                field("Engine No.";Rec. "Engine No.")
                {
                }
                field("Colour Name";Rec. "Colour Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

