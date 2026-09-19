page 80072 "Isolo Part Report Updated"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Source No." = FILTER('TCSC*'),
                            "Inventory Posting Group" = FILTER('N_PARTCONS|N_PARTS'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Purchase Amount (Actual)"; Rec."Purchase Amount (Actual)")
                {
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                }
                field("Prod. Gr."; Rec."Prod. Gr.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Positive; Rec.Positive)
                {
                }
                field("Shpt. Method Code"; Rec."Shpt. Method Code")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
                field("Entry/Exit Point"; Rec."Entry/Exit Point")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Area"; Rec."Area")
                {
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Assemble to Order"; Rec."Assemble to Order")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Job Purchase"; Rec."Job Purchase")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Derived from Blanket Order"; Rec."Derived from Blanket Order")
                {
                }

                field("Item Category Code"; Rec."Item Category Code")
                {
                }

                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                }
                field("Item Name"; Rec."Item Name")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("BNP Grouping"; Rec."BNP Grouping")
                {
                }
                field("Product Grp Code"; Rec."Product Grp Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

