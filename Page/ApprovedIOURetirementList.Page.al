page 70033 "Approved IOU Retirement List"
{
    ApplicationArea = All;
    CardPageID = "Approved IOU Retirement";
    PageType = List;
    SourceTable = "IOU Retirement Header";
    SourceTableView = WHERE(Posted = filter('No'),
                            "Final Apprv. Status" = filter('Approved'));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                }
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Original IOU Amount"; Rec."Original IOU Amount")
                {
                }
                field("Amount To Retire"; Rec."Amount To Retire")
                {
                }
                field(BalAmt; BalAmt)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        BalAmt := 0;
        Rec.CALCFIELDS(Rec."Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
    end;

    var
        BalAmt: Decimal;
}

