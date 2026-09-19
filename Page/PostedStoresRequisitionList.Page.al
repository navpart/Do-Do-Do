page 50208 "Posted Stores Requisition List"
{
    ApplicationArea = All;
    CardPageID = "Posted Stores Requisition Card";
    Editable = false;
    PageType = List;
    SourceTable = "Stores Requisition Header.";
    SourceTableView = WHERE(Type = FILTER("Posted Issue"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec. "No.")
                {
                }
                field(Type;Rec. Type)
                {
                }
                field(Date;Rec. Date)
                {
                }
                field("SIV No.";Rec. "SIV No.")
                {
                    Editable = false;
                }
                field("Date Issued";Rec. "Date Issued")
                {
                }
            }
        }
    }

    actions
    {
    }
}

