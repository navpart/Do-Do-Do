page 50184 "Dealer Request process List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Dealer Request Process header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(control5)
            {
                field("Request Period";Rec."Request Period")
                {
                }
                field("Customer No.";Rec."Customer No.")
                {
                }
                field("Customer Name";Rec."Customer Name")
                {
                }
                field("Process Date";Rec."Process Date")
                {
                }
                field("Process Time";Rec."Process Time")
                {
                }
                field("Total Quantity Requested";Rec."Total Quantity Requested")
                {
                }
                field("Total Quantity Allocated";Rec."Total Quantity Allocated")
                {
                }
            }
        }
    }

    actions
    {
    }
}

