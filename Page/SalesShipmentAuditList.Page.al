page 70530 "Sales Shipment Audit List"
{
    ApplicationArea = All;
    CardPageID = "Sales Shipment Audit";
    PageType = List;
    SourceTable = "Sales Shipment Header";
    SourceTableView = WHERE("Online Order" = CONST(true),
                            "Audit Summary" = FILTER(' ' | "Non-Satisfactory"),
                            "Order No." = FILTER('TSOV*'),
                            "Sell-to Customer No." = FILTER('TDV01020|TDV05020'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

