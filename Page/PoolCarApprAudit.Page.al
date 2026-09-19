page 70249 "Pool Car Appr. Audit"
{
    ApplicationArea = All;
    CardPageID = "Pool Car Request Card";
    PageType = List;
    SourceTable = "Pool Car Register";
    SourceTableView = WHERE("Global Dimension 1 code" = CONST('08AUDSYS'),
                            "1st Approval Status" = FILTER(' '),
                            "Send for Approval" = FILTER(true));

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
                field(Approved; Rec.Approved)
                {
                }
                field("Approved by"; Rec."Approved by")
                {
                }
            }
        }
    }

    actions
    {
    }
}

