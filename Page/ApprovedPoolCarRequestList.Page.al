page 50594 "Approved Pool Car Request List"
{
    ApplicationArea = All;
    CardPageID = "Approved Pool Car Request Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Pool Car Register";
    SourceTableView = WHERE("2nd Approval Status" = filter('Approved'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field(Requester; Rec.Requester)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

