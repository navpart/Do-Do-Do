page 70111 "Service Test"
{
    PageType = List;
    SourceTable = "Service Test";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

