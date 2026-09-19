page 70237 "Leave Req. Approval"
{
    ApplicationArea = All;
    CardPageID = "Leave Request Card";
    PageType = List;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE("Global Dimension 1 code" = CONST('08AUDSYS'),
                            "Send for Approval" = CONST(true),
                            "1st Approval Status" = FILTER(' ' | 'On hold'),
                            "2nd Approval Status" = FILTER(<> Approved));

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
                field("User ID"; Rec."User ID")
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

