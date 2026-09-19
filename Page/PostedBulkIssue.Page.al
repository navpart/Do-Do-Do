page 50477 "Posted Bulk Issue"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bulk Issue";
    SourceTableView = WHERE(Issued = filter(false));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Item; Rec.Item)
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Consignment No."; Rec."Consignment No.")
                {
                }
                field("Collected By"; Rec."Collected By")
                {
                }
                field(Issued; Rec.Issued)
                {
                }
                field("Date/Time"; Rec."Date/Time")
                {
                }
            }
        }
    }

    actions
    {
    }
}

