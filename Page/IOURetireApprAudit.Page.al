page 70240 "IOU Retire. Appr. Audit"
{
    ApplicationArea = All;
    CardPageID = "IOU Retirement Card";
    PageType = List;
    SourceTable = "IOU Retirement Header";
    SourceTableView = WHERE("2nd Approval to" = FILTER('ADEWUMI'),
                            "1st Apprv. Status" = CONST(Approved),
                            "3rd Approval to" = CONST(''),
                            "Send for Approval" = CONST(true),
                            "2nd Apprv. Status" = FILTER(' ' | 'on Hold'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Original IOU Amount"; Rec."Original IOU Amount")
                {
                }
                field("Amount To Retire"; Rec."Amount To Retire")
                {
                }
                field("Audit Approval"; Rec."Audit Approval")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Staff No."; Rec."Staff No.")
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

