page 50215 "Posted COF Report"
{
    Editable = false;
    PageType = List;
    SourceTable = "Service Line";
    SourceTableView = WHERE(Posted = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

