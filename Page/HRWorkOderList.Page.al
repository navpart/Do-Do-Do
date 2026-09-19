page 50453 "HR Work Oder List"
{
    CardPageID = "HR Work Order";
    PageType = List;
    SourceTable = "HR Work Order";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Issued Date"; Rec."Issued Date")
                {
                }
                field(Approval; Rec.Approval)
                {
                }
                field("COF Ref Code"; Rec."COF Ref Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

