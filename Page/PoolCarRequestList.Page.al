page 50592 "Pool Car Request List"
{
    ApplicationArea = All;
    Caption = 'Pool Car Request';
    CardPageID = "Pool Car Request Card";
    PageType = List;
    Editable = false;
    SourceTable = "Pool Car Register";
    SourceTableView = WHERE("2nd Approval Status" = FILTER(<> Approved),
                            Reject = filter(false));

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
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                    Caption = 'Pupose';
                }
            }
        }
    }

    actions
    {
    }
}

