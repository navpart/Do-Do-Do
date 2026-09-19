page 50228 "Stock Capitalisation List"
{
    ApplicationArea = All;
    CardPageID = "Stock Capitalisation";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Stock Capitalisation";
    SourceTableView = WHERE("Stock Capitalisation Approval" = FILTER(false),
                            Processed = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Asset No."; Rec."Asset No.")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                }
                field("Asset Aquisition Date"; Rec."Asset Aquisition Date")
                {
                }
                field(Processed; Rec.Processed)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Process date"; Rec."Process date")
                {
                }
                field("Process Time"; Rec."Process Time")
                {
                }
                field("Process By"; Rec."Process By")
                {
                }
                field("Stock Capitalisation Account"; Rec."Stock Capitalisation Account")
                {
                }
                field("Stock Capitalisation Approval"; Rec."Stock Capitalisation Approval")
                {
                }
                field("Capitalisation Approved By"; Rec."Capitalisation Approved By")
                {
                }
                field("Capitalisation Approved Time"; Rec."Capitalisation Approved Time")
                {
                }
                field("Capitalisation Approved Date"; Rec."Capitalisation Approved Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

