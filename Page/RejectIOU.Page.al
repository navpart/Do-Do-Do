page 50220 "Reject IOU"
{
    PageType = List;
    SourceTable = "IOU Register";
    SourceTableView = WHERE(Reject = FILTER(True));
    ApplicationArea = All;

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
                field("Collected By"; Rec."Collected By")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

