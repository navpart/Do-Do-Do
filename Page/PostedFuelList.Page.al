page 70003 "Posted Fuel List"
{
    CardPageID = "Posted Fuel";
    PageType = List;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE(Issue = CONST(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("Voucher No."; Rec."Voucher No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Fuel Code"; Rec."Fuel Code")
                {
                }
                field("Asset Code"; Rec."Asset Code")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Qty Requested"; Rec."Qty Requested")
                {
                }
                field("Qty Approved"; Rec."Qty Approved")
                {
                }
                field("Qty Issued"; Rec."Qty Issued")
                {
                }
                field("Issued By"; Rec."Issued By")
                {
                }
                field("Received By"; Rec."Received By")
                {
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

