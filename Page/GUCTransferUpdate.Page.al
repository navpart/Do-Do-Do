page 50377 "GUC Transfer Update"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
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
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
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
                field("Area"; Rec.Area)
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

                field("Originally Ordered No."; Rec."Originally Ordered No.")
                {
                }
                field("Originally Ordered Var. Code"; Rec."Originally Ordered Var. Code")
                {
                }
                field("Out-of-Stock Substitution"; Rec."Out-of-Stock Substitution")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field(Nonstock; Rec.Nonstock)
                {
                }
                field("Purchasing Code"; Rec."Purchasing Code")
                {
                }

                field("Completely Invoiced"; Rec."Completely Invoiced")
                {
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                }
                field("Applied Entry to Adjust"; Rec."Applied Entry to Adjust")
                {
                }
                field("Cost Amount (Expected)"; Rec."Cost Amount (Expected)")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Cost Amount (Non-Invtbl.)"; Rec."Cost Amount (Non-Invtbl.)")
                {
                }
                field("Cost Amount (Expected) (ACY)"; Rec."Cost Amount (Expected) (ACY)")
                {
                }
                field("Cost Amount (Actual) (ACY)"; Rec."Cost Amount (Actual) (ACY)")
                {
                }
                field("Cost Amount (Non-Invtbl.)(ACY)"; Rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                }
                field("Purchase Amount (Expected)"; Rec."Purchase Amount (Expected)")
                {
                }
                field("Purchase Amount (Actual)"; Rec."Purchase Amount (Actual)")
                {
                }
                field("Sales Amount (Expected)"; Rec."Sales Amount (Expected)")
                {
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                }
                field(Correction; Rec.Correction)
                {
                }
                field("Shipped Qty. Not Returned"; Rec."Shipped Qty. Not Returned")
                {
                }
                field("Prod. Order Comp. Line No."; Rec."Prod. Order Comp. Line No.")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Lot No."; Rec."Lot No.")
                {
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                }
                field("Item Tracking"; Rec."Item Tracking")
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field(Binlocation; Rec.Binlocation)
                {
                }
                field("Issuing Department"; Rec."Issuing Department")
                {
                }
                field("Depart."; Rec."Depart.")
                {
                }
                field("Prod. Gr."; Rec."Prod. Gr.")
                {
                }
                field("Vouch GL"; Rec."Vouch GL")
                {
                }
                field("Old Value"; Rec."Old Value")
                {
                }
                field("xRemain Qty Val"; Rec."xRemain Qty Val")
                {
                }
                field("Serial no. TNL"; Rec."Serial no. TNL")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Qty. Demanded"; Rec."Qty. Demanded")
                {
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                }
                field(Reference; Rec.Reference)
                {
                }
                field("Item Order Type"; Rec."Item Order Type")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Original Purch Customer No."; Rec."Original Purch Customer No.")
                {
                }
                field("New Location Code"; Rec."New Location Code")
                {
                }
                field("Chasis Number"; Rec."Chasis Number")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Service Item Registered"; Rec."Service Item Registered")
                {
                }
                field("On Transfer Line"; Rec."On Transfer Line")
                {
                }
                field("From Service"; Rec."From Service")
                {
                }
                field("From Service Line No."; Rec."From Service Line No.")
                {
                }
                field("Purchase Date"; Rec."Purchase Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

