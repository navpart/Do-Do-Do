page 70238 "IOU Appr. Audit"
{
    ApplicationArea = All;
    CardPageID = "IOU Register Card";
    PageType = List;
    Editable = false;
    SourceTable = "IOU Register";
    SourceTableView = WHERE("2nd Approval to" = FILTER('ADEWUMI'),
                            "2nd Apprv. Status" = FILTER(' ' | 'on Hold'),
                            "1st Apprv. Status" = FILTER('Approved'),
                            Reject = FILTER('No'));

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

