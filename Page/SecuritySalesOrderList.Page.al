page 70527 "Security Sales Order List"
{
    CardPageID = "Sales Shipment Security";
    Editable = true;
    PageType = List;
    SourceTable = 110;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                }
                field("Order No."; rec."Order No.")
                {
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                }
                field("Bill-to Name"; rec."Bill-to Name")
                {
                }
                field("Order Date"; rec."Order Date")
                {
                }
                field("Posting Description"; rec."Posting Description")
                {
                }
                field("Location Code"; rec."Location Code")
                {
                }
                field("Salesperson Code"; rec."Salesperson Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

