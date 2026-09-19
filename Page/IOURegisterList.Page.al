page 70030 "IOU Register List"
{
    ApplicationArea = All;
    CardPageID = "IOU Register Card";
    PageType = List;
    Editable = false;
    SourceTable = "IOU Register";
    SourceTableView = SORTING("IOU No.")
                      WHERE(Posted = FILTER(false),
                            Treated = FILTER(false),
                            "Final Apprv. Status" = FILTER(<> Approved),
                            Reject = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IOU No."; Rec."IOU No.")
                {
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
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Staff  Name';
                }
                field(Retired; Rec.Retired)
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

