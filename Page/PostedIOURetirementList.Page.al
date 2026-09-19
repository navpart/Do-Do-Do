page 70034 "Posted IOU Retirement List"
{
    ApplicationArea = All;
    CardPageID = "Posted IOU Retirement";
    Editable = false;
    PageType = List;
    SourceTable = "IOU Retirement Header";
    SourceTableView = WHERE(Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("User ID"; Rec."User ID")
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
                    Caption = 'Balance';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        BalAmt := 0;
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
    end;

    var
        BalAmt: Decimal;
}

