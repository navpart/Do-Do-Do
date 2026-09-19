page 50207 "Stores Requisition List"
{
    ApplicationArea = All;
    CardPageID = "Stores Requisition Card";
    PageType = List;
    Editable = false;
    SourceTable = "Stores Requisition Header.";
    SourceTableView = WHERE(Type = FILTER(Issue));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("SIV No."; Rec."SIV No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

