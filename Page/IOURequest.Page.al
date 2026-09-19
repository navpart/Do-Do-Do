page 50217 "IOU Request"
{
    ApplicationArea = All;
    CardPageID = "IOU Register Card";
    PageType = List;
    SourceTable = "IOU Register";
    SourceTableView = SORTING("IOU No.")
                      WHERE(Posted = FILTER(false),
                            Treated = FILTER(True));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IOU No."; Rec."IOU No.")
                {
                    Editable = false;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Manual Voucher No."; Rec."Manual Voucher No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Staff No."; Rec."Account No.")
                {
                }
                field("Staff Name"; Rec."Account Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

