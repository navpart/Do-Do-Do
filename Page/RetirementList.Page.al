page 50204 "Retirement List"
{
    ApplicationArea = All;
    CardPageID = "IOU Retirement Card";
    PageType = List;
    SourceTable = "IOU Retirement Header";
    SourceTableView = WHERE(Posted = CONST(false),
                            "Final Apprv. Status" = FILTER(' '),
                            Reject = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control01)
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
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
    end;

    var
        BalAmt: Decimal;
}

