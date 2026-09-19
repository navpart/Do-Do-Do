page 70538 "IOU HOD Appr. Audit"
{
    ApplicationArea = All;
    CardPageID = "IOU Register Card";
    PageType = List;
    SourceTable = "IOU Register";
    SourceTableView = WHERE("1st Approval to" = FILTER('BRANO'),
                            "1st Apprv. Status" = FILTER(' ' | 'on Hold'),
                            "Send for Approval" = FILTER(true),
                            Reject = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Collected By"; Rec."Collected By")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Account No.";Rec."Account No.")
                {

                }
                field("Account Name";Rec."Account Name")
                {
                    
                }
            }
        }
    }

    actions
    {
    }
}

